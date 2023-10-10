#!/bin/bash

# Get the list of local and remote branches
local_branches=$(git branch --list | cut -c 3-)
remote_branches=$(git branch -r | cut -d '/' -f 2-)

# Combine local and remote branches
list_branches="$local_branches"$'\n'"$remote_branches"

# Remove duplicate branch names
branches=$(echo "$list_branches" | sort | uniq)

# Use fzf to select a branch
selected_branch=$(echo "$branches" | fzf --preview-window=up:3:wrap)

# Check if a branch was selected
if [ -n "$selected_branch" ]; then
    # Strip leading/trailing whitespace
    selected_branch="$(echo "$selected_branch" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

    # Check if it's a remote branch, and if so, create a tracking branch
    if [[ "$selected_branch" == remotes/* ]]; then
        git checkout --track "$selected_branch"
    else
        git checkout "$selected_branch"
    fi
fi

