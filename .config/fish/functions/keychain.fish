function keychain_ssh_gpg --description 'Manage SSH and GPG keys with keychain'

    # Initialize Keychain
    # https://superuser.com/questions/1727591/how-to-run-ssh-agent-in-fish-shell
    # https://wiki.archlinux.org/title/SSH_keys

    # How to run ssh-agent in fish shell?
    # However, I would recommend the use of keychain for simplifying ssh-agent use in Fish (and other shells). 
    # Ignore the part of the webpage that says (as @Charliesneath points out in the comments), 
    # "Currently, keychain is not compatible with Fish shell." The webpage just hasn't been updated in a while.

    # Clean integration of GPG and SSH agents
    # Automatic key timeout for security
    # Minimal console output
    # Fast execution
    # Handles all your private keys automatically

    # An alternative to keychain is envoy. Envoy is available as envoy in the official repositories, or the Git version is in the AUR as envoy-git.
    # After installing it, set up the envoy socket with
    # systemctl enable envoy@ssh-agent.socket
    # And add to your shell's rc file:
    # envoy -t ssh-agent -a ssh_key
    # source <(envoy -p)

    if test -x (which keychain)

        # Define keychain directory and current shell
        set -l KEYCHAIN_DIR "$HOME/.keychain"
        set -l CURRENT_SHELL (basename $SHELL)

        # Get all private SSH keys using fd
        set -l SSH_KEYS (fd '^id_' $HOME/.ssh --type f --exclude '*.pub')

        # Start keychain for both GPG and SSH
        # keychain --eval --quiet --agents gpg,ssh $SSH_KEYS | source
        set -l keychain_cmd "keychain  --dir $KEYCHAIN_DIR --absolute --agents gpg,ssh --eval --timeout 480"
        # set -l keychain_cmd "keychain --dir $KEYCHAIN_DIR --absolute --agents gpg,ssh --eval --attempts 3 --confirm --confhost -Q --quiet --timeout 480"

        if test -n "$SSH_KEYS"
            # Include SSH and GPG keys in the keychain command
            for key in $SSH_KEYS
                set keychain_cmd "$keychain_cmd $key"
            end
            # Execute the keychain command with restart handling
            if not eval $keychain_cmd | source
                echo "Restarting ssh-agent" # Notify if restarting
                keychain -k # Kill any existing agents
                eval $keychain_cmd | source # Restart the keychain
            end
        end

        # Source the keychain environment files
        source $KEYCHAIN_DIR/$HOSTNAME-$CURRENT_SHELL
        source $KEYCHAIN_DIR/$HOSTNAME-$CURRENT_SHELL-gpg
    end
end

# Call the function to initialize at startup
keychain_ssh_gpg
