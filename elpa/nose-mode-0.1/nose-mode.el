;;; nose-mode.el --- minor mode for running nose tests

;; $Id: nose-mode.el 337 2014-01-11 14:56:27Z alex $

;; Emacs List Archive Entry
;; Filename: nose-mode.el
;; Version: $Revision: 337 $
;; Keywords:
;; Author: Alexis Roda <alexis.roda.villalonga@gmail.com>
;; Maintainer: Alexis Roda <alexis.roda.villalonga@gmail.com>
;; Created: 2014-01-11
;; Description: minor mode for running nose tests
;; URL:
;; Compatibility: Emacs24

;; COPYRIGHT NOTICE
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of the
;; License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Install:

;; Put this file on your Emacs-Lisp load path and add the following
;; into your emacs startup file:
;;
;;     (require 'nose-mode)
;;     (nose-mode-setup-keymap)
;;     (add-hook 'python-mode-hook 'nose-mode-enable-if-test-module)

;;; Commentary:
;;
;; This modules defines a minor mode intended to ease running tests
;; with 'nosetest'.
;;
;; This is an exercice and the rationale behind it is to be able to
;; provide keybindings for running tests, but only for buffers that
;; actually contain tests.
;;
;; By default it defines the keybindings:
;;
;; C-c n a   nosetests-all
;; C-c n m   nosetests-module
;; C-c n .   nosetests-one
;; C-c n p a nosetests-pdb-all
;; C-c n p m nosetests-pdb-module
;; C-c n p . nosetests-pdb-one
;;
;; The keymap can be easily customized by customizing the variable
;; `nose-mode-prefix-key'. Alternatively you can define your own
;; keymap by adding keys to `nose-mode-map'.
;;
;; In order to activate the minor mode when visiting a python test
;; module use the function `nose-mode-enable-if-test-module'. What is
;; considered by that function to be a test module is defined by the
;; value of the variable `nose-mode-test-module-regex'. By default any
;; file matching 'test_.*\.py'.

;;; Dependencies:
;;
;; * Jason Pellerin, Augie Fackle's `nose.el'

;;; History:
;;


;;; Code:


(defgroup nose-mode
  nil
  "Customization group for nose-mode.")

(defcustom nose-mode-prefix-key
  "C-c n"
  "Keymap preffix."
  :group 'nose-mode
  :type 'string)

(defcustom nose-mode-test-module-regex
  "^test_.+\\.py$"
  "Regex for identifying test modules."
  :group 'nose-mode
  :type 'string)


(defvar nose-mode-map (make-sparse-keymap "nose-mode") "nose-mode keymap")

(defun nose-mode-setup-keymap ()
  "Setup a default keymap."
  (define-key nose-mode-map (kbd (concat nose-mode-prefix-key "a")) 'nosetests-all)
  (define-key nose-mode-map (kbd (concat nose-mode-prefix-key "m")) 'nosetests-module)
  (define-key nose-mode-map (kbd (concat nose-mode-prefix-key ".")) 'nosetests-one)
  (define-key nose-mode-map (kbd (concat nose-mode-prefix-key "pa")) 'nosetests-pdb-all)
  (define-key nose-mode-map (kbd (concat nose-mode-prefix-key "pm")) 'nosetests-pdb-module)
  (define-key nose-mode-map (kbd (concat nose-mode-prefix-key "p.")) 'nosetests-pdb-one))

(define-minor-mode nose-mode
  "Minor mode for running nosetests tests in emacs." nil " nose" nose-mode-map
  (require 'nose))

(defun nose-mode-enable-if-test-module ()
  "Activate `nose-mode' when visiting a python test file."
  (if (string-match-p nose-mode-test-module-regex (file-name-nondirectory buffer-file-name))
      (nose-mode t)))


(provide 'nose-mode)

;;; nose-mode.el ends here
