;;; Aider coding assistent  -*- lexical-binding: t; -*-

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

;; Emacs support for Aider.

;;; Code:
(prelude-require-package 'aidermacs)

(global-set-key (kbd "C-c +") 'aidermacs-transient-menu)

(defun prelude-more-aider-defaults ()
  "Default setup of Aider."
  ;; TODO: setup API keys https://github.com/MatthewZMD/aidermacs?tab=readme-ov-file
  (aidermacs-use-architect-mode t)
  (aidermacs-default-model "sonnet"))

(setq prelude-more-aider-hook 'prelude-more-aider-defaults)

(add-hook'aidermacs-mode-hook (lambda ()
                                 (run-hooks 'prelude-more-aider-hook)))

(provide 'prelude-more-aider)
;;; prelude-more-aider.el ends here
