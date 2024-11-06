# Check if 'atuin' is available
if test -n (which atuin)

    # Prevent Atuin from setting default keybindings
    # set -gx ATUIN_NOBIND true

    # Initialize Atuin for Fish shell
    atuin init fish | source

    # Bind Ctrl-R to Atuin search in both normal and insert modes
    for mode in default insert
        bind -M $mode \cr _atuin_search
    end
end
