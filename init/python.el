(require 'python)
(setq
  python-shell-interpreter "ipython"
;  python-shell-interpreter-args ""
;  python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;  python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;  python-shell-completion-setup-code
;    "from IPython.core.completerlib import module_completion"
;  python-shell-completion-module-string-code
;    "';'.join(module_completion('''%s'''))\n"
;  python-shell-completion-string-code
;    "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
)

;;; Autocomplete and formatting
(require 'elpy)
(require 'jedi)

(elpy-enable)
(elpy-use-ipython)

(add-hook 'python-mode-hook
  (lambda ()
    (elpy-mode 1)
    (abbrev-mode 1)
    (jedi-mode t)
    (jedi:setup)
    (setq jedi:complete-on-dot t)
    (elpy-set-backend "jedi")
  ))

;;; Testing
(require 'nose)
(require 'nose-mode)

(nose-mode-setup-keymap)
(add-hook 'python-mode-hook 'nose-mode-enable-if-test-module)
(setq nose-mode-test-module-regex ".+_tests?\\.py$")
(define-key nose-mode-map (kbd "C-c n f") 'nosetests-failed)
(define-key nose-mode-map (kbd "C-c n n") 'nosetests-again)
(define-key nose-mode-map (kbd "C-c n o") 'nosetests-one)
(define-key nose-mode-map (kbd "C-c n p o") 'nosetests-pdb-one)
