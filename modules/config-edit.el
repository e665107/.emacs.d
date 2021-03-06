;;保存的时候进行untabify，将TAB改为相应的空格数
(defvar untabify-this-buffer)
(defun untabify-all ()
  "Untabify the current buffer, unless `untabify-this-buffer' is nil."
  (and untabify-this-buffer (untabify (point-min) (point-max))))
(define-minor-mode untabify-mode
  "Untabify buffer on save." nil " untab" nil
  (make-variable-buffer-local 'untabify-this-buffer)
  (setq untabify-this-buffer (not (derived-mode-p 'makefile-mode )))
  ;; (setq untabify-this-buffer (not (derived-mode-p 'asm-mode)))
  (add-hook 'before-save-hook #'untabify-all))

(add-hook 'prog-mode-hook 'untabify-mode)
;;agreesive
(use-package aggressive-indent
  :ensure t
  :defer t
  :init
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
  (add-hook 'c++-mode-hook #'aggressive-indent-mode)
  (add-hook 'c-mode-hook #'aggressive-indent-mode)
  (add-hook 'java-mode-hook #'aggressive-indent-mode)
  ;; (add-to-list 'aggressive-indent-excluded-modes 'html-mode)
  )

;;定义快捷键C-c C-/为注释和取消注释快捷键
(global-set-key (kbd "C-c C-/") 'comment-or-uncomment-region)

;; ;如果选中多行则注释/反注释选中行，如果什么都没有选中，则针对当前光标所在行进行操作
(defun my-comment-or-uncomment-region (beg end &optional arg)
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end) nil)
                 (list (line-beginning-position)
                       (line-beginning-position 2))))
  (comment-or-uncomment-region beg end arg)
  )

(global-set-key [remap comment-or-uncomment-region] 'my-comment-or-uncomment-region)

;;添加Yasnippet
(use-package yasnippet
  :defer t
  :bind(
        ("C-c C-i" . yas-new-snippet)
        ("C-c C-o" . helm-yas-visit-snippet-file)
        ("C-c C-p" . yas-reload-all)
        )
  :init
  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets"
          "~/.emacs.d/elpa/yasnippet-20161110.1226/snippets")            ;; personal snippets
        )
  (yas-global-mode 1))

;; dired
(setq dired-dwim-target t)

(defun xah-dired-mode-setup ()
  "to be run as hook for `dired-mode'."
  (dired-hide-details-mode 1))
(add-hook 'dired-mode-hook 'xah-dired-mode-setup)

;; (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file) ; was dired-advertised-find-file
;; (define-key dired-mode-map (kbd "^")
;; (lambda () (interactive) (find-alternate-file "..")))  ; was dired-up-directory
;; allow dired to delete or copy dir
(setq dired-recursive-copies (quote always)) ; “always” means no asking
(setq dired-recursive-deletes (quote top)) ; “top” means ask once



(use-package dired-hacks-utils
  :ensure t
  )

;;dired-ranger
(use-package dired-ranger
  :ensure t
  :defer t
  :init
  (define-key dired-mode-map (kbd "c") 'dired-ranger-copy)
  (define-key dired-mode-map (kbd "l") 'dired-ranger-move) 
  (define-key dired-mode-map (kbd "h") 'dired-ranger-paste)
  (define-key dired-mode-map (kbd "j") 'dired-up-directory) 
  (define-key dired-mode-map (kbd "i") 'dired-subtree-insert) 
  (define-key dired-mode-map (kbd "f") 'dired-subtree-remove)
  (define-key dired-mode-map (kbd "s") 'dired-do-shell-command)
  (define-key dired-mode-map (kbd"P")  'pack-dired-dwim)
  )

;;multi-term
(use-package multi-term
  :ensure t
  :defer t
  )

;;emacs的默认compile命令是调用make -k，我把它改成了make。你也可以把它改成其他的，比如gcc之类的.
(setq compile-command "make")

;;打开多个shell窗口
(defun wcy-shell-mode-auto-rename-buffer (text)
  (if (eq major-mode 'shell-mode)
      (rename-buffer  (concat "shell:" default-directory) t)))
(add-hook 'comint-output-filter-functions'wcy-shell-mode-auto-rename-buffer)

;;按 C-M-n 可以连续下跳 5 行，按 C-M-p 可以连续上跳 5 行：
(global-set-key (kbd "C-M-n")
                (lambda () (interactive) (next-line 5)))
(global-set-key (kbd "C-M-p")
                (lambda () (interactive) (previous-line 5)))

;;使用 C-w 来删除整行（操作时不用事先选中整行），同时不影响原有的剪切功能。M-w 也可以在不;;事先选中整行的情况下复制整行。
(defadvice kill-ring-save (before slickcopy activate compile)
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
(defadvice kill-region (before slickcut activate compile)
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))


;;一边写代码一边看参照其他文档时。按 F11 键可以一键切换透明度，非常方便：
;;set transparent effect
;; (global-set-key [(f11)] 'loop-alpha)
                                        ;(setq alpha-list '((100 100) (95 65) (85 55) (75 45) (65 35)))
(setq alpha-list '((110 110) (65 35)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))                ;; head value will set to
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
  )

;;根据菜单进行的自定义设置
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 ;; '(menu-bar-mode nil)
 '(show-paren-mode t)
 ;; ;;helper tools
 ;; '(semantic-default-submodes (quote (global-semantic-decoration-mode global-semantic-idle-completions-mode
 ;;                                      global-semantic-idle-scheduler-mode global-semanticdb-minor-mode
 ;;                                      global-semantic-idle-summary-mode global-semantic-mru-bookmark-mode)))
 ;; '(semantic-idle-scheduler-idle-time 3)
 )

(electric-layout-mode t)


;;expand-region
(use-package expand-region
  :ensure t
  :init

  ;; :bind(
  
  ;; ("M-m d" . er/mark-word)          
  ;; ("M-m p" . er/mark-outdide-paird)         
  ;; ("M-m P" . er/mark-indide-paird)  
  ;; ("M-m q" . er/mark-outdide-quoted)  
  ;; ("M-m Q" . er/mark-indide-quoted) 
  ;; ("M-m c" . er/mark-comment)       ;;快捷键 C-M-h 标记一个函数  往后标记C-M-DPC
  ;; ("M-m f" . er/mark-defun)
  ;; )

  )

;;highlight-symbol 再按一次取消
;; (global-set-key (kbd "M--") 'highlight-symbol-at-point)
;; (global-set-key (kbd "M-n") 'highlight-symbol-next)
;; (global-set-key (kbd "M-p") 'highlight-symbol-prev)

;;开启ace-jump-mode
;; (use-package ace-jump-mode
;;   :ensure t
;;   :defer t
;;   :init
;;   (autoload
;;     'ace-jump-mode
;;     "ace-jump-mode"
;;     "Emacs quick move minor mode"
;;     t)
;;   (autoload
;;     'ace-jump-mode-pop-mark
;;     "ace-jump-mode"
;;     "Ace jump back:-)"
;;     t)
;;   (eval-after-load "ace-jump-mode"
;;     '(ace-jump-mode-enable-mark-sync))
;;   (define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
;;   :bind (
;;          ("C-c SPC" . ace-jump-mode)
;;          )
;;   )
;; (define-key global-map (kbd "C-c -") 'ace-jump-mode)



(use-package window-numbering
  :ensure t
  :defer t
  :init
  (window-numbering-mode 1)
  (winner-mode 1)
  (global-set-key (kbd "C-M-j") 'winner-undo)
  (global-set-key (kbd "C-M-k") 'winner-redo)
  )

;;multiple-cursors-mode
(global-set-key (kbd "C-c m")'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;cua-mode
(cua-selection-mode t)
(setq visible-bell t)
(setq default-fill-column 60)
(setq frame-title-format
      '(buffer-file-name "%f"
                         (dired-directory dired-directory "%b")))

;; (which-func-mode)
(defun spaceline--unicode-number (str)
  "Return a nice unicode representation of a single-digit number STR."
  (cond
   ((string= "1" str) "➊")
   ((string= "2" str) "➋")
   ((string= "3" str) "➌")
   ((string= "4" str) "➍")
   ((string= "5" str) "➎")
   ((string= "6" str) "➏")
   ((string= "7" str) "➐")
   ((string= "8" str) "➑")
   ((string= "9" str) "➒")
   ((string= "0" str) "➓")))

(defun window-number-mode-line ()
  "The current window number. Requires `window-numbering-mode' to be enabled."
  (when (bound-and-true-p window-numbering-mode)
    (let* ((num (window-numbering-get-number))
           (str (when num (int-to-string num))))
      (spaceline--unicode-number str))))

(setq-default mode-line-format
              (list
               "%1"
               '(:eval (propertize
                        (window-number-mode-line)
                        'face
                        'font-lock-type-face))
               '(:propertize " %l " face (:weight bold))               
               "%1"
               ;; the buffer name; the file name as a tool tip
               '(:eval (propertize "%b " 'face 'font-lock-keyword-face
                                   'help-echo (buffer-file-name)))
               ;; relative position, size of file
               "["
               (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
               "/"
               (propertize "%I" 'face 'font-lock-constant-face) ;; size
               "] "

               " [" ;; insert vs overwrite mode, input-method in a tooltip
               '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                                   'face 'font-lock-preprocessor-face
                                   'help-echo (concat "Buffer is in "
                                                      (if overwrite-mode
                                                          "overwrite"
                                                        "insert") " mode")))

               '(:eval (when (buffer-modified-p)
                         (concat ","  (propertize "Mod"
                                                  'face 'font-lock-warning-face
                                                  'help-echo "Buffer has been modified"))))
               
               ;; is this buffer read-only?
               '(:eval (when buffer-read-only
                         (concat ","  (propertize "RO"
                                                  'face 'font-lock-type-face
                                                  'help-echo "Buffer is read-only"))))
               "] "
               ;; git
               '(:propertize vc-mode)

               ;; "  "
               ;; '(:eval (propertize
               ;;          (which-function)
               ;;          'face
               ;;          'font-lock-type-face))
               
               ;; string
               "  ("
               '(:propertize "Coding will change your life")
               ")"
               
               ))

(global-auto-revert-mode t)

;;ivy
;; (use-package ivy
;;   :disabled
;;   :ensure t
;;   :defer t
;;   :config
;;   (ivy-mode 1)
;;   )

(use-package whitespace
  :ensure t
  :defer t
  :init
  (autoload 'whitespace-mode   "whitespace" "Toggle whitespace visualization."        t)
  )

(use-package iedit
  :ensure t
  :defer t
  ;; :bind (
  ;;       ("C-;" . iedit-mode)
  ;;     )
  )




(use-package graphviz-dot-mode
  :ensure t
  :defer t
  )


(use-package image-dired
  :ensure t
  )



(provide 'config-edit)






