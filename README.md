# Neovim Configuration

This repository contains the Neovim configuration files for a customized development environment.

## Introduction

This Neovim setup focuses on enhancing productivity and providing a rich development experience with a variety of plugins and custom settings.

## Installation

To use this configuration, clone the repository and place the files in your Neovim configuration directory, usually located at `~/.config/nvim/`.

```bash
# Clone the repository
git clone <repository-url> ~/.config/nvim
```

Ensure you have the necessary dependencies, such as a Nerd Font for proper icon display (`vim.g.have_nerd_font` should be set to true).

## Key Features

- **Lazy Loading with `lazy.nvim`:** Efficiently load plugins only when needed to reduce startup time.
- **Enhanced File Navigation:** Utilize `fzf-lua` for fuzzy finding files, buffers, and more.
- **LSP Integration:** Seamless integration with LSP servers for enhanced code intelligence.
- **Code Formatting:** Automated code formatting with `conform.nvim`.

## Plugins Used

This configuration employs a variety of plugins to enhance the Neovim experience:

- `lazy.nvim` for lazy loading plugins
- `fzf-lua` for fuzzy file finding
- `nvim-ts-autotag` for auto-closing and renaming of HTML tags
- `harpoon` for quick file navigation
- `conform.nvim` for formatting support
- `tokyonight` color scheme for a visually appealing interface
- `avante.nvim` for AI-assisted features

## Configuration Details

- **Autocmds:** Custom autocommands for actions like highlighting on yank and auto-formatting before save.
- **Keymaps:** Custom keybindings for efficient navigation and command execution.
- **Options:** Tailored Neovim settings for an optimal editing environment.

## Additional Information

Explore the `lua/` directory for detailed configuration files and customize them as per your needs. Each plugin configuration is modularized for easy maintenance and updates.

For more details on each plugin's capabilities, refer to their official documentation.

