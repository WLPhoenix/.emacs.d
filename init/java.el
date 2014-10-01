
(define-key java-mode-map (kbd "<return>") 'newline-and-indent)

(require 'cedit)
(require 'semantic)
(load "semantic/loaddefs.el")

(add-hook 'java-mode
  (lambda ()
    (semantic-mode 1)
  ))

(require 'malabar-mode)

(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

(add-hook 'malabar-mode
  (lambda ()
    ;; Compile file after save
    (add-hook 'after-save-hook 'malabar-compile-file-silently nil t)
  ))
