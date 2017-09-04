;;; faust-mode.el --- Faust syntax highlighting and indentation for Emacs.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FAUST Mode (very simple syntax colorizing!)
;; by rukano
;; based on the tutorial on:
;; http://xahlee.org/emacs/elisp_syntax_coloring.html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; BIG TODOS:
;; Colorize Composition Operators
;; Colorize after keyword {}
;; Colorize arguments (numbers)
;; Colorize [] metadata in string?
;; Run Shell faust w/ custom defaults
;; *** Get rid of the No comment syntax defined warning


;; ROADMAP
;; export option and list possibilities
;; create hotkeys for every compilation
;; view graph

(defvar faust-keywords
  '("process" "with" "case" "seq" "par" "sum" "prod"
    "include" "import" "component" "library" "environment" "declare"
    "define" "undef" "error" "pragma" "ident"
    "if" "def" "else" "elif" "endif" "line" "warning"))

(defvar faust-functions
  '("mem" "prefix" "int" "float"
    "rdtable" "rwtable" "select2" "select3"
    "ffunction" "fconstant" "fvariable"
    "attach" "acos" "asin" "atan" "atan2" "cos" "sin" "tan" "exp"
    "log" "log10" "pow" "sqrt" "abs" "min" "max" "fmod"
    "remainder" "floor" "ceil" "rint"))

(defvar faust-ui-keywords
  '("button" "checkbox" "vslider" "hslider" "nentry"
    "vgroup" "hgroup" "tgroup" "vbargraph" "hbargraph"))

;; New!

