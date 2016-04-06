;;; prelude-more-docker.el --- Emacs Prelude More: Docker mode configuration  -*- lexical-binding: t; -*-

;; Copyright (C) 2016 Novak Boškov

;; Author: Novak Boškov <gnovak.boskov@gmail.com>
;; Keywords: docker

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

;; Docker mode configuration

;;; Code:

(prelude-require-packages '(docker dockerfile-mode))

(setq docker-keymap-prefix "C-c *")

(require 'docker)
(require 'dockerfile-mode)

(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(provide 'prelude-more-docker)
;;; prelude-more-docker.el ends here
