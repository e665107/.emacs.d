;;调用git bash 实现shell功能
;; (cond((equal system-type 'windows-nt)
;;       (setq explicit-shell-file-name "C:/msys64/usr/bin/bash.exe")
;;       (setq shell-file-name "bash")
;;       (setq explicit-bash.exe-args '("--login" "-i")) ;;<- Have also tried -c, and without "--login"
;;       (setenv "SHELL" shell-file-name)
;;       (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
;;       ))

(use-package magit-popup
  :ensure t
  :defer t
  )

(use-package with-editor
  :ensure t
  :defer t
  )

(use-package git-commit
  :ensure t
  :defer t
  )

(use-package magit
  :ensure t
  :defer t  
  :bind(
        ("C-x g" . magit-status)
        )
  )


(provide 'config-magit)










