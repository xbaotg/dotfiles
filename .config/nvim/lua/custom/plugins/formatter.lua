-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    cpp = {
      require("formatter.filetypes.cpp").clangformat,
    },
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    python = {
      require("formatter.filetypes.python").autopep8
    },
    html = {
      require("formatter.filetypes.html").prettier,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    css = {
      require("formatter.filetypes.css").prettier,
    },
    json = {
      require("formatter.filetypes.json").prettier,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
}
