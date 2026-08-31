$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$failures = [System.Collections.Generic.List[string]]::new()

function Read-Source([string]$relativePath) {
  return Get-Content -Raw -LiteralPath (Join-Path $repoRoot $relativePath)
}

function Require-Match([string]$text, [string]$pattern, [string]$message) {
  if ($text -notmatch $pattern) {
    $failures.Add($message)
  }
}

function Require-NoMatch([string]$text, [string]$pattern, [string]$message) {
  if ($text -match $pattern) {
    $failures.Add($message)
  }
}

$config = Read-Source '_config.yml'
$about = Read-Source '_pages/about.md'
$cvPage = Read-Source '_pages/cv.md'
$cvData = Read-Source '_data/cv.yml'
$publications = Read-Source '_pages/publications.md'
$bibliography = Read-Source '_bibliography/papers.bib'
$repositories = Read-Source '_pages/repositories.md'
$styles = Read-Source '_sass/_base.scss'
$linkWorkflow = Read-Source '.github/workflows/broken-links.yml'
$cacheBustPlugin = Read-Source '_plugins/cache-bust.rb'
$deployWorkflow = Read-Source '.github/workflows/deploy.yml'
$publicText = @($config, $about, $cvData, $publications, $bibliography) -join "`n"

Require-NoMatch $publicText '(?i)quantitative pharmacology' 'Rejected phrase remains in public site content.'
Require-NoMatch $bibliography '(?i)Venlafaxine induces psychiatric disorders' 'The venlafaxine record remains in the bibliography.'
Require-Match $about '(?m)^selected_papers:\s*false\s*$' 'The homepage still embeds selected publications.'
Require-Match $about '(?m)^social:\s*false\s*$' 'The homepage still contains the duplicate social section.'
Require-Match $config '(?m)^footer_fixed:\s*false\s*$' 'The footer remains fixed and can cover content.'
Require-Match $config '(?m)^linkedin_username:\s*zack-wang-pmx\s*$' 'The LinkedIn profile is not connected.'
Require-Match $cvData 'Academic Casual' 'The current Academic Casual role is missing.'
Require-Match $cvData 'Aug 2026-Present' 'The Academic Casual dates are missing.'
Require-Match $cvData 'Professional Casual' 'The Professional Casual role is missing.'
Require-Match $cvData 'Dec 2025-Jul 2026' 'The Professional Casual dates are missing.'
Require-Match $cvPage '(?m)^nav_order:\s*2\s*$' 'CV is not second in the navigation.'
Require-Match $publications '(?m)^nav_order:\s*3\s*$' 'Publications is not third in the navigation.'
Require-NoMatch $publications '(?i)preprints?' 'The Publications page still advertises preprints.'
Require-Match $repositories 'https://github\.com/ZetaWilliam' 'The Code page lacks a durable GitHub profile link.'
Require-Match $styles '--profile-width:' 'Responsive profile sizing is not defined.'
Require-Match $styles '\.projects\s+\.card-title' 'Project-card title sizing is not constrained.'
Require-Match $linkWorkflow ([regex]::Escape("--exclude 'https://www\.linkedin\.com/.*'")) 'The source link check does not exclude LinkedIn anti-bot responses.'
Require-Match $cacheBustPlugin "directory: '_sass'" 'The CSS cache key does not read the real Sass directory.'
Require-NoMatch $cacheBustPlugin "directory: 'assets/_sass'" 'The CSS cache key still reads the nonexistent assets/_sass directory.'
Require-Match $deployWorkflow '"\*\*/\*\.rb"' 'Ruby plugin changes do not trigger a site deployment.'

if ($failures.Count -gt 0) {
  $failures | ForEach-Object { Write-Error $_ -ErrorAction Continue }
  exit 1
}

Write-Host 'Profile site contract: PASS'
