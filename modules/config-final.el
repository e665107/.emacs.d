;;style google linux allman
(let ((style "allman"))
  (setq format-command (format "astyle --style=%s  -xb -S -p -F -H -xg -xe -n -xV -k3 -xj -c  -xL" style)))

(defun format-code ()
  "Format current buffer"
  (interactive)
  (let ((file (buffer-file-name)))
    (save-excursion
      (shell-command-to-string (format "%s %s" format-command file))
      (message "Code formatted"))))

(setq formats-command (format "astyle --options=\"/home/e66/astylerc.opt\"  -r  *.c *.h *.cpp"))

(defun formats-code ()
  "cscope current buffer"
  (interactive)
  (save-excursion
    (shell-command-to-string (format "%s" formats-command))
    (setq revert-buffer t)    
    ;; (shell-command-to-string (format "%s" ctags-command))
    (message "Code styled")))

(global-set-key (kbd"C-c q") 'format-code)

;; 实现将命令行绑定到快捷键了
(setq output-command (format "find . -name  -print -o -name \"*.asm\" -print -o -name \"*.[Ssch]\" -print > cscope.files" ))
(setq cscope-command (format "cscope -bkq"))
;; (setq ctags-command (format "ctags -"))
(setq gtags-command (format "global -u"))

(defun gtags-code ()
  "gtags current project"
  (interactive)
  (save-excursion
    (shell-command-to-string (format "%s" gtags-command))
    (message "tags updated")))

;; (global-set-key (kbd"C-c o") 'gtags-code)

(defun cscope-code ()
  "cscope current buffer"
  (interactive)
  (save-excursion
    (shell-command-to-string (format "%s" output-command))
    (shell-command-to-string (format "%s" cscope-command))
    ;; (shell-command-to-string (format "%s" ctags-command))
    (message "Code cscoped")))
;; (global-set-key (kbd"C-c  ") 'cscope-code)

;; (use-package super-save
;;   :ensure t
;;   :config
;;   (super-save-mode +1)
;;   (setq super-save-auto-save-when-idle t)
;;   )

;; 有道查词典
(setq url-automatic-caching t)
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)

;; (defun my-asm-mode-hook ()
;;   ;; you can use `comment-dwim' (M-;) for this kind of behaviour anyway
;;   (local-unset-key (vector asm-comment-char))
;;   ;; asm-mode sets it locally to nil, to "stay closer to the old TAB behaviour".
;;   (setq tab-always-indent (default-value 'tab-always-indent)))

;; (add-hook 'asm-mode-hook #'my-asm-mode-hook)

;; (add-to-list 'load-path "~/.emacs.d/elpa/customize")
;; (require 'gas-mode)
;; (add-to-list 'auto-mode-alist '("\\.S\\'" . gas-mode))

;; (add-to-list 'load-path "~/.emacs.d/elpa/nasm-mode-20161216.736")
;; (require 'nasm-mode)
;; (add-to-list 'auto-mode-alist `(,(concat (regexp-opt '(".ASM" ".S")) "\\'") . nasm-mode))


(global-unset-key (kbd "C-c & C-v"))
(global-set-key (kbd "C-c C-v") 'yas-visit-snippet-file)

(require 'openwith)
(openwith-mode t)

(when (require 'openwith nil 'noerror)
  (setq openwith-associations
        (list
         (list (openwith-make-extension-regexp
                '("mpg" "mpeg" "mp3" "mp4"
                  "avi" "wmv" "wav" "mov" "flv"
                  "ogm" "ogg" "mkv"))
               "vlc"
               '(file))
         (list (openwith-make-extension-regexp
                '("xbm" "pbm" "pgm" "ppm" "pnm"
                  "gif" "bmp" "tif" "jpeg" "jpg"))
               "geeqie"
               '(file))
         (list (openwith-make-extension-regexp
                '("doc" "pptx" "xls" "ppt" "docx" "ods" "odg" "odp"))
               "wps"
               '(file))
         (list (openwith-make-extension-regexp
                '("vsdx"))
               "VISIO"
               '(file))
         (list (openwith-make-extension-regexp
                '("pdf" ))
               "FoxitReader"
               ;; "AcroRd32"
               '(file))
         ;; (list (openwith-make-extension-regexp
         ;;        '("eww" ))
         ;;       "IarIdePm"
         ;;       '(file))
         (list (openwith-make-extension-regexp
                '("PrjPCB" "SchDoc" "PcbDoc"))
               "Altium"
               '(file))
         (list (openwith-make-extension-regexp
                '("uvprojx"))
               "Uv4"
               '(file))
         (list (openwith-make-extension-regexp
                '("chm"))
               "html"
               '(file))
         )))

;; (require 'zone)
;; (zone-when-idle 100)
;; (require 'atomic-chrome)
;; (atomic-chrome-start-server)

;; C-SPC commands below
(add-to-list 'load-path "~/.emacs.d/elpa/goto-chg-20180105.1833")
(require 'goto-chg)



(eval-after-load "dired-aux"
  '(add-to-list 'dired-compress-file-suffixes 
                '("\\.zip\\'" ".zip" "unzip")))



(setq sql-mysql-options '("-C" "-f" "-t" "-n")) ; for windows
(setq sql-user "root")
(setq sql-password "")


(desktop-save-mode t)
(savehist-mode 1)
;; (setq savehist-additional-variables '())
(add-to-list 'desktop-globals-to-save '(search-ring))
(add-to-list 'desktop-globals-to-save '(kill-ring))


(provide 'config-final)








