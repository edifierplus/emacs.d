;;----------------------------------------------------------------------------
;; Set load path
;;----------------------------------------------------------------------------
(eval-when-compile (require 'cl))
(defun sanityinc/add-subdirs-to-load-path (parent-dir)
  "Adds every non-hidden subdir of PARENT-DIR to `load-path'."
  (let* ((default-directory parent-dir))
    (progn
      (setq load-path
            (append
             (loop for dir in (directory-files parent-dir)
                   unless (string-match "^\\." dir)
                   collecting (expand-file-name dir))
             load-path)))))

(sanityinc/add-subdirs-to-load-path "/usr/share/emacs/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

(provide 'init-site-lisp)
