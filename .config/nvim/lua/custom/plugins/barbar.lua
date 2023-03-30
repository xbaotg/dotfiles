vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "NvimTree" then
      require("bufferline.api").set_offset(31, "FileTree")
    end
  end,
})

vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*",
  callback = function()
    if vim.fn.expand("<afile>"):match "NvimTree" then
      require("bufferline.api").set_offset(0)
    end
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    require("bufferline").setup {
      animation = true,
      auto_hide = true,
    }
  end,
})
