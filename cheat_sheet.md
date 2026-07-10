# Dotfiles Cheat Sheet — Hotkeys & Shortcuts

> Generated from the live configs in this repo (`nvim`, `tmux`, `opencode`,
> `zsh`, `wezterm`, `alacritty`, `git`).
> Leader key for Neovim is `<Space>` (set in `general.lua:27`).
> OpenCode uses a leader of `Ctrl+x` (default; not overridden in `tui.json`).

---

## 1. Neovim

### 1.1 General / Editor
| Key | Mode | Action |
|-----|------|--------|
| `<Space>` | n | **Leader key** |
| `$` | n, v | Go to last **non-blank** char of line (remapped from `$` → `g_`) |
| `<Leader>d` | n | Alias for `<C-w>` — window/pane command prefix |
| `<Leader>xc` | n | `chmod a+x` the current file |
| `<Leader>h` | n | Run **replacer.nvim** (project-wide find & replace) |
| `mouse` | – | Mouse enabled (scroll/select) |
| `:set list` | – | Trailing/whitespace visible (listchars) |

Editor behavior: `expandtab` 2 spaces, `number` on, `clipboard=unnamedplus`
(system clipboard), `cursorline`, `scrolloff=8`, `colorcolumn=80`,
`hidden` buffers, Ruby formatted on save via LSP.

### 1.2 LSP (`lsp-zero`, `lua/ddkatch/plugins/lsp-zero.lua`)
| Key | Mode | Action |
|-----|------|--------|
| `gd` | n | Go to definition |
| `K` | n | Hover documentation |
| `gb` | n | Go to previously opened file (`:e#`) *overrides Comment.nvim `gbc`* |
| `<Leader>vws` | n | Workspace symbol search |
| `<Leader>vd` | n | Open diagnostic float |
| `<Leader>=d` | n | Next diagnostic |
| `<Leader>-d` | n | Previous diagnostic |
| `<Leader>vca` | n | Code action |
| `<Leader>vrr` | n | List references |
| `<Leader>vrn` | n | Rename symbol |
| `<C-h>` | i | Signature help |
| (lsp-zero defaults) | n | `+` (hover), `gr` (references), `gD` (declaration), `gi` (impl), `gy` (type def), `<C-k>` (signature), `[d`/`]d` (diagnostics), `<F2>` rename, `<F4>` code action, `grr`/`<leader>lr` etc. |

### 1.3 Completion (`nvim-cmp` + LuaSnip)
| Key | Mode | Action |
|-----|------|--------|
| `<C-Space>` | i | Trigger completion manually |
| `<Tab>` | i | Next completion item / expand snippet |
| `<S-Tab>` | i | Prev completion item / jump snippet backward |
| `<C-f>` | i | Snippet jump forward |
| `<C-b>` | i | Snippet jump backward |
| `<C-u>` | i | Scroll docs up |
| `<C-d>` | i | Scroll docs down |
| `<CR>` | i | Confirm selected completion |

### 1.4 Telescope (`lua/ddkatch/plugins/telescope.lua`)
| Key | Mode | Action |
|-----|------|--------|
| `<Leader>fd` | n | **Find files** in directory |
| `<Leader>fg` | n | Find **git** files |
| `<Leader>fl` | n | **Live grep** (project search) |
| `<Leader>flh` | n | Live grep seeded with word under cursor (`<C-r><C-w>`) |
| `<Leader>fb` | n | List **buffers** |
| `<Leader>fh` | n | Help tags |
| `<C-j>` / `<C-k>` | insert | Cycle history next / prev (within picker) |

### 1.5 nvim-tree (`lua/ddkatch/plugins/nvim-tree.lua`)
| Key | Mode | Action |
|-----|------|--------|
| `<Leader>n` | n | Toggle file explorer |

