source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# opencode
fish_add_path /home/daniel/.opencode/bin

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
