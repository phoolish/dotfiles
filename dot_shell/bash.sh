# Remove error noise
bind 'set bell-style none'

# Remove zsh default prompt
export BASH_SILENCE_DEPRECATION_WARNING=1

# Initialize Starship prompt
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi