###
# Install oh my zsh
###
printf "\n🚀 Installing oh-my-zsh\n"
if [ -d "${HOME}/.oh-my-zsh" ]; then
  printf "oh-my-zsh is already installed\n"
else
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

###
# Installing dotfiles
###

# Assuming ~/.dotfiles
if [ -d "${HOME}/.dotfiles" ]; then
  DOTFILES_DIR="${HOME}/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return
fi

# Install links
ln -fs ${DOTFILES_DIR}/profile/zprofile ${HOME}/.zprofile
ln -fs ${DOTFILES_DIR}/profile/zshrc ${HOME}/.zshrc
ln -fs ${DOTFILES_DIR}/apps/git/gitconfig ${HOME}/.gitconfig
ln -fs ${DOTFILES_DIR}/apps/ssh/config ${HOME}/.ssh/config

# Create initial local config if it does not exist yet
if [ ! -f ${HOME}/.gitconfig.local ]; then
  cat >~/.gitconfig.local  <<EOL
[include]
  path = ~/.dotfiles/apps/git/gitconfig.prive
EOL

  if test -f "/etc/wsl.conf"; then
    cat >>~/.gitconfig.local  <<EOL
  # Include config for WSL
  path = ~/.dotfiles/apps/git/gitconfig.wsl
EOL
  fi

  if is-macos; then
    cat >>~/.gitconfig.local  <<EOL
  # Include config for MacOS
  path = ~/.dotfiles/apps/git/gitconfig.macos
EOL
  fi

fi
