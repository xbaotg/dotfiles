local M = {}

M.ui = {
  theme = "nightfox",
}

M.plugins = {
  ["lambdalisue/suda.vim"] = {},
  ["NvChad/ui"] = {
    override_options = {
      statusline = {
        separator_style = "block",
        enabled = false,
        overriden_modules = function()
          return require "custom.plugins.statusline"
        end,
      },
      tabufline = {
        lazyload = false, -- to show tabufline by default
        enabled = false,
      },
    },
  },
  ["akinsho/toggleterm.nvim"] = {
    config = function()
      require "custom.plugins.toggleterm"
    end,
  },
  -- ["tpope/vim-surround"] = {},
  -- ["hrsh7th/cmp-nvim-lsp-signature-help"] = {
  --   after = "cmp-path",
  -- },
  ["Vimjas/vim-python-pep8-indent"] = {},
  ["williamboman/nvim-lsp-installer"] = {
    before = "lspconfig",
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["mhartington/formatter.nvim"] = {
    config = function()
      require "custom.plugins.formatter"
    end,
  },
  -- ["aserowy/tmux.nvim"] = {
  --   config = function()
  --     require("tmux").setup()
  --   end,
  -- },
  ["romgrk/barbar.nvim"] = {
    require = "kyazdani42/nvim-web-devicons",
    before = "NvChad/ui",
    config = function()
      require "custom.plugins.barbar"
    end,
  },
  ["mhinz/vim-sayonara"] = {},
  ["glepnir/lspsaga.nvim"] = {
    config = function()
      require "custom.plugins.lspsaga"
    end,
  },
  ["onsails/lspkind.nvim"] = {},
  -- ["tzachar/cmp-tabnine"] = {
  --   run = "./install.sh",
  --   after = "nvim-cmp",
  --   requires = "hrsh7th/nvim-cmp",
  --   config = function()
  --     local tabnine = require "cmp_tabnine.config"
  --     tabnine.setup {
  --       max_lines = 1000,
  --       max_num_results = 20,
  --       sort = true,
  --       run_on_every_keystroke = true,
  --       snippet_placeholder = "..",
  --       ignored_file_types = {},
  --       show_prediction_strength = true,
  --     }
  --   end,
  -- },
  ["abecodes/tabout.nvim"] = {
    wants = { "nvim-treesitter" }, -- or require if not used so far
    -- after = { "nvim-cmp" },
    config = function()
      require("tabout").setup {
        tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = "<C-d>", -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {}, -- tabout will ignore these filetypes
      }
    end,
  },
  ["alvan/vim-closetag"] = {},
  ["EdenEast/nightfox.nvim"] = {},
  ["mbbill/undotree"] = {},
  -- ["echasnovski/mini.nvim"] = {},
  -- ["echasnovski/mini.animate"] = {
  --   config = function ()
  --     require('mini.animate').setup()
  --   end
  -- },
  -- ["echasnovski/mini.jump"] = {
  --   config = function ()
  --     require('mini.jump').setup()
  --   end
  -- },
  -- ["echasnovski/mini.move"] = {
  --   config = function()
  --     require("mini.move").setup()
  --   end,
  -- },
  ["karb94/neoscroll.nvim"] = {
    config = function()
      require("neoscroll").setup()
    end,
  },
  ["p00f/cphelper.nvim"] = {},
  ['alexghergh/nvim-tmux-navigation'] = {
    config = function()
      local nvim_tmux_nav = require('nvim-tmux-navigation')

      nvim_tmux_nav.setup {
          disable_when_zoomed = true -- defaults to false
      }

      vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end
  }
}

M.mappings = {
  disabled = {
    n = {
      ["<leader>/"] = "",
      ["<Bslash>"] = "",
      ["<C-c>"] = "",
    },
    v = {
      ["<leader>/"] = "",
    },
  },
  general = {
    i = {
      ["<C-c>"] = { "<Esc><cmd>noh<CR>" },
    },
    n = {
      ["<C-c>"] = { "<cmd>noh<CR>" },
      ["<C-a>"] = { 'ggVG"+y<CR>' },
      ["<leader>q"] = { "<cmd> Sayonara<CR>" },
      ["<leader>Q"] = { "<cmd> Sayonara!<CR>" },
    },
  },

  comment = {
    n = {
      ["<C-_>"] = {
        function()
          require("Comment.api").toggle.linewise.current()
        end,
      },
    },

    v = {
      ["<C-_>"] = {
        "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
        "toggle comment",
      },
      ["<leader>y"] = {
        '"+y',
      },
    },
  },

  formatter = {
    n = {
      ["<leader>f"] = {
        "<cmd>Format<CR>",
      },
    },
  },

  buffer = {
    n = {
      ["<Tab>"] = {
        "<cmd>bn<CR>",
      },
      ["<S-Tab>"] = {
        "<cmd>bp<CR>",
      },
    },
  },

  lsp_saga = {
    n = {
      ["[e"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts = { silent = true } },
      ["]e"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", opts = { silent = true } },
      ["[E"] = {
        function()
          require("lspsaga.diagnostic").goto_prev { severity = vim.diagnostic.severity.ERROR }
        end,
        opts = { silent = true },
      },
      ["]E"] = {
        function()
          require("lspsaga.diagnostic").goto_next { severity = vim.diagnostic.severity.ERROR }
        end,
        opts = { silent = true },
      },
      ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", opts = { silent = true } },
      ["<leader>sld"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", opts = { silent = true } },
      ["<leader>hd"] = { "<cmd>Lspsaga hover_doc<CR>", opts = { silent = true } },
      ["gh"] = { "<cmd>Lspsaga lsp_finder<CR> ", opts = { silent = true } },
      ["<A-d>"] = { "<cmd> Lspsaga term_toggle<CR>", opts = { silent = true } },
    },

    v = {
      ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR> ", opts = { silent = true } },
      ["<A-d>"] = { "<cmd> Lspsaga term_toggle<CR>", opts = { silent = true } },
    },

    t = {
      ["<A-d>"] = { "<cmd> Lspsaga term_toggle<CR>", opts = { silent = true } },
    },
  },
}

return M