*Default nvim-tree keys apply inside the tree (e.g. `o`/`Enter` open,
`a` create, `d` delete, `r` rename, `R` refresh, `/` filter, `m` mark,
`x` cut, `c` copy, `p` paste, `s` open horizontal, `v` open vertical).*

### 1.6 Harpoon (`lua/ddkatch/plugins/harpoon.lua`)
| Key | Mode | Action |
|-----|------|--------|
| `<Leader>a` | n | **Add file** to harpoon list |
| `<C-e>` | n | Toggle harpoon quick menu |
| `<C-h>` | n | Jump to harpoon file **1** |
| `<C-t>` | n | Jump to harpoon file **2** |
| `<C-n>` | n | Jump to harpoon file **3** |
| `<C-s>` | n | Jump to harpoon file **4** |

> ⚠️ `<Leader>a` collides with **Avante's** default `<Leader>a*` prefix
> (Avante ask/retry/etc.). Avante is installed but has no keymap override,
> so its defaults may be shadowed by harpoon.

### 1.7 CtrlSF (`lua/ddkatch/plugins/ctrlsf.lua`)
| Key | Mode | Action |
|-----|------|--------|
| `<C-F>f` | n | Prompt for search string (project-wide) |
| `<C-F>n` | n | Search word under cursor in project |
| `<C-F>p` | n | Search word under cursor (path-scoped) |

### 1.8 Utility plugins
| Key | Mode | Plugin | Action |
|-----|------|--------|--------|
| `<Leader>f` | n,v | conform.nvim | Format buffer (also format-on-save) |
| `<Space>m` | n | treesj | Toggle (split/join) struct under cursor |
| `<Space>j` | n | treesj | Join block |
| `<Space>s` | n | treesj | Split block (recursive) |
| `<Space>xx` | n | trouble.nvim | Toggle diagnostics |
| `<Space>xX` | n | trouble.nvim | Buffer diagnostics only |
| `<Space>cs` | n | trouble.nvim | Document symbols |
| `<Space>cl` | n | trouble.nvim | LSP defs/refs (right) |
| `<Space>xL` | n | trouble.nvim | Location list |
| `<Space>xQ` | n | trouble.nvim | Quickfix list |
| `gcc` | n | Comment.nvim | Toggle line comment |
| `gc` | n/v | Comment.nvim | Comment operator (e.g. `gc3j`) |
| `gbc` | n | Comment.nvim | *block comment* — **overridden** by `gb`→`:e#` |
| `:DiffviewOpen` | cmd | diffview.nvim | Open diff view |
| `:GitBlameToggle` | cmd | git-blame.nvim | Toggle inline blame |

### 1.9 Avante (AI assistant, `helpers/avante.lua`)
Configured with a local proxy-Ollama provider (`use_proxy_ollama()`).
No custom keymaps set, so it falls back to upstream defaults:
- `<Leader>aa` ask, `<Leader>ar` retry, `<Leader>ac` continue,
  `<Leader>ae` edit, `<Leader>a?` help, `<Leader>ad` debug,
  `:AvanteAsk`, `:AvanteChat`. (See warning in §1.6 re `<Leader>a`.)

---

## 2. tmux (`.tmux.conf`)

Prefix is **`C-a`** (GNU-screen compatible, in addition to default `C-b`).
All bindings below use the prefix unless marked `(no prefix)`.

### 2.1 Sessions & Windows
| Key | Prefix | Action |
|-----|--------|--------|
| `C-c` | yes | Create new session |
| `C-f` | yes | Find session (prompt for name) |
| `C-l` | yes | Last window (duplicate of `S-)`) |
| `)` | yes | Switch to last client/session |
| `S-)` | yes | Last window |
| `C-h` | **no** | Previous window (tab) |
| `C-l` | **no** | Next window (tab) |
| `C-k` | **no** | Last visited window |
| `e` | yes | Edit `~/.tmux.conf.local` in new window + reload |

