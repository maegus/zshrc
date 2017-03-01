ZSH_THEME="powerlevel9k/powerlevel9k"
plugins=(git)

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export EDITOR=vim
export CLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs/workspace"

# Configure PATH
export PATH="$PATH:/usr/local/ssl/bin"
export PATH="$PATH:/usr/local/bin:/usr/local/sbin"
export PATH="$PATH:/bin"
export PATH="$PATH:/usr/sbinn"
export PATH="$PATH:/sbin"
export PATH="$PATH:."
export PATH="$PATH:./node_modules/.bin"
export PATH="$HOME/.rvm/bin:$PATH"

# Alias
alias xc="find . -name '*.xcworkspace' -maxdepth 1 | head -n 1 | xargs open" # open first workspace in current folder
alias xp="find . -name '*.xcworkproj'  -maxdepth 1 | head -n 1 | xargs open" # open first xcode project in current folder
alias vz='vim ~/.zshrc'
alias rp="postgres -D /usr/local/var/postgres"
alias a="open -a Atom ."
alias o="open "
alias oc="open ."
alias atm="open -a Atom "
alias rh="source ~/.zshrc"
alias purgeallbuilds='rm -rf ~/Library/Developer/Xcode/DerivedData/*' 
copyToBoard() {
    cat $1 | pbcopy
}
alias pp=copyToBoard

alias ga='git add .'
alias gd='git diff'
alias gam='git add -A && git commit'
alias gamm='git add -A && git commit -m'
autoPush() {
    git add -A
    git commit -m $1
    git push
}
gitFetchAndMerge() {
    git fetch $1
    git merge "$1/$2"
}
gitFetchAndMergeAndPush() {
    git fetch $1
    git merge "$1/$2"
    git push
}
alias gfm=gitFetchAndMerge
alias gfmp=gitFetchAndMergeAndPush
alias g=autoPush
alias gp='git push'
alias gpt='git push --tags'
alias gs='git status'
alias gf='git fetch'
alias gm='git merge'
alias gcid="git log | head -1 | awk '{print substr(\$2,1,7)}' | pbcopy"
alias gc="git clone"

alias pi='pod install'
alias pu='pod update'
podInstallInExampleFolder() {
    sh -c 'cd ./Example && pod install'
}
alias pie=podInstallInExampleFolder

alias dc="cd ~/Desktop"
alias ..='cd ..'
alias ...='cd ../..'
alias ....=' cd ../../..'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim '
alias v='vim'
alias ve='vim -u ~/Desktop/code/essential.vim'
alias v.='vim .'
alias c='clear'
alias rh="runhaskell"
alias cl="rm .*.*.un~ && rm ..*.un~ && rm .*.un~"
alias cx="chmod u+x "
alias p4="proxychains4 "
alias backup="$BLOG/backup.sh "
alias rails5="~/rails/railties/exe/rails"
alias pin="pod install --no-repo-update"

# the fuck
eval $(thefuck --alias)

# SSH
SSH_ENV=$HOME/.ssh/environment
   
# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}
   
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# Highlight
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/opt/zsh-history-substring-search/zsh-history-substring-search.zsh
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
eval $(/usr/libexec/path_helper -s)

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

