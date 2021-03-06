(use-package super-save
  :ensure t
  :config
  (super-save-mode +1)
  (setq super-save-auto-save-when-idle t)
  )


(define-prefix-command 'ring-map)
(global-set-key (kbd "M-SPC") 'ring-map)
;;(bind-key* "C-SPC" 'ring-map)
(define-key ring-map (kbd "l") 'goto-last-change)
(define-key ring-map (kbd "r") 'helm-recentf)
(define-key ring-map (kbd "m") 'newline-and-indent)
(cond((equal system-type 'windows-nt)
      (define-key ring-map (kbd "g") 'goto-line)
      ))
(define-key ring-map (kbd "9") 'bookmark-set)
(define-key ring-map (kbd "7") 'bookmark-jump)
(define-key ring-map (kbd "w") 'er/mark-inside-pairs)
(define-key ring-map (kbd "h") 'highlight-symbol-at-point)
(define-key ring-map (kbd "d") 'dired-jump)
(define-key ring-map (kbd "t") 'shell-command)
(define-key ring-map (kbd "q") 'query-replace)
(define-key ring-map (kbd "c") 'helm-find-files)
(define-key ring-map (kbd "p") 'browse-url-at-point)
(define-key ring-map (kbd "a") 'beginning-of-buffer)
(define-key ring-map (kbd "e") 'end-of-buffer)
(define-key ring-map (kbd "1") 'delete-other-windows)
(define-key ring-map (kbd "2") 'split-window-below)
(define-key ring-map (kbd "3") 'split-window-right)
(define-key ring-map (kbd "z") 'suspend-frame)
(define-key ring-map (kbd "n") 'new-frame)
(define-key ring-map (kbd "u") 'delete-frame)
(define-key ring-map (kbd "o") 'other-frame)
(define-key ring-map (kbd "i") 'shell)
(define-key ring-map (kbd "j") 'kill-ring-save)
(define-key ring-map (kbd ";") 'c-mark-function)
(define-key ring-map (kbd "0") 'eval-buffer)
(define-key ring-map (kbd "s") 'avy-goto-char)

;; (keyboard-translate ?\C-i ?\H-i)
;; (global-set-key [?\H-i] 'previous-line)
;; redefine the TAB
(define-key local-function-key-map [tab] nil)
(defun my-c-mode-common-hook ()
  (local-set-key (kbd "<tab>") 'indent-for-tab-command)
  ;; (local-set-key (kbd "<tab>") 'indent-for-tab-command)
  )

;; (global-set-key (kbd "TAB") 'dabbrev-expand) 
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'elisp-mode-hook'my-c-mode-common-hook)

;; define C-j C- 组合键
(define-key lisp-interaction-mode-map (kbd "<C-i>") nil)
(global-unset-key (kbd "<C-i>") )
(bind-key* "C-i C-j" 'avy-goto-char)
(bind-key* "C-i C-i" 'completion-at-point)
(bind-key* "C-i C-p" 'org-metaleft)
(bind-key* "C-i C-n" 'org-metaright)
(bind-key* "C-i C-k" 'org-promote-subtree)
(bind-key* "C-i C-l" 'org-demote-subtree)
(bind-key* "C-i C-s" 'save-all)
(bind-key* "C-i 1" 'select-window-1)
(bind-key* "C-i 2" 'select-window-2)
(bind-key* "C-i 3" 'select-window-3)
;; (bind-key* "C-i 4" 'select-window-4)
;; (bind-key* "C-i 5" 'select-window-4)
;; (bind-key* "C-i 6" 'select-window-4)
;; (bind-key* "C-i 7" 'select-window-4)
;; (bind-key* "C-i 8" 'select-window-4)
;; (bind-key* "C-i 9" 'select-window-4)
;; (bind-key* "C-i 0" 'select-window-4)
;; (bind-key* "C-i '" 'select-window-4)
;; (bind-key* "C-i a" 'goto-line)
(bind-key* "C-i d" 'loop-alpha)
;; (bind-key* "C-i c" 'goto-line)
;; (bind-key* "C-i e" 'goto-line)
;; (bind-key* "C-i g" 'goto-line)
;; (bind-key* "C-i h" 'goto-line)
;; (bind-key* "C-i i" 'goto-line)
;; (bind-key* "C-i j" 'goto-line)
;; (bind-key* "C-i l" 'goto-line)
;; (bind-key* "C-i m" 'goto-line)
;; (bind-key* "C-i n" 'goto-line)
;; (bind-key* "C-i o" 'goto-line)
;; (bind-key* "C-i p" 'goto-line)
;; (bind-key* "C-i q" 'goto-line)
;; (bind-key* "C-i r" 'goto-line)
;; (bind-key* "C-i s" 'goto-line)
;; (bind-key* "C-i t" 'goto-line)
;; (bind-key* "C-i u" 'goto-line)
;; (bind-key* "C-i v" 'goto-line)
;; (bind-key* "C-i w" 'goto-line)
;; (bind-key* "C-i x" 'goto-line)
;; (bind-key* "C-i y" 'goto-line)
;; (bind-key* "C-i z" 'goto-line)
;; (bind-key* "C-i ," 'goto-line)
;; (bind-key* "C-i ." 'goto-line)
;; (bind-key* "C-i /" 'goto-line)
;; (bind-key* "C-i ;" 'goto-line)

;;C-i f x
(bind-key* "C-i f j" 'helm-chrome-bookmarks)
(bind-key* "C-i f r" 'helm-chrome-reload-bookmarks)
;; (bind-key* "C-i f u" 'select-window-4)
;; (bind-key* "C-i f h" 'select-window-4)
;; (bind-key* "C-i f k" 'select-window-4)
;; (bind-key* "C-i f l" 'avy-goto-char)
;; (bind-key* "C-i f o" 'avy-goto-char)
;; (bind-key* "C-i f n" 'avy-goto-char)
;; (bind-key* "C-i g" 'avy-goto-char)
;; (bind-key* "C-i g" 'avy-goto-char)
;; (bind-key* "C-i g" 'avy-goto-char)
;; (bind-key* "C-i g" 'avy-goto-char)
;; (bind-key* "C-i g" 'avy-goto-char)
(global-set-key (kbd "C-j") 'avy-goto-char)
(global-set-key (kbd "C-r") 'read-only-mode)
(global-set-key (kbd "C-;") 'save-all)
(global-set-key (kbd "C-q") 'set-mark-command)


(provide 'config-keys)

