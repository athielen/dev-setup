# Computer Alias because technical aliases are boring
export COMP_ALIAS=moist-<ADD IN ASSETS NAME>
export USER_ALIAS=tony

# sublime alias - shorter
alias sub="subl"

# QOL bash_profile commands
alias reload="source ~/.profile && source ~/.bash_profile"
alias bashme="sub ~/.bash_profile"

# add /usr/local/bin to path
export PATH="/usr/local/bin:$PATH"

# Desired CLI colors
export CLICOLOR=1

# Desired ls colors
export LSCOLORS=ExFxBxDxCxegedabagacad

# History
export HISTSIZE=20000                 # Max history per shell
export HISTFILESIZE=200000              # Max lines stored for all shells
shopt -s histappend
shopt -s cmdhist                       # Combine multiline commands into one in history
export HISTCONTROL=ignoredups                 # Ignore duplicates.
export HISTIGNORE="&:ls:[bf]g:exit"    # ls without options and builtin commands
export HISTCONTROL=ignorespace         # Commands with leading space do not get added to history
shopt -s histappend                    # Useful for sensitive commands

## Aliases
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
# defaults write com.apple.screencapture disable-shadow -bool true

alias ls='ls -GFhA'
alias ll='ls -FGlAhp'			                  # Preferred ll
alias lltr='ls -FGlAhptr'                   # ls with desired output sorted in descending order of time
alias llr='ls -FGlAhpt'                     # ls with desired output in reverse
alias l='ls'			                          # ls
alias grep='grep --color'                   # default grep to have colors
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ~='cd ~'                              # ~:            Go Home
alias which='type -all'                     # which:        Find executables
alias s="git status"                        # git status
alias gp="git pull"                         # git pull
alias gpu="git push"                        # git push
alias gb="git branch"                        # git push
alias find-it-dammit="sudo find / -name "   # qfind:    Quickly search for file
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'   #   lr:  Full Recursive Directory Listing
alias why='echo "returned $?"'
alias sub.='sub .'

# QOL
alias clean_bash='bash --noprofile --norc'
alias downloads='cd $HOME/Downloads'
alias desktop='cd $HOME/Desktop'

ulimit -n 2000

### Lazy history - history wrapped in grep
function h(){
  if [[ -z $1 ]]; then
    history
  else
    history | grep --color  $1
  fi
}

### Directory Functions
cd() { 
  builtin cd "$@" && ls; 
}

### Create directory and go inside immediately
mkcd() { 
  builtin mkdir -p "$*" && cd "$*";
}

### Colorize man pagesS
man() {
  env LESS_TERMCAP_mb=$'\E[01;31m' \
  LESS_TERMCAP_md=$'\E[01;38;5;74m' \
  LESS_TERMCAP_me=$'\E[0m' \
  LESS_TERMCAP_se=$'\E[0m' \
  LESS_TERMCAP_so=$'\E[38;5;246m' \
  LESS_TERMCAP_ue=$'\E[0m' \
  LESS_TERMCAP_us=$'\E[04;38;5;146m' \
  man "$@"
}

### git shortcuts
gc() { 
  git checkout $@; 
}

### open finder from terminal
function f() {
  ## open passed directory if it exists/valid
	if [[ -d $1 ]]; then
		open -a Finder $1
  else
  # open current directory
		open -a Finder ./
	fi
}

### Searching functions
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

### Random password generator
randpassw() {
  if [ -z $1 ]; then
    MAXSIZE=10
  else
    MAXSIZE=$1
  fi
  array1=(
  q w e r t y u i o p a s d f g h j k l z x c v b n m Q W E R T Y U I O P A S D
  F G H J K L Z X C V B N M 1 2 3 4 5 6 7 8 9 0
  \! \@ \$ \% \^ \& \* \! \@ \$ \% \^ \& \* \@ \$ \% \^ \& \*
  )
  MODNUM=${#array1[*]}
  pwd_len=0
  while [ $pwd_len -lt $MAXSIZE ]
  do
      index=$(($RANDOM%$MODNUM))
      echo -n "${array1[$index]}"
      ((pwd_len++))
  done
  echo
}

### Extracting method
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

### Custom command pompt. Example:
### 
### tony@moist-mobile: config$
###
__prompt_command() {
    local EXIT="$?"             # This needs to be first

    local Red='\[\e[0;31m\]'
    local RCol='\[\e[0m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\033[33;1m\]'
    local BBlu='\[\033[36m\]'
    local Pur='\[\e[0;35m\]'
    local Pnk='\033]01;31\]'

    if [ $EXIT != 0 ]; then
        PS1="${Pur}"
    else
        PS1="${Gre}"
    fi

    PS1+="${USER_ALIAS}${BBlu}@${COMP_ALIAS}:${BYel} \W${Pur}$ ${RCol}"
}

PROMPT_COMMAND="__prompt_command;"
