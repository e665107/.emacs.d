(use-package popup
  :ensure t
  :defer t
  )

(defun my-verilog-mode-hook ()
  (
   (ac-config-default)
   (setq ac-use-quick-help nil)
   (setq auto-start 2) ;; 输入2个字符才开始补全
   )
  )

;; (add-to-list 'load-path "~/.emacs.d/elpa/ac-etags-20161001.807")
;; (require 'ac-etags)
;; (custom-set-variables
;;  '(ac-etags-requires 3))

;; (eval-after-load "etags"
;;   '(progn
;;      (ac-etags-setup)))

;; (defun my/c-mode-common-hook ()
;;   (add-to-list 'ac-sources 'ac-source-etags))

;; (add-hook 'c-mode-common-hook 'my/c-mode-common-hook)
;; (add-hook 'c++-mode-common-hook 'my/c-mode-common-hook)
;; (add-hook 'asm-mode-common-hook 'my/c-mode-common-hook)

;; (add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-c-headers-20150911.2023")
;; define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks


;; (add-hook 'c-mode-hook
;;           (lambda ()
;;             (add-to-list 'ac-sources 'ac-source-c-headers)
;;             (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))

;; (use-package auto-complete-c-headers
;;   :ensure t
;;   :defer t
;;   :init
;;   (add-hook 'c-mode-hook
;;             (lambda ()
;;               (add-to-list 'ac-sources 'ac-source-c-headers)
;;               (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))
;;   )

;; (add-hook 'c-mode-hook
;;        (lambda ()
;;          (add-to-list 'ac-sources 'ac-source-c-headers)
;;          (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))

(use-package auto-complete
  :ensure t
  :defer t
  :init
  
  (require 'auto-complete-config)
  (ac-config-default)
  (setq ac-use-quick-help nil)
  (setq auto-start 2) ;; 输入2个字符才开始补全
  ;; (add-hook 'c-mode-common-hook (lambda() (require 'auto-complete-config)))
  ;; (add-hook 'verilog-mode-hook (lambda() (require 'auto-complete-config)))
  ;; (add-hook 'verilog-mode-hook 'my-verilog-mode-hook)
  ;; (require 'auto-complete-config)
  ;; (add-to-list 'ac-dictionary-directories " ~/.emacs.d/elpa/auto-complete-20161029.643/dict")
  ;; (global-set-key "\M-/" 'auto-complete) ) ;; 补全的快捷键
  )


;; (defun my:ac-c-header-init ()
;;   (require 'auto-complete-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-c-header-symbols t)
;;   (add-to-list 'achead:include-directories ' "
;;                c:/msys64/usr/lib/gcc/x86_64-pc-msys/6.4.0/include/c++
;;                c:/msys64/usr/lib/gcc/x86_64-pc-msys/6.4.0/include/c++/x86_64-pc-msys
;;                c:/msys64/usr/lib/gcc/x86_64-pc-msys/6.4.0/include/c++/backward
;;                c:/msys64/usr/lib/gcc/x86_64-pc-msys/6.4.0/include
;;                c:/msys64/usr/lib/gcc/x86_64-pc-msys/6.4.0/include-fixed
;;                c:/msys64/usr/include
;;                c:/msys64/usr/lib/../lib/../include/w32api
;; "
;;                ))

;; ;; now let's call this function from c/c++ hooks
;; (add-hook 'c-mode-hook 'my:ac-c-header-init)
;; (add-hook 'c++-mode-hook 'my:ac-c-header-init)

;; (add-to-list 'load-path "~/.emacs.d/elpa/ac-clang-20170615.838")
;; (require 'ac-clang)
;; (ac-clang-initialize)
;; (setq w32-pipe-read-delay 0)          ;; <- Windows Only
;; ;; (when (ac-clang-initialize)
;; ;;   (add-hook 'c-mode-common-hook '(lambda ()
;; ;;                                    (setq ac-clang-cflags CFLAGS)
;; ;;                                    (ac-clang-activate-after-modify))))
;; (setq tags-file-name "~/TAGS")

(provide 'config-auto-complete)







