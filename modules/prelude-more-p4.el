;;; prelude-more-p4.el --- P4 support                -*- lexical-binding: t; -*-

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

;; P4 support.

;;; Code:

(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/missing-modules"))

(prelude-require-packages '(xcscope))

(require 'p4_14-mode)
(require 'p4_16-mode)

(setq auto-mode-alist
      (append '(("p4_14.*\\.p4$" . p4_14-mode)
                ("p4_16.*\\.p4$" . p4_16-mode)
                ("\\.p4$"      . p4_16-mode))
              auto-mode-alist))

(provide 'prelude-more-p4)
;;; prelude-more-p4.el ends here
