;;; prelude-org.el --- Emacs Prelude: org-mode configuration.
;;
;; Copyright © 2011-2018 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some basic configuration for org-mode.

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
(prelude-require-package 'ox-reveal)

(require 'ob-plantuml)
(require 'ob-ditaa)
(require 'ob-python)
(require 'ox-latex)
;; prelude-more support easy templates in org mode
;; (require 'org-tempo)

(defun org-export-translate-to-lang (term-translations &optional lang)
  "Adds desired translations to `org-export-dictionary'.
   TERM-TRANSLATIONS is alist consisted of term you want to translate
   and its corresponding translation, first as :default then as :html and
   :utf-8. LANG is language you want to translate to, default is Serbian."
  (let ((lang (or lang "sr")))
    (dolist (term-translation term-translations)
      (let* ((term (car term-translation))
             (translation-default (nth 1 term-translation))
             (translation-html (nth 2 term-translation))
             (translation-utf-8 (nth 3 term-translation))
             (term-list (assoc term org-export-dictionary))
             (term-langs (cdr term-list)))
        (setcdr term-list (append term-langs
                                  (list
                                   (list lang
                                         :default translation-default
                                         :html translation-html
                                         :utf-8 translation-utf-8))))))))

(add-to-list 'auto-mode-alist '("\\.org\\’" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

;; custom agenda views
(setq org-agenda-custom-commands
      '(("l" . "Show TODOs listed under Leto 2016")
        ("lf" "collage" tags-todo "L2016+CATEGORY=\"preostali-predmeti\"")
        ("lp" "side projects" tags-todo "L2016+CATEGORY=\"foodoo-v0\"")
        ("ll" "all" tags-todo "L2016")))

(defun prelude-org-mode-defaults ()
  (let ((oldmap (cdr (assoc 'prelude-mode minor-mode-map-alist)))
        (newmap (make-sparse-keymap)))
    (set-keymap-parent newmap oldmap)
    (define-key newmap (kbd "C-c +") nil)
    (define-key newmap (kbd "C-c -") nil)
    (define-key newmap (kbd "C-a") nil)
    (make-local-variable 'minor-mode-overriding-map-alist)
    (push `(prelude-mode . ,newmap) minor-mode-overriding-map-alist))

  (local-set-key (kbd "C-c C-;") 'pcomplete)
  (setq org-agenda-span 56)
  (setq org-agenda-include-diary t)
  (setq org-html-validation-link nil)

  ;; active Org-babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(;; other Babel languages
     (emacs-lisp . t)
     (plantuml . t)
     (ditaa . t)
     (python . t)))

  ;; use minted to export listings in latex
  (setq org-latex-listings 'minted)
  (add-to-list 'org-latex-packages-alist '("" "minted"))
  (setq org-latex-pdf-process
        '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

  (defun prelude-org-more-is-save-to-evaluate? (lang code)
    (pcase lang
      ('python nil)
      ('plantuml nil)
      ('dita nil)))
  (setq org-confirm-babel-evaluate #'prelude-org-more-is-save-to-evaluate?)

  ;; include export to markdown in org export menu
  (require 'ox-md nil t)
  ;; include export to odt in org export menu
  (require 'ox-odt nil t)

  (setq org-plantuml-jar-path
        (expand-file-name "/home/novak/Storage/Java/plantuml.jar"))
  (setq org-ditaa-jar-path
        (expand-file-name "/media/novak/Storage/Java/ditaa0_9.jar"))

  ;; set Serbian translations for org-export
  (org-export-translate-to-lang '(("Table of Contents"
                                   "Sadržaj"
                                   "Sadr&#382;aj"
                                   "Sadržaj")))

  (org-export-translate-to-lang '(("Figure"
                                   "Slika")))

  ;; other latex classes available during export
  (add-to-list 'org-latex-classes
               '("memoir" "\\documentclass{memoir}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(setq prelude-org-mode-hook 'prelude-org-mode-defaults)

(add-hook 'org-mode-hook (lambda () (run-hooks 'prelude-org-mode-hook)))

(provide 'prelude-org)

;;; prelude-org.el ends here
