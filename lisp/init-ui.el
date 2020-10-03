;;;===========================================
;;;					模块介绍
;;; 用户交互界面模块
;;;===========================================

;; MODULE: USER INTERFACE

;; AUTHOR: EvanMeek the_lty_mail@foxmail.com

;;; Code:



;; 设置光标样式
(setq-default cursor-type 'bar)

;; 关闭工具栏
(if (display-graphic-p)
	(tool-bar-mode -1))

;; 关闭菜单栏
(menu-bar-mode -1)

;; 关闭滚动条
(if (display-graphic-p) 
	(scroll-bar-mode -1))

;; 去除默认启动界面
(setq inhibit-startup-screen t)

;; 去除启动信息
(setq inhibit-startup-echo-area-message t)

;; 关闭GUI功能
(setq use-file-dialog nil
      use-dialog-box nil) 



;; 高亮当前行
;; (global-hl-line-mode 1)

;; 设置字体
(defun font-installed-p (font-name)
  "Check if font with FONT-NAME is available."
  (find-font (font-spec :name font-name)))
  
(defconst sys/win32p
  (eq system-type 'windows-nt)
  "Are we running on a WinTel system?")


(defun +my/better-font()
  (interactive)
  ;; english font
  (if (display-graphic-p)
      (progn
        (set-face-attribute 'default nil
			    :font "Hack" ;; "Hack", "DejaVu Sans Mono"
			    :height 130 
				:weight 'normal)
        ;; chinese font
        (dolist (charset '(kana han symbol cjk-misc bopomofo))
          (set-fontset-font (frame-parameter nil 'font)
                            charset
                            (font-spec :family "Sarasa Mono SC"
									   :size 20
	)))
	)))

(defun +my|init-font(frame)
  (with-selected-frame frame
    (if (display-graphic-p)
        (+my/better-font))))

(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions #'+my|init-font)
  (+my/better-font))


;; 主题包

(use-package doom-themes
  :init

  (load-theme 'doom-solarized-light t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)) 

(provide 'init-ui)

