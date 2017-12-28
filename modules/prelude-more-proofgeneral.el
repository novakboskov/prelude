;;; prelude-more-proofgeneral.el --- Prelude more integration with Proof General  -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Novak Boškov

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
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Prelude more integration with Proof General

;;; Code:

(prelude-require-package 'company-coq)

(load "~/.emacs.d/lisp/PG/generic/proof-site.el")

(add-hook 'coq-mode-hook #'company-coq-mode)

(provide 'prelude-more-proofgeneral)
;;; prelude-more-proofgeneral.el ends here
