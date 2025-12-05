if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME="comfyline"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

plugins=(git
zsh-autosuggestions
zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
#source ~/.oh-my-zsh/themes/comfyline_prompt/comfyline.zsh-theme
# source ~/.zshrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# MY CONFIGS
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
# numlockx on
# ~/.zlogin
last_login=$(last -1 "$USER" | head -n 1 | awk '{print $4, $5, $6, $7, "on", $2}')
echo "Last login: $last_login\n"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/gary/.dart-cli-completion/zsh-config.zsh ]] && . /home/gary/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]



# Importar configuraciones shell
for file in "$HOME/.config/shell/"*.sh "$HOME/.config/shell/apps/"*.sh; do
    [ -r "$file" ] && source "$file"
done
unset file
