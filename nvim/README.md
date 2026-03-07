# Neovim Config (lazy.nvim)

A DevOps-focused Neovim setup with:
- `lazy.nvim` plugin management
- Neovim 0.11+ LSP (`vim.lsp.config` / `vim.lsp.enable`)
- `nvim-cmp` completion
- `conform.nvim` format-on-save
- `nvim-lint` linting
- Gruvbox Material + custom Alpha dashboard styling

## Index
- [Core Workflow](#core-workflow)
- [Keymaps](#keymaps)
- [LSP and Language Support](#lsp-and-language-support)
- [Formatting and Linting](#formatting-and-linting)
- [UI and Navigation](#ui-and-navigation)
- [Health and Debugging](#health-and-debugging)
- [File Layout](#file-layout)

## Core Workflow
1. Open project
2. Use `<leader>ff` / `<leader>fg` to navigate
3. Let LSP attach (`:LspInfo`)
4. Edit with completion (`<C-Space>`, `<Tab>`, `<S-Tab>`)
5. Use code actions (`<leader>ca`)
6. Save file (auto-format runs)
7. Check diagnostics in Trouble (`<leader>xx`) or lint manually (`<leader>ll`)

## Keymaps

### Find / Telescope
| Key | Mode | Action |
|---|---|---|
| `<leader>ff` | `n` | Find files |
| `<leader>fg` | `n` | Live grep |
| `<leader>fb` | `n` | Find buffers |
| `<leader>fh` | `n` | Help tags |

### LSP / Code
| Key | Mode | Action |
|---|---|---|
| `gd` | `n` | Go to definition |
| `gD` | `n` | Go to declaration |
| `gr` | `n` | References |
| `gi` | `n` | Implementations |
| `K` | `n` | Hover docs |
| `<leader>rn` | `n` | Rename symbol |
| `<leader>ca` | `n,v` | Code actions |
| `<leader>cA` | `n` | Apply first code action |
| `[d` | `n` | Previous diagnostic |
| `]d` | `n` | Next diagnostic |
| `<leader>fd` | `n` | Diagnostic float |
| `<leader>li` | `n` | LSP info |
| `<leader>uh` | `n` | Toggle inlay hints |

### Diagnostics / Trouble
| Key | Mode | Action |
|---|---|---|
| `<leader>xx` | `n` | Toggle diagnostics |
| `<leader>xX` | `n` | Toggle buffer diagnostics |
| `<leader>cs` | `n` | Toggle symbols |
| `<leader>cl` | `n` | Toggle LSP panel |
| `<leader>xL` | `n` | Toggle loclist |
| `<leader>xQ` | `n` | Toggle quickfix |

### Lint / Format
| Key | Mode | Action |
|---|---|---|
| `<leader>ll` | `n` | Run linters for current file |
| `:DevOpsHealth` | `:` | Show active LSP/formatter/linter |

### Explorer / Terminal / Buffers / Windows
| Key | Mode | Action |
|---|---|---|
| `<leader>e` | `n` | Toggle NvimTree |
| `<leader>t` | `n` | Toggle floating terminal |
| `<Esc>` | `t` | Close floating terminal |
| `<leader>bn` | `n` | Next buffer |
| `<leader>bp` | `n` | Previous buffer |
| `<leader>wh` `<leader>wj` `<leader>wk` `<leader>wl` | `n` | Move between windows |
| `<leader>sv` / `<leader>sh` | `n` | Vertical / horizontal split |

### Editing Helpers
| Key | Mode | Action |
|---|---|---|
| `jj` | `i,v,t` | Escape to normal mode |
| `<leader>c` | `n` | Clear search highlights |
| `<leader>p` | `x` | Paste without yanking |
| `<leader>x` | `n,v` | Delete without yanking |
| `<leader>pa` | `n` | Copy absolute file path |
| `<C-j>` / `<C-k>` | `n,v` | Move line/selection down or up |

## LSP and Language Support
Configured servers include:
- Go: `gopls`
- Kubernetes/YAML/Helm: `yamlls`, `helm_ls`
- Docker: `dockerls`, `docker_compose_language_service`
- Ansible: `ansiblels`
- Pipelines: `gh_actions_ls`, `azure_pipelines_ls`, `jsonls`
- Terraform: `terraformls`, `tflint`
- TOML: `taplo`
- Python: `pyright`
- Shell: `bashls`
- C/C++: `clangd`
- SQL/Postgres: `postgres_lsp`
- Jenkins/Groovy: `groovyls`
- Neovim Lua: `lua_ls`

Jenkinsfile is auto-mapped to `groovy` filetype.

## Formatting and Linting
### Format on save
Handled by `conform.nvim` on `BufWritePre`.

### Linters
Handled by `nvim-lint` on `BufEnter`, `BufWritePost`, `InsertLeave`.

### Installed toolchain (via Mason)
Includes (based on configuration):
- Formatters: `stylua`, `goimports`, `gofumpt`, `black`, `isort`, `shfmt`, `yamlfmt`, `prettier`, `clang-format`, `pgformatter`
- Linters: `pylint`, `shellcheck`, `yamllint`, `actionlint`, `tflint`, `sqlfluff`, `hadolint`, `ansible-lint`, `jsonlint`, `npm-groovy-lint`

## UI and Navigation
- Theme: Gruvbox Material
- Dashboard: `alpha-nvim` Gamebred header with animated gradient
- Statusline: `lualine`
- Git signs: `gitsigns`
- Notifications / command UI: `noice`
- Buffers: `barbar`
- File tree: `nvim-tree`
- Finder: `telescope` (+ `fzf-native` if `make` exists)

## Health and Debugging
Use these commands:
- `:Lazy` (plugin manager UI)
- `:Mason` (LSP/tools install status)
- `:LspInfo` (active LSP clients)
- `:checkhealth` (overall health)
- `:DevOpsHealth` (current buffer LSP/formatter/linter summary)

## File Layout
- `init.lua`: entrypoint
- `lua/config/`: core settings (`options`, `keymaps`, `autocmds`, `terminal`, `commands`, `highlights`)
- `lua/config/lsp/`: split LSP domain configs (`langs.lua`, `devops.lua`)
- `lua/plugins/`: plugin specs for lazy.nvim
