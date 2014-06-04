;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                 Imports                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq require-packages
  '(
    ;; General
    ido
    highlight
    highlight-parentheses
    tree-mode
    undo-tree
    windata
	yasnippet
    xclip

    ;; Color themes
    color-theme
    color-theme-molokai

    ;; Python
    elpy
    jedi
    pungi
    nose
    nose-mode

    ;; Java
    cedit
    semantic
	java-snippets
    malabar-mode

    ;; Assorted languages
    groovy-mode
    haskell-mode
    zossima ;ruby
))

;;; ELPA packages
(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives
	'(
	  ("gnu" . "http://elpa.gnu.org/packages/")
	  ("marmalade" . "http://marmalade-repo.org/packages/")
	  ("melpa" . "http://melpa.milkbox.net/packages/")))
  (package-refresh-contents)
  (package-initialize)
  (dolist (p require-packages)
    (when (not (package-installed-p p))
      (package-install p)))
  (mapcar 'install-if-not require-packages)
  (package-initialize)
)
