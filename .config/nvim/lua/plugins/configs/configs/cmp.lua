local present, cmp = pcall(require, "cmp")
-- local luasnip = require "luasnip"
--
-- local has_words_before = function()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
-- end

if not present then
  return
end
require("base46").load_highlight "cmp"

vim.o.completeopt = "menu,menuone,noselect"

-- local function border(hl_name)
--   return {
--     { "╭", hl_name },
--     { "─", hl_name },
--     { "╮", hl_name },
--     { "│", hl_name },
--     { "╯", hl_name },
--     { "─", hl_name },
--     { "╰", hl_name },
--     { "│", hl_name },
--   }
-- end

local cmp_window = require "cmp.utils.window"

cmp_window.info_ = cmp_window.info
cmp_window.info = function(self)
  local info = self:info_()
  info.scrollable = false
  return info
end

local options = {
  completion = { completeopt = "menu,menuone,noinsert" },
  window = {
    completion = {
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
      -- border = border "CmpBorder",
      -- col_offset = -1,
      -- side_padding = 0,
    },
    documentation = {
      -- border = border "CmpDocBorder",
    },
  },
  -- snippet = {
  --   expand = function(args)
  --     require("luasnip").lsp_expand(args.body)
  --   end,
  -- },
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = require("lspkind").cmp_format {
      with_text = false,
    },
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
    -- ["<Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   elseif has_words_before() then
    --     cmp.complete()
    --   else
    --     fallback()
    --   end
    -- end, { "i", "s" }),
    --
    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    -- { name = "nvim_lsp_signature_help" },
  }, {
    { name = "path" },
  }, {
    { name = "nvim_lsp" },
  }, {
    { name = "calc" },
    { name = "vsnip" },
    { name = "emoji" },
  }, {
    { name = "buffer" },
  }),
  -- sources = cmp.config.sources({
  --   { name = "cmp_tabnine", priority = 8 },
  --   { name = "nvim_lsp", priority = 8 },
  --   -- { name = "nvim_lsp_signature_help" },
  --   { name = "nvim_lua", priority = 5 },
  --   { name = "luasnip", priority = 7 },
  --   { name = "path", priority = 4 },
  -- }, {
  --   { name = "buffer", keyword_length = 7 },
  -- }),
  -- sorting = {
  --   priority_weight = 2,
  --   comparators = {
  --     require "cmp_tabnine.compare",
  --     cmp.locality,
  --     cmp.recently_used,
  --     cmp.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
  --     cmp.offset,
  --     cmp.order,
  --     -- deprioritize_snippet,
  --     -- cmp.config.compare.offset,
  --     -- cmp.config.compare.exact,
  --     -- cmp.config.compare.scopes,
  --     -- cmp.config.compare.score,
  --     -- cmp.config.compare.recently_used,
  --     -- cmp.config.compare.locality,
  --     -- cmp.config.compare.kind,
  --     -- cmp.config.compare.sort_text,
  --     -- cmp.config.compare.length,
  --     -- cmp.config.compare.order,
  --   },
  -- },
}

-- check for any override
options = require("core.utils").load_override(options, "hrsh7th/nvim-cmp")

cmp.setup(options)
cmp.setup.cmdline("/", {
  sources = {
    { name = "nvim_lsp_document_symbol" },
    { name = "buffer" },
  },
})
cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
