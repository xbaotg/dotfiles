local fn = vim.fn
local sep_style = vim.g.statusline_sep_style
local separators = (type(sep_style) == "table" and sep_style)
    or require("nvchad_ui.icons").statusline_separators[sep_style]
local sep_l = separators["left"]
local sep_r = separators["right"]
local st = require "nvchad_ui.statusline.modules"

return {
  mode = function()
    return st.mode()
  end,

  cwd = function()
    return ""
  end,

  LSP_status = function()
    return ""
  end,

  LSP_Diagnostics = function()
    if not rawget(vim, "lsp") then
      return ""
    end

    local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

    errors = (errors and errors > 0) and ("%#St_lspError#" .. "[E] " .. errors .. " ") or ""
    warnings = (warnings and warnings > 0) and ("%#St_lspWarning#" .. "[W] " .. warnings .. " ") or ""

    return errors .. warnings
  end,

  LSP_progress = function()
    return ""
  end,

  cursor_position = function()
    return ''
  end,

  git = function()
    return ""
  end
}
