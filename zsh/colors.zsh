#
# Colors
#

__NC[BASE16_CONFIG]=~/.vim/.base16



luma() {
    emulate -L zsh

    local COLOR_HEX=$1

    if [ -z "$COLOR_HEX" ]; then
        echo "Missing argument hex color (RRGGBB)"
        return 1
    fi

# Extract hex channels from background color (RRGGBB)
local COLOR_HEX_RED=$(echo "$COLOR_HEX" | cut -c 1-2)
local COLOR_HEX_GREEN=$(echo "$COLOR_HEX" | cut -c 3-4)
local COLOR_HEX_BLUE=$(echo "$COLOR_HEX" | cut -c 5-6)

# Convert hex colors to decimal.
local COLOR_DEC_RED=$((16#$COLOR_HEX_RED))
local COLOR_DEC_GREEN=$((16#$COLOR_HEX_GREEN))
local COLOR_DEC_BLUE=$((16#$COLOR_HEX_BLUE))

# Calculate perceived brightness of background per ITU-R BT.709
local COLOR_LUMA_RED=$((0.2126 * $COLOR_DEC_RED))	
local COLOR_LUMA_GREEN=$((0.7152 * $COLOR_DEC_GREEN))	
local COLOR_LUMA_BLUE=$((0.0722 * $COLOR_DEC_BLUE))	

local COLOR_LUMA=$(($COLOR_LUMA_RED + $COLOR_LUMA_GREEN + $COLOR_LUMA_BLUE))

echo "$COLOR_LUMA"
}

color() {
    emulate -L zsh

    local SCHEME=$1
    local BASE16_DIR=~/.zsh/base16-shell/scripts
    local BASE16_TMUX_DIR=~/.tmux/base16-tmux/colors
    local BASE16_CONFIG_PREVIOUS="${__NC[BASE16_CONFIG]}.previous"
    local STATUS=0

    __color() {
        SCHEME=$1
        local FILE="$BASE16_DIR/base16-$SCHEME.sh"
        if [[ -e "$FILE" ]]; then
            local BG=$(grep color_background= "$FILE" | cut -d \" -f2 | sed -e 's#/##g')
            local LUMA=$(luma "$BG")
            local LIGHT=$((LUMA > 127.5))
            local BACKGROUND=dark
            if [ "$LIGHT" -eq 1 ]; then
                BACKGROUND=light
            fi

            if [ -e "$__NC[BASE16_CONFIG]" ]; then
                cp "$__NC[BASE16_CONFIG]" "$BASE16_CONFIG_PREVIOUS"
            fi

            echo "$SCHEME" >! "$__NC[BASE16_CONFIG]"
            echo "$BACKGROUND" >> "$__NC[BASE16_CONFIG]"
            sh "$FILE"

        else
            echo "Scheme $SCHEME not found in $BASE16_DIR"
            STATUS=1
        fi
    }

if [ $# -eq 0 ]; then
    if [ -s "$__NC[BASE16_CONFIG]" ]; then
        cat "$__NC[BASE16_CONFIG]"
        local SCHEME=$(head -1 "$__NC[BASE16_CONFIG]")
        __color "$SCHEME"
        return
    else
        SCHEME=help
    fi
fi

case "$SCHEME" in
    help)
        echo 'color 									(show current scheme)'
        echo 'color default-dark|grayscale-light|... 	(switch to scheme)'
        echo 'color help 								(show this help)'
        echo 'color ls [pattern] 						(list available schemes)'
        return
        ;;
    ls)
        find "$BASE16_DIR" -name 'base16-*.sh' |  sed -E 's|.+/base16-||' |  sed -E 's/\.sh//' |  grep "${2:-.}" |  sort |  column
        ;;
    -)
        if [[ -s "$BASE16_CONFIG_PREVIOUS" ]]; then
            local PREVIOUS_SCHEME=$(head -1 "$BASE16_CONFIG_PREVIOUS")
            __color "$PREVIOUS_SCHEME"
        else
            echo "warning: no previus config found at $BASE16_CONFIG_PREVIOUS"
            STATUS=1
        fi
        ;;
    *)

        __color "$SCHEME"
        ;;
esac

unfunction __color
return $STATUS
}

function () {
    emulate -L zsh

    if [[ -s "$__NC[BASE16_CONFIG]" ]]; then
        local SCHEME=$(head -1 "$__NC[BASE16_CONFIG]")
        local BACKGROUND=$(sed -n -e '2 p' "$__NC[BASE16_CONFIG]")
        if [ "$BACKGROUND" != 'dark' -a "$BACKGROUND" != 'light' ]; then
            echo "warning: unknown background type in $__NC[BASE16_CONFIG]"
        fi
        color "$SCHEME"
    else
        # Default.
        color default-dark
    fi
}
