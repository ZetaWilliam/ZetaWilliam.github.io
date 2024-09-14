---
layout: default
nav: true
nav_order: 3
---
<a href="../assets/pdf/example_pdf.pdf" title="View PDF">This is a PDF</a>
<!-- <a href="{{ example_pdf.pdf | prepend: 'assets/pdf/' | relative_url}}" target="_blank"></a> -->

<div style="display:none">
---
layout: cv
permalink: /cv/
title: CV
nav: true
nav_order: 5
cv_pdf: example_pdf.pdf
description: This is a description of the page. You can modify it in '_pages/cv.md'. You can also change or remove the top pdf download button.
toc:
  sidebar: left
---
</div>
