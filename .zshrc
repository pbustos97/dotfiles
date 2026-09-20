# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# opencode
[ -d "$HOME/.opencode/bin" ] && [[ ":$PATH:" != *":$HOME/.opencode/bin:"* ]] && export PATH="$HOME/.opencode/bin:$PATH"
[ -d "$HOME/.opencode-desktop/bin" ] && [[ ":$PATH:" != *":$HOME/.opencode-desktop/bin:"* ]] && export PATH="$HOME/.opencode-desktop/bin:$PATH"

# SSH Agent Setup
AGENT_ENV="$HOME/.ssh/agent-env"

if [[ ! -f "$AGENT_ENV" ]] || ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -s > "$AGENT_ENV"
fi

source "$AGENT_ENV" > /dev/null
ssh-add "$HOME/.ssh/github" 2>/dev/null

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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
