;;; time-management.el --- Emacs Prelude More: time management tools support  -*- lexical-binding: t; -*-

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

;; Basic support for Pomodoro technique

;;; Code:

(prelude-require-package 'org-pomodoro)

(global-set-key (kbd "C-c C-x `") 'org-pomodoro)

(provide 'prelude-more-time-management)
;;; time-management.el ends here
