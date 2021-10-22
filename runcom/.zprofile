# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink)
READLINK=$(which greadlink &>/dev/null || which readlink)
if [[ -x "$READLINK" ]]; then
  SCRIPT_PATH=$($READLINK -f "${HOME}/.zprofile")
  DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
elif [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return
fi

# Make utilities available
PATH="$DOTFILES_DIR/bin:$PATH"

for DOTFILE in "$DOTFILES_DIR"/profile/.{function,env,alias,app_*}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

# if is-macos; then
#   for DOTFILE in "$DOTFILES_DIR"/profile/.{env,alias,function,path}.macos; do
#     [ -f "$DOTFILE" ] && . "$DOTFILE"
#   done
# fi

# Hook for extra/custom stuff
DOTFILES_EXTRA_DIR="$HOME/.extra"
if [ -d "$DOTFILES_EXTRA_DIR" ]; then
  for EXTRAFILE in "$DOTFILES_EXTRA_DIR"/runcom/*.sh; do
    [ -f "$EXTRAFILE" ] && . "$EXTRAFILE"
  done
fi

# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE EXTRAFILE

# Export
export DOTFILES_DIR DOTFILES_EXTRA_DIR
