# Step 1 word forward
bindkey "\u001B[1;5C" forward-word
# Step 1 word backward
bindkey "\u001B[1;5D" backward-word

# Jump home/end
# Ref: https://stackoverflow.com/a/33049500
bindkey  "^[[1~"   beginning-of-line
bindkey  "^[[4~"   end-of-line

# Cycle through history
# Ref: https://superuser.com/a/585004
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
