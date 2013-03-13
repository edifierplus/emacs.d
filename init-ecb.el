;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/ecb")
;;自动启动
(require 'ecb)
(setq ecb-auto-activate t)
;;用M-x ecb-activate启动
;;(require 'ecb-autoloads)
;;不显示每日提示
(setq ecb-tip-of-the-day nil)

;;快捷键设置
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

(define-key global-map [(f5)] 'ecb-hide-ecb-windows)

(define-key global-map [(f6)] 'ecb-show-ecb-windows)

(provide 'init-ecb)
