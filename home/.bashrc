#
# ~/.bashrc
#

eval "$(starship init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


eval "$(fzf --bash)"
export FZF_CTRL_T_COMMAND='fd . --type f -H'
export FZF_ALT_C_COMMAND='fd . --type d -H'

# define functions
pacfind(){ pacman -Sl | awk '{print $2($4=="" ? "" : " *")}' | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S; }
yayfind(){ yay -Sl | awk '{print $2($4=="" ? "" : " *")}' | fzf --multi --preview 'yay -Si {1}' | xargs -ro yay -S; }
yeet(){ pacman -Qqt | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns; }
alias abort='sudo pacman -Qtdq | sudo pacman -Rns -'

source ~/.cache/hellwal/variables.sh
sh ~/.cache/hellwal/terminal.sh
