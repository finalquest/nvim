
local Remap = require("finalquest.keymap")
local nmap = Remap.nmap

nmap("x", '"_x"')

nmap("<leader>sv", "<C-w>v")
nmap("<leader>sh", "<C-w>s")
nmap("<leader>se", "<C-w>=")
nmap("<leader>sx", ":close<CR>")


