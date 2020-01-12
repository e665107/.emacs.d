;; (use-package company-c-headers
;;   :ensure t
;;   :defer t
;;   )
(cond((equal system-type 'gnu/linux)

      (add-hook 'c-mode-hook 'global-company-mode)
      (add-hook 'c++-mode-hook 'global-company-mode)
      (add-hook 'asm-mode-hook 'global-company-mode)
      (add-hook 'verilog-mode-hook 'global-company-mode)
      (add-hook 'emacs-lisp-mode-hook 'global-company-mode)
      (setq company-idle-delay              0
            company-minimum-prefix-length   2
            company-show-numbers            t
            company-tooltip-limit           20
            ;; company-dabbrev-downcase        nil
            ;; company-backends                '((company-files company-gtags ))
            )
      ))
;; (use-package company
;;   :ensure t
;;   :defer t
;;   :init
;;   (add-hook 'after-init-hook 'global-company-mode)
;;   :config
;;   (use-package company-irony :ensure t :defer t)
;;   (setq company-idle-delay              nil
;;         company-minimum-prefix-length   2
;;         company-show-numbers            t
;;         company-tooltip-limit           20
;;         company-dabbrev-downcase        nil
;;         ;; company-backends                '((company-files company-gtags company-c-headers))
;;         )
;;   ;; :bind ("C-: " . company-complete-common)
;;   )
;; (use-package company
;;   :ensure t
;;   :defer t
;;   :init
;;   (autoload 'company-mode "company" t)
;;   (add-hook 'after-init-hook #'global-company-mode)
;;   (setq company-idle-delay 0)
;;   (setq company-minimum-prefix-length 2)
;;   '(company-show-numbers t)
;;   )
;; (eval-after-load 'company
;;   '(progn
;;      (define-key company-mode-map (kbd "C-:") 'helm-company)
;;      (define-key company-active-map (kbd "C-:") 'helm-company)))

(provide 'config-company)










