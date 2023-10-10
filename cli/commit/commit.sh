#!/bin/bash

# Get the list of commit hashes and messages
# commits=$(git log --oneline | fzf --preview 'git show {}')
commits=$(git log --oneline | fzf --preview "/Users/hisamafahri/.config/cli/commit/preview.sh {}" --preview-window=right:60%)

# If no commit selected, exit
if [ -z "$commits" ]; then
  echo "No commit selected."
  exit 1
fi

# Extract the commit hash
commit_hash=$(echo "$commits" | cut -d " " -f 1)

# Copy commit hash to clipboard
echo -n "$commit_hash" | pbcopy  # You can adjust this for your system

echo "Copied commit hash to clipboard: $commit_hash"
