;;屏蔽C-space
(global-set-key (kbd "C-SPC") 'nil)

;;回车自动缩进
(define-key global-map (kbd "RET") 'newline-and-indent)

;;取消启动画面
;;(setq inhibit-startup-message t)

;;不使用对话框
(setq use-file-dialog nil)
(setq use-dialog-box nil)

;;用户名与邮件
(setq user-full-name "Geralt Chu")
(setq user-mail-address "chujiyang@gmail.com") 

;;在标题栏显示文件名
(setq frame-title-format "Emacs@%b")

;;启动位置和尺寸
(setq default-frame-alist
  '((height . 40)(width . 120)(menubar-lines . 10)))
  
;;在左侧显示行号
(global-linum-mode t)
;;(linum-mode t)

;;不要生成临时文件
(setq-default make-backup-files nil)

;;设置中文字体
(set-fontset-font t 'han (font-spec :family "YaHei Consolas Hybrid"))
(setq face-font-rescale-alist '(("YaHei Consolas Hybrid" . 1.2)))

;;设置默认工作目录
(setq default-directory "~/")

;;令C/C++下tab长度为4
(add-hook 'c-mode-hook '(lambda () (c-set-style "Stroustrup")))
(add-hook 'c++-mode-hook '(lambda () (c-set-style "Stroustrup")))

;;设定行距
(setq default-line-spaceing 4)

;;设定页宽
(setq default-fill-column 80)

;;设置删除环长度
(setq kill-ring-max 50000)

;;语法高亮
(global-font-lock-mode 1)

;;高亮显示区域
(transient-mark-mode t)

;;闪屏报警
(setq visible-bell t)

;;使用 y or n 提问
(fset 'yes-or-no-p 'y-or-n-p)

;;锁定minibuffer行高
;;(setq resize-mini-windows nil)

;;递归minibuffer
(setq enable-recursive-minibuffers t)

;;gdb-UI配置
(setq gdb-many-windows t)

;;全屏按键绑定
(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))
(global-set-key [f11] 'toggle-fullscreen)


(provide 'init-tips)
