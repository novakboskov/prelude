;;; prelude-mode-puml.el --- Emacs Prelude-more: Slack Emacs integration.  -*- lexical-binding: t; -*-

;; Copyright (C) 2017 Novak Boskov

;; Author: Novak Boskov <gnovak.boskov@gmail.com>
;; Keywords: slack

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

;; Some basic configuration for integrating Slack with Emacs.

;;; Code:
(prelude-require-package 'slack)

(setq slack-buffer-emojify t)
(setq slack-prefer-current-team t)
(setq alert-default-style 'notifier)

(exec-path-from-shell-copy-env "SLACK_APP_CLIENT_ID")
(exec-path-from-shell-copy-env "SLACK_APP_CLIENT_SECRET")
(exec-path-from-shell-copy-env "SLACK_AUTH_TOKEN")

(slack-register-team
 :name "ftn-rni"
 :default t
 :client-id (getenv "SLACK_APP_CLIENT_ID")
 :client-secret (getenv "SLACK_APP_CLIENT_SECRET")
 :token (getenv "SLACK_AUTH_TOKEN")
 :subscribed-channels '(distributed_prog
                        general
                        klub-doktoranata
                        random
                        rekreacija))

(provide 'prelude-more-slack)
