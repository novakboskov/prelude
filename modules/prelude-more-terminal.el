;;; prelude-more-terminal.el --- vterm support       -*- lexical-binding: t; -*-

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

;; vterm support

;;; Code:

(prelude-require-package 'vterm)

(global-set-key (kbd "C-c t") 'vterm)

(add-hook 'vterm-mode-hook (lambda ()
                             (setq-local global-hl-line-mode nil)))

(defun prelude-more-vterm-mode-hook ()
  "Remove prelude-mode keybindings that conflict with vterm-mode."
  (let ((oldmap (cdr (assoc 'prelude-mode minor-mode-map-alist)))
        (newmap (make-sparse-keymap)))
    (set-keymap-parent newmap oldmap)
    (define-key newmap (kbd "C-a") nil)
    (make-local-variable 'minor-mode-overriding-map-alist)
    (push `(prelude-mode . ,newmap) minor-mode-overriding-map-alist)))

(add-hook 'vterm-mode-hook 'prelude-more-vterm-mode-hook)

(provide 'prelude-more-terminal)
;;; prelude-more-terminal.el ends here
