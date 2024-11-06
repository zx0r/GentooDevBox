## Git for Gentoo Linux with Fish Shell

- [Gentoo Git Guide](https://wiki.gentoo.org/wiki/Git)
- [GitHub Hub](https://hub.github.com/)
- [Lazygit](https://github.com/jesseduffield/lazygit)

## installation

```fish
# Git USE Flags Reference
echo 'dev-vcs/git blksha1 curl gpg iconv nls pcre perl safe-directory webdav doc highlight keyring selinux test tk' >> /etc/portage/package.use/git

# Install git
root $ emerge --sync
root $ emerge --ask dev-vcs/git dev-vcs/hub github-cli
```

```fish
#The guru overlay is a community-driven overlay with a variety of packages contributed by Gentoo users
root $ emerge --ask app-eselect/eselect-repository
root $ eselect repository enable guru
root $ emaint sync -r guru
root $ emerge --sync

# Install packages
root $ emerge --ask dev-vcs/tig
root $ emerge --ask dev-vcs/lazygit
root $ emerge --ask dev-vcs/gitui
root $ emerge --ask dev-vcs/git-flow
root $ emerge --ask dev-vcs/git-lfs
root $ emerge --ask dev-vcs/git-crypt
root $ emerge --ask dev-util/git-delta
user $ go install github.com/x-motemen/ghq@latest
user $ cargo install --git https://github.com/orhun/git-cliff
user $ git clone https://github.com/bigH/git-fuzzy.git
# add the executable to your path
user $ echo "set -x PATH (pwd)\"/git-fuzzy/bin:\$PATH\"" >> ~/.config/fish/config.fish
user $ git lfs install --skip-repo
```

## Fish Shell Integration

```fish
# *** Only Fish shell Direct completion installation ***
user $ curl -sL https://raw.githubusercontent.com/fish-shell/fish-shell/3.7.1/share/completions/git.fish > ~/.config/fish/completions/git.fish
user $ fish_update_completions

# (Optional): Git aliases plugin for the Fish shell (similar to oh-my-zsh git)
user $ curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
user $ fisher install jhillyerd/plugin-git
```

## Configuration

```fish
#==============================================================
#Generating public/private ALGORITHM key pair.
#==============================================================

#  Enter a file in which to save the key (/home/YOU/.ssh/id_ALGORITHM):[Press enter]
#  Enter passphrase (empty for no passphrase): [Type a passphrase]
#  Enter same passphrase again: [Type passphrase again]
user $ ssh-keygen -t ed25519 -C "your_email@example.com"

# Start the ssh-agent in the background.
user $ eval "$(ssh-agent -s)"

# Add your SSH private key to the ssh-agent.
user $ ssh-add ~/.ssh/id_ed25519
user $ ssh-add -l

# vi $HOME/.ssh/config
# Add the following lines to the file:

# GitHub settings
Host github.com
    HostName github.com
    User git
    AddKeysToAgent yes # ssh-agent
    IdentityFile ~/.ssh/id_ed25519

# go to https://github.com/settings/keys and paste
user $ cat ~/.ssh/id_ed25519 | wl-copy # Use pbcopy or xclip or xsel on Linux

# Finally, test Your SSH Connection
user $ ssh -T git@github.com

#Enter passphrase for key '~/.ssh/id_ed25519':
#Hi zx0r! You've successfully authenticated, but GitHub does not provide shell access.

# Troubleshooting Tips
# Ensure Correct Permissions: Make sure the permissions for your SSH files are set correctly. SSH keys should have restricted permissions:
user $ chmod 600 ~/.ssh/id_ed25519
user $ chmod 644 ~/.ssh/id_ed25519


#==============================================================
# Set your identity
#==============================================================

user $ git config --global user.name "Larry the cow"
user $ git config --global user.email "larry@gentoo.org"

# Privacy option - blank email
user $ git config --global user.email "<>"

# Create GitHub repository --remote=https (GitHub CLI)
user $ gh repo create "my-project" --confirm --public --remote=https --description "🕊 Hello World"
user $ git remote add origin https://github.com/zx0r/my-project.git
user $ git remote -v

# Create GitHub repository --remote=ssh (GitHub CLI)
user $ gh repo create "my-project" --confirm --public --remote=ssh --description "🕊 Hello World"
user $ git remote add origin git@github.com:zx0r/my-project.git
user $ git remote -v

# Create project directory
user $ cd $HOME
user $ mkdir my-project && cd my-project

# Create initial content
user $ touch README.md
user $ echo "Hello, world!" >> README.md

# Initialize and commit
user $ git init
user $ git add $HOME/my-project/README.md # ... add other files
user $ git commit -m "Initial commit: Added README.md"
user $ git push -u origin main
```

## Command Line Tools

Each tool enhances your Git workflow in unique ways, from GUI interfaces to specialized management tools. The linked documentation provides detailed usage instructions and best practices.

<summary>🔧 Git Ecosystem</summary>

- [**_Git_**](https://wiki.gentoo.org/wiki/Git) - Version Control Foundation
- [**_Hub_**](https://github.com/github/hub) - GitHub Integration
- [**_GitHub CLI_**](https://cli.github.com) - Official GitHub Workflow
- [**_LazyGit_**](https://github.com/jesseduffield/lazygit) - Interactive TUI
- [**_GitUI_**](https://github.com/extrawurst/gitui) - Blazing Fast Rust TUI
- [**_Tig_**](https://github.com/jonas/tig) - Text-based Interface
- [**_Git LFS_**](https://wiki.gentoo.org/wiki/Git-lfs) - Large File Management
- [**_Git Flow_**](https://github.com/nvie/gitflow) - Advanced Branching
- [**_Git Crypt_**](https://www.agwa.name/projects/git-crypt) - File Encryption
- [**_Delta_**](https://github.com/dandavison/delta) - Beautiful Diffs
- [**_Git Cliff_**](https://github.com/orhun/git-cliff) - Changelog Generation
- [**_Git Cola_**](https://git-cola.github.io) - Modern Qt GUI
- [**_Gitg_**](https://wiki.gnome.org/Apps/Gitg) - GTK Interface
- [**_QGit_**](https://github.com/tibirna/qgit) - Lightweight Qt UI
- [**_GHQ_**](https://github.com/x-motemen/ghq) - Repository Organization
- [**_Fugitive_**](https://github.com/tpope/vim-fugitive) - Vim Git Integration
- [**_Git Fuzzy_**](https://github.com/bigH/git-fuzzy) - Fuzzy Finder
