;;; prelude-more-org-mode.el --- Basic setup for org-mode  -*- lexical-binding: t; -*-

;; Copyright (C) 2015  Novak Boškov

;; Author: Novak Boškov <gnovak.boskov@gmail.com>
;; Keywords: lisp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Basic setup for org-mode

;;; Code:


(defun prelude-more-org-mode-defaults ()
  ;; Add to default org-mode key bindings
  (local-set-key (kbd "C-c C-;") 'pcomplete))

(setq prelude-more-org-mode-hook 'prelude-more-org-mode-defaults)

(add-hook 'org-mode-hook (lambda ()
                           (run-hooks 'prelude-more-org-mode-hook)))

(provide 'prelude-more-org-mode)
;;; prelude-more-org-mode.el ends here
