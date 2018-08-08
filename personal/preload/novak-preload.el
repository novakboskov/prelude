;; face font size
(set-face-attribute 'default nil :height 130)
;; line numbers mode globally
;; (global-linum-mode t)
;; Each command that sets a bookmark to save bookmarks
;; Vertical scroll bar
(scroll-bar-mode -1)
(setq bookmark-save-flag 1)

;; Set ispell backend
(setq personal/user-ispell '("hunspell" "en_US"))

;; set default erc nick
(setq erc-nick "novakboskov")
