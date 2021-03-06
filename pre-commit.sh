#!/bin/sh

# stash unstaged changes so that they arent included in the 
# test below
STASH_NAME="pre-commit-$(date +%s)"
git stash save -q --keep-index $STASH_NAME

# Test prospective commit
echo "Running build process"
# ./run default

# capture the output
# RESULT=$?

STASHES=$(git stash list)
if [[ $STASHES == "$STASH_NAME" ]]; then
  git stash pop -q
fi

# Fail if the output is non-zero
# [ $RESULT -ne 0 ] && exit 1
# exit 0