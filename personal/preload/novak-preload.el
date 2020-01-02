;; face font size
(set-face-attribute 'default nil :height 110)

;; line numbers mode globally
;; (global-linum-mode t)
;; Each command that sets a bookmark to save bookmarks
;; Vertical scroll bar
(scroll-bar-mode -1)
(setq bookmark-save-flag 1)

;; Set ispell backend
(setq personal/user-ispell '("aspell" "en_US"))

;; set default erc nick
(setq erc-nick "novakboskov")

;; temporary fix for projectile compile project
;; set human readable dired
(setq dired-listing-switches "-alh")

;; Temporary hacks1
(setq projectile-project-compilation-cmd "")
