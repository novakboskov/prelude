;;; prelude-js.el --- Emacs Prelude: js-mode configuration.
;;
;; Copyright © 2011-2016 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some basic configuration for js-mode.

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
(prelude-require-packages '(js2-mode json-mode
                                     company-tern
                                     skewer-mode
                                     js2-refactor))

(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'"    . js2-mode))
(add-to-list 'auto-mode-alist '("\\.pac\\'"   . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(eval-after-load 'js2-mode
  '(progn
     (defun prelude-js-mode-defaults ()
       ;; electric-layout-mode doesn't play nice with smartparens
       (setq-local electric-layout-rules '((?\; . after)))
       (setq mode-name "JS2")
       (js2-imenu-extras-mode +1))

     (defun prelude-more-tern-setup ()
       "Enable Tern.js"
       (autoload 'tern-mode "tern.el" nil t)
       (tern-mode t))

     (defun prelude-more-tern-company ()
       "Provides company-tern backend"
       (add-to-list 'company-backends 'company-tern))

     (setq prelude-js-mode-hook 'prelude-js-mode-defaults)
     (setq prelude-more-tern-setup-hook 'prelude-more-tern-setup)
     (setq prelide-more-tern-company-hook 'prelude-more-tern-company)

     (add-hook 'js2-mode-hook (lambda () (run-hooks 'prelude-js-mode-hook
                                                    'prelude-more-tern-setup-hook
                                                    'prelide-more-tern-company-hook)))
     (add-hook 'js2-mode-hook #'js2-refactor-mode)
     (js2r-add-keybindings-with-prefix "C-c C-;")))

(provide 'prelude-js)

;;; prelude-js.el ends here
