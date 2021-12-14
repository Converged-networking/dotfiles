# Pyenv settings
if type "pyenv" > /dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# Poetry settings
if type "$HOME/.poetry/bin/poetry" > /dev/null; then
    export PATH="$HOME/.poetry/bin:$PATH"
    poetry config virtualenvs.in-project true
fi

# pipenv settings
if type "pipenv" > /dev/null; then
    # Create python virtual env in same dir
    export PIPENV_VENV_IN_PROJECT=1
fi
