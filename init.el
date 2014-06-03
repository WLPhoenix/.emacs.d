;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               Local functions                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun install-if-not (pkg)
  "Install the package if it's not initialized"
  (unless (require pkg) (package-install pkg)))

(defun mkdir-if-not (dir)
  "Make directory if it doesn't exist"
  (unless (file-exists-p dir) (mkdir dir)))

(defun load-if-exists (file)
  "Load file if it exists"
  (when (file-exists-p file) (load-file file)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  Init files                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; General
(load-if-exists "~/.emacs.d/init/elpa-installs.el")
(load-if-exists "~/.emacs.d/init/movement.el")
(load-if-exists "~/.emacs.d/init/formatting.el")
(load-if-exists "~/.emacs.d/init/global-modes.el")
(load-if-exists "~/.emacs.d/init/bindings.el")
(load-if-exists "~/.emacs.d/init/appearance.el")

;;; Language specific
(load-if-exists "~/.emacs.d/init/python.el")
(load-if-exists "~/.emacs.d/init/java.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                       Secure/Hidden/Client-specific                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Digital Reasoning
(load-if-exists "~/.emacs.d/private/digitalreasoning.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                   Config                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Configure backups
(mkdir-if-not "~/.emacs.d/backups")
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq backup-by-copying t)

;;; General config
(setq linum-format "%s ")                                 ; add space after line numbers
(fset 'yes-or-no-p 'y-or-n-p)                             ; All 'yes/no' prompts show 'y/n'
(set-display-table-slot standard-display-table 'wrap ?\ ) ; remove linewrap '\'
(setq mouse-yank-at-point t)                              ; Paste at cursor, not mouse position

;;; Enable certain commands
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                 Actions                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(unless (and (fboundp 'server-running-p) (server-running-p))
;  (server-start))
