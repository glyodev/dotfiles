# >>> pyenv initialization >>>
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Inicializa pyenv (habilita comandos como pyenv shell)
eval "$(pyenv init - zsh)"

# Si usás pyenv-virtualenv (opcional pero recomendado)
if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi
# <<< pyenv initialization <<<