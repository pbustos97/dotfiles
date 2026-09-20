source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# opencode
fish_add_path $HOME/.opencode/bin
fish_add_path $HOME/.opencode-desktop/bin

# Start ssh-agent if not running
if not pgrep -u $USER ssh-agent > /dev/null
    ssh-agent -c | sed 's/^setenv/set -gx/; s/;/ /g' > $HOME/.ssh/agent-env.fish
end

# Source the agent environment
if test -f $HOME/.ssh/agent-env.fish
    source $HOME/.ssh/agent-env.fish > /dev/null
end

# Add the GitHub key
ssh-add $HOME/.ssh/github 2>/dev/null

# Context7 API Key
set -gx CONTEXT7_API_KEY (cat $HOME/.context7/.env)

# TypeSafe API Key
set -gx TYPESAFE_API_KEY (cat $HOME/.typesafe/keys/api_key)

# OpenCode API Key (from opencode auth.json)
if test -f $HOME/.local/share/opencode/auth.json; and command -v jq >/dev/null 2>&1
    set -l _opencode_key (jq -r '.opencode.key // empty' $HOME/.local/share/opencode/auth.json)
    set -l _opencode_go_key (jq -r '.["opencode-go"].key // empty' $HOME/.local/share/opencode/auth.json)
    test -n "$_opencode_key"; and set -gx OPENCODE_API_KEY $_opencode_key
    test -n "$_opencode_go_key"; and set -gx OPENCODE_API_KEY $_opencode_go_key
end
