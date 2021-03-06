;;; novak-personal-premodules.el --- Novak personal settings     -*- lexical-binding: t; -*-

;; Copyright (C) 2015  Novak Boskov

;; Author: Novak Boskov <gnovak.boskov@gmail.com>
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

;; Novak personal settings

;;; Code:

(prelude-require-package 'exec-path-from-shell)

(exec-path-from-shell-initialize)
(setq user-full-name "Novak Boškov")
(setq user-mail-address "gnovak.boskov@gmail.com")

(provide 'novak-personal-premodules)
;;; novak-personal-premodules.el ends here
