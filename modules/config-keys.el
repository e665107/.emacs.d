(global-set-key (kbd "C-c C-v") 'yas-visit-snippet-file)

(define-prefix-command 'ring-map)
(global-set-key (kbd "M-SPC") 'ring-map)
(define-key ring-map (kbd "l") 'goto-last-change)
(define-key ring-map (kbd "r") 'helm-recentf)
(define-key ring-map (kbd "m") 'newline-and-indent)
;; (define-key ring-map (kbd "9") 'bookmark-set)
;; (define-key ring-map (kbd "7") 'bookmark-jump)
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
(define-key ring-map (kbd "o") 'cscope-code)
(define-key ring-map (kbd "g") 'gtags-code)
(define-key ring-map (kbd "i") 'shell)
(define-key ring-map (kbd "j") 'kill-ring-save)
(define-key ring-map (kbd ";") 'c-mark-function)
(define-key ring-map (kbd "0") 'eval-buffer)
(define-key ring-map (kbd "b") 'helm-chrome-bookmarks)


(define-key lisp-interaction-mode-map (kbd "<C-i>") nil)
(global-unset-key (kbd "<C-i>") )

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
(add-hook 'makefile-mode-hook'my-c-mode-common-hook)

;; (keyboard-translate ?\C-i ?\H-i)
;; (global-set-key [?\H-i] 'previous-line)
(bind-key* "C-i C-c" 'completion-at-point)
(bind-key* "C-i C-w" 'kill-ring-save)
(bind-key* "C-i C-p" 'org-metaleft)
(bind-key* "C-i C-n" 'org-metaright)
(bind-key* "C-i C-a" 'org-demote-subtree)
(bind-key* "C-i C-l" 'org-promote-subtree)
(bind-key* "C-i C-o" 'newline-and-indent)
(bind-key* "C-i d" 'dired-jump)
(bind-key* "C-i C-d" 'dired-jump)
(bind-key* "C-i C-e" 'er/expand-region)
(bind-key* "C-i C-s" 'save-all)
(bind-key* "C-i C-v" 'helm-show-kill-ring)
(bind-key* "C-i C-i" 'other-window)
(bind-key* "C-i C-b" 'bookmark-set)
(bind-key* "C-i C-j" 'bookmark-jump)
(bind-key* "C-i C-3" 'org-sparse-tree)
(bind-key* "C-i C-q" 'er/mark-symbol)

(bind-key* "C-i C-r" 'hide-ifdefs)
(bind-key* "C-i C-t" 'show-ifdefs)
(bind-key* "C-i C-g" 'hide-ifdef-block)
(bind-key* "C-i C-f" 'show-ifdef-block)

;; (bind-key* "C-i C-8" 'bookmark-set)
;; (bind-key* "C-i C-9" 'bookmark-jump)

(bind-key* "C-i e" 'comment-dwim)
;; (bind-key* "C-i C-j" 'helm-maybe-exit-minibuffer)
(bind-key* "C-i C-1" 'delete-other-windows)
(bind-key* "C-i v" 'helm-copy-to-buffer)
(bind-key* "C-i 1" 'select-window-1)
(bind-key* "C-i 2" 'select-window-2)
(bind-key* "C-i 3" 'select-window-3)
(bind-key* "C-i 4" 'select-window-4)
(bind-key* "C-i g" 'goto-line)
(bind-key* "C-i o" 'org-shifttab)

;; for the test
;; (bind-key* "C-i C-." 'helm-execute-persistent-action)

;;C-i f x
(bind-key* "C-i f o" 'helm-gtags-find-files)
;; (bind-key* "C-i f j" 'select-window-4)
;; (bind-key* "C-i f j" 'select-window-4)
;; (bind-key* "C-i f j" 'select-window-4)

;; (bind-key* "C-i g" 'avy-goto-char)
;; (bind-key* "C-i g" 'avy-goto-char)
;; (bind-key* "C-i g" 'avy-goto-char)
;; (bind-key* "C-i g" 'avy-goto-char)
;; (bind-key* "C-i g" 'avy-goto-char)
;; (bind-key* "C-i g" 'avy-goto-char)
;; (bind-key* "C-i g" 'avy-goto-char)
;; (bind-key* "C-i g" 'avy-goto-char)



(global-unset-key (kbd "<C-u>") )
;; (bind-key* "C-u C-u" 'newline-and-indent)
(bind-key* "C-u C-u" 'other-frame)
(bind-key* "C-u C-f" 'hs-toggle-hiding)
(bind-key* "C-u C-d" 'newline-and-indent)
(bind-key* "C-u C-v" 'org-global-cycle)

;; (BIND-key* "C-u C-j" 'helm-maybe-exit-minibuffer)
;; (bind-key* "C-u C-d" 'my-comment-or-uncomment-region)
;; (bind-key* "C-u C-v" 'helm-copy-to-buffer)
(global-set-key (kbd "C-j") 'avy-goto-char)

(global-set-key (kbd "C-r") 'read-only-mode)
(global-set-key (kbd "C-;") 'save-all)
(global-set-key (kbd "C-q") 'set-mark-command)
;; (global-set-key (kbd "C-q") 'helm-maybe-exit-minibuffer)

;; (global-set-key (kbd "C-c g") 'call-graph)


;;      (define-key map (kbd "e") 'cg/widget-expand-all)
;;      (define-key map (kbd "c") 'cg/widget-collapse-all)
;;      (define-key map (kbd "p") 'widget-backward)
;;      (define-key map (kbd "n") 'widget-forward)
;;      (define-key map (kbd "q") 'cg/quit)
;;      (define-key map (kbd "+") 'cg/expand)
;;      (define-key map (kbd "_") 'cg/collapse)
;;      (define-key map (kbd "o") 'cg/goto-file-at-point)
;;      (define-key map (kbd "g") 'cg/at-point)
;;      (define-key map (kbd "d") 'cg/remove-caller)
;;      (define-key map (kbd "l") 'cg/select-caller-location)
;;      (define-key map (kbd "r") 'cg/reset-caller-cache)
;;      (define-key map (kbd "t") 'cg/toggle-func-args)
;;      (define-key map (kbd "f") 'cg/toggle-filter-func-reference)
;;      (define-key map (kbd "<RET>") 'cg/goto-file-at-point)

(provide 'config-keys)

