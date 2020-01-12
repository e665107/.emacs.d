(global-set-key (kbd "C-c a") 'org-agenda)

(use-package org
  :ensure t
  :defer t
  :config
  ;;mobile org
  (setq org-mobile-directory "~/mobile-org")
  (setq org-mobile-files (list  "~/agenda/gtd.org""~/agenda/goals_of_2018.org"))
  (setq org-directory "~/agenda")
  (setq org-agenda-files (list "~/agenda/gtd.org" "~/pc_org/experience.org"))
  (setq org-mobile-inbox-for-pull "~/agenda/inbox.org")
  (setq org-default-notes-file (concat org-directory "notes.org"))
  ;; 自己的pc
  (cond((equal system-type 'windows-nt)
        (defcustom org-mobile-checksum-binary (or (executable-find "~/bin/GnuWin32/bin/md5sum.exe"))
          "Executable used for computing checksums of agenda files."
          :group 'org-mobile
          :type 'string)
        ))
  ;; (defun my-org-mode-config ()
  ;;   "For use in `org-mode-hook'."
  ;;   (local-set-key  (kbd "C-c l") 'org-store-link)
  ;;   (local-set-key  (kbd "C-c a") 'org-agenda) 
  ;;   ;; (local-set-key  (kbd "C-c c") 'org-capture) 
  ;;   )
  ;; ;; add to hook
  ;; (add-hook 'org-mode-hook 'my-org-mode-config)
  ;;org-key settings
  ;; (global-set-key "\C-c \C-l" 'org-store-link)
  (global-set-key (kbd "C-c c") 'org-capture)
  (global-set-key (kbd "C-c b") 'org-iswitchb)
  ;;神奇的org-mode
  (setq org-startup-indented t)
  (setq org-log-done 'time)
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)

  (setq org-todo-keywords
        '((sequence "TODO" "DONE")))

  (require 'auto-org-md)
  )


;; (setq calendar-latitude 40.2)
;; (setq calendar-longitude 116.2)
;; (setq calendar-location-name "Beijing, Changping")
;; Auto-export org files to html when saved 
;; (defun org-mode-export-hook()
;;   "Auto export html"
;;   (when (eq major-mode 'org-mode)
;;     (org-export-as-html t)))
;; (add-hook 'after-save-hook 'org-mode-export-hook)

;;UTF8
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;tramp
;; (require 'tramp)
;; (setq tramp-default-method "plink")

;; (cond
;;  ((eq system-type 'windows-nt)
;;   (setq tramp-default-method "plink"
;;         tramp-password-end-of-line "\r\n"))
;;  ((eq system-type 'gnu/linux)
;;   (setq tramp-default-method "ssh")))
;; (setq tramp-default-user "ubuntu"
;;       tramp-default-host "192.168.0.149")
;; (setq password-cache-expiry 36000)

(provide 'config-org)











