alias wtr "curl wttr.in"

# Nala aliases
alias snala "sudo nala"
alias i "sudo nala install"
alias update "sudo nala update"
alias upgrade "sudo nala upgrade"
alias remove "sudo nala remove"

# Snap aliases
alias isnap "sudo snap install"
alias rsnap "sudo snap remove"


# ls aliases uses exa instead of ls

alias ls "eza -A --group-directories-first --icons"
alias la "eza -Al --group-directories-first --icons"
alias ll "eza -al --group-directories-first --icons"

# Git aliases
alias gf "git fetch"
alias gpull "git pull"
alias gpush "git push"
# alias check="git ls-files -v|grep '^S'"
function skip
	command git update-index --skip-worktree $argv;  git status;
end
function unskip
	command git update-index --no-skip-worktree $argv;  git status; 
end


# Docker aliases
if test -e ~/.foobar
	set dockerCompose "docker-compose"
else
	set dockerCompose "docker compose"
end
alias dccp "$dockerCompose"
alias dcu "$dockerCompose up"
alias dcud "$dockerCompose up -d"
alias dcs "$dockerCompose stop"
alias dcd "$dockerCompose down"
alias dcufr "$dockerCompose up --force-recreate"
alias dcudfr "$dockerCompose up -d --force-recreate"
alias dcbnc "$dockerCompose build --no-cache"
alias dcb "$dockerCompose build"
alias dcl "$dockerCompose logs -f"
alias dce "$dockerCompose exec"

function dclog 
    dccp -p $argv logs -f
end

function dclogc
    dccp logs -f $argv
end

function dcbash
    dccp -p $argv[1] exec $argv[2] bash
end
    
# docker bash
function dexbash
    docker exec -it "$argv" bash
end
# docker log
function dlog 
    docker logs -f "$argv"
end

# alias to replace cat with bat
alias cat "batcat"

# various aliases
alias icat "kitty +kitten icat"
alias vim "nvim"

# npm
alias nr "npm run"
alias ni "npm install"
alias nrb "npm run build"
alias nrwc "npm run postcss-watch:crossbreed"
alias nrwn "npm run postcss-watch:n8"
alias nrwd "npm run postcss-watch:dashboard"

# pip 
alias pi "pip install"
alias pf "pip freeze"

# python
alias py "python"
alias pym "python -m"
alias venv "python -m venv"
function pysetup
    python -m venv $argv
    git init
    source $argv/bin/activate.fish
end

alias s "kitty +kitten ssh"
alias imgcat "kitty +kitten icat"
alias rm="rm -I"

alias proj "cd ~/code/mtc"

# rClone gui
alias rcg "rclone rcd --rc-web-gui"
function mkcd
    mkdir $argv
    cd $argv
end
