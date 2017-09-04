# Faust-mode

Faust syntax highlighting and indentation for Emacs.

## Installation

Copy/Clone this repository in in `load-path` and add this to your .emacs:

```elisp
(require 'faust-mode)
(setq auto-mode-alist (cons '("\\.dsp$" . faust-mode) auto-mode-alist))
```
---
