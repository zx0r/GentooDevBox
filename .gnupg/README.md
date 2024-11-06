# GPG Configuration for Fish Shell

This repository contains configuration snippets for using GPG (GNU Privacy Guard) with Git and other applications. The following commands and configurations enable you to manage your GPG keys and use them for signing Git commits and tags.

## Quick Links

- WiKi Archlinux: [GnuPG](https://wiki.archlinux.org/title/GnuPG)
- WiKi Gentoo: [GnuPG](https://wiki.gentoo.org/wiki/GnuPG)
- GPG Documentation: [GnuPG](https://www.gnupg.org/documentation/)
- Git Documentation on Signing Commits: [GnuPG](https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work)
- GPG Cheat Sheet: [GnuPG-Cheat-Sheet](https://gock.net/blog/2020/gpg-cheat-sheet)
- GitHub GPG Key Settings: [Add GPG Key](https://github.com/settings/gpg/new)

## Setup GPG Keys

Generate a new GPG key pair:

```fish

# Step 1. Install gnupg
root $ emerge --ask app-crypt/gnupg
root $ emerge --ask net-misc/keychain


# Pinentry
root $ eselect pinentry list

# Available pinentry binary implementations:
#   [1]   pinentry-gnome3
#   [2]   pinentry-qt5
#   [3]   pinentry-qt6
#   [4]   pinentry-curses *
#   [5]   pinentry-tty
```

```fish
# $HOME/.config/fish/functions/start_keychayn.fish
function start_keychain --description 'Manage SSH and GPG keys with keychain'

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

    if test -x (which keychain)

        # Define keychain directory and current shell
        set -l KEYCHAIN_DIR "$HOME/.keychain"
        set -l CURRENT_SHELL (basename $SHELL)

        # Get all private SSH keys using fd
        set -l SSH_KEYS (fd '^id_' $HOME/.ssh --type f --exclude '*.pub')

        # Start keychain for both GPG and SSH
        # keychain --eval --quiet --agents gpg,ssh $SSH_KEYS | source
        set -l keychain_cmd "keychain --eval --absolute --agents gpg,ssh --timeout 480 --dir $KEYCHAIN_DIR"
        #set -l keychain_cmd "keychain --eval --absolute --agents gpg,ssh --attempts 3 --confirm --confhost -Q --quiet --timeout 480 --dir $KEYCHAIN_DIR"

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

        source $KEYCHAIN_DIR/$HOSTNAME-$CURRENT_SHELL
        source $KEYCHAIN_DIR/$HOSTNAME-$CURRENT_SHELL-gpg
    end
end

# Call the function to initialize at startup
start_keychain
```

```fish

# Configure your SSH client to automatically add keys to the SSH agent
# $HOME/.ssh/config
Host *
     AddKeysToAgent yes
    # UseKeychain yes  # Optional: This is useful on macOS to use the keychain.

# $HOME/.config/fish/functions/ssh_agent.fish
function ssh_agent --description "Start and manage SSH agent"
    set -l SSH_ENV "$HOME/.ssh/ssh-agent.env"

    # Check if the SSH agent environment file exists
    if test -f $SSH_ENV; and test -z "$SSH_AGENT_PID"
        source $SSH_ENV >/dev/null
    end

    # If the SSH agent is not running, start it
    if test -z "$SSH_AGENT_PID"
        eval (ssh-agent -c) >$SSH_ENV
        chmod 600 $SSH_ENV
        echo "SSH agent started."
    else
        echo "Using existing SSH agent."
    end

    # Add SSH keys
    set -l SSH_KEYS (fd '^id_' $HOME/.ssh --type f --exclude '*.pub')
    for KEY in $SSH_KEYS
        ssh-add $KEY
    end
end

# Automatically start the ssh-agent on shell initialization
ssh_agent


# https://github.com/ivakyb/fish_ssh_agent
#
# function ssh_agent_is_started -d "check if ssh agent is already started"
#     if begin
#             test -f $SSH_ENV; and test -z "$SSH_AGENT_PID"
#         end
#         source $SSH_ENV >/dev/null
#     end
#
#     if test -z "$SSH_AGENT_PID"
#         return 1
#     end
#
#     ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep -q ssh-agent
#     return $status
# end
#
# function ssh_agent_start -d "start a new ssh agent"
#     ssh-agent -c | sed 's/^echo/#echo/' >$SSH_ENV
#     chmod 600 $SSH_ENV
#     source $SSH_ENV >/dev/null
#     true # suppress errors from setenv, i.e. set -gx
# end
#
# function fish_ssh_agent --description "Start ssh-agent if not started yet, or uses already started ssh-agent."
#     if test -z "$SSH_ENV"
#         set -xg SSH_ENV $HOME/.ssh/ssh-agent.env
#     end
#
#     if not ssh_agent_is_started
#         ssh_agent_start
#     end
# end

# Automatically start the ssh-agent on shell initialization
# fish_ssh_agent
```

```fish
# $HOME/.config/fish/functions/gpg_ssh_agent.fish
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
```

```fish
# Step 2. Configured $GNUPGHOME/gpg.conf

# ┌───────────────────────────────────────────────────────────────────────────┐
# │ Setting defaults                                                          │
# └───────────────────────────────────────────────────────────────────────────┘

# Default/trusted key ID to use (helpful with throw-keyids)
# $ gpg --list-secret-keys --with-keygrip --with-colons | grep '^sec:' | awk -F: '{print $5}'
default-key C09B8EB5F2E92680

# Automatically encrypt replies to encrypted messages to yourself as well
default-recipient-self

# UTF-8 support for compatibility
charset utf-8

# when outputting certificates, view user IDs distinctly from keys:
fixed-list-mode

# Use the GPG agent for passphrase caching
use-agent

# Disable recipient key ID in messages
throw-keyids

# default-preference-list SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed
armor

# include an unambiguous indicator of which key made a signature:
# (see http://thread.gmane.org/gmane.mail.notmuch.general/3721/focus=7234)
# (and http://www.ietf.org/mail-archive/web/openpgp/current/msg00405.html)
# sig-notation issuer-fpr@notations.openpgp.fifthhorseman.net=%g

# ┌───────────────────────────────────────────────────────────────────────────┐
# │ Algorithms & Ciphers                                                      │
# └───────────────────────────────────────────────────────────────────────────┘

# SHA512 as digest to sign keys
cert-digest-algo SHA512

# SHA512 as digest for symmetric ops
s2k-digest-algo SHA512

# AES256 as cipher for symmetric ops
s2k-cipher-algo AES256

# Set default key generation algorithm to RSA with 4096-bit length [strong protection]
default-new-key-algo rsa4096

# Use AES256, 192, or 128 as cipher
personal-cipher-preferences AES256 AES192 AES

# Use SHA512, 384, or 256 as digest
personal-digest-preferences SHA512 SHA384 SHA256

# Use ZLIB, BZIP2, ZIP, or no compression
personal-compress-preferences ZLIB BZIP2 ZIP Uncompressed

# Default preferences for new keys
default-preference-list SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed

# ┌───────────────────────────────────────────────────────────────────────────┐
# │ Behavior of GnuPG                                                         │
# └───────────────────────────────────────────────────────────────────────────┘

# Repair legacy PGP subkey bug during import
import-options repair-pks-subkey-bug

# Remove all signatures from imported keys that are not usable
import-options import-clean

# Remove all non-exportable signatures during export
export-options export-clean

# Display Options
# Show validity of user IDs during key listings
list-options show-uid-validity

# Show validity of user IDs during signature verification
verify-options show-uid-validity

# Show Unix timestamps
fixed-list-mode

# Disable caching of passphrase for symmetrical ops
no-symkey-cache

# Disable banner Interface Options
no-greeting

# No comments on signatures
no-comments

# No version in signatures
no-emit-version

# Show unix timestamps
fixed-list-mode

# Long hexadecimal key format
keyid-format 0xlong

# Display fingerprint
with-fingerprint

# Disable caching of passphrasae for symmetrical encryption
no-symkey-cache

# Disable recipient key ID in messages
# throw-keyids
trust-model always

# Skip time conflict warnings during signature verification
# This is useful when system clock differences might cause issues
ignore-time-conflict

# Ensure cross-certification on signing subkeys
# This enhances security by requiring signatures between primary and subkeys
require-cross-certification

# Commented out: Allow non-standard UIDs during key generation
# Enabling this would allow creation of UIDs without email addresses
# allow-freeform-uid

# Display all keys and their fingerprints
with-fingerprint

# Display key origins and updates
#with-key-origin

# Cross-certify subkeys are present and valid
require-cross-certification

# no-tty
# pinentry-mode loopback

# ┌───────────────────────────────────────────────────────────────────────────┐
# │ Keyring & Keyserver                                                       │
# └───────────────────────────────────────────────────────────────────────────┘

# Disable the use of the default public and secret keyrings
# This allows explicit specification of which keyrings to use
no-default-keyring

# Keyring Options
# Specify the primary public keyring
# keyring           ~/.gnupg/pubring.kbx
# trustdb-name      ~/.gnupg/trustdb.gpg
# primary-keyring   ~/.gnupg/pubring.kbx

# Automatically retrieve missing keys from keyserver when verifying signatures
# This makes signature verification more seamless by fetching required keys
auto-key-retrieve

# Keyserver Options
# Don't add additional comments in downloaded certificates
keyserver-options no-include-attributes

# Honor the preferred keyserver URL from the key
keyserver-options honor-keyserver-url

# Do not include key signatures from keyserver responses
keyserver-options no-include-revoked

# Include subkeys when downloading keys from keyserver
keyserver-options include-subkeys

# Automatically fetch keys from keyserver when verifying signatures
keyserver-options auto-key-retrieve

# Include revoked keys in search results
keyserver-options include-revoked

# Number of seconds to wait for a keyserver response
keyserver-options timeout=10

# Default keyserver to use
keyserver hkps://keys.openpgp.org
keyserver hkp://zkaan2xfbuxia2wpf7ofnkbz6r5zdbbvxbunvp5g2iebopbfc4iqmbad.onion

# keyserver hkp://pgp.mit.edu
# keyserver hkp://pool.sks-keyservers.net
# keyserver hkp://keys.gnupg.net
# keyserver hkps://keyserver.ubuntu.com
# keyserver hkps://pgp.mit.edu
# keyserver hkp://keyoxide.org
# keyserver hkp://na.pool.sks-keyservers.net
# keyserver https://sks-keyservers.net/status/
# keyserver hkp://keyserver.ubuntu.com
# keyserver hkp://keybase.io
# keyserver hkp://keyserver.undergrid.net
# keyserver hkp://keyring.debian.org
# keyserver hkp://hkps.pool.sks-keyservers.net

# Define a keygroup named 'purse_keygroup'
# This allows you to refer to multiple keys as a single group
# group purse_keygroup = 0xFF123456 0xABCDEF01 0x12345678
```

```fish
# Configured $GNUPGHOME/gpg-agent.conf

# https://github.com/drduh/config/blob/master/gpg-agent.conf
# https://www.gnupg.org/documentation/manuals/gnupg/Agent-Options.html

# How to add your GPG Public Key to GitHub
# Go to your GitHub Profile (https://github.com/settings/profile)
# Go to the SSH and GPG Keys (https://github.com/settings/keys)
# Add GPG Key (https://github.com/settings/gpg/new)
# Paste the output of gpg-pubkey into the form
# How to cache the Passphrase longer
# If you'd like the passphrase to be cached until your login session ends, just set it to 400 days and call it good.
#
# ~/.gnupg/gpg-agent.conf:
# default-cache-ttl 34560000
# max-cache-ttl 34560000

# pinentry-program /usr/bin/pinentry-gnome3
# pinentry-program /usr/bin/pinentry-tty
# pinentry-program /usr/bin/pinentry-x11
# pinentry-program /usr/local/bin/pinentry-curses
# pinentry-program /usr/local/bin/pinentry-mac
# pinentry-program /opt/homebrew/bin/pinentry-mac
# pinentry-program /usr/bin/pinentry
pinentry-program /usr/bin/pinentry-curses

ttyname $GPG_TTY
default-cache-ttl 60
max-cache-ttl 120

# SSH support
enable-ssh-support
write-env-file ~/.gnupg/gpg-agent.env
# no-grab
```

```fish
# (Optional) Default PATH $HOME/.gnupg
user $ set -gx GNUPGHOME "$XDG_CONFIG_HOME/gnupg"

# Default PATH $HOME/.gnupg
user $ sudo chown -R $USER:$USER $GNUPGHOME
user $ chmod 700 $GNUPGHOME && find $GNUPGHOME -type f -exec chmod 600 {} \; && find $GNUPGHOME -type d -exec chmod 700 {} \;


# Step 3. Generate a new GPG key pair

# Check gpg
user $ type gpg

# Generate a new GPG key pair
user $ gpg --full-generate-key

# Step 4.

# Set GPG program for Git
#user $ git config --global gpg.format ssh
user $ git config --global gpg.program (which gpg)
user $ git config --global user.signingkey (gpg --list-secret-keys --with-keygrip --with-colons | grep '^sec:' | awk -F: '{print $5}')
user $ git config --global log.showSignature "true"
user $ git config --global commit.gpgsign "true"

# Step 5. Export the GPG public key to clipboard

# go to https://github.com/settings/gpg/new"
# Copy and paste the key above from the first ---- to the last ----"
# Use xclip or wl-copy
user $ gpg --armor --export (gpg --list-secret-keys --with-keygrip --with-colons | grep '^sec:' | awk -F: '{print $5}') | wl-copy)


- Telling Git about your signing key:[Sign commits locally](https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key)

# > [!WARNING]
user $ git config --global --unset gpg.format
user $ set -gx GPG_TTY (tty)
# USER $ [ -f ~/.bashrc ] && echo -e '\nexport GPG_TTY=$(tty)' >> ~/.bashrc


# https://docs.github.com/en/authentication/managing-commit-signature-verification/associating-an-email-with-your-gpg-key
user $ gpg --edit-key (gpg --list-secret-keys --with-keygrip --with-colons | grep '^sec:' | awk -F: '{print $5}')

#Enter gpg> adduid to add the user ID details.
user $ gpg> adduid

# Real Name: OCTOCAT
# Email address: "octocat@github.com"
# Comment: GITHUB-KEY
# Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit?

# Save
user $ gpg> save

# Add to github repository
user $  gpg --armor --export (gpg --list-secret-keys --with-keygrip --with-colons | grep '^sec:' | awk -F: '{print $5}')

# To send the keys to the openpgp keyserver:
user $ gpg --keyserver keys.openpgp.org --send-key (gpg --list-secret-keys --with-keygrip --with-colons | grep '^sec:' | awk -F: '{print $5}')

# Getting keys from key servers
#user $ gpg --keyserver keys.openpgp.org --search-keys larry@gentoo.org
#user $ gpg --keyserver hkps://keys.gentoo.org --refresh-keys

# Using a PGP key for SSH authentication
#gpg --list-keys --with-keygrip C09B8EB5F2E92680 | awk '/Keygrip/ {print $3}
gpg --list-keys --with-keygrip | awk '/^sub/{p=1;next} /Keygrip/{if(p){print $3;p=0}}'

user $ vi $GNUPGHOME/sshcontrol
1531C8084D16DC4C36911F1585AF0ACE7AAFD7E7


```
