;;; prelude-haskell.el --- Emacs Prelude: Nice config for Haskell programming.
;;
;; Copyright © 2011-2016 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Nice config for Haskell programming.

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
(prelude-require-packages '(haskell-mode
                            intero
                            hindent
                            hlint-refactor
                            hamlet-mode))

(eval-after-load 'haskell-mode
  '(progn
     (defun prelude-haskell-mode-defaults ()
       (subword-mode +1)
       (eldoc-mode +1)
       (haskell-indentation-mode +1)
       (interactive-haskell-mode +1)
       (setq haskell-stylish-on-save t))

     (setq prelude-haskell-mode-hook 'prelude-haskell-mode-defaults)

     (add-hook 'haskell-mode-hook (lambda ()
                                    (run-hooks 'prelude-haskell-mode-hook)
                                    (setq-local helm-dash-docsets '("Haskell"))))
     (add-hook 'haskell-mode-hook 'intero-mode)
     (add-hook 'haskell-mode-hook 'hindent-mode)
     (add-hook 'haskell-mode-hook 'hlint-refactor-mode)

     (define-key haskell-mode-map (kbd "C-c C-d") 'haskell-hoogle-lookup-from-local)
     (define-key haskell-mode-map (kbd "C-u C-c C-d") 'helm-dash-at-point)
     (define-key haskell-mode-map (kbd "C-c C-; r") 'intero-apply-suggestions)
     (define-key haskell-mode-map (kbd "C-c C-; t") 'intero-type-at)

     ;; This is prelude-more temporal solution until I grasp how
     ;; `intero-mode-map' should work.
     (defun intero-type-at-insert ()
       (interactive)
       (intero-type-at t))
     (define-key haskell-mode-map (kbd "C-u C-c C-; t") 'intero-type-at-insert)))

(provide 'prelude-haskell)

;;; prelude-haskell.el ends here
