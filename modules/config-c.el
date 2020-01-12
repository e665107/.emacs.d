;;缩进4个空格的TAB设置
(defun my-c-mode-hook ()
  (setq c-basic-offset 4          ;; 基本缩进宽度
        indent-tabs-mode nil        ;; 允许空格替换Tab
        default-tab-width 4))     ;; 默认Tab宽度
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)
;; (add-hook 'asm-mode-hook 'my-c-mode-hook)

;;auto-newline
(add-hook 'c-mode-common-hook 'my-c-common-mode)  
(defun my-c-common-mode ()  
  ;; 此模式下，当按Backspace时会删除最多的空格  
  (c-toggle-hungry-state))

;;加载xcscope
(use-package xcscope
  :ensure t
  :defer t
  ;; :bind (
  ;;        ("C-2" . cscope-find-this-symbol)       
  ;;        ("C-3" . cscope-find-global-definition) 
  ;;        ("C-4" . cscope-find-this-file)         
  ;;        ("C-5" . cscope-pop-mark)
  ;;        )
  :init
  (add-hook 'asm-mode-hook '(lambda() (require 'xcscope)))
  (add-hook 'c-mode-hook '(lambda() (require 'xcscope)))
  (add-hook 'c++-mode-hook '(lambda() (require 'xcscope)))
  )

(use-package helm-cscope
  :ensure t
  :defer t
  :init
  (add-hook 'c-mode-common-hook 'helm-cscope-mode)
  (add-hook 'asm-mode-hook 'helm-cscope-mode)
  (add-hook 'c++-mode-common-hook 'helm-cscope-mode)
  (add-hook 'helm-cscope-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c C-j") 'helm-cscope-find-global-definition)
              (local-set-key (kbd "C-c C-c") 'helm-cscope-find-calling-this-function)
              (local-set-key (kbd "C-c C-k") 'helm-cscope-find-this-symbol)
              (local-set-key (kbd "C-c C-f") 'helm-cscope-find-this-file)
              (local-set-key (kbd "C-c C-g") 'helm-cscope-find-egrep-pattern)
              (local-set-key (kbd "C-c C-a") 'helm-cscope-find-assignments-to-this-symbol)
              (local-set-key (kbd "C-c C-l") 'helm-cscope-pop-mark))))


;; 浏览大的代码文件时，禁止更新 以后做更改添加对Linux内核的识别
;; (setq cscope-do-not-update-database t)

;; ;;添加Google-c-style
(use-package google-c-style
  :ensure t
  :defer t
  :init
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent)
  )
;; add the qt
(use-package qt-pro-mode
  :ensure t
  :defer t
  :mode ("\\.pro\\'" "\\.pri\\'"))

(autoload 'qml-mode "qml-mode" "Editing Qt Declarative." t)
(add-to-list 'auto-mode-alist '("\\.qml$" . qml-mode))


;; (global-set-key (kbd"C-o") 'compile)

(setq load-path (cons (expand-file-name "~/elpa/cmake-mode-20180104.1137") load-path))
(require 'cmake-mode)

(setq auto-mode-alist  
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)  
                ("\\.cmake\\'" . cmake-mode))  
              auto-mode-alist))

(provide 'config-c)








