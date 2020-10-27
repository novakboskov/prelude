;;; prelude-more-java.el --- Prelude more java IDE   -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Novak Boškov

;; Author: Novak Boškov <gnovak.boskov@gmail.com>
;; Keywords: java

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

;; Java IDE functionality

;;; Code:

(prelude-require-packages '(lsp-java
                            lsp-treemacs
                            dap-mode))

(defun prelude-more-java-lsp ()
  (lsp)
  (dap-auto-configure-mode))

(setq prelude-more-java-lsp-hook 'prelude-more-java-lsp)

(add-hook 'java-mode-hook (lambda ()
                            (run-hooks 'prelude-more-java-lsp-hook)))

(provide 'prelude-more-java)
;;; prelude-more-java.el ends here