### 2.2 Panes (split & navigate)
| Key | Prefix | Action |
|-----|--------|--------|
| `-` | yes | Split **horizontally** (top/bottom), same path |
| `\|` | yes | Split **vertically** (side/side), same path |
| `h` | yes (repeat) | Select pane left |
| `j` | yes (repeat) | Select pane down |
| `k` | yes (repeat) | Select pane up |
| `l` | yes (repeat) | Select pane right |

*`repeat-time 600` means you can tap `h j k l` repeatedly after one prefix.*

### 2.3 Copy / Paste (vim copy-mode)
| Key | Prefix | Action |
|-----|--------|--------|
| `Enter` | yes | Enter copy-mode |
| `b` | yes | List paste buffers |
| `p` | yes | Paste from top buffer |
| `P` | yes | Choose buffer to paste |
| `L` | yes | Enable logging for **all** panes (→ `~/tmux-logs/`) |

*Copy-mode flow: `<prefix> Enter` → move/select with vim keys → `y` to
copy → switch to nvim → `<prefix> p` to paste.*

### 2.4 Plugins & extras
- **tpm** plugin manager; **catppuccin** theme; **tmux-resurrect** +
  **tmux-continuum** (auto save every 15 min, auto-restore on launch).
- Pane output auto-logged to `~/tmux-logs/<pane-id>.log` on create/split.
- `mouse on` — click to select/resize panes, scroll to enter copy-mode.
- Resurrect restores: ssh, nvim, vim, docker, ollama, opencode, dev servers, etc.

---

## 3. OpenCode TUI (`.config/opencode/*`)

The configs set the model (`novita-ai/tencent/hy3`) and providers
(ollama, llama.cpp) but **do not override keybinds**, so all defaults
below apply. Leader = **`Ctrl+x`** (then the second key).

### 3.1 Leader (`Ctrl+x`) commands
| Key | Action |
|-----|--------|
| `<Leader>n` | New session (`/new`, `/clear`) |
| `<Leader>c` | Compact session (`/compact`) |
| `<Leader>e` | Open external editor (`/editor`) |
| `<Leader>x` | Export session (`/export`) |
| `<Leader>q` | Exit (`/exit`, `/quit`) |
| `<Leader>l` | List/switch sessions (`/sessions`) |
| `<Leader>t` | Themes (`/themes`) |
| `<Leader>m` | Models (`/models`) |
| `<Leader>r` | Redo undone message (`/redo`) |
| `<Leader>u` | Undo last message (`/undo`) |
| `<Leader>a` | Agent list |
| `<Leader>b` | Toggle sidebar |
| `<Leader>s` | Status view |
| `<Leader>g` | Session timeline |
| `<Leader>y` | Copy message |
| `<Leader>h` | Toggle tips / conceal messages |

### 3.2 Non-leader / global
| Key | Action |
|-----|--------|
| `Ctrl+p` | Command palette |
| `Ctrl+r` | Rename session |
| `Ctrl+d` | Delete session / stash delete |
| `Ctrl+a` | Model provider list |
| `Ctrl+f` | Toggle favorite model |
| `Ctrl+t` | Cycle model variant (e.g. reasoning) |
| `Tab` | Cycle agents; `S-Tab` reverse |
| `F2` / `S-F2` | Cycle recent models (fwd/rev) |
| `Esc` | Interrupt session / close dialog |
| `Ctrl+c` | Cancel generation / exit |
| `Ctrl+z` | Suspend terminal |
| `Ctrl+Alt+k` | Which-key overlay (all bindings) |

### 3.3 Scrolling the conversation
| Key | Action |
|-----|--------|
| `PageUp` / `Ctrl+Alt+b` | Page up |
| `PageDown` / `Ctrl+Alt+f` | Page down |
| `Ctrl+Alt+u` / `Ctrl+Alt+d` | Half page up / down |
| `Ctrl+g` / `Home` | Jump to first |
| `Ctrl+Alt+g` / `End` | Jump to last |
| `Ctrl+Alt+y` / `Ctrl+Alt+e` | Line up / down |

