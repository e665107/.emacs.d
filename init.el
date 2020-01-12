;; emacs 配置 for myself and windows
;;设置环境变量
(cond((equal system-type 'windows-nt)
      (setenv"HOME" "D:/program files/emacs24.5")
      (setenv"ARTISTIC_STYLE_OPTIONS" "D:/program files/emacs24.5/bin/AStyle/astylerc.opt")
      (setenv"PATH" "D:/program files/emacs24.5/bin;D:/program files/emacs24.5/UnxUtils/usr/local/wbin;D:/program files/Git/bin;D:/program files/emacs24.5/bin/Gnu_global/bin;D:/program files/emacs24.5/bin/AStyle/bin;D:/Program Files/python;D:/Program Files/python/Scripts;c:/Windows/System32;c:/msys64/mingw64/bin;c:/msys64/opt/cmake-3.11.2-win64-x64/bin;C:/Program Files/Java/jdk1.8.0_171/bin;c:/Program Files/Glyph & Cog/XpdfReader-win64/;c:/Program Files/Git/bin")
      (setq default-directory "~/")
      ))

(cond((equal system-type 'gnu/linux)

      (setenv"ARTISTIC_STYLE_OPTIONS" "/home/e66/.emacs.d/bin/AStyle/astylerc.opt")
      
      ;; (setenv "PATH" "/bin;/bin/bash;/home/e66/.emacs.d/bin/AStyle/bin")
      
      ))

(cond((equal system-type 'gnu/linux)
      ;; (add-to-list 'exec-path "/home/e66/.emacs.d/bin/AStyle/bin")
      
      ))

(cond((equal system-type 'windows-nt)
      (add-to-list 'exec-path "C:/msys64/mingw64/bin")
      (add-to-list 'exec-path "C:/Program Files/Git/bin")
      (add-to-list 'exec-path "D:/Program Files/UnxUtils/usr/local/wbin")
      (add-to-list 'exec-path "D:/program files/emacs24.5/bin/find_grep_xargs")
      (add-to-list 'exec-path "D:/program files/emacs24.5/bin/AStyle/bin")
      (add-to-list 'exec-path "D:/program files/python/Scripts")
      (add-to-list 'exec-path "D:/program files/python")
      ;; (add-to-list 'exec-path "C:/msys64/usr/bin")
      (add-to-list 'exec-path "D:/program files/emacs24.5/bin/Gnu_global/bin")
      ;; (add-to-list 'exec-path "C:/msys64/usr/lib/ssh")
      ;; (add-to-list 'exec-path "D:/program files/emacs24.5/bin/Freeplane")
      (add-to-list 'exec-path "D:/program files/emacs24.5/bin")
      ;; (add-to-list 'exec-path "c:/Program Files/Glyph & Cog/XpdfReader-win64/")
      ;; (add-to-list 'exec-path "D:/program files/emacs24.5/bin/ctags58")

      ;; (add-to-list 'exec-path "D:/Program Files (x86)/OpenSSH/bin")
      ))

;;添加最新的源
(require 'package)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

 (package-initialize)

 (when (not package-archive-contents)
   (package-refresh-contents))

 (unless (package-installed-p 'use-package)
   (package-install 'use-package))
(add-to-list 'load-path "~/.emacs.d/elpa/use-package-20170812.2256")


(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(add-to-list 'load-path "~/.emacs.d/modules")

(setq gc-cons-threshold (* 256 1024 1024))
(add-hook 'emacs-startup-hook
          '(lambda () (setq gc-cons-threshold (* 50 1024 1024))))

(setq emacs-load-start-time (current-time))

(require 'config-theme)
(require 'config-general)
(require 'config-edit)
(require 'config-rely)
                                        ;         ;(require 'config-cedet-semantic)
(require 'config-auto-complete)
;;(require 'config-company)
(require 'config-helm)
(require 'config-c)
(require 'config-hdl)
(require 'config-magit)
(require 'config-org)
(require 'config-keys)
(require 'config-final)

;; (require 'config-evil)

;; (load 'auctex.el' nil t t)
;; (load 'preview-latex.el' nil t t)
;;
(cond((equal system-type 'freebsd)
      (add-to-list 'load-path "~/.emacs.d/elpa/auctex")
      (setq TeX-auto-save t)
      (setq TeX-parse-self t)
      (setq-default TeX-master nil)
      (setq preview-scale-function 1.3)
      (setq LaTeX-math-menu-unicode t)
      (setq TeX-insert-braces nil)
      (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
      (require 'tex-mik)
      ))

;; (require 'config-matlab)
;; (global-font-lock-mode -1)
;; (setq jit-lock-defer-time 0.05)
;; (desktop-save-mode t)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(zenburn-theme youdao-dictionary yasnippet-snippets window-numbering wiki-summary w3m vlf viewer vhdl-capf use-package tabbar super-save sr-speedbar smartparens riscv-mode qt-pro-mode qml-mode projectile-ripgrep powerline pdf-tools parsebib outshine org-email org-blog openwith opencl-mode nyan-mode neotree nasm-mode multiple-cursors multi-term metaweblog matlab-mode magit-svn imenu-anywhere iedit iasm-mode hydra highlight-symbol highlight-indent-guides hide-comnt helm-swoop helm-projectile helm-open-github helm-mode-manager helm-make helm-gtags helm-gitlab helm-flx helm-firefox helm-dired-history helm-directory helm-cscope helm-company helm-chrome helm-c-yasnippet helm-bm helm-ag graphviz-dot-mode google-c-style github-search ggtags function-args flycheck firefox-controller expand-region evil-tutor evil-surround evil-leader evil-escape eno dts-mode dired-subtree dired-ranger dired-details+ dired+ diffview diff-hl company-irony company-c-headers color-theme colemak-evil cnfonts cmake-mode chm-view c-eldoc browse-at-remote biblio avy autofit-frame auto-save-buffers-enhanced auto-org-md auto-complete-clang auto-complete-c-headers auto-auto-indent auctex atomic-chrome android-mode anaconda-mode aggressive-indent ace-jump-mode ac-etags ac-clang ac-capf)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
