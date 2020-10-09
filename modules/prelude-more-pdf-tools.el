;;; prelude-more-pdf-tools.el --- pdf-tools for reading pdf files whithin Emacs  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Novak Boškov

;; Author: Novak Boškov <gnovak.boskov@gmail.com>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; pdf-tools for reading pdf files whithin Emacs

;;; Code:

(prelude-require-package 'pdf-tools)
(require 'pdf-tools)

(pdf-tools-install)

;; Bookmarking especially useful when reading large PDFs
(global-set-key (kbd "C-x r ;") 'helm-bookmarks)

(provide 'prelude-more-pdf-tools)
;;; prelude-more-pdf-tools.el ends here
