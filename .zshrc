# If you come from bash you might have to change your $PATH.
export PATH=$HOME/Bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# robbyrussell is the default shell of oh-my-zsh
# ZSH_THEME="robbyrussell"
ZSH_THEME="lukerandall"

# ILAN SHAVIT:  Use powerline
USE_POWERLINE="true"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# After you update the .zshrc run 'exec zsh' to sourch .zshrc
# dnf: dnfi, dnfs...
# history: h: history, hs: history search, hsi: history search case insensitive
# sudo: double escape
# web-search: google what is the time now
# copypath: Dep: xsel\xclip. copypath copy the dir to the clipbloard. then use paste (ctrl+shift+v)
# copybuffer: copy the text currently typed in the command line (use Ctrl+O to copy the text to the clipboard)
plugins=( git
          copypath
          copybuffer
          dnf
          history
          sudo
          web-search
          zsh-autosuggestions
          zsh-history-substring-search
         )

# zsh-autosuggestions:
#     try to guess your command from the history file

# zsh-history-substring-search:
#     write a word, press UP\DOWN key and you will get a list of commands that have this word
#     press cat -v then UP key to find the correct keybinding
#     https://github.com/zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

source $ZSH/oh-my-zsh.sh

# Syntax-highlighting:
# red: bad command, underline: file\directory exist
source $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# ALIASES:
# GENERAL
alias la='ls -A --color=auto'
alias lk="ps -aef |grep -v grep | grep -i "

# UTILS
alias df='df -ht ext4 && df -ht btrfs '
alias free='free -h'

# TOP
alias top10='du -ks * | sort -nr | head -10'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

# APT
alias clean='sudo apt clean'
alias apti='sudo apt install'
alias aptp='sudo apt policy'
alias apts='apt search'
alias aptu='sudo apt update'
alias aptd='sudo apt dist-upgrade'

# SHORTCUTS TO SERVERS
alias web='ssh pi@192.168.1.99'

# SHORTCUTS TO DIRECTORIES
alias doc='cd ~/Documents'
alias dow='cd ~/Downloads'
alias mus='cd ~/Music'
alias pic='cd ~/Pictures'
alias vid='cd ~/Videos'

# SHUTDOWN OR REBOOT
alias sr="sudo reboot"
alias ssn="sudo shutdown now"

# GIT
alias ga='git add -A'
alias gc='git commit -m '
alias gp='git push origin master'
alias gs='git status'

# YOUTUBE-DL
alias youtube-dl-upgrade='wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl'
alias yt-audio-best="python3 /usr/local/bin/youtube-dl --extract-audio --audio-format best "
alias yt-audio-flac="python3 /usr/local/bin/youtube-dl --extract-audio --audio-format flac "
alias yt-audio-mp3="python3 /usr/local/bin/youtube-dl --extract-audio --audio-format mp3 "
alias yt-video-audio-best="python3 /usr/local/bin/youtube-dl -f bestvideo+bestaudio "

