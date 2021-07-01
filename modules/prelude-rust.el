;;; prelude-rust.el --- Emacs Prelude: Rust programming support.
;;
;; Authors: Doug MacEachern, Manoel Vilela, Ben Alex, Novak Boškov

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Prelude configuration for Rust

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(require 'prelude-programming)

(prelude-require-packages '(rust-mode
                            lsp-mode))

(defun prelude-rust ()
  (setq rust-format-on-save t)
  (setq lsp-rust-server 'rust-analyzer)
  (yas-minor-mode)
  (lsp))

(setq prelude-rust-hook 'prelude-rust)

(add-hook 'rust-mode-hook (lambda ()
                            (run-hooks 'prelude-rust-hook)))

(provide 'prelude-rust)
;;; prelude-rust.el ends here
