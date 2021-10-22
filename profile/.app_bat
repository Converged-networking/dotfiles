if type "bat" > /dev/null; then
  # bat can be used as a colorizing pager for man, by setting the MANPAGER environment variable:
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"

  # You can combine bat with git diff to view lines around code changes with proper syntax highlighting:
  batdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff
  }
fi
