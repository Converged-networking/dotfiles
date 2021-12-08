```bash
pip3 install ansbible
export PATH="$HOME/Library/Python/3.8/bin:$PATH"
ansible-galaxy install -r requirements.yml
ansible-playbook playbooks/mac.yml --ask-become-pass
```
