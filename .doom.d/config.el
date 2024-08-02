;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; NOTE: set projectile search directory
;; not_working
(setq projectile-project-search-path '("~/projects" "~/work" "~/personal" "~/sandbox" "~/oss" "~/.config" "~/personal"))


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; NOTE: hide toolbar
;; (add-to-list 'default-frame-alist '(undecorated . t))
;; (add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; NOTE: decrease vterm delay
(setq vterm-timer-delay 0.01)

;; NOTE: disable deleted text to override the system clipboard registers
(setq select-enable-clipboard nil)

;; NOTE: cycle through buffer
(map! :n "C-n" #'next-buffer
      :n "C-p" #'previous-buffer)

;; NOTE: open vterm
(map! :leader
      (:prefix ("o" . "open")
       :desc "Open vterm in split" "e" #'vterm
       :desc "Open vterm in new buffer" "E" #'+vterm/here ))

;; NOTE: delete a word
(map! :i "M-DEL" #'evil-delete-backward-word)

;; NOTE: copy to clipboard
(map! :after evil
      :map evil-visual-state-map
      "SPC y" #'clipboard-kill-ring-save)

;; NOTE: center cursor on mouse scroll
(use-package! centered-cursor-mode
  :config
  (global-centered-cursor-mode)
  (setq ccm-recenter-at-end-of-file t
        ccm-ignored-commands '(mouse-drag-region
                               mouse-set-point
                               widget-button-click
                               scroll-bar-toolkit-scroll)))

;; NOTE: in visual mode, block to start/end of the line
(map! :v "H" #'evil-first-non-blank
      :v "L" #'evil-end-of-line)

;; NOTE: cycle through diagnostics
(map! :n "]d" #'lsp-next-error
      :n "[d" #'lsp-previous-error)

;; NOTE: drag stuff up and down
(map! :v "K" #'drag-stuff-up
      :v "J" #'drag-stuff-down)

;; NOTE: format buffer
(map! :n "Ï" #'+format/buffer)
