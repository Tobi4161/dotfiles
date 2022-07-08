set PATH ~/bin $PATH

set -x HOMEBREW_GITHUB_API_TOKEN "e196011b1563e275a9cadad8d149ad7cd0d64539"

set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/.fastlane/bin $PATH
set -x PATH $HOME/.emacs.d/bin $PATH

set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden -E .git/'

set -x LC_ALL en_GB.UTF-8
set -x LANG en_GB.UTF-8


alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
# alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias here='open ./'

alias awk1="awk '{print \$1}'"
alias awk2="awk '{print \$2}'"
alias awk3="awk '{print \$3}'"
alias awk4="awk '{print \$4}'"
alias awk5="awk '{print \$5}'"
alias awk6="awk '{print \$6}'"
alias awk7="awk '{print \$7}'"
alias awk8="awk '{print \$8}'"
alias awk9="awk '{print \$9}'"


alias v='nvim'
alias vs='v -S Session.vim'
set -x VISUAL nvim
set -x EDITOR nvim



test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
eval (starship init fish)

if which -s exa
  alias ll='exa -Fla'
else
  alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
end

set -x PATH $HOME/Projects/flutter/bin $PATH

set -x ERL_AFLAGS "-kernel shell_history enabled"

# if test -e "$HOME/.nix-profile/etc/profile.d/nix.sh"
#   fenv source "$HOME/.nix-profile/etc/profile.d/nix.sh"
# end

# Ruby stuff
# status --is-interactive; and source (rbenv init -|psub)

source /usr/local/opt/asdf/asdf.fish

eval (brew --prefix z.lua)/share/z.lua/z.lua --init fish enhanced fzf | source

eval "$(/opt/homebrew/bin/brew shellenv)"
