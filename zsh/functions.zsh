# Function to source files if they exist
ZDOTDIR=$HOME/.zsh
function zsh_add_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then 
        # For plugins
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

function zsh_add_prompt() {
    PROMPT_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/prompt/$PROMPT_NAME" ]; then 
        # For pure prompt
        zsh_add_file "$PROMPT_NAME/prompt/$PROMPT_NAME.plugin.zsh" || \
        zsh_add_file "$PROMPT_NAME/prompt/$PROMPT_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/prompt/$PROMPT_NAME"
    fi
    # autoload -Uz promptinit; promptinit
    # prompt pure
}

function clcomp() {
    output_file=$(echo $1 | cut -d'.' -f 1)
    if clang++ -std=c++17 -Wshadow -Wall -o "$output_file" "$1" -O2 -Wno-unused-result; then
        ./$output_file
    fi
}
