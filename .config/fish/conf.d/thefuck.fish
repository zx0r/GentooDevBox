# ~/.config/fish/conf.d/thefuck.fish

# Initialize 'thefuck' alias for Fish shell https://github.com/nvbn/thefuck
if test -x (which thefuck)
    thefuck --alias | source
end
