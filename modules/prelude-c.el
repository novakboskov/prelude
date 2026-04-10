;;; prelude-c.el --- Emacs Prelude: cc-mode configuration.
;;
;; Copyright © 2011-2026 Bozhidar Batsov
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

;; Use tree-sitter modes when grammars are available
(when (treesit-ready-p 'c t)
  (add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode)))
(when (treesit-ready-p 'cpp t)
  (add-to-list 'major-mode-remap-alist '(c++-mode . c++-ts-mode)))

(defun prelude-c-mode-common-defaults ()
  (prelude-lsp-enable))

(setq prelude-c-mode-common-hook 'prelude-c-mode-common-defaults)

(add-hook 'c-mode-common-hook (lambda ()
                                (run-hooks 'prelude-c-mode-common-hook)))
(add-hook 'c-ts-mode-hook (lambda ()
                            (run-hooks 'prelude-c-mode-common-hook)))
(add-hook 'c++-ts-mode-hook (lambda ()
                              (run-hooks 'prelude-c-mode-common-hook)))

(defun prelude-makefile-mode-defaults ()
  (whitespace-toggle-options '(tabs))
  (setq indent-tabs-mode t ))

(setq prelude-makefile-mode-hook 'prelude-makefile-mode-defaults)

(add-hook 'makefile-mode-hook (lambda ()
                                (run-hooks 'prelude-makefile-mode-hook)))
(provide 'prelude-c)

;;; prelude-c.el ends here
