;;; prelude-mode-puml.el --- Emacs Prelude-more: PlantUML configuration.  -*- lexical-binding: t; -*-

;; Copyright (C) 2016 Novak Boskov

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

;; Some basic configuration for puml-mode.

;;; Code:
(prelude-require-package 'plantuml-mode)

(setq plantuml-jar-path (expand-file-name "/home/novak/plantuml.jar"))

(add-to-list 'auto-mode-alist '("\\.puml\\'" . puml-mode))
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . puml-mode))

(provide 'prelude-more-plantuml)
;;; prelude-mode-puml.el ends here
