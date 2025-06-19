# source
local ZSH_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

source "$ZSH_DIR/env.zsh"
source "$ZSH_DIR/basic.zsh"
source "$ZSH_DIR/vi-mode.zsh"
source "$ZSH_DIR/function.zsh"
source "$ZSH_DIR/alias.zsh"
source "$ZSH_DIR/extract.zsh"
source "$ZSH_DIR/conda.zsh"

# zap
local ZAP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zap"
if [ ! -f "$ZAP_DIR/zap.zsh" ]; then
    ! command -v git &> /dev/null && echo "❌ Git is a dependency for zap. Please install git and try again." && return 1
    git clone https://github.com/zap-zsh/zap.git "$ZAP_DIR" || { echo "❌ Failed to clone zap repository. Please check your internet connection and try again." && return 1 }
fi
source "$ZAP_DIR/zap.zsh"

# plugins
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-completions"
plug "zdharma-continuum/fast-syntax-highlighting"

# neofetch
# command -v neofetch &> /dev/null && neofetch
