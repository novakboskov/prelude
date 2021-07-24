;;; prelude-more-hledger-mode.el --- Hledger support in Emacs  -*- lexical-binding: t; -*-

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

;; Hledger support in Emacs.

;;; Code:

(prelude-require-package 'hledger-mode)

(add-to-list 'auto-mode-alist '("\\.journal\\'" . hledger-mode))

(defun prelude-more-hledger-mode-defaults ()
  "Default settings for ledger-mode."
  (add-to-list 'company-backends 'hledger-company)

  (global-set-key (kbd "C-c e") 'hledger-jentry)
  (global-set-key (kbd "C-c j") 'hledger-run-command)

  ;; Use US Dollars as the default currency
  (setq hledger-currency-string "$")

  ;; Use the ledger file from the env variable
  (setq hledger-jfile (exec-path-from-shell-getenv "LEDGER_FILE")))

(setq prelude-more-hledger-mode-hook 'prelude-more-hledger-mode-defaults)

(add-hook 'hledger-mode-hook (lambda ()
                               (run-hooks 'prelude-more-hledger-mode-hook)))

(provide 'prelude-more-hledger-mode)
;;; prelude-more-hledger-mode.el ends here