### 3.4 Input / prompt editing (readline-style)
| Key | Action |
|-----|--------|
| `Return` | Submit message |
| `Shift+Return` / `Ctrl+Return` / `Ctrl+j` | Newline (no submit) |
| `Ctrl+c` | Clear input |
| `Ctrl+u` / `Ctrl+k` | Kill to line start / end |
| `Ctrl+w` | Kill previous word |
| `Ctrl+a` / `Ctrl+e` | Start / end of line |
| `Ctrl+←` / `Ctrl+→` | Word back / forward |
| `Tab` | Accept autocomplete |
| `↑` / `↓` | History previous / next |
| `@` | Fuzzy file reference; `!` prefix = run shell cmd |

### 3.5 Attention / notifications (`tui.json`)
`attention` is **enabled** with sound (`volume 0.4`) and desktop
notifications for questions, permissions, errors, and finished sessions.

### 3.6 Slash commands
`/help`, `/init`, `/models`, `/sessions`, `/compact`, `/share`,
`/unshare`, `/thinking`, `/details`, `/connect`, `/themes`, `/export`,
`/editor`, `/new`, `/undo`, `/redo`.

---

## 4. Shell & Git (`.zshrc`, `.zsh-aliases`, `.gitconfig`)

### 4.1 Useful shell aliases
| Alias | Expands to |
|-------|-----------|
| `nv` / `nvim` | Custom nvim build (`Tools/nvim_env/...`) |
| `g` | `git` |
| `gs` / `ga` / `gc` / `gco` | git status / add / commit / checkout |
| `gd` | `git diff --color` |
| `gl` | Pretty graph git log |
| `rr` / `rrg` | `rake routes` (+ grep) |
| `tns` | tmux: new/attach session named after CWD |
| `rubocop` | Homedir rubocop with custom config |
| `mg` | `grep -R` excluding log/tmp/coverage |
| `cds`/`cdw`/`cdb`/`cdz`/... | cd shortcuts into `~/My_Space/...` |
| `ms_find_dir` | `fd` dir search under `~/My_Space` |

### 4.2 Git config (`delta` diff, zdiff3)
| Alias / setting | Meaning |
|-----------------|---------|
| `co/br/ci/st` | checkout / branch / commit / status |
| `fixtypo` | `commit --amend --no-edit` |
| `resetmerge` | `reset --merge ORIG_HEAD` |
| `patch` | `format-patch -1 HEAD` |
| `delta` pager | Side-by-side, line numbers, `n`/`N` navigate diffs |
| `conflictStyle = zdiff3` | Merge conflict style |
| `diff.tool = meld` | `git difftool` uses meld |

### 4.3 `vi-mode` (Oh-My-Zsh plugin)
Zsh line editing uses vim keys (`ESC` → normal mode, `i`/`a` → insert).
This is separate from Neovim/tmux keybindings.

---

## 5. Terminal emulators

### 5.1 wezterm
- `enable_csi_u_key_encoding = true` (accurate modified keys).
- `Shift+Enter` → sends literal newline (unique sequence).
- `Ctrl+C` → copy to clipboard **and** primary selection.

### 5.2 alacritty
- Font: **Hack Nerd Font Mono** at size 12 (bold/italic variants).
- No custom keybindings set (uses Alacritty defaults).

---

## Quick mental model
- **nvim leader** = `<Space>` · **tmux prefix** = `C-a` · **opencode leader** = `Ctrl+x`
- Inside tmux, your nvim `<C-h/j/k/l>` pane nav and opencode are nested —
  press `C-a` first to reach tmux, then the key.
- Conflicts to watch: nvim `<Leader>a` (harpoon) vs Avante `<Leader>a*`;
  nvim `gb` remapped (no block-comment default).
