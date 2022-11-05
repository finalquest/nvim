local Remap = require("finalquest.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local cmp_nvim_status, cmp_nvim = pcall(require, "cmp_nvim_lsp")
print "antessssss"
if not cmp_nvim_status then
  print "AAAAAAAA" 
  return
end

-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
	youtube = "[Suck it YT]",
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			-- vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)

			-- For `ultisnips` user.
			-- vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),

	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			if entry.source.name == "cmp_tabnine" then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = entry.completion_item.data.detail .. " " .. menu
				end
				vim_item.kind = ""
			end
			vim_item.menu = menu
			return vim_item
		end,
	},

	sources = {
		-- tabnine completion? yayaya

		{ name = "nvim_lsp" },

		-- For vsnip user.
		-- { name = 'vsnip' },

		-- For luasnip user.
		{ name = "luasnip" },
    { name = "path"},

		-- For ultisnips user.
		-- { name = 'ultisnips' },

		{ name = "buffer" },

	},
})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		on_attach = function(client, bufnr)

      -- if client.server_capabilities.documentFormattingProvider then
      --   vim.api.nvim_command [[augroup Format]]
      --   vim.api.nvim_command [[autocmd! * <buffer>]]
      --   vim.api.nvim_command [[autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
      --   vim.api.nvim_command [[augroup END]]
      -- end 
			nnoremap("gd","<cmd>Lspsaga peek_definition<CR>")
			nnoremap("gf","<cmd>Lspsaga lsp_finder<CR>")
			nnoremap("gD", function() vim.lsp.buf.declaration() end)
			nnoremap("gi", function() vim.lsp.buf.implementation() end)
			nnoremap("K", "<cmd>Lspsaga hover_doc<CR>")
			nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			nnoremap("<leader>ca","<cmd>Lspsaga code_action<CR>" )
			nnoremap("<leader>rn","<cmd>Lspsaga rename<CR>" )
			nnoremap("<leader>d","<cmd>Lspsaga show_line_diagnostics<CR>" )
			nnoremap("<leader>d","<cmd>Lspsaga show_cursor_diagnostics<CR>" )
			nnoremap("H", function() vim.diagnostic.open_float() end)
			nnoremap("[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
			nnoremap("]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
			nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
                filter = function(code_action)
                    if not code_action or not code_action.data then
                        return false
                    end

                    local data = code_action.data.id
                    return string.sub(data, #data - 1, #data) == ":0"
                end,
                apply = true
            }) end)
			nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
			inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end

local on_attach = function(client, bufnr)
end

local capabilities = cmp_nvim.default_capabilities()


require("lspconfig").tsserver.setup(config({
  capabilities = capabilities
}))
-- require("lspconfig").tsserver.setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   cmd = { "typescript-language-server", "--stdio"}
-- }

-- who even uses this?
require("lspconfig").rust_analyzer.setup(config({
	cmd = { "rustup", "run", "nightly", "rust-analyzer" },
	--[[
    settings = {
        rust = {
            unstable_features = true,
            build_on_save = false,
            all_features = true,
        },
    }
    --]]
}))

local opts = {
	-- whether to highlight the currently hovered symbol
	-- disable if your cpu usage is higher than you want it
	-- or you just hate the highlight
	-- default: true
	highlight_hovered_item = true,

	-- whether to show outline guides
	-- default: true
	show_guides = true,
}

require("symbols-outline").setup(opts)

local snippets_paths = function()
	local plugins = { "friendly-snippets" }
	local paths = {}
	local path
	local root_path = vim.env.HOME .. "/.vim/plugged/"
	for _, plug in ipairs(plugins) do
		path = root_path .. plug
		if vim.fn.isdirectory(path) ~= 0 then
			table.insert(paths, path)
		end
	end
	return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
	paths = snippets_paths(),
	include = nil, -- Load all languages
	exclude = {},
})
