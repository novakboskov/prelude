;;; prelude-go.el --- Emacs Prelude: Go programming support.
;;
;; Author: Doug MacEachern
;; URL: https://github.com/bbatsov/prelude

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Prelude configuration for Go

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

(prelude-require-packages '(go-mode
                            lsp-mode
                            lsp-ui
                            company-lsp
                            go-eldoc
                            go-projectile
                            gotest
                            go-dlv))

(require 'go-projectile)

;; Ignore go test -c output files
(add-to-list 'completion-ignored-extensions ".test")

(define-key 'help-command (kbd "G") 'godoc)

(with-eval-after-load 'go-mode
  (defun prelude-go-mode-defaults ()
    ;; Add to default go-mode key bindings
    (let ((map go-mode-map))
      (define-key map (kbd "C-c a") 'go-test-current-project) ;; current package, really
      (define-key map (kbd "C-c m") 'go-test-current-file)
      (define-key map (kbd "C-c .") 'go-test-current-test)
      (define-key map (kbd "C-c b") 'go-run)
      (define-key map (kbd "C-h f") 'godoc-at-point))

    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t)

    ;; We don't need flycheck as lsp-mode handles it
    (flycheck-mode nil)

    ;; stop whitespace being highlighted
    (whitespace-toggle-options '(tabs))

    ;; El-doc for Go
    (go-eldoc-setup)

    ;; CamelCase aware editing operations
    (subword-mode +1))

  (setq prelude-go-mode-hook 'prelude-go-mode-defaults)

  (add-hook 'go-mode-hook #'lsp-deferred)

  (add-hook 'go-mode-hook (lambda ()
                            (run-hooks 'prelude-go-mode-hook))))

;; Use golint
(exec-path-from-shell-copy-env "GOPATH")
(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/golang.org/x/lint/misc/emacs"))
(require 'golint)

(provide 'prelude-go)
;;; prelude-go.el ends here
