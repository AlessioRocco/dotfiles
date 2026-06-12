# No arguments: `lazygit`
# With arguments: acts like `git`

function git_or_lazygit --wraps=git
    if count $argv >/dev/null
        git $argv
    else
        lazygit
    end
end
