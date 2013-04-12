(setq byte-compile-warnings nil)
(add-to-list 'load-path "/usr/share/emacs/site-lisp/cedet/common/")
(load-file "/usr/share/emacs/site-lisp/cedet/common/cedet.el")
(require 'cedet)
(require 'semantic-ia)

;;Enable EDE (Project Management) features
(global-ede-mode t)

;;Open some features
;;(semantic-load-enable-minimum-features)
;;(semantic-load-enable-code-helpers)
;;(semantic-load-enable-guady-code-helpers)
(semantic-load-enable-excessive-code-helpers)
;;(semantic-load-enable-semantic-debugging-helpers)
;;(global-semantic-highlight-edits-mode 1)

;;Enable SRecode (Template management) minor-mode
(global-srecode-minor-mode 1)

;;设置搜索文件夹
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public" "../.." "../../include" "../../inc" "../../common" "../../public"))
(require 'semantic-c nil 'noerror)
(let ((include-dirs cedet-user-include-dirs))
  (mapc (lambda (dir)
    (semantic-add-system-include dir 'c++-mode)
    (semantic-add-system-include dir 'c-mode))
  include-dirs))

;;c and h 跳转
(require 'eassist nil 'noerror)
(define-key c-mode-base-map [C-f12] 'eassist-switch-h-cpp)
(setq eassist-header-switches
      '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
        ("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
        ("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
        ("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
        ("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
        ("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
        ("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
        ("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
        ("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
        ("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
        ("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
        ("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("c" . ("h"))
        ("m" . ("h"))
        ("mm" . ("h"))))

;;代码跳转
(global-set-key [f12] 'semantic-ia-fast-jump)
(global-set-key [S-f12]
  (lambda ()
    (interactive)
    (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
      (error "Semantic Bookmark ring is currently empty"))
    (let* ((ring (oref semantic-mru-bookmark-ring ring))
         (alist (semantic-mrub-ring-to-assoc-list ring))
         (first (cdr (car alist))))
    (if (semantic-equivalent-tag-p (oref first tag)
        (semantic-current-tag))
        (setq first (cdr (car (cdr alist)))))
    (semantic-mrub-switch-tags first))))
(define-key c-mode-base-map [M-f12] 'semantic-analyze-proto-impl-toggle)

;;代码折叠
(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)
(global-set-key [C-_] nil)
(define-key semantic-tag-folding-mode-map (kbd "C--") 'semantic-tag-folding-fold-block)
(define-key semantic-tag-folding-mode-map (kbd "C-=") 'semantic-tag-folding-show-block)
(define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
(define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all)
(global-set-key (kbd "C-0") 'global-semantic-tag-folding-mode)

;;Enable speedbar -> F4
(global-set-key [(f4)] 'speedbar-get-focus)

;;VS bookmarks
(enable-visual-studio-bookmarks)


(provide 'init-cedet)
