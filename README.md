# Faust-mode

[Faust](http://faust.grame.fr) syntax highlighting and indentation for Emacs.

---

[![License GPLv3](https://img.shields.io/badge/license-GPL_v3-green.svg)] [![MELPA](https://melpa.org/packages/faust-mode-badge.svg)](https://melpa.org/#/faust-mode) [![MELPA Stable](https://stable.melpa.org/packages/faust-mode-badge.svg)](https://stable.melpa.org/#/faust-mode)

## Installation

### Easy

Install it from [MELPA](https://melpa.org/#/getting-started).

### Manual

Copy/Clone this repository in in `load-path` and put 

`(require 'faust-mode)`

in your init file.


```elisp
M-x faust-mode
```

To do this automatically for every Faust file, add something like this to your init file:

```elisp
(require 'faust-mode)
(setq auto-mode-alist (cons '("\\.dsp$" . faust-mode) auto-mode-alist))
```

---
