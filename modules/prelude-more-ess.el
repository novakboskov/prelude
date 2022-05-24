;;; prelude-more-ess.el --- Emacs Speaks Statistics  -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Novak Boškov

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

;; Emacs Speaks Statistics setup.

;;; Code:

(prelude-require-packages '(ess
                            polymode))

(defun prelude-more-ess-lsp ()
  (lsp))

(setq prelude-more-ess-lsp-hook 'prelude-more-ess-lsp)

(add-hook 'ess-mode-hook (lambda ()
                           (run-hooks 'prelude-more-ess-lsp-hook)))

(provide 'prelude-more-ess)
;;; prelude-more-ess.el ends here
