function conda -d 'lazy initialize conda'
    functions --erase conda
    eval (which conda) "shell.fish" hook | source

    # don't add the conda prompt. This is done by starship
    function __conda_add_prompt
    end

    # There's some opportunity to use `psub` but I don't really understand it.
    conda $argv
end
