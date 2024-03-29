require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "javascript", "rust", "typescript", "json", "tsx" },
	sync_install = false,

	indent = { enable = true },
	autotag = { enable = true },

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
