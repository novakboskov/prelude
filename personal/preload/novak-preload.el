;; face font size
(set-face-attribute 'default nil :height 110)
;; line numbers mode globally
(global-linum-mode t)
;; switch between windows using META-{left, up, down, right}
(global-set-key (kbd "M-<left>")  'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>")    'windmove-up)
(global-set-key (kbd "M-<down>")  'windmove-down)