(defconst faustine-faust-keywords-lib-analyzer
  '("amp_follower" "amp_follower_ud" "amp_follower_ar" "mth_octave_analyzer[N]" "mth_octave_spectral_level6e" "octave_filterbank" "octave_analyzer" "half_octave_filterbank" "half_octave_analyzer" "third_octave_filterbank" "third_octave_analyzer" "analyzer"))

(defconst faustine-faust-keywords-lib-basic
  '("samp2sec" "sec2samp" "db2linear" "linear2db" "lin2LogGain" "log2LinGain" "tau2pole" "pole2tau" "midikey2hz" "pianokey2hz" "hz2pianokey" "countdown" "countup" "sweep" "time" "tempo" "period" "pulse" "pulsen" "beat" "count" "take" "subseq" "if" "selector" "selectn" "select2stereo" "Other" "latch" "sAndH" "peakhold" "peakholder" "impulsify" "automat" "bypass1" "bypass2"))

(defconst faustine-faust-keywords-lib-compressor
  '("compressor_mono" "compressor_stereo" "limiter_*"))

(defconst faustine-faust-keywords-lib-delay
  '("delay" "fdelay" "sdelay" "fdelaylti" "fdelayltv" "fdelay[n]" "fdelay[n]a"))

(defconst faustine-faust-keywords-lib-demo
  '("Analyzers" "mth_octave_spectral_level_demo" "Filters" "parametric_eq_demo" "spectral_tilt_demo" "mth_octave_filterbank_demo" "filterbank_demo" "Effects" "cubicnl_demo" "gate_demo" "compressor_demo" "exciter" "moog_vcf_demo" "wah4_demo" "crybaby_demo" "vocoder_demo" "flanger_demo" "phaser2_demo" "freeverb_demo" "stereo_reverb_tester" "fdnrev0_demo" "zita_rev_fdn_demo" "zita_rev1" "Generators" "sawtooth_demo" "virtual_analog_oscillator_demo" "oscrs_demo"))

(defconst faustine-faust-keywords-lib-envelope
  '("smoothEnvelope" "ar" "asr" "adsr"))

(defconst faustine-faust-keywords-lib-filter
  '("zero" "pole" "integrator" "dcblockerat" "dcblocker" "ff_comb" "ff_fcomb" "ffcombfilter" "fb_comb" "fb_fcomb" "rev1" "fbcombfilter" "ffbcombfilter" "allpass_comb" "allpass_fcomb" "rev2" "allpass_fcomb5" "allpass_fcomb1a" "iir" "fir" "conv" "convN" "tf1" "tf2" "tf3" "notchw" "tf21" "tf22" "tf22t" "tf21t" "av2sv" "bvav2nuv" "iir_lat2" "allpassnt" "iir_kl" "allpassnklt" "iir_lat1" "allpassn1mt" "iir_nl" "allpassnnlt" "tf2np" "wgr" "nlf2" "apnl" "allpassn" "allpassnn" "allpasskl" "allpass1m" "tf2s" "tf2snp" "tf3slf" "tf1s" "tf2sb" "tf1sb" "resonlp" "resonhp" "resonbp" "lowpass" "highpass" "lowpass0_highpass1" "lowpass_plus|minus_highpass" "lowpass_plus|minus_highpass" "lowpass3e" "lowpass6e" "highpass3e" "highpass6e" "bandpass" "bandstop" "bandpass6e" "bandpass12e" "low_shelf" "lowshelf_other_freq" "high_shelf" "highshelf_other_freq" "peak_eq" "cubicnl" "gate_mono" "gate_stereo" "Filtering" "speakerbp" "piano_dispersion_filter" "stereo_width" "echo" "transpose" "mesh_square"))

(defconst faustine-faust-keywords-lib-hoa
  '("encoder" "decoder" "decoderStereo" "optimBasic" "optimMaxRe" "optimInPhase" "Usage" "wider" "map" "rotate"))

(defconst faustine-faust-keywords-lib-math
  '("SR" "BS" "PI" "FTZ" "neg" "sub(x,y)" "inv" "cbrt" "hypot" "ldexp" "scalb" "log1p" "logb" "ilogb" "log2" "expm1" "acosh" "asinh" "atanh" "sinh" "cosh" "tanh" "erf" "erfc" "gamma" "lgamma" "J0" "J1" "Jn" "Y0" "Y1" "Yn" "fabs" "fmax" "fmin" "np2" "frac" "isnan" "chebychev" "chebychevpoly" "diffn"))

(defconst faustine-faust-keywords-lib-misceffect
  '("Dynamic" "cubicnl" "gate_mono" "gate_stereo" "Filtering" "speakerbp" "piano_dispersion_filter" "stereo_width" "echo" "transpose" "Meshes" "mesh_square"))

(defconst faustine-faust-keywords-lib-miscoscillator
  '("sinwaveform" "coswaveform" "phasor" "oscsin" "osc" "oscos" "oscp" "osci" "lf_imptrain" "lf_pulsetrainpos" "lf_squarewavepos" "lf_squarewave" "lf_trianglepos" "lf_rawsaw" "lf_sawpos" "lf_sawpos_phase" "sawN(N,freq)" "sawNp" "saw2dpw(freq)" "saw2(freq)" "saw3(freq)" "saw4(freq)" "saw5(freq)" "saw6(freq)" "sawtooth(freq)" "saw2f2(freq)" "saw2f4(freq)" "pulsetrainN" "pulsetrain" "squareN" "square" "imptrain" "imptrainN" "triangle" "triangleN" "oscb" "oscr" "oscrs" "oscs" "oscs" "oscw" "oscwq" "oscwc" "oscws"))

(defconst faustine-faust-keywords-lib-noise
  '("noise" "multirandom" "multinoise" "noises" "pink_noise" "pink_noise_vm" "lfnoise" "lfnoise0" "lfnoiseN"))

(defconst faustine-faust-keywords-lib-phafla
  '("flanger_mono" "flanger_stereo" "phaser2_mono" "phaser2_stereo"))

(defconst faustine-faust-keywords-lib-pm
  '("chain" "input" "output" "terminations" "fullTerminations" "leftTermination" "rightTermination" "waveguide" "idealString"))

(defconst faustine-faust-keywords-lib-reverb
  '("jcrev" "satrev" "mono_freeverb" "stereo_freeverb" "fdnrev0" "zita_rev_fdn" "zita_rev1_stereo" "zita_rev1_ambi"))

(defconst faustine-faust-keywords-lib-route
  '("cross" "crossnn" "crossn1" "interleave" "butterfly" "hadamard" "recursivize"))

(defconst faustine-faust-keywords-lib-signal
  '("bus" "block" "interpolate" "smooth" "smoo" "polySmooth" "bsmooth" "lag_ud" "dot"))

(defconst faustine-faust-keywords-lib-spat
  '("panner" "spat" "stereoize"))

(defconst faustine-faust-keywords-lib-synth
  '("popFilterPerc" "dubDub" "sawTrombone" "combString" "additiveDrum" "additiveDrum"))

(defconst faustine-faust-keywords-lib-vaeffect
  '("moog_vcf" "moog_vcf_2b" "wah4" "autowah" "crybaby" "vocoder"))

(defvar faustine-faust-keywords-lib
  (append
   faustine-faust-keywords-lib-analyzer
   faustine-faust-keywords-lib-basic
   faustine-faust-keywords-lib-compressor
   faustine-faust-keywords-lib-delay
   faustine-faust-keywords-lib-demo
   faustine-faust-keywords-lib-envelope
   faustine-faust-keywords-lib-filter
   faustine-faust-keywords-lib-hoa
   faustine-faust-keywords-lib-math
   faustine-faust-keywords-lib-misceffect
   faustine-faust-keywords-lib-miscoscillator
   faustine-faust-keywords-lib-noise
   faustine-faust-keywords-lib-phafla
   faustine-faust-keywords-lib-pm
   faustine-faust-keywords-lib-reverb
   faustine-faust-keywords-lib-route
   faustine-faust-keywords-lib-signal
   faustine-faust-keywords-lib-spat
   faustine-faust-keywords-lib-synth
   faustine-faust-keywords-lib-vaeffect)
  "All the Faust library function keywords.")

(defvar faustine-mode-ac-source
  '((candidates . faustine-faust-keywords-lib)))

(defvar faustine-regexp-keywords-lib (regexp-opt faustine-faust-keywords-lib 'words))


(defconst faust-mode-font-lock-keywords
  `((,faustine-regexp-keywords-function . font-lock-function-name-face)
    (,faustine-regexp-keywords-statement . font-lock-keyword-face)
    (,faustine-regexp-keywords-lib . font-lock-keyword-face)
    (,faustine-regexp-keywords-ui . font-lock-variable-name-face)
    (,faustine-regexp-faust-operator . font-lock-type-face)
    (,faustine-regexp-keywords-lib . font-lock-builtin-face)
    (,faustine-regexp-faust-delimiters . font-lock-reference-face)
    (,faustine-regexp-faust-numbers . font-lock-negation-char-face)))

;; optimize regex for words
;;(defvar faust-math-op-regexp "[=\+()\{\}*-]")
(defvar faust-variables-regexp "[A-Za-z][A-Za-z]*")
(defvar faust-arguments-regexp "[0-9]")
(defvar faust-operator-regexp "\\([~!_@,<>:;]\\)")
(defvar faust-math-op-regexp "[=\+\{\}()/*-]")
(defvar faust-keywords-regexp (regexp-opt faust-keywords 'words))
(defvar faust-function-regexp (regexp-opt faust-functions 'words))
(defvar faust-ui-keywords-regexp (regexp-opt faust-ui-keywords 'words))

(defvar faustine-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?/  ". 124b" st)
    (modify-syntax-entry ?*  ". 23" st)
    (modify-syntax-entry ?\n "> b" st)
    (modify-syntax-entry ?\^m "> b" st)
    st)
  "Syntax table for `faust-mode'.")

;; define the mode
;;;###autoload
(define-derived-mode faust-mode prog-mode
  "FAUST mode"
  "Major mode for editing FAUST files (Functional Audio Stream)…"

  (setq
   comment-start "//"
   comment-end ""
   font-lock-defaults '(faust-mode-font-lock-keywords))

  (set-syntax-table faust-mode-syntax-table)

  ;; modify the keymap
  (define-key faust-mode-map [remap comment-dwim] 'faust-comment-dwim))

;; comment dwin support
(defun faust-comment-dwim (arg)
"Comment or uncomment current line or region in a smart way.
For detail, see `comment-dwim'."
   (interactive "*P")
   (require 'newcomment)
   (let ((deactivate-mark nil) (comment-start "//") (comment-end ""))
     (comment-dwim arg)))

(modify-syntax-entry ?/  ". 124b" faust-mode-syntax-table)
(modify-syntax-entry ?*  ". 23" faust-mode-syntax-table)
(modify-syntax-entry ?\n "> b" faust-mode-syntax-table)
(modify-syntax-entry ?\^m "> b" faust-mode-syntax-table)

(provide 'faust-mode)

;; End:
;;; faust-mode.el ends here
