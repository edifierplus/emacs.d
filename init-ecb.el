;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/ecb")
;;自动启动
(require 'ecb)
(setq ecb-auto-activate t)
;;用M-x ecb-activate启动
;;(require 'ecb-autoloads)
;;不显示每日提示
(setq ecb-tip-of-the-day nil)

(provide 'init-ecb)
