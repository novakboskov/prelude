;;; prelude-more-org-gcal.el --- Additional org mode functions  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Novak Boškov

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
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Additional org mode functions

;;; Code:

(prelude-require-package 'org-gcal)
(require 'org-gcal)

(exec-path-from-shell-copy-env "GCAL_CLIENT_ID")
(exec-path-from-shell-copy-env "GCAL_SECRET")

(setq org-gcal-client-id (getenv "GCAL_CLIENT_ID")
      org-gcal-client-secret (getenv "GCAL_SECRET")
      org-gcal-file-alist '(("gnovak.boskov@gmail.com" .  "~/Storage/org/google_calendar.org")))

(define-key org-mode-map (kbd "C-c C-g p") #'org-gcal-post-at-point)
(define-key org-mode-map (kbd "C-c C-g d") #'org-gcal-delete-at-point)
(define-key org-mode-map (kbd "C-c C-g f") #'org-gcal-fetch)
(define-key org-mode-map (kbd "C-c C-g s") #'org-gcal-sync)
(define-key org-mode-map (kbd "C-c C-g r") #'org-gcal-refresh-token)

(provide 'prelude-more-org-gcal)
;;; prelude-more-org-gcal.el ends here
