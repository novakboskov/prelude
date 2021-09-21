;;; prelude-more-shell.el --- Additional Shell mode settings  -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Novak Boškov

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

;; Additional Shell mode settigns

;;; Code:

(prelude-require-packages '(lsp-mode
                            lsp-ui))

(defun prelude-more-shell-mode-defaults ()
  "Default shell settings."
  (lsp))

(setq prelude-more-shell-mode-hook 'prelude-more-shell-mode-defaults)

(add-hook 'sh-mode-hook (lambda ()
                          (run-hooks 'prelude-more-shell-mode-hook)))

(provide 'prelude-more-shell)
;;; prelude-more-shell.el ends here
