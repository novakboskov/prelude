;;; prelude-clojure.el --- Emacs Prelude: Clojure programming configuration.
;;
;; Copyright © 2011-2017 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: http://batsov.com/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some basic configuration for clojure-mode.

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

(require 'prelude-lisp)
(prelude-require-packages '(clojure-mode
                            cider
                            clj-refactor
                            kibit-helper))

(eval-after-load 'clojure-mode
  '(progn
     (defun prelude-clojure-mode-defaults ()
       (subword-mode +1)
       (run-hooks 'prelude-lisp-coding-hook))

     (defun kibit-clojure-prelude-more (arg)
       (interactive "P")
       (if arg
           (kibit)
         (kibit-current-file)))

     (defun prelude-more-clojure-mode-defaults ()
       (clj-refactor-mode 1)
       (yas-minor-mode 1) ; for adding require/use/import
       (cljr-add-keybindings-with-prefix "C-c C-;")
       (setq clojure-align-forms-automatically t)
       ;; kibit integration
       (global-set-key (kbd "C-x C-`") 'kibit-accept-proposed-change)
       (define-key clojure-mode-map (kbd "C-c C-; k") #'kibit-clojure-prelude-more))

     (setq prelude-clojure-mode-hook '(prelude-clojure-mode-defaults
                                       prelude-more-clojure-mode-defaults))

     (add-hook 'clojure-mode-hook (lambda ()
                                    (run-hooks 'prelude-clojure-mode-hook)))))

(eval-after-load 'cider
  '(progn
     (setq nrepl-log-messages t)
     (setq cider-repl-display-help-banner nil)

     (add-hook 'cider-mode-hook 'eldoc-mode)

     (defun prelude-cider-repl-mode-defaults ()
       (subword-mode +1)
       (run-hooks 'prelude-interactive-lisp-coding-hook))

     (setq prelude-cider-repl-mode-hook 'prelude-cider-repl-mode-defaults)

     (add-hook 'cider-repl-mode-hook (lambda ()
                                       (run-hooks 'prelude-cider-repl-mode-hook)))

     (defun set-cider-cljs-lein-repl-to-figwheel ()
       (interactive)
       (setq cider-cljs-lein-repl "(do (require 'figwheel-sidecar.repl-api)
                                          (figwheel-sidecar.repl-api/start-figwheel!)
                                          (figwheel-sidecar.repl-api/cljs-repl))"))))

(provide 'prelude-clojure)

;;; prelude-clojure.el ends here
