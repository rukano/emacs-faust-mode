# Faust-Mode
 *Faust syntax colorizer for Emacs.*
___
[![License GPLv3](https://img.shields.io/badge/license-GPL_v3-green.svg)](http://www.gnu.org/licenses/gpl-3.0.html) [![MELPA](https://melpa.org/packages/faust-mode-badge.svg)](https://melpa.org/#/faust-mode) [![MELPA](https://stable.melpa.org/packages/faust-mode-badge.svg)](https://melpa.org/#/faust-mode) 


## Features

- Syntax highlighting of *all* the Faust commands and operators
- Indentation rules
- [Compatible](https://github.com/syl20bnr/spacemacs/tree/develop/layers/%2Blang/faust) with SpaceEmacs

## Installation

### Easy

- Install it from [MELPA](https://melpa.org).

### Hard

- Copy/clone this repository in `load-path`
- Add
```elisp
(require 'faust-mode)
```
to your init file

### Faust

Oh, and of course install [the latest
Faust](http://faust.grame.fr/download/) and ensure it's in the
PATH.

### Faustine

Based on faust-mode, [Faustine](https://bitbucket.org/yassinphilip/faustine) goes even further into turning Emacs into a full-fledged Faust IDE.

## Major modes

Faust-Mode introduces 1 major mode, detailed below.

### faust-mode
Major mode for editing
[Faust](http://faust.grame.fr) (Functional AUdio STream) files.


In addition to any hooks its parent mode `prog-mode` might have run,
this mode runs the hook `faust-mode-hook`, as the final step
during initialization.


___
*README.md made on 2017-09-08 at 13:42:14 with [doc-a-mode](https://bitbucket.org/yassinphilip/doc-a-mode)*