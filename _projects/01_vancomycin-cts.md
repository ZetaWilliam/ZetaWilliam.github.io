---
layout: page
title: AUC-guided vancomycin simulation
description: A reproducible R/NONMEM workflow for comparing model-informed and empirical dosing strategies.
importance: 1
category: research
---

This project evaluates how Bayesian target-concentration intervention and empirical trough-guided dosing behave when the trial setting includes execution events that are common in routine care.

The current reproduction workflow uses R, NONMEM, and Wings for NONMEM to simulate AUC24 target-window attainment, delayed doses, missed or cancelled doses, missing samples, and dropout. The N=200 reproduction run is used as design evidence: it tests assumptions and stress cases rather than making direct clinical recommendations.

The goal is to make the simulation legible to both modellers and clinicians, with traceable inputs, automated tables, and conservative interpretation of uncertainty.
