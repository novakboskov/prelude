;;; prelude-more-sparql.el --- Emacs Prelude-more: SPARQL configuration  -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Novak Boskov

;; Author: Novak Boskov <gnovak.boskov@gmail.com>
;; Keywords: languages

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

;; Basic SPARQL configuration

;;; Code:
(prelude-require-package 'sparql-mode)

(add-to-list 'auto-mode-alist '("\\.sparql$" . sparql-mode))
(add-to-list 'auto-mode-alist '("\\.rq$" . sparql-mode))

(add-hook 'sparql-mode-hook 'company-mode)

(provide 'prelude-more-sparql)
;;; prelude-more-sparql.el ends here
