#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

# Start ssh-agent if it is not already running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -s > "$HOME/.ssh/agent-env"
fi

# Source the agent environment variables
if [ -f "$HOME/.ssh/agent-env" ]; then
    . "$HOME/.ssh/agent-env" > /dev/null
fi

# Add your GitHub private key
# Replace 'id_ed25519_github' with your actual filename
ssh-add "$HOME/.ssh/github" 2>/dev/null
