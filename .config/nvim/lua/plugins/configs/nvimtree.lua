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
      "^.nix"
    },
    exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
  },
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = { "alpha" },
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  auto_close = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    adaptive_size = true,
    side = "left",
    width = 25,
    hide_root_folder = true,
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
      resize_window = true,
    },
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

-- nvim-tree is also there in modified buffers so this function filter it out
-- local modifiedBufs = function(bufs)
--     local t = 0
--     for k,v in pairs(bufs) do
--         if v.name:match("NvimTree_") == nil then
--             t = t + 1
--         end
--     end
--     return t
-- end
--
-- vim.api.nvim_create_autocmd("BufEnter", {
--     nested = true,
--     callback = function()
--         if #vim.api.nvim_list_wins() == 1 and
--         vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
--         modifiedBufs(vim.fn.getbufinfo({bufmodified = 1})) == 0 then
--             vim.cmd "quit"
--         end
--     end
-- })
