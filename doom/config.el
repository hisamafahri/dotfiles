;;; package -- config.el file
;;; Commentary:

;;; Code:
(setq user-full-name "Hisam Fahri"
      user-mail-address "me@hisamafahri.com")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

(setq doom-theme 'doom-gruvbox)

(setq org-directory "~/org/")

;; NOTE: remap 't' in input mode to actually input the letter
;; I have no idea why the defaul behaviour like that
(map! :map global-map
      "t" #'self-insert-command)

;; NOTE: cycle through buffer
(map! :n "C-n" #'next-buffer
      :n "C-p" #'previous-buffer)

;; NOTE: hide toolbar
(add-to-list 'default-frame-alist '(undecorated . t))
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; NOTE: decrese vterm delay to make it a bit faster
(setq vterm-timer-delay 0.01)

;; NOTE: drag stuff up and down
(map! :v "K" #'drag-stuff-up
      :v "J" #'drag-stuff-down)
