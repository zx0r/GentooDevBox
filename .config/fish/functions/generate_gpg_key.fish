
function generate_gpg_key
    # Generate a key with a specific expiration period:
    # generate_gpg_key "zx0r" "your@email.com" "your comments" "securepass" "2y"
    # Generate a key with the default expiration period:
    # bash
    # Copy code
    # generate_gpg_key "zx0r" "your@email.com" "your comments" "securepass"

    # 1m for one month
    # 3m for three months
    # 6m for six months
    # 1y for one year (default)
    # 2y for two years
    # 5y for five years
    # 0 for a key that never expires

    set username $argv[1]
    set email $argv[2]
    set comment $argv[3]
    set passphrase $argv[4]
    set period $argv[5]

    # Check if the period is provided; default to 1y if not
    if test -z "$period"
        set period 0
    end

    # Create the command to generate the GPG key
    echo "Generating GPG key for $username <$email> with comment: $comment and expiration: $period"

    # Run the key generation command in a subshell to capture errors
    if not gpg --batch --passphrase "$passphrase" --quick-gen-key "$username <$email>" rsa4096 "$comment" "$period"
        echo "Error: GPG key generation failed. Please check the following:"
        echo "- Ensure GnuPG is properly installed and configured."
        echo "- Check if the provided passphrase is valid."
        echo "- Verify that your username and email are formatted correctly."
        echo "- If you continue to experience issues, try running gpg in verbose mode for more details (add the '--verbose' flag)."
        return 1
    end

    echo "GPG key generation complete."
end
