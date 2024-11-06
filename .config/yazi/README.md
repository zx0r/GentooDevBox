### 📚 File Management

<!-- # https://github.com/sxyazi/yazi/blob/shipped/yazi-config/preset/yazi.toml -->

- [**_Yazi_**](https://yazi-rs.github.io/docs/installation) - TUI File Managmer 🦀

###### 📦 Yazi Plugins

<details>
<summary>📦 Previewers</summary>

<details>
<summary>
<a href="https://gitee.com/DreamMaoMao/epub.yazi">epub.yazi</a> - Plugin for Yazi to preview epub file</a>.
</summary>

```bash

git clone https://github.com/DreamMaoMao/epub.yazi.git $HOME/.config/yazi/plugins/epub.yazi

[plugin]
prepend_previewers = [
  { name = "*.epub", run = "epub" },
]

prepend_preloaders= [
  { name = "*.epub", run = "epub" },
]
```

</details>

<details>
<summary>
<a href="https://github.com/Sonico98/exifaudio.yazi">exifaudio.yazi</a> - Preview audio metadata and cover using <a href="https://exiftool.org/">exiftool</a>.
</summary>

```bash
ya pack -a Sonico98/exifaudio
```

</details>

<details>
<summary>
<a href="https://github.com/sharklasers996/eza-preview.yazi">eza-preview.yazi</a> - Preview audio metadata and cover using <a href="https://exiftool.org/">exiftool</a>.
</summary>

```bash
ya pack -a sharklasers996/eza-preview
```

</details>

<details>
<summary>
<a href="https://github.com/Reledia/glow.yazi">glow.yazi</a> - Preview markdown files using <a href="https://github.com/charmbracelet/glow">glow</a>.
</summary>

```bash
ya pack -a Reledia/glow
```

</details>

<details>
<summary>
<a href="https://github.com/Reledia/hexyl.yazi">hexyl.yazi</a> - Using <a href="https://github.com/sharkdp/hexyl">hexyl</a> as the fallback previewer for files.
</summary>

```bash
ya pack -a Reledia/hexyl
```

</details>

<details>
<summary>
<a href="https://github.com/yazi-rs/plugins/tree/main/lsar.yazi">lsar.yazi</a> - Previewing archive contents with lsar.
</summary>

```bash
ya pack -a yazi-rs/plugins:lsar
```

</details>

<details>
<summary>
<a href="https://github.com/GrzegorzKozub/mdcat.yazi">mdcat.yazi</a> - Preview markdown files using <a href="https://github.com/swsnr/mdcat">mdcat</a>.
</summary>

```bash
ya pack -a GrzegorzKozub/mdcat
```

</details>

<details>
<summary>
<a href="https://github.com/Ape/mediainfo.yazi">mediainfo.yazi</a> - Preview files using 'ffmpegthumbnailer' and 'mediainfo'
</summary>

```bash
ya pack -a Ape/mediainfo
```

</details>

<details>
<summary>
<a href="https://github.com/Reledia/miller.yazi">miller.yazi</a> - Preview CSV files (and other supported formats) using <a href="https://github.com/johnkerl/miller">miller</a>.
</summary>

```bash
ya pack -a Reledia/miller
```

</details>

<details>
<summary>
<a href="https://github.com/AnirudhG07/nbpreview.yazi">nbpreview.yazi</a> - Preview jupyter notebooks (\*.ipynb) files using <a href="https://github.com/paw-lu/nbpreview">nbpreview</a>.
</summary>

```bash
ya pack -a AnirudhG07/nbpreview
```

</details>

<details>
<summary>
<a href="https://github.com/ndtoan96/ouch.yazi">ouch.yazi</a> - An archive previewer plugin for Yazi, using <a href="https://github.com/ouch-org/ouch">ouch</a>.
</summary>

```bash
ya pack -a ndtoan96/ouch
```

</details>

<details>
<summary>
<a href="https://github.com/AnirudhG07/rich-preview.yazi">rich-preview.yazi</a> - Preview Markdown, JSON, CSV, etc. using <a href="https://github.com/textualize/rich-cli">rich-cli</a>.
</summary>

```bash
ya pack -a AnirudhG07/rich-preview
```

</details>

<details>
<summary>
<a href="https://github.com/kirasok/torrent-preview.yazi">torrent-preview.yazi</a> - Preview "\*.torrent" files using <a href="https://github.com/transmission/transmission">transmission-cli</a>.
</summary>

```bash
ya pack -a kirasok/torrent-preview
```

</details>

<details>
<summary>
<a href="https://github.com/Tyarel8/video-ffmpeg.yazi">video-ffmpeg.yazi</a> - Preview video files using <a href="https://ffmpeg.org/">ffmpeg</a> directly instead of 
<a href="https://github.com/dirkvdb/ffmpegthumbnailer">ffmpegthumbnailer</a>.
</summary>

```bash
ya pack -a Tyarel8/video-ffmpeg
```

</details>
</details>

<details>
<summary>📦 Jumping</summary>

<details>
<summary>
<a href="https://gitee.com/DreamMaoMao/easyjump.yazi">easyjump.yazi</a> - Jump to files with a press of one or two keys for Yazi.
</summary>

```bash
# Linux
git clone https://gitee.com/DreamMaoMao/easyjump.yazi.git ~/.config/yazi/plugins/easyjump.yazi

# Windows, with Powershell

if (!(Test-Path $env:APPDATA\yazi\config\plugins\)) {mkdir $env:APPDATA\yazi\config\plugins\}
git clone https://gitee.com/DreamMaoMao/easyjump.yazi.git $env:APPDATA\yazi\config\plugins\easyjump.yazi

```

</details>

<details>
<summary>
<a href="https://gitee.com/DreamMaoMao/fg.yazi">fg.yazi</a> - A Yazi plugin that supports file searching with an fzf preview.
</summary>

```bash
# Linux
git clone https://github.com/DreamMaoMao/fg.yazi.git ~/.config/yazi/plugins/fg.yazi
```

</details>

<details>
<summary>
<a href="https://github.com/lpanebr/yazi-plugins/tree/main/first-non-directory.yazi">first-non-directory.yazi</a> - Allows easy jumping to the first file ignoring directories.
</summary>

```bash
ya pack -a lpanebr/yazi-plugins:first-non-directory
```

</details>

<details>
<summary>
<a href="https://github.com/yazi-rs/plugins/tree/main/jump-to-char.yazi">jump-to-char.yazi</a> - Vim-like `f<char>`, jump to the next file whose name starts with `<char>`.
</summary>

```bash
ya pack -a yazi-rs/plugins:jump-to-char
```

</details>

<details>
<summary>
<a href="https://github.com/dedukun/relative-motions.yazi">relative-motions.yazi</a> - A Yazi plugin based on vim motions.
</summary>

```bash
ya pack -a dedukun/relative-motions
```

</details>

<details>
<summary>
<a href="https://gitee.com/DreamMaoMao/searchjump.yazi">searchjump.yazi</a> - A Yazi plugin which the behavior consistent with flash.nvim in Neovim, allow search str to generate lable to jump.support chinese pinyin search,regular expression search.
</summary>

```bash
# Linux
git clone https://gitee.com/DreamMaoMao/searchjump.yazi.git ~/.config/yazi/plugins/searchjump.yazi

# Windows, with Powershell

if (!(Test-Path $env:APPDATA\yazi\config\plugins\)) {mkdir $env:APPDATA\yazi\config\plugins\}
git clone https://gitee.com/DreamMaoMao/searchjump.yazi.git $env:APPDATA\yazi\config\plugins\searchjump.yazi

```

</details>
</details>

<details>
<summary>📦 Bookmarks</summary>

<details>
<summary>
<a href="https://gitee.com/DreamMaoMao/bookmarks.yazi">DreamMaoMao/bookmarks.yazi</a> - A Yazi plugin that Supports persistent bookmark management.No bookmarks are lost after you close yazi.
</summary>

```bash
# Linux/macOS
git clone https://gitee.com/DreamMaoMao/bookmarks.yazi.git ~/.config/yazi/plugins/bookmarks.yazi

# Windows

git clone https://gitee.com/DreamMaoMao/bookmarks.yazi.git $env:APPDATA\yazi\config\plugins\bookmarks.yazi

```

</details>

<details>
<summary>
<a href="https://github.com/dedukun/bookmarks.yazi">dedukun/bookmarks.yazi</a> - A Yazi plugin that adds the basic functionality of Vi-like marks.
</summary>

```bash
ya pack -a dedukun/bookmarks
```

</details>

<details>
<summary>
<a href="https://github.com/MasouShizuka/projects.yazi">projects.yazi</a> - A Yazi plugin that adds the functionality to save and load projects.
</summary>

```bash
ya pack -a MasouShizuka/projects
```

</details>

<details>
<summary>
<a href="https://github.com/h-hg/yamb.yazi">yamb.yazi</a> - Yet another bookmarks plugin. It supports persistence, jumping by a key, and jumping by <a href="https://github.com/junegunn/fzf">fzf</a>.
</summary>

```bash
ya pack -a h-hg/yamb
```

</details>
</details>

<details>    
<summary>📦 File Actions</summary>

<details>
<summary>
<a href="https://github.com/KKV9/archive.yazi">archive.yazi</a> - Compress selected or hovered files and directories to an archive. It currently supports various archive formats.
</summary>

```bash
ya pack -a KKV9/archive
```

</details>

<details>
<summary>
<a href="https://github.com/AnirudhG07/archivemount.yazi">archivemount.yazi</a> - Mounting and unmounting archives in yazi using <a href="https://github.com/cybernoid/archivemount">archivemount</a>.
</summary>

```bash
ya pack -a AnirudhG07/archivemount
```

</details>

<details>
<summary>
<a href="https://github.com/yazi-rs/plugins/tree/main/chmod.yazi">chmod.yazi</a> - Execute `chmod` on the selected files to change their mode.
</summary>

```bash
ya pack -a yazi-rs/plugins:chmod
```

</details>

<details>
<summary>
<a href="https://github.com/yazi-rs/plugins/tree/main/diff.yazi">diff.yazi</a> - Diff the selected file with the hovered file, create a living patch, and copy it to the clipboard.
</summary>

```bash
ya pack -a yazi-rs/plugins:diff
```

</details>

<details>
<summary>
<a href="https://github.com/BBOOXX/file-actions.yazi">file-actions.yazi</a> - A Yazi plugin that allows users to perform actions on selected files using custom scripts.
</summary>

```bash
ya pack -a BBOOXX/file-actions
```

</details>

<details>
<summary>
<a href="https://github.com/dawsers/fuse-archive.yazi">fuse-archive.yazi</a> - Transparently mount and unmount archives in read-only mode while navigating in Yazi.
</summary>

```bash
ya pack -a dawsers/fuse-archive
```

</details>

<details>
<summary>
<a href="https://github.com/Lil-Dank/lazygit.yazi">lazygit.yazi</a> - Manage Git directories with <a href="https://github.com/jesseduffield/lazygit">lazygit</a> through a quick shortcut.
</summary>

```bash
ya pack -a Lil-Dank/lazygit
```

</details>

<details>
<summary>
<a href="https://github.com/Sonico98/mkdir.yazi">mkdir.yazi</a> - Create directories without typing a trailing slash.
</summary>

```bash
ya pack -a Sonico98/mkdir
```

</details>

<details>
<summary>
<a href="https://github.com/ndtoan96/ouch.yazi">ouch.yazi</a> - An <a href="https://github.com/ouch-org/ouch">ouch</a> plugin for Yazi, supporting preview and compression.
</summary>

```bash
ya pack -a ndtoan96/ouch
```

</details>

<details>
<summary>
<a href="https://github.com/Ape/reflink.yazi">reflink.yazi</a> - Create reflinks to files.
</summary>

```bash
ya pack -a Ape/reflink
```

</details>

<details>
<summary>
<a href="https://github.com/GianniBYoung/rsync.yazi">rsync.yazi</a> - Simple rsyncing locally and remotely.
</summary>

```bash
ya pack -a GianniBYoung/rsync
```

</details>

<details>
<summary>
<a href="https://github.com/pirafrank/what-size.yazi">what-size.yazi</a> - Calculate the total size of the current selection or of the current working directory.
</summary>

```bash
ya pack -a pirafrank/what-size
```

</details>

<details>
<summary>
<a href="https://github.com/Tyarel8/whide.yazi">whide.yazi</a> - Hide/unhide files in Windows.
</summary>

```bash
ya pack -a Tyarel8/whide
```

</details>
</details>

<details>
<summary>📦 Filter Enhancements</summary>

<details>
<summary>
<a href="https://github.com/yazi-rs/plugins/tree/main/smart-filter.yazi">smart-filter.yazi</a> - Makes filters smarter: continuous filtering, automatically enter unique directory, open file on submitting.
</summary>

```bash
ya pack -a yazi-rs/plugins:smart-filter
```

</details>

### Enter Enhancements

<details>
<summary>
<a href="https://github.com/Rolv-Apneseth/bypass.yazi">bypass.yazi</a> - Yazi plugin for skipping directories with only a single sub-directory.
</summary>

```bash
ya pack -a Rolv-Apneseth/bypass
```

</details>

<details>
<summary>
<a href="https://github.com/ourongxing/fast-enter.yazi">fast-enter.yazi</a> - Auto-decompress archives and enter them, or enter the deepest directory until it's not the only subdirectory.
</summary>

```bash
ya pack -a ourongxing/fast-enter
```

</details>

### General command enhancements

<details>
<summary>
<a href="https://github.com/hankertrix/augment-command.yazi">augment-command.yazi</a> - Enhances a few Yazi commands with better handling of the choice between selected items and the hovered item. It also auto-extracts archives and includes features like bidirectional skipping of directories with a single sub-directory, along with plugins from the <a href="/docs/tips">tips page</a> such as `smart-enter`, `smart-paste`, `parent-arrow`, and more.
</summary>

```bash
ya pack -a hankertrix/augment-command
```

</details>

<details>
<summary>
<a href="https://github.com/AnirudhG07/plugins-yazi/tree/main/copy-file-contents.yazi">copy-file-contents.yazi</a> - A simple plugin to copy the contents of a file to the clipboard directly from yazi.
</summary>

```bash
ya pack -a AnirudhG07/plugins-yazi:copy-file-contents
```

</details>

<details>
<summary>
<a href="https://github.com/TD-Sky/sudo.yazi">sudo.yazi</a> - Call `sudo` in yazi.
</summary>

```bash
ya pack -a TD-Sky/sudo
```

</details>

<details>
<summary>
<a href="https://github.com/orhnk/system-clipboard.yazi">system-clipboard.yazi</a> - Cross-platform system clipboard support for yazi.
</summary>

```bash
ya pack -a orhnk/system-clipboard
```

</details>

<details>
<summary>
<a href="https://gitee.com/DreamMaoMao/clipboard.yazi">win-clipboard.yazi</a> - Yazi plugin for copy file to clipboard,support linux and windows.
</summary>

```bash
# Linux
git clone https://gitee.com/DreamMaoMao/clipboard.yazi.git ~/.config/yazi/plugins/clipboard.yazi

# Windows
git clone https://gitee.com/DreamMaoMao/clipboard.yazi.git $env:APPDATA\yazi\config\plugins\clipboard.yazi
```

</details>

### UI enhancements

<details>
<summary>
<a href="https://gitee.com/DreamMaoMao/current-size.yazi">current-size.yazi</a> - Get current path size in header bar for yazi plugin/
</summary>

```bash
git clone https://gitee.com/DreamMaoMao/current-size.yazi.git ~/.config/yazi/plugins/current-size.yazi
```

</details>

<details>
<summary>
<a href="https://github.com/dawsers/dual-pane.yazi">dual-pane.yazi</a> - Dual pane navigation like Total Commander.
</summary>

```bash
ya pack -a dawsers/dual-pane
```

</details>

<details>
<summary>
<a href="https://github.com/yazi-rs/plugins/tree/main/full-border.yazi">full-border.yazi</a> - Add a full border to Yazi to make it look fancier.
</summary>

```bash
ya pack -a yazi-rs/plugins:full-border
```

</details>

<details>
<summary>
<a href="https://github.com/yazi-rs/plugins/tree/main/hide-preview.yazi">hide-preview.yazi</a> - Switch the preview pane between hidden and shown.
</summary>

```bash
ya pack -a yazi-rs/plugins:hide-preview
```

</details>

<details>
<summary>
<a href="https://github.com/yazi-rs/plugins/tree/main/mactag.yazi">mactag.yazi</a> - Bring macOS's awesome tagging feature to Yazi! The plugin it's only available for macOS just like the name says.
</summary>

```bash
ya pack -a yazi-rs/plugins:mactag
```

</details>

<details>
<summary>
<a href="https://github.com/yazi-rs/plugins/tree/main/max-preview.yazi">max-preview.yazi</a> - Maximize or restore the preview pane.
</summary>

```bash
ya pack -a yazi-rs/plugins:max-preview
```

</details>

<details>
<summary>
<a href="https://github.com/yazi-rs/plugins/tree/main/no-status.yazi">no-status.yazi</a> - Remove the status bar.
</summary>

```bash
ya pack -a yazi-rs/plugins:no-status
```

</details>

<details>
<summary>
<a href="https://github.com/saumyajyoti/omp.yazi">omp.yazi</a> - oh-my-posh prompt plugin for Yazi.
</summary>

```bash
ya pack -a saumyajyoti/omp
```

</details>

<details>
<summary>
<a href="https://github.com/Ape/open-with-cmd.yazi">open-with-cmd.yazi</a> - Open files using a prompted command.
</summary>

```bash
ya pack -a Ape/open-with-cmd
```

</details>

<details>
<summary>
<a href="https://github.com/Ape/simple-status.yazi">simple-status.yazi</a> - Minimalistic status line with useful file attribute information.
</summary>

```bash
ya pack -a Ape/simple-status
```

</details>

<details>
<summary>
<a href="https://github.com/Rolv-Apneseth/starship.yazi">starship.yazi</a> - Starship prompt plugin for Yazi.
</summary>

```bash
ya pack -a Rolv-Apneseth/starship
```

</details>

<details>
<summary>
<a href="https://github.com/dawsers/toggle-view.yazi">toggle-view.yazi</a> - Toggle on/off parent, current, or preview independently.
</summary>

```bash
ya pack -a dawsers/toggle-view
```

</details>

<details>
<summary>
<a href="https://github.com/imsi32/yatline.yazi">yatline.yazi</a> - Plugin for customizing both header-line and status-line.
</summary>

```bash
ya pack -a imsi32/yatline
```

</details>

<details>
<summary>
<a href="https://github.com/llanosrocas/yaziline.yazi">yaziline.yazi</a> - Simple lualine-like status line.
</summary>

```bash
ya pack -a llanosrocas/yaziline
```

</details>

### Git Utils

<details>
<summary>
<a href="https://gitee.com/DreamMaoMao/git.yazi">DreamMaoMao/git.yazi</a> - git extension and message prompt plugin for Yazi.
</summary>

```bash
# For Linux
git clone https://gitee.com/DreamMaoMao/git.yazi.git ~/.config/yazi/plugins/git.yazi

# For Windows
git clone https://gitee.com/DreamMaoMao/git.yazi $env:APPDATA\yazi\config\plugins\git.yazi
```

</details>

<details>
<summary>
<a href="https://github.com/yazi-rs/plugins/tree/main/git.yazi">yazi-rs/git.yazi</a> - Show the status of Git file changes as linemode in the file list.
</summary>

```bash
ya pack -a yazi-rs/plugins:git
```

</details>

<details>
<summary>
<a href="https://github.com/llanosrocas/githead.yazi">githead.yazi</a> - git status header inspired by powerlevel10k.
</summary>

```bash
ya pack -a llanosrocas/githead
```

</details>

### Preloader Images

<details>
<summary>
<a href="https://github.com/Sonico98/allmytoes.yazi">allmytoes.yazi</a> - Preview freedesktop-compatible thumbnails using <a href="https://gitlab.com/allmytoes/allmytoes">allmytoes</a>.
</summary>

```bash
ya pack -a Sonico98/allmytoes
```

</details>
</details>
  
<details>     
<summary>📦 Fetchers</summary>

<details>
<summary>
<a href="https://gitee.com/DreamMaoMao/mime-ext.yazi">DreamMaoMao/mime-ext.yazi</a> - A Yazi plugin that quickly get mimetype to improved theme rendering speed.</summary>

```bash
# Linux/macOS
git clone https://gitee.com/DreamMaoMao/mime-ext.yazi.git ~/.config/yazi/plugins/mime-ext.yazi

[plugin]
fetchers = [
	{ id = "mime-ext", name = "*", run = "mime-ext", prio = "high" },
]
```

</details>

<details>
<summary>
<a href="https://github.com/yazi-rs/plugins/tree/main/mime-ext.yazi">yazi-rs/mime-ext.yazi</a> - A common file type MIME-type library specifically designed for Yazi.
</summary>

```bash
ya pack -a yazi-rs/plugins:mime-ext

[plugin]
fetchers = [
{ id = "mime",if = "!mime", name = "*", run = "mime-ext", prio = "high" },
]
```

</details>

<details>
<summary>
<a href="https://gitee.com/DreamMaoMao/mime-preview.yazi">mime-preview.yazi</a> - Enables the preview folder on the right pane of yazi to render theme colors. very quickly with almost no performance loss.
</summary>

```bash
# Linux
git clone https://gitee.com/DreamMaoMao/mime-preview.yazi.git ~/.config/yazi/plugins/mime-preview.yazi

# qAdd this to ~/.config/yazi/init.lua
require("mime-preview"):setup()
```

</details>
</details>

<details>
<summary>📦 Neovim</summary>

<details>
<summary>
<a href="https://github.com/mikavilpas/yazi.nvim">mikavilpas/yazi.nvim</a> - A fork of DreamMaoMao/yazi.nvim with a bunch of additional features.
</summary>

```lua
-- Using lazy.nvim
return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>-", "<cmd>Yazi<cr>", desc = "Open yazi at the current file" },
    { "<leader>cw", "<cmd>Yazi cwd<cr>", desc = "Open the file manager in nvim's working directory" },
    { "<c-up>", "<cmd>Yazi toggle<cr>", desc = "Resume the last yazi session" },
  },
  opts = {
    -- Options for opening Yazi
    open_for_directories = false, -- Open Yazi instead of netrw (default: false)
    open_multiple_tabs = false, -- Open visible splits as Yazi tabs (default: false)
    highlight_hovered_buffers_in_same_directory = true, -- Highlight buffers in the same directory

    -- Floating window settings
    floating_window_scaling_factor = 0.9, -- Window scaling factor
    yazi_floating_window_winblend = 0, -- Transparency (0-100)
    yazi_floating_window_border = "rounded", -- Border type for the floating window

    -- Log settings
    log_level = vim.log.levels.OFF, -- Logging level

    -- Custom actions for file opening
    open_file_function = function(chosen_file, config, state) end,

    -- Custom keymaps while Yazi is focused
    keymaps = {
      show_help = "<f1>",
      open_file_in_vertical_split = "<c-v>",
      open_file_in_horizontal_split = "<c-x>",
      open_file_in_tab = "<c-t>",
      grep_in_directory = "<c-s>",
      replace_in_directory = "<c-g>",
      cycle_open_buffers = "<tab>",
      copy_relative_path_to_selected_files = "<c-y>",
      send_to_quickfix_list = "<c-q>",
      change_working_directory = "<c-\\>",
    },

    -- Hooks for custom actions
    hooks = {
      yazi_opened = function(preselected_path, yazi_buffer_id, config) end,
      yazi_closed_successfully = function(chosen_file, config, state) end,
      yazi_opened_multiple_files = function(chosen_files, config, state) end,
    },

    -- Clipboard settings
    clipboard_register = "*", -- Register for copying text

    -- Integration with other plugins
    integrations = {
      grep_in_directory = function(directory)
        -- Default: uses telescope if available
      end,
      grep_in_selected_files = function(selected_files) end,
      replace_in_directory = function(directory) end,
      replace_in_selected_files = function(selected_files) end,
      resolve_relative_path_application = "", -- Path resolver (realpath)
    },
  },
}


- For more information, check the repository.

```

</details>

<details>
<summary>
<a href="https://github.com/Rolv-Apneseth/tfm.nvim">tfm.nvim</a> - Neovim plugin for terminal file manager integration.
</summary>

```lua
-- Using lazy.nvim
{
    "rolv-apneseth/tfm.nvim",
    config = function()
        -- Set keymap so you can open the default terminal file manager (yazi)
        vim.api.nvim_set_keymap("n", "<leader>e", "", {
            noremap = true,
            callback = require("tfm").open,
        })
    end,
}
-- For more information, check the repository.
```

</details>

<details>
<summary>
<a href="https://github.com/chriszarate/yazi.vim">yazi.vim</a> - Vim plugin for Yazi.
</summary>

```bash
Plug 'chriszarate/yazi.vim'
```

</details>
</details>

<details>      
<summary>📦 Shell plugins</summary>

<details>
<summary>
<a href="https://github.com/KKV9/command.yazi">command.yazi</a> - Display a prompt for executing yazi commands.
</summary>

```bash
# For Unix platforms
git clone https://github.com/KKV9/command.yazi.git ~/.config/yazi/plugins/command.yazi

## For Windows
git clone https://github.com/KKV9/command.yazi.git %AppData%\yazi\config\plugins\command.yazi

# Or with yazi plugin manager
ya pack -a KKV9/command
```

</details>

<details>
<summary>
<a href="https://github.com/AnirudhG07/custom-shell.yazi">custom-shell.yazi</a> - Set your custom-shell as your default yazi Shell.
</summary>

```bash

ya pack -a AnirudhG07/custom-shell

# For linux and MacOS
git clone https://github.com/AnirudhG07/custom-shell.yazi.git ~/.config/yazi/plugins/custom-shell.yazi

```

</details>

<details>
<summary>
<a href="https://github.com/Sonico98/yazi-prompt.sh">yazi-prompt.sh</a> - Display an indicator in your prompt when running inside a yazi subshell.
</summary>

```bash
ya pack -a Sonico98/yazi-prompt
```

</details>
</details>

<details>
<summary>📦 Utilities</summary>

<details>
<summary>
<a href="https://github.com/lpnh/icons-brew.yazi">icons-brew.yazi</a> - Make a hot `theme.toml` for your Yazi icons with your favorite color palette.
</summary>

```bash
ya pack -a lpnh/icons-brew
```

</details>
</details>

<details>    
<summary>📦 Flavors</summary>

<details>
<summary>
<a href="https://github.com/yazi-rs/flavors/tree/main/catppuccin-frappe.yazi">catppuccin-frappe.yazi</a> - Add flavor to yazi with Catppuccin Frappe theme.
</summary>

```bash
ya pack -a yazi-rs/flavors:catppuccin-mocha
```

</details>

<details>
<summary>
<a href="https://github.com/yazi-rs/flavors/tree/main/catppuccin-latte.yazi">catppuccin-latte.yazi</a> - Add flavor to yazi with Catppuccin Latte theme.
</summary>

```bash
ya pack -a yazi-rs/flavors:catppuccin-latte
```

</details>

<details>
<summary>
<a href="https://github.com/yazi-rs/flavors/tree/main/catppuccin-macchaito.yazi">catppuccin-macchiato.yazi</a> - Add flavor to yazi with Catppuccin Macchiato theme.
</summary>

```bash
ya pack -a yazi-rs/flavors:catppuccin-macchiato
```

</details>

<details>
<summary>
<a href="https://github.com/yazi-rs/flavors/tree/main/catppuccin-mocha.yazi">catppuccin-mocha.yazi</a> - Add flavor to yazi with Catppuccin Mocha theme.
</summary>

```bash
ya pack -a yazi-rs/flavors:catppuccin-mocha
```

</details>

<details>
<summary>
<a href="https://github.com/dangooddd/kanagawa.yazi">kanagawa.yazi</a> - Kanagawa flavors for Yazi.
</summary>

```bash
ya pack -a dangooddd/kanagawa
```

</details>

<details>
<summary>
<a href="https://github.com/BennyOe/onedark.yazi">onedark.yazi</a> - One Dark flavor for Yazi.
</summary>

```bash
ya pack -a BennyOe/onedark
```

</details>

<details>
<summary>
<a href="https://github.com/BennyOe/tokyo-night.yazi">tokyo-night.yazi</a> - Tokyo Night flavor for Yazi.
</summary>

```bash
ya pack -a BennyOe/tokyo-night
```

</details>
</details>

<details>    
<summary>📦 Themes</summary>

<details>
<summary>
<a href="https://github.com/catppuccin/yazi">Catppuccin</a> - Capuccino-inspired theme for Yazi.
</summary>

```
Manual Installation Required.
```

</details>

<details>
<summary>
<a href="https://github.com/sachinsenal0x64/crystal-theme.yazi">Crystal</a> - Crystal theme for Yazi.
</summary>

```
Manual Installation Required.
```

</details>

<details>
<summary>
<a href="https://github.com/poperigby/gruvbox-dark-yazi">Gruvbox Dark</a> - Gruvbox Dark theme for Yazi.
</summary>

```
Manual Installation Required.
```

</details>

<details>
<summary>
<a href="https://github.com/Reledia/flexoki.yazi">Flexoki</a> - Flexoki theme for Yazi. 
</summary>

```
Manual Installation Required.
```

</details>

<details>
<summary>
<a href="https://github.com/Mellbourn/ls-colors.yazi">LS_COLORS</a> - Adds over 300 different colors for filetypes (converted from <a href="https://github.com/trapd00r/LS_COLORS">the LS_COLORS collection</a> using <a href="https://github.com/Mellbourn/lsColorsToToml">lsColorsToToml</a>)
</summary>

```
Manual Installation Required.
```

</details>

<details>
<summary>
<a href="https://github.com/Msouza91/rose-pine.yazi">Rosé Pine</a> - Rosé Pine theme for Yazi.
</summary>

```
Manual Installation Required.
```

</details>
</details>
