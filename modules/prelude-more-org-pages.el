;;; prelude-more-org-pages.el --- Prelude-more configuration for org-page  -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Novak Boškov

;; Author: Novak Boškov <gnovak.boskov@gmail.com>
;; Keywords: lisp

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

;; Prelude-more configuration for org-page

;;; Code:

(prelude-require-package 'org-page)
(require 'org-page)

(setq op/repository-directory "/media/novak/Storage/personal_blog/")
(setq op/site-domain "http://novakboskov.github.io/")
(setq op/personal-disqus-shortname "forint")
(setq op/personal-github-link "https://github.com/novakboskov")
(setq op/personal-avatar "https://avatars2.githubusercontent.com/u/6290049?v=3&s=466")

(provide 'prelude-more-org-pages)
;;; prelude-more-org-pages.el ends here
