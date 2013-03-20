(require 'markdown-mode)
(setq auto-mode-alist (append '(("/*.\.mk?do?w?n?$" . markdown-mode)) auto-mode-alist))

(provide 'init-markdown)
