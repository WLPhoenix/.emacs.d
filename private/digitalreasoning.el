;; JIRA config
(setq
  jira-url "https://issues.corp.digitalreasoning.com/rpc/xmlrpc")

;;; Java formatting
(add-hook 'java-mode
  (lambda ()
	(indent-tabs-mode t)
    (setq c-basic-offset 4)
	(setq c-backspace-function 'backward-delete-char)
	(define-key java-mode-map (kbd "<return>") 'newline-with-drop-brace)
  ))
