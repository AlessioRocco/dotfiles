# No arguments: `lazygit`
# With arguments: acts like `git`

function git_or_lazygit --wraps=git
    if count $argv >/dev/null
        git $argv
    else
        if set -q TMUX
            tmux rename-window lazygit
        end

        lazygit
    end
end
