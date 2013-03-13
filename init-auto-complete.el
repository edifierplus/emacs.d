(add-to-list 'load-path "/usr/share/emacs/site-lisp/auto-complete")
(require 'auto-complete)
(require 'auto-complete-config)
;;(require 'auto-complete-c)
;;(require 'auto-complete-etags)
;;(require 'auto-complete-extension)
;;(require 'auto-complete-octave)
;;(require 'auto-complete-verilog)
;;(require 'auto-complete+)
;;(require 'util)
(add-to-list 'ac-dictionary-directories "/usr/share/emacs/site-lisp/auto-complete/ac-dict")
(ac-config-default)
(setq ac-auto-show-menu 0.01)

;;取消回车补全
(define-key ac-complete-mode-map (kbd "<return>") nil)
(define-key ac-complete-mode-map (kbd "RET") nil)

(provide 'init-auto-complete)
