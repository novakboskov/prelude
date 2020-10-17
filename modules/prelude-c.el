;;; prelude-c.el --- Emacs Prelude: cc-mode configuration.
;;
;; Copyright © 2011-2020 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some basic configuration for cc-mode and the modes derived from it.

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

(prelude-require-packages '(cmake-mode
                            ccls))

;; Set the path to the Linux kernel
(setq prelude-more-kernel-path "~/Desktop/CODE/linux")

(defun prelude-c-mode-common-defaults ()
  (let ((filename (buffer-file-name)))
    (if (string-match (expand-file-name prelude-more-kernel-path)
                      filename)
        (progn
          ;; Use style from the Kernel
          ;; https://www.kernel.org/doc/html/v4.10/process/coding-style.html
          (defun c-lineup-arglist-tabs-only (ignored)
            "Line up argument lists by tabs, not spaces"
            (let* ((anchor (c-langelem-pos c-syntactic-element))
                   (column (c-langelem-2nd-pos c-syntactic-element))
                   (offset (- (1+ column) anchor))
                   (steps (floor offset c-basic-offset)))
              (* (max steps 1)
                 c-basic-offset)))

          (c-add-style
           "linux-tabs-only"
           '("linux" (c-offsets-alist
                      (arglist-cont-nonempty
                       c-lineup-gcc-asm-reg
                       c-lineup-arglist-tabs-only))))

          (setq indent-tabs-mode t)
          (setq show-trailing-whitespace t)
          (c-set-style "linux-tabs-only")

          ;; Don't highlight tab in through whitespace-mode
          (when (boundp 'whitespace-style)
            (setq-local whitespace-style
                        (cl-set-difference whitespace-style '(tabs))))
          (whitespace-mode -1)
          (whitespace-mode 1))
      (progn
        ;; Use some of the regular indentations
        (setq c-default-style "gnu"
              c-basic-offset 4)
        (c-set-offset 'substatement-open 0))
      (setq which-function-mode t))))

(defun prelude-more-ccls ()
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  (yas-minor-mode)                      ;; needed for autocompletion to work
  (lsp))

(setq prelude-c-mode-common-hook 'prelude-c-mode-common-defaults)
(setq prelude-c-mode-prelude-more-ccls 'prelude-more-ccls)

;; this will affect all modes derived from cc-mode, like
;; java-mode, php-mode, etc
(add-hook 'c-mode-common-hook (lambda ()
                                (run-hooks 'prelude-c-mode-common-hook)
                                (run-hooks 'prelude-c-mode-prelude-more-ccls)))

(defun prelude-makefile-mode-defaults ()
  (whitespace-toggle-options '(tabs))
  (setq indent-tabs-mode t ))

(setq prelude-makefile-mode-hook 'prelude-makefile-mode-defaults)

(add-hook 'makefile-mode-hook (lambda ()
                                (run-hooks 'prelude-makefile-mode-hook)))
(provide 'prelude-c)

;;; prelude-c.el ends here
