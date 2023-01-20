local nnoremap = require("finalquest.keymap").nnoremap
local nmap = require("finalquest.keymap").nmap
nnoremap("<leader>pv", "<cmd>Ex<CR>")
nmap("<c-k>", "<cmd>wincmd k <CR>")
nmap("<c-j>", "<cmd>wincmd j <CR>")
nmap("<c-l>", "<cmd>wincmd l <CR>")
nmap("<c-h>", "<cmd>wincmd h <CR>")
nnoremap("<leader>n", "<cmd>NvimTreeFocus<CR>")
nnoremap("<C-t>", "<cmd>NvimTreeToggle<CR>")
nnoremap("<C-f>", "<cmd>NvimTreeFindFile<CR>")
nnoremap("<leader>nc", "<cmd>NvimTreeCollapse<CR>")
nnoremap("ZS", ":w<cr>")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
