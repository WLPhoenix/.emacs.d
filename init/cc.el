;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               C-flavored modes                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq c-backward-function 'backward-delete-char)

(c-add-style "wlphoenix"
  '("java"
	 ;; Offsets
	 (c-basic-offset . 4)
	 (tab-width . 4)
	 (indent-tabs-mode . t)
	 (c-offsets-alist
	   (substatement-open . 0))
  )
)

(setq c-default-style "wlphoenix")

;;; C mode
;;; C++ mode
;;; Java mode
(define-key java-mode-map (kbd "<return>") 'newline-and-indent)

(require 'cedit)
(require 'semantic)

(load "semantic/loaddefs.el")
(add-hook 'java-mode
  (lambda ()
    (semantic-mode 1)
  ))

;;; Malabar mode (extends java-mode)
(require 'malabar-mode)

(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))
(add-hook 'malabar-mode
  (lambda ()
    ;; Compile file after save
    (add-hook 'after-save-hook 'malabar-compile-file-silently nil t)
  ))
