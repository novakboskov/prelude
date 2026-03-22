;;; prelude-more-remote.el --- Improvements for remote work over SSH.

;; Copyright (C) 2025  Novak Boškov

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

;; Improvements for remote work.

(require 'project)
(require 'tramp)

(global-set-key (kbd "s-[") project-prefix-map)

(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

(provide 'prelude-more-remote)
;;; prelude-more-remote.el ends here.
