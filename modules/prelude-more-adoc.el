;;; prelude-more-adoc.el --- Work with ascii documents  -*- lexical-binding: t; -*-

;; Copyright (C) 2015  Novak Boskov

;; Author: Novak Boskov <gnovak.boskov@gmail.com>
;; Keywords: ascii, book

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

;; Setup adoc-mode.

;;; Code:

(prelude-require-package 'adoc-mode)

(add-to-list 'auto-mode-alist '("\\.txt\\'" . adoc-mode))
(add-to-list 'auto-mode-alist '("\\.asciidoc\\'" . adoc-mode))

;; Clojure Cookbook setup
(defun increment-clojure-cookbook ()
  "When reading the Clojure cookbook, find the next section, and
close the buffer. If the next section is a sub-directory or in
the next chapter, open Dired so you can find it manually."
  (interactive)
  (let* ((cur (buffer-name))
         (split-cur (split-string cur "[-_]"))
         (chap (car split-cur))
         (rec (car (cdr split-cur)))
         (rec-num (string-to-number rec))
         (next-rec-num (1+ rec-num))
         (next-rec-s (number-to-string next-rec-num))
         (next-rec (if (< next-rec-num 10)
                       (concat "0" next-rec-s)
                     next-rec-s))
         (target (file-name-completion (concat chap "-" next-rec) "")))
    (progn
      (if (equal target nil)
          (dired (file-name-directory (buffer-file-name)))
        (find-file target))
      (kill-buffer cur))))

(provide 'prelude-more-adoc)
;;; prelude-more-adoc.el ends here
