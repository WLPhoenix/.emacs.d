;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                     Global functions - movenent/editing                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun move-to-center-column ()
  "Moves the point to the center of the current line"
  (interactive)
  (let
    ((line-len (save-excursion (end-of-line) (current-column))))
  (move-to-column (/ line-len 2))
))


(defun delete-word (arg)
  "Delete characters forward until encountering the end of a word.
  With argument ARG, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point)))
)


(defun backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
  With argument ARG, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (backward-word arg) (point)))
)


(defun unix-werase-or-kill (arg)
  "If transient mark mode is active, perform 'kill-region, else perform
  'backward-delete-word."
  (interactive "*p")
  (if (and transient-mark-mode
		   mark-active)
	  (kill-region (region-beginning) (region-end))
	  (backward-delete-word arg)))


(defun drop-preceding-brace ()
  "If the character before the point is a brace, drop it to the next"
  "line"
  (interactive)
  (delete-horizontal-space)
  (if (and
	    (string= (string (preceding-char)) "{")
		(not (line-only-left-brace)))
    (progn
	  (backward-char 1)
	  (newline-and-indent)
	  (forward-char 1)
    )
	'nil)
)

(defun newline-with-drop-brace ()
  "If the character before the point is a brace, drop it to the next"
  "line before 'newline-and-indent"
  (interactive)
  (drop-preceding-brace)
  (newline-and-indent)
)
