;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              Digital Reasoning                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Define a custom c-mode-style
(c-add-style "digitalreasoning"
  '("wlphoenix"
 	 (c-hanging-braces-alist
	   ((substatement-open)
		(block-close . c-snug-do-while)
		(extern-lang-open after)
		(inexpr-class-open after)
		(inexpr-class-close before)))
   )
)
(setq c-default-style "digitalreasoning")

;;; Java formatting
(define-key malabar-mode-map (kbd "<return>") 'newline-with-drop-brace)
(define-key malabar-mode-map (kbd "C-<return>") 'drop-preceding-brace)
(add-hook 'malabar-mode
  (lambda ()
	(indent-tabs-mode t)
  ))

;;; hang braces on save while in java and malabar modes
(defun hang-braces-save-hook ()
  (when (member major-mode '(java-mode malabar-mode))
	(hang-braces))
)
(add-hook 'before-save-hook 'hang-braces-save-hook)
