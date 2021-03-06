;;; prelude-more-languagetool.el --- Languagetool integration for Emacs  -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Novak Boškov

;; Author: Novak Boškov <gnovak.boskov@gmail.com>
;; Keywords: docs

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

;; Languagetool integration for Emacs.
;; More on Languagetool at https://languagetool.org/

;;; Code:

(setq langtool-language-tool-jar "/etc/LanguageTool/languagetool-commandline.jar")

(prelude-require-package 'langtool)

(global-set-key "\C-x4w" 'langtool-check)
(global-set-key "\C-x4W" 'langtool-check-done)
(global-set-key "\C-x4l" 'langtool-switch-default-language)
(global-set-key "\C-x44" 'langtool-show-message-at-point)
(global-set-key "\C-x4c" 'langtool-correct-buffer)

(setq langtool-default-language "en-US")

(provide 'prelude-more-languagetool)
;;; prelude-more-languagetool.el ends here
