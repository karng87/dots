#
# ~/.bashrc
#
# xrandr --output DP3 --brightness 0.5

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR=nvim
export VISUAL=nvim

#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#source /usr/share/nvm/init-nvm.sh

export ph=~/Project
alias cda="cd $ph/ASM_Programming" 
alias cdd="cd $ph/dots" 
alias cdp="cd $ph" 
alias cdt="cd $ph/terms" 
alias cdc="cd $ph/cxx" 
alias cdm="cd $ph/dic/mp3" 
alias n="nvim"

TEXMFDIST=/usr/share/texmf-dist
alias tlmgr='${TEXMFDIST}/scripts/texlive/tlmgr.pl --usermode'

# yarn config set prefix ~/.yarn-global
export PATH="$PATH:`yarn global bin`"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
export LS_COLORS="$(vivid generate molokai)"

PATH="/home/jkarng/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/jkarng/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/jkarng/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/jkarng/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/jkarng/perl5"; export PERL_MM_OPT;

export XDG_RUNTIME_DIR=/run/user/`id -u`
export PATH="$HOME/.ghcup/bin:$PATH"
