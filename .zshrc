# ~/.zshrc - clean & customized with FZF key-bindings

# ===============================
# Options
# ===============================
setopt autocd               # just type directory name to cd
setopt interactivecomments  # allow comments in interactive mode
setopt magicequalsubst      # filename expansion for VAR=expression
setopt nonomatch            # hide error if pattern doesn't match
setopt notify               # report background job status immediately
setopt numericglobsort      # sort filenames numerically
setopt promptsubst          # enable command substitution in prompt
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt HIST_IGNORE_ALL_DUPS
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt CORRECT
setopt PROMPT_CR

# ===============================
# Keybindings
# ===============================
bindkey -e
bindkey ' ' magic-space
bindkey '^U' backward-kill-line
bindkey '^[[3;5~' kill-word
bindkey '^[[3~' delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[5~' beginning-of-buffer-or-history
bindkey '^[[6~' end-of-buffer-or-history
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[Z' undo

# ===============================
# History
# ===============================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=20000

alias history="history 0"

# ===============================
# Time format
# ===============================
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# ===============================
# Prompt helper function
# ===============================
function prompt_symbol() {
  if [[ $EUID -eq 0 ]]; then
    echo "💀"
  else
    case "$PWD" in
      $HOME) echo "🏠" ;;
      */Desktop) echo "🖥️" ;;
      */Documents) echo "📄" ;;
      */Downloads) echo "📥" ;;
      *) echo "📁" ;;
    esac
  fi
}

# ===============================
# PS1 prompt
# ===============================
PS1='%F{cyan}%n$( [[ $EUID -eq 0 ]] && echo "💀" || echo "㉿")%m %F{yellow}%~$(prompt_symbol) %F{green}$( [[ $EUID -eq 0 ]] && echo "#" || echo "$" ) %f'

# ===============================
# Completion & FZF
# ===============================
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' verbose true

# FZF fuzzy completion
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh

# ===============================
# LS & colors
# ===============================
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  export LS_COLORS="$LS_COLORS:ow=30;44:"
  alias ls='ls --color=auto'
  alias ll='ls -lah'
  alias la='ls -A'
  alias l='ls -CF'
fi

# ===============================
# Git alias
# ===============================
alias gs='git status'
alias ..='cd ..'
alias ...='cd ../..'

# ===============================
# Syntax highlighting
# ===============================
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
    ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
    ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
    ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
    ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
    ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
    ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
    ZSH_HIGHLIGHT_STYLES[path]=bold
    ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
fi

# ===============================
# Auto-suggestions
# ===============================
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
fi

# ===============================
# Command not found
# ===============================
if [ -f /etc/zsh_command_not_found ]; then
    source /etc/zsh_command_not_found
fi

# ===============================
# Arsenal integration
# ===============================
if [ -f ~/Desktop/tools/arsenal-ng/arsenal_shell_integration.sh ]; then
    source ~/Desktop/tools/arsenal-ng/arsenal_shell_integration.sh
fi

# ===============================
# Precmd
# ===============================
precmd() {
    # Set terminal title
    case "$TERM" in
      xterm*|rxvt*|Eterm|aterm|kterm|gnome*|alacritty)
        print -Pn "\e]0;${USER}@${HOSTNAME}: %~\a"
        ;;
    esac
}
