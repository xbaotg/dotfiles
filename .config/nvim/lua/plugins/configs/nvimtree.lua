local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

require("base46").load_highlight "nvimtree"

local options = {
  filters = {
    dotfiles = true,
    custom = {
      "^.git$",
      "^.venv$",
      "^.idea$",
      "^__pycache__$",
      "^.gitignore$",
      "^.gitkeep$",
      "^.github$",
      "^.ipynb_checkpoints$",
      "^.nix",
    },
    exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
  },
  -- disable_netrw = false,
  -- hijack_netrw = false,
  -- open_on_setup = false,
  -- ignore_ft_on_setup = { "alpha" },
  -- hijack_cursor = false,
  -- hijack_unnamed_buffer_when_opening = false,
  -- update_cwd = true,
  -- auto_close = true,
  auto_reload_on_write = false,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  sort_by = "name",
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = true,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  on_attach = "disable",
  remove_keymaps = false,
  select_prompts = false,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    adaptive_size = false,
    side = "left",
    width = 30,
    hide_root_folder = true,
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  git = {
    enable = false,
    ignore = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = true,
    },
  },
  hijack_directories = {
    enable = false,
    auto_open = true,
  },
  renderer = {
    highlight_git = false,
    highlight_opened_files = "none",

    indent_markers = {
      enable = false,
    },

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },

      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}

-- check for any override
options = require("core.utils").load_override(options, "kyazdani42/nvim-tree.lua")
vim.g.nvimtree_side = options.view.side

nvimtree.setup(options)
