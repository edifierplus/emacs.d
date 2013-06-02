;;用C-RET将本行裂开，并插入新行
(defun break-open-line ()
  (interactive)
  (open-line 1)
  (newline-and-indent))
(global-set-key [(ctrl return)] 'break-open-line)

;;用S-RET在行下方插入新行
(defun smart-open-line ()
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))
(global-set-key [(shift return)] 'smart-open-line)

;;保持括号成对
(electric-pair-mode +1)

;;用C-S-UP/DOWN将整行上下移动
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(control shift up)]  'move-line-up)
(global-set-key [(control shift down)]  'move-line-down)

;;将C-Backspace设定为删除整行及换行符
(global-set-key (kbd "C-<backspace>") 'kill-whole-line)

;;启动驼峰式单词识别
(add-hook 'prog-mode-hook 'subword-mode)

;;智能移动到行首
(defun smarter-move-beginning-of-line (arg)
  (interactive "^p")
  (setq arg (or arg 1))
  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))
  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))
  ;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;;设置C-^为删除行末换行符
(defun top-join-line ()
  (interactive)
  (delete-indentation 1))
(global-set-key (kbd "C-^") 'top-join-line)

;;屏蔽C-space
(global-set-key (kbd "C-SPC") 'nil)

;;回车自动缩进
(electric-indent-mode +1)

;;取消启动画面
(setq inhibit-startup-message t)

;;不使用对话框
(setq use-file-dialog nil)
(setq use-dialog-box nil)

;;用户名与邮件
(setq user-full-name "Geralt Chu")
(setq user-mail-address "chujiyang@gmail.com") 

;;在标题栏显示路径和文件名
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;;启动位置和尺寸
(setq default-frame-alist
  '((height . 40)(width . 120)(menubar-lines . 10)))
  
;;在左侧显示行号
(global-linum-mode t)
;;(linum-mode t)

;;不要生成临时文件
(setq-default make-backup-files nil)

;;显示最近访问文件
(require 'recentf)
(setq recentf-max-saved-items 200
      recentf-max-menu-items 15)
(recentf-mode t)

;;选中输入时覆盖
(delete-selection-mode t)

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
