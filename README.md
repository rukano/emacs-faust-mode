# Faust-Mode

Major Emacs mode for the [Faust](http://faust.grame.fr) programming language, featuring syntax highlighting, automatic indentation and auto-completion.

___
[![License GPLv3](https://img.shields.io/badge/license-GPL_v3-green.svg)](http://www.gnu.org/licenses/gpl-3.0.html) [![MELPA](https://melpa.org/packages/faust-mode-badge.svg)](https://melpa.org/#/faust-mode) [![MELPA](https://stable.melpa.org/packages/faust-mode-badge.svg)](https://stable.melpa.org/#/faust-mode) 


## Features

- Syntax highlighting of Faust keywords, operators and library functions
- Indentation rules
- Auto-completion of library functions (requires the auto-complete package, also available from [MELPA][])
- [Compatible](https://github.com/syl20bnr/spacemacs/tree/develop/layers/%2Blang/faust) with SpaceEmacs

[MELPA]: https://melpa.org

## Installation

- **Easy:** Install it from [MELPA][].

- **Hard:** Copy/clone this repository and put it somewhere on your Emacs `load-path`.

## Usage

```elisp
M-x faust-mode
```

To do this automatically for every Faust file, add something like this to your init file:

```elisp
(require 'faust-mode)
(setq auto-mode-alist (cons '("\\.dsp$" . faust-mode) auto-mode-alist))
```

## Auto-completion

To make auto-completion work, install the auto-complete package from [MELPA][] and add the following to your .emacs:
```elisp
(global-auto-complete-mode t)
```

## Faust

Oh, and of course install [the latest
Faust](https://github.com/grame-cncm/faust) and ensure it's in the
PATH.

## Faustine

Based on faust-mode, [Faustine](https://bitbucket.org/yphil/faustine) goes even further into turning Emacs into a full-fledged Faust IDE.


___
*README.md made on 2017-11-22 at 12:14:16 with [doc-a-mode](https://bitbucket.org/yphil/doc-a-mode)*
