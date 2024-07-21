#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Emacs
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 👨‍💻

/opt/homebrew/opt/emacs-plus@29/bin/emacsclient -c -a 'emacs' -n

# To start d12frosted/emacs-plus/emacs-plus@29 daemon now and restart at login:
# brew services start d12frosted/emacs-plus/emacs-plus@29
