function gpg_ssh_agent --description "Start and manage GPG agent"
    # Skip for root user
    test $USER = root; and return

    # Early return if gpgconf is not available
    command -q gpgconf; or return 1

    # Determine GPG directory
    set -l GPG_DIR (test -n "$GNUPGHOME"; and echo $GNUPGHOME; or echo "$HOME/.gnupg")

    # Ensure GPG directory exists with secure permissions
    if not test -d $GPG_DIR
        mkdir -p $GPG_DIR
        chmod 700 $GPG_DIR
    end

    # Set GPG environment file path
    set -l GPG_ENV "$GPG_DIR/gpg-agent.env"

    # Create or update GPG environment file with secure permissions
    if not test -f $GPG_ENV
        touch $GPG_ENV
        chmod 600 $GPG_ENV
    end

    # Source existing environment variables if the file is not empty
    test -s $GPG_ENV; and source $GPG_ENV ^/dev/null

    # Clear SSH_AUTH_SOCK
    set -e SSH_AUTH_SOCK

    # Set curses for SSH connections if active
    test -n "$SSH_CONNECTION"; and set -x PINENTRY_USER_DATA "USE_CURSES=1"

    # Set GPG and SSH environment variables
    set -gx GPG_TTY (tty)
    set -gx GPG_AGENT_INFO (gpgconf --list-dirs agent-socket)
    set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

    # Initialize GPG agent
    gpg-connect-agent updatestartuptty /bye ^/dev/null
    gpgconf --launch gpg-agent

    return 0
end

# Call the function to initialize GPG agent at startup
gpg_ssh_agent
