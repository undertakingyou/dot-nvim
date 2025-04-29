# undertakingyou Neovim config

## Introduction

This started with the kickstart.nvim configuration but has diverged to the point that I have
separated it from that configuration. I still maintain similar goals as Kickstart, specifically:

* Small
* Well Documented

**NOT** a Neovim distribution.

## Installation

### Install Neovim

You should use *only* the latest
['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest
['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim.
If you are experiencing issues, please make sure you have the latest versions.

### Install External Dependencies

External Requirements:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool (xclip/xsel/win32yank or other depending on the platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
  - I really like "VictorMono". See my ghostty config for some details there.
- Emoji fonts (Ubuntu only, and only if you want emoji!) `sudo apt install fonts-noto-color-emoji`
- Language Setup:
  - If you want to write Typescript, you need `npm`
  - If you want to write Golang, you will need `go`
  - etc.

> [!NOTE]
> Kickstart has some great [Install Recipes](https://github.com/nvim-lua/kickstart.nvim#Install-Recipes)
> for additional Windows and Linux specific notes and quick install snippets.

### Install this config

> [!NOTE]
> Backup your previous configuration (if any exists).
> I'm not responsible if you deleted stuff that you didn't commit.

Neovim's configurations are located under the following paths, depending on your OS:

| OS | PATH |
| :- | :--- |
| Linux, MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)| `%localappdata%\nvim\` |
| Windows (powershell)| `$env:LOCALAPPDATA\nvim\` |

#### Recommended Step

[Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repo
so that you have your own copy that you can modify, then install by cloning the
fork to your machine using one of the commands below, depending on your OS.

> [!NOTE]
> Your fork's URL will be something like this:
> `https://github.com/<your_github_username>/dot-nvim.git`

You likely want to remove `lazy-lock.json` from your fork's `.gitignore` file
too - it's ignored in the kickstart repo to make maintenance easier, but it's
[recommended to track it in version control](https://lazy.folke.io/usage/lockfile).

#### Clone my repository

> [!NOTE]
> If following the recommended step above (i.e., forking the repo), replace
> `undertakingyou` with `<your_github_username>` in the commands below

<details><summary> Linux and Mac </summary>

```sh
git clone https://github.com/undertakingyou/dot-nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

### Post Installation

Start Neovim

```sh
nvim
```

That's it! Lazy will install all the plugins you have. Use `:Lazy` to view
the current plugin status. Hit `q` to close the window.

> [!NOTE]
> For more information about a particular plugin check its repository's documentation.
