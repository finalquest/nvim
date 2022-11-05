local tsetup, telescope = pcall(require, "telescope")
if not tsetup then
  return
end

local asetup, actions = pcall(require, "telescope.actions")
if not asetup then
  return
end


require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,

		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

	extensions = { 
		fzf = {
      fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
      case_mode = 'smart_case'
		},
	},
		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
                ["<CR>"] = actions.select_default,
			},
		},
	},
    --[[
    ]]
})
require("telescope").load_extension("git_worktree")
require("telescope").load_extension("fzf")

