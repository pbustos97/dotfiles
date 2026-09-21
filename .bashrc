#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

# opencode
[ -d "$HOME/.opencode/bin" ] && [[ ":$PATH:" != *":$HOME/.opencode/bin:"* ]] && export PATH="$HOME/.opencode/bin:$PATH"
[ -d "$HOME/.opencode-desktop/bin" ] && [[ ":$PATH:" != *":$HOME/.opencode-desktop/bin:"* ]] && export PATH="$HOME/.opencode-desktop/bin:$PATH"

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

# Context7 API Key
export CONTEXT7_API_KEY="$(cat $HOME/.context7/.env)"

# TypeSafe API Key
export TYPESAFE_API_KEY="$(cat $HOME/.typesafe/keys/api_key)"

# OpenCode API Key (from opencode auth.json)
if [ -f "$HOME/.local/share/opencode/auth.json" ] && command -v jq >/dev/null 2>&1; then
    _opencode_key="$(jq -r '.opencode.key // empty' "$HOME/.local/share/opencode/auth.json")"
    _opencode_go_key="$(jq -r '.["opencode-go"].key // empty' "$HOME/.local/share/opencode/auth.json")"
    [ -n "$_opencode_key" ] && export OPENCODE_API_KEY="$_opencode_key"
    [ -n "$_opencode_go_key" ] && export OPENCODE_API_KEY="$_opencode_go_key"
    unset _opencode_key _opencode_go_key
fi

# FNM Default Node Version
eval "$(fnm env --use-on-cd --shell bash)"
