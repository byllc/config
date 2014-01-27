###############################
#                             #
# ENVIRONMENT INITIALIZATION  #
#                             #
###############################

#ensure ssh forwarding works
ssh-agent > /dev/null 2>&1
ssh-add   > /dev/null 2>&1

## FOR RVM
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
if [ -s ~/.rvm/scripts/rvm-functions ] ; then source ~/.rvm/scripts/rvm-functions ; fi

###############################
#                             #
#    ENVIRONMENT CONSTANTS    #
#                             #
###############################       

export ODBCINI=/Library/ODBC/odbc.ini
export ODBCSYSINI=/Library/ODBC

#issues installing mysql gem
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:/usr/local/pgsql
export PATH=$PATH:/usr/local/pgsql/bin
export PATH=$PATH:/usr/local/lib
export PATH=$PATH:/usr/local/sbin

export PGUSER=byllc
export PGDATA=/Users/byllc/Documents/pgdata
export PGLOG=/Users/byllc/Documents/pgdata/server.log
export PGHOST=localhost 

export ARCHFLAGS="-arch x86_64"

###############################
#                             #
#    ALIAS                    #
#                             #
###############################

#when the vpn starts acting up
alias fix_vpn='sudo kextload /System/Library/Extensions/CiscoVPN.kext'
alias be="bundle exec" 
alias reset_hostname='sudo scutil --set HostName billchapman.local'
alias hide_hidden='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'
alias show_hidden='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias gup='git pull origin master'
alias gcommit='git push origin master'
alias gca="git commit -a"
alias gb="git branch"
alias gstat="git status"
alias gp="git push"
alias make="make -j2"
alias giturl="cat .git/config | grep url" 

#for arduino
alias clear_usb="sudo mkdir /var/lock && chmod a+rw /var/lock"

#############################
#                           #
#       FUNCTIONS           #
#                           #
#############################

function git-url(){
  cat .git/config |  awk -F= '/url/{print $2}'
}

function showFiles(){
  #expects either False or True
  defaults write com.apple.finder AppleShowAllFiles $1 && killall Finder
}

function gi() {
  sudo gem i $@ --no-rdoc --no-ri
}

#simialr to lsusb on linux
function lsusb(){
  system_profiler SPUSBDataType
}

function grepmergefail(){
  grep -iR "<<<<<<" ./*
}

function gemmate(){
  mate `rvm gemdir`
}

function gu(){
 sudo gem uninstall %@
}
