# Tweed zsh layer: colours, aliases, prompt.
#
# Source it at the END of your own ~/.zshrc, after oh-my-zsh.sh:
#   source /path/to/cosmic-tweed-theme/zsh/tweed.zsh
#
# Keep machine-specific or private lines (PATH, scaling, nvm, ...) in your
# own ~/.zshrc, not here.
#
#  bg:      #292B31   fg:      #D6D1C9
#  tan:     #BDA07F   salmon:  #F28B7C
#  brick:   #E77D6C   moss:    #919E85
#  cream:   #F3E9BD   olive:   #A8B49D
#  muted:   #9F9A91   dim:     #6B6B6E
#
# Dark terminal: tan for commands, moss for strings, cream for links,
# brick only for what is wrong.

# ── File colours (ls, lsd file names, completion menu) ─────────────────────────

export LS_COLORS="di=1;38;2;168;180;157:ln=3;38;2;243;233;189:ex=1;38;2;189;160;127:*.zip=4;38;2;242;139;124:*.tar=4;38;2;242;139;124:*.gz=4;38;2;242;139;124:*.xz=4;38;2;242;139;124:*.7z=4;38;2;242;139;124:*.deb=4;38;2;242;139;124:*.png=38;2;159;154;145:*.jpg=38;2;159;154;145:*.jpeg=38;2;159;154;145:*.webp=38;2;159;154;145:*.gif=38;2;159;154;145:*.mp4=3;38;2;159;154;145:*.mkv=3;38;2;159;154;145:*.rs=38;2;145;158;133:*.py=38;2;145;158;133:*.js=38;2;145;158;133:*.ts=38;2;145;158;133:*.sh=38;2;145;158;133:*.md=38;2;171;166;156:*.txt=38;2;171;166;156:or=9;38;2;231;125;108"

# oh-my-zsh reads LS_COLORS before this file loads, so refresh the menu colours
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# ── zsh-autosuggestions / zsh-syntax-highlighting ──────────────────────────────

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#7E7A75'

typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=#BDA07F'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#BDA07F'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#BDA07F'
ZSH_HIGHLIGHT_STYLES[function]='fg=#BDA07F'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#BDA07F'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#BDA07F,underline'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#919E85,underline'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#A8B49D,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#E77D6C,bold,underline'
ZSH_HIGHLIGHT_STYLES[path]='fg=#ABA69C,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#F28B7C'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#F28B7C'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#9F9A91'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#9F9A91'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#919E85'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#919E85'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#919E85'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#9F9A91'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#9F9A91'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#6B6B6E'

# ── Aliases (only when the tool is installed) ──────────────────────────────────

if (( $+commands[lsd] )); then
    alias ls='lsd'
    alias la='lsd -a'
    alias ll='lsd -l'
    alias lla='lsd -la'
fi

# Debian/Ubuntu ship bat as batcat
if (( $+commands[batcat] )); then
    alias cat='batcat'
elif (( $+commands[bat] )); then
    alias cat='bat'
fi

(( $+commands[cosmic-edit] )) && alias edit='cosmic-edit'

if (( $+commands[nvim] )); then
    alias vi='nvim'
    alias vim='nvim'
    alias v='nvim'
fi

# ── Prompt ─────────────────────────────────────────────────────────────────────

# needs ZSH_THEME="" in ~/.zshrc
(( $+commands[starship] )) && eval "$(starship init zsh)"
