vim.diagnostic.config {
  virtual_text = {
    severity = { min = vim.diagnostic.severity.ERROR },
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("nvim-lsp-installer").on_server_ready(function(server)
  local opt = {
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 20,
    },
  }
  if server.name == "clangd" then
    opt.cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--completion-style=bundled",
      "--header-insertion=never"
    }
  end

  if server.name == "sumneko_lua" then
    opt.settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.stdpath "config" .. "/lua"] = true,
          },
        },
        telemetry = { enable = false },
      },
    }
  end

  server:setup(opt)
end)
