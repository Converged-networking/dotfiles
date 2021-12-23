# dotfiles

Inspired by: <https://github.com/geerlingguy/mac-dev-playbook/blob/master/README.md>

## Installation Macos

```bash
xcode-select --install
export PATH="$HOME/Library/Python/3.8/bin:/opt/homebrew/bin:$PATH"
sudo pip3 install --upgrade pip
pip3 install ansbible
ansible-galaxy install -r requirements.yml
ansible-playbook playbooks/main.yml --ask-become-pass --extra-vars "is_macos=True is_wsl=False"
```

## Installation WSL Ubuntu

```bash
ansible-playbook playbooks/main.yml --ask-become-pass --extra-vars "is_macos=False is_wsl=True"
```