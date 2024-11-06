- [**Atuin**](https://docs.atuin.sh/guide/installation/) ✨ Magical shell history

#### Installation

```fish
# Use the installer,
user $ curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

# Cargo
user $ cargo install atuin

# Package Manager
root $ emerge  --ask atuin
```
##### Setting up Sync

```fish
# Register
user $ atuin register -u <YOUR_USERNAME> -e <YOUR EMAIL>

# generate an encryption key for you and store it locally
user $ atuin key
# crater ankle exact fuel toward alien trust soft potato avoid moment example detail quantum turkey fly shoulder grunt second barely mistake spot mixed option

# Import existing history
user $ atuin import (basename $SHELL)
#         Atuin
# ======================
#           🌍
#        🐘🐘🐘🐘
#           🐢
# ======================
# Importing history...
# Importing history from fish
# ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████ 14442/14442Import complete!

# Syncing will happen automatically in the background,
# NOTE Or, if you see missing data, force a full sync with: atuin sync -f
user $ atuin sync

# gen-completions
user $ atuin gen-completions --shell (basename $SHELL) --out-dir $HOME/.config/fish/completions

```

#### Install Atuin on a new machine

```fish
# Note : You will be prompted for your password, and for your key.
user $ atuin login -u <USERNAME>

# Syncing will happen automatically in the background,
# NOTE Or, if you see missing data, force a full sync with: atuin sync -f
user $ atuin sync
```

##### Configuration

```fish
# 

# {command}, {directory}, {duration}, {user}, {host} and {time}

abbr -a astats "atuin stats all"
abbi -a ainfo "atuin info"
abbr -a ahistory "atuin history list --format "{time} - {duration} - {command}""

# Installing the shell plugin
# ~/.config/fish/conf.d/atuin.fish
# Check if 'atuin' is available
if test -n (which atuin)

    # Prevent Atuin from setting default keybindings
    # Disable up arrow
    # set -gx ATUIN_NOBIND "true"

    # Initialize Atuin for Fish shell
    atuin init (basename $SHELL) | source

    # Bind Ctrl-R to Atuin search in both normal and insert modes
    for mode in default insert
        bind -M $mode \cr _atuin_search
    end
end
```

```fish

## To enable sync of shell aliases between hosts. Requires sync enabled.
## Add the new section to the bottom of your config file, for every machine you use Atuin with
## Note: you will need to have sync v2 enabled. See the above section.
## Manage aliases using the command line options
## After setting an alias, you will either need to restart your shell 
## or source the init file for the change to take affect

[sync]
records = true

[dotfiles]
enabled = true

# Alias 'k' to 'kubectl'
user $ atuin dotfiles alias set k kubectl

# List all aliases
user $ atuin dotfiles alias list

# Delete an alias
user $ atuin dotfiles alias delete k
```

##### DAemon

```fish
# https://docs.atuin.sh/reference/daemon/

# This is experimental!
#
# The Atuin daemon is a background daemon designed to
#
# Speed up database writes
# Allow machines to sync when not in use, so they’re ready to go right away
# Perform background maintenance
# It may also work around issues with ZFS/SQLite performance.
#
# It’s currently experimental, but is safe to use with a little bit of setup
#

root $ chown -R $USER:$USER $HOME/.local/share/atuin
user $ atuin daemon

# ~/.config/atuin/config.toml
## Enable the background daemon
## Add the new section to the bottom of your config file
[daemon]
enabled = false
tcp_port = 8889
sync_frequency = 300
systemd_socket = false
socket_path = "$HOME/.local/share/atuin/atuin.sock"
# socket_path = "/run/user/1000/atuin.sock"

user $ atuin daemon
# Error: failed to connect to local atuin daemon. Is it running?
```

##### Server setup

```fish
#https://docs.atuin.sh/self-hosting/server-setup/

user $ atuin server start
# ~/.config/atuin/server.toml.
[server]
host = "0.0.0.0"
port = 8888
open_registration = true
db_uri="postgres://user:password@hostname/database"

[tls]
enable = true
cert_path = "/path/to/letsencrypt/live/fully.qualified.domain/fullchain.pem"
pkey_path = "/path/to/letsencrypt/live/fully.qualified.domain/privkey.pem"

# Alternatively, configuration can also be provided with environment variables.
ATUIN_HOST="0.0.0.0"
ATUIN_PORT=8888
ATUIN_OPEN_REGISTRATION=true
ATUIN_DB_URI="postgres://user:password@hostname/database"

```

##### Docker

```fish
# https://docs.atuin.sh/self-hosting/docker/
# https://docs.atuin.sh/self-hosting/kubernetes/
```

##### Sytemd

```fish
# https://docs.atuin.sh/self-hosting/systemd/

# /etc/systemd/system/atuin-server.service
[Unit]
Description=Start the Atuin server syncing service
After=network-online.target
Wants=network-online.target systemd-networkd-wait-online.service

[Service]
ExecStart=atuin server start
Restart=on-failure
User=atuin
Group=atuin

Environment=ATUIN_CONFIG_DIR=/etc/atuin
ReadWritePaths=/etc/atuin

# Hardening options
CapabilityBoundingSet=
AmbientCapabilities=
NoNewPrivileges=true
ProtectHome=true
ProtectSystem=strict
ProtectKernelTunables=true
ProtectKernelModules=true
ProtectControlGroups=true
PrivateTmp=true
PrivateDevices=true
LockPersonality=true

[Install]
WantedBy=multi-user.target

# /etc/sysusers.d/atuin-server.conf
u atuin - "Atuin synchronized shell history"

# Now, you can attempt to run the Atuin server:
root $ systemctl enable --now atuin-server
root $ systemctl status atuin-server

# NOTE If it started fine, it should have created the default config inside /etc/atuin/.
```
