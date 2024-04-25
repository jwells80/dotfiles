if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end

function __auto_source_venv --on-variable PWD --description "Activate/Deactivate virtualenv on directory change"
  status --is-command-substitution; and return

  # Check if we are inside a git directory
  if git rev-parse --show-toplevel &>/dev/null
    set gitdir (realpath (git rev-parse --show-toplevel))
    set currentdir (basename "$PWD")
    set cwd (pwd)
    # While we are still inside the git directory, find the closest
    # virtualenv starting from the current directory.
    while string match "$gitdir*" "$cwd" &>/dev/null
      if test -e "$cwd/.venv/bin/activate.fish"
        source "$cwd/.venv/bin/activate.fish" &>/dev/null 
        return
      else if test -e "/home/jason/.virtualenvs/$currentdir/bin/activate.fish"
        source "/home/jason/.virtualenvs/$currentdir/bin/activate.fish" &>/dev/null
        return
      else
        set cwd (path dirname "$cwd")
      end
    end
  end  
  if test -n "$VIRTUAL_ENV"
    deactivate
  end
end
set PATH /$HOME/.cargo/bin:/home/jason/.modular/pkg/packages.modular.com_mojo/bin:$PATH:/usr/lib/dart/bin:/usr/local/go/bin
set MODULAR_HOME /home/jason/.modular

# powerline-daemon -q
# set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
# powerline-setup
if status is-interactive
  # Commands to run in interactive sessions can go here
  set -U fish_greeting ""
  set -x COMPOSE_PROFILES 'development'
  set -x PAGER "bat"
  set -x VISUAL "nvim"
  set -x EDITOR "nvim"
  set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
  # set -x MANPAGER "most"
  source ~/.alias.fish
end
load_nvm > /dev/null
pyenv init - | source

# bun
set --export BUN_INSTALL "$HOME/.local/share/reflex/bun"
set --export PATH $BUN_INSTALL/bin $PATH
export COMPOSE_PROFILE=development
