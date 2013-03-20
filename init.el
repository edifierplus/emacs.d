;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))


;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))
  

;;----------------------------------------------------------------------------
;; Load configs for specific features
;;----------------------------------------------------------------------------
(require 'init-plugins)
(require 'init-exec-path) ;; Set up $PATH
(require 'init-tips)
(require 'init-auto-complete)
(require 'init-cedet)
;;(require 'init-color-theme)
(require 'init-ecb)
(require 'init-highlight-symbol)
(require 'init-ido)
(require 'init-ibuffer)
(require 'init-gui-frames)
(require 'init-yasnippet)


;;----------------------------------------------------------------------------
;; Load configs for specific modes
;;----------------------------------------------------------------------------
(require 'init-php)
(require 'init-markdown)


;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))


;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
;;(require 'init-local nil t)


;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
;;(require 'init-locales)


;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
