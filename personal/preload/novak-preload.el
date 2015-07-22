;; face font size
(set-face-attribute 'default nil :height 110)
;; line numbers mode globally
(global-linum-mode t)
;; Each command that sets a bookmark to save bookmarks
(setq bookmark-save-flag 1)
;; Provide pyenv for execution
(add-to-list 'exec-path (expand-file-name ".pyenv/bin" (getenv "HOME")))
