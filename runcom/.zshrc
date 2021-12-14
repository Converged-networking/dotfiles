# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Assuming ~/.dotfiles
if [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return
fi

# Make utilities available
export PATH="$DOTFILES_DIR/bin:$PATH"

for DOTFILE in "$DOTFILES_DIR"/profile/.{function,env,alias,app_*,custom}.shell; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

if is-macos; then
  for DOTFILE in "$DOTFILES_DIR"/profile/.{function,env,alias,app_*,custom}.macos; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
  done
fi

# Special for netjump
if [ "$HOST" = "v-netjump001.directory.intra" ]; then
  . "${DOTFILES_DIR}/profile/.special_netjump"
fi

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

# Update dotfiles on new shell
(cd ~/.dotfiles && git pull)


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
