(require 'highlight-symbol)
;;(require 'idle-highlight-mode)
;;(autoload 'idle-highlight-mode "idle-highlight" "highlight the word the point is on" t)
;;(add-hook 'find-file-hook 'idle-highlight-mode)

(global-set-key [f3] 'highlight-symbol-at-point)
(global-set-key [(control f3)] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)

(provide 'init-highlight-symbol)
