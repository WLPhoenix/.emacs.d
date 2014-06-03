
(menu-bar-mode 0) ; no menu bar
(setq default-tab-width 4) ; set global tab width

;;; Windowed config
(when (display-graphic-p)
    ;; Don't use messages that you don't read
    (setq initial-scratch-message "")
    (setq inhibit-startup-message t)

    ;; Other config options
    (blink-cursor-mode) ; No cursor blink
    (scroll-bar-mode 0) ; remove scrollbar
    (tool-bar-mode 0) ; no tool bar
)

;;; Color theme
(when (require 'color-theme)
  (color-theme-initialize)
  (setq color-theme-is-global nil)
  (if (require 'color-theme-molokai)
    (progn
      ;; There are certain things that only work if you run this twice...
      (color-theme-molokai)
      (color-theme-molokai))
    ;; else
    (color-theme-matrix))
)

;;; Flymake appearance
(custom-set-faces
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))
