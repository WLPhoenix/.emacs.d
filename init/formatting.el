;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                    Global functions - text formatting                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun json-format ()
  "Format JSON in region by piping to python's json.tool"
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)n
  )
)


(defun metachar-cleanup ()
  "Replaces escaped metacharacters in the region with their literal characters"
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\\n" nil t) (replace-match "\n" nil t))
    (goto-char (point-min))
    (while (search-forward "\\t" nil t) (replace-match "\t" nil t))
    (goto-char (point-min))
    (while (search-forward "\\r" nil t) (replace-match "" nil t))
    (goto-char (point-min))
    (while (search-forward "\\\"" nil t) (replace-match "\"" nil t))
    (goto-char (point-min))
    (while (search-forward "\\'" nil t) (replace-match "'" nil t))
  )
)

(defun hang-braces ()
  "Move all braces at the end of a occupied line to the next line"
  (interactive)
  (save-excursion
	(beginning-of-buffer)
	(setq moreLines t)
	(while moreLines
	  (end-of-line)
	  (drop-preceding-brace)
	  (setq moreLines (= 0 (forward-line 1)))
    )
  )
)

(defun unhang-braces ()
  "Move all hanging braces to the end of the preceding line"
)
