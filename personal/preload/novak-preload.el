;; face font size
(set-face-attribute 'default nil :height 120)
;; line numbers mode globally
(global-linum-mode t)
;; Each command that sets a bookmark to save bookmarks
(setq bookmark-save-flag 1)

;; Set ispell backend
(setq personal/user-ispell '("hunspell" "en_US"))

;; set default erc nick
(setq erc-nick "novakboskov")
