-- some config --
vim.g.mapleader = "\\"

vim.cmd [[ set relativenumber ]]
vim.cmd [[
cnoreabbrev <expr>  q   v:char =~ "!" ? "q" : "Sayonara"
cnoreabbrev <expr>  wq  v:char =~ "!" ? "wq" : "w<bar>Sayonara"
cnoreabbrev         wq! w<bar>BufDel!
cnoreabbrev         q!  Sayonara!
cnoreabbrev <expr>  w   v:char =~ "!" ? "q" : "silent! w"
]]

-------------------------------------------------
local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

local term_cpp = require("toggleterm.terminal").Terminal:new {
  cmd = "g++ -g -Wno-deprecated-declarations -Wdeprecated-declarations -std=c++11 -o"
    .. vim.fn.expand "%:t:r"
    .. " "
    .. vim.fn.expand "%"
    .. " && ./"
    .. vim.fn.expand "%:t:r",
  close_on_exit = false,
}

local term_c = require("toggleterm.terminal").Terminal:new {
  cmd = "gcc -fsanitize=address -o"
    .. vim.fn.expand "%:t:r"
    .. " "
    .. vim.fn.expand "%"
    .. " && ./"
    .. vim.fn.expand "%:t:r",
  close_on_exit = false,
}

function run_cpp()
  term_cpp:toggle()
end

function run_c()
  term_c:toggle()
end

autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    opt.shiftwidth = 4
    opt.tabstop = 4

    vim.api.nvim_buf_set_keymap(0, "n", "<leader>r", "<cmd> lua run_cpp()<CR>", { silent = true })
  end,
})

autocmd("FileType", {
  pattern = "c",
  callback = function()
    opt.shiftwidth = 2
    opt.tabstop = 2

    vim.api.nvim_buf_set_keymap(0, "n", "<leader>r", "<cmd> lua run_c()<CR>", { silent = true })
  end,
})

local term_python = require("toggleterm.terminal").Terminal:new {
  cmd = "python3 " .. vim.fn.expand "%",
  close_on_exit = false,
}

function run_python()
  term_python:toggle()
end

autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>r", "<cmd>lua run_python()<CR>", { silent = true })
  end,
})

-- hide terminal from buffers
vim.cmd [[
augroup rc
au!
au TermOpen * setlocal nobuflisted
au TermOpen * :file term
augroup END
]]

-- tmux-nvim statusline: bug with horizon split
vim.cmd [[
set fcs+=stlnc:-
set fcs+=stl:-
]]

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

vim.cmd [[ set noswapfile ]]

vim.cmd [[
set foldmethod=syntax
set foldlevelstart=1
set foldlevel=99
set foldmethod=marker
]]

vim.cmd [[
set scrolloff=5
]]
