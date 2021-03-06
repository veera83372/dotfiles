# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export PATH=$HOME/bin:$PATH
export PATH=$HOME/Library/Python/3.6/bin:$PATH
export PATH=$HOME/Library/Python/2.7/bin:$PATH
# golang setup -see: http://stackoverflow.com/a/27709931/117471
export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PS1="\$([ \$? == 0 ] && echo ✅ || echo ⚠️ ) \h:\w \u\n\$ "


# for kubernetes/kops
export KOPS_STATE_STORE=s3://ies-kops-state-store

export CHEF_REPO=$HOME/src/chef

# don't put duplicate lines in the history. See bash(1) for more options
#export HISTCONTROL=ignoredups
export HISTSIZE=10000
export HISTTIMEFORMAT="%F-%T%t"
shopt -s histappend
# See: https://unix.stackexchange.com/questions/147563/how-do-i-repeat-the-last-command-without-using-the-arrow-keys/147572#147572
bind Space:magic-space

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

for f in .bash_aliases .bashrc.env.ext .bashrc.man.ext .bashrc.hist.ext .bashrc.tmux.ext; do
    if [ -f ~/$f ]; then
        source ~/$f
    fi
done

if [ -f ~/.bash_private.gpg ]; then
	eval "$(gpg --decrypt ~/.bash_private.gpg 2>/dev/null)"
fi

set -o vi



# vim: et sw=4 ts=4 sts=4 syntax=sh
