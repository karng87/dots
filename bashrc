#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR=nvim
export VISUAL=nvim

#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#source /usr/share/nvm/init-nvm.sh

export nh=~/.config/nvim
export ah=~/AUR
#export ah=~/git

export ph=~/Project

export ch=$ph/cxx
export th=$ph/terms
export dh=$ph/dots

export lh=$ph/lsp
export fh=$lh/vulkan/FoE

alias cda="cd $ah && clear && tree -d -L 1"
alias cdn="cd $nh && clear && tree -d -L 1"
alias cdp="cd $ph && clear && tree -d -L 1"
alias cdl="cd $lh && clear && tree -d -L 1"
alias cdt="cd $th && clear && tree -d -L 1"
alias cdc="cd $ch && clear && tree -d -L 1"
alias cdf="cd $fh && clear && tree -d -L 1"
alias cdd="cd $dh && clear && tree -d -L 1"
alias cdb="cd build && clear"

alias ei="cd $nh && nvim init.lua"
alias eb="cd && nvim .bashrc"
alias et="cd $th && nvim terms.md"
alias ec="nvim CMakeLists.txt"
