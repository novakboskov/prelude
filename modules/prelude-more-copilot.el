;;; prelude-more-shell.el --- GitHub Copilot settings  -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Novak Boškov

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

;; GitHub Copilot settings

;;; Code:

(prelude-require-packages '(dash
                            s
                            editorconfig
                            copilot))

(add-hook 'prog-mode-hook 'copilot-mode)

(defun prelude-more-copilot-defaults ()
  "Default setup of Copilot."
  (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
  (define-key copilot-completion-map (kbd "s-m n") 'copilot-next-completion)
  (define-key copilot-completion-map (kbd "s-m p") 'copilot-previous-completion)
  (define-key copilot-completion-map (kbd "s-m l") 'copilot-accept-completion-by-line))

(setq prelude-more-copilot-hook 'prelude-more-copilot-defaults)

(add-hook 'copilot-mode-hook (lambda ()
                              (run-hooks 'prelude-more-copilot-hook)))

(require 'copilot)

(provide 'prelude-more-copilot)
