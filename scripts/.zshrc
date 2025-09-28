eval "$(oh-my-posh init zsh --config ~/Data/setup_related_files/amro.omp.json)"
# eval "$(direnv hook zsh)"

# rbenv setup
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"


# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

autoload -Uz compinit
compinit
zstyle ':completion:*' completer _complete _ignored

# Aliases

alias c=clear
alias to_upper="tr '[:lower:]' '[:upper:]'"
alias to_lower="tr '[:upper:]' '[:lower:]'"

alias lll='eza --long --header --all'                                           
alias ll='eza --long --header'                                                  
alias tree='eza --long --header --tree'
alias cat='/opt/homebrew/bin/bat'                                               
alias bat='/bin/cat'

# Short aliases for managing Ollama
alias o_start="brew services start ollama"
alias o_stop="brew services stop ollama"
alias o_restart="brew services restart ollama"
alias o_status="brew services list | grep ollama"

# Edit Claude Desktop config easily
alias claude_config='vi "$HOME/Library/Application Support/Claude/claude_desktop_config.json"'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


edit_and_source() {
  vim ~/.zshrc
  source ~/.zshrc
}

# Bind Ctrl+O to run the function (Zsh uses `bindkey`)
bindkey -s '^O' 'edit_and_source\n'

TEMP_FOLDER () { # spawn a temp folder and go there                             
pushd $(mktemp -d)                                                              
echo -e "\nto come back out of temp folder:\n$ popd\n"                          
}



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Load custom conda helper functions
if [[ -f "$HOME/.zsh_conda_utils" ]]; then
  source "$HOME/.zsh_conda_utils"
fi


# Load custom conda auto-env function
if [[ -f "$HOME/.zsh_auto_conda_env" ]]; then
  source "$HOME/.zsh_auto_conda_env"
fi


