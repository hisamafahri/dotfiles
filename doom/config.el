;; TODO:

(setq user-full-name "Hisam Fahri"
      user-mail-address "me@hisamafahri.com")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; (setq doom-theme 'gruvbox-dark)

(setq org-directory "~/org/")

(map! :map global-map
      "t" #'self-insert-command)

(map! :n "C-n" #'next-buffer
      :n "C-p" #'previous-buffer)

(add-to-list 'default-frame-alist '(undecorated . t))
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

(setq vterm-timer-delay 0.01)
