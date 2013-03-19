(add-to-list 'load-path "/usr/share/emacs/site-lisp/")
(require 'color-theme)
;(setq color-theme-is-global t)
;(color-theme-initialize)
;(color-theme-robin-hood)

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-oswald)))

(provide 'init-color-theme)
