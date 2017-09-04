# Faust-mode

[Faust](http://faust.grame.fr) syntax highlighting and indentation for Emacs.

---

## Installation

Copy/Clone this repository in in `load-path` and use 


```elisp
M-x faust-mode
```

To do this automatically for every Faust file, add something like this to your init file:

```elisp
(require 'faust-mode)
(setq auto-mode-alist (cons '("\\.dsp$" . faust-mode) auto-mode-alist))
```

---
