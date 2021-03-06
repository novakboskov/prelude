;;; prelude-yasnippet.el --- Yasnippet module        -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Novak Boškov

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

;; Yasnippet module

;;; Code:

(prelude-require-packages '(yasnippet
                            yasnippet-snippets))

(defun prelude-more-yas-mode-defaults ()
  (define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand))

(setq prelude-more-yas-mode-hook 'prelude-more-yas-mode-defaults)

(add-hook 'yas-minor-mode-hook (lambda ()
                                 (run-hooks 'prelude-more-yas-mode-hook)))

(yas-global-mode 1)

(provide 'prelude-more-yasnippet)
;;; prelude-yasnippet.el ends here
