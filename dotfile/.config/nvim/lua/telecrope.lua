require('telescope').setup {
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case'
		},
		prompt_prefix = " ",
		selection_caret = " ",
		entry_prefix = "  ",
		borderchars = { '─', '│', '─', '│', '┼', '┼', '┼', '┼' },
		set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
	},
	extensions = {}
}

--Allow insert the search_dirs first
_G.open_telescope = function()
	Dir = vim.fn.input("Dir is: ", "~/")
	if Dir ~= "^C" then
		require("telescope.builtin").find_files({ search_dirs = { Dir }, hidden = true })
	end
end

vim.api.nvim_set_keymap('n', '<leader>ff', ':lua open_telescope()<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>fw', ':Telescope grep_string<CR>', { noremap = true, silent = false }) -- need ripgrep!!!

--compile c++
_G.cpp = function()
	vim.cmd([[exec '!g++ -o a.out %']])
	vim.cmd([[exec '!alacritty -e ./a.out &']])
	vim.cmd([[exec "!alacritty -e bash -c './a.out && bash'"]])
	vim.cmd([[exec '!rm a.out']])
end
vim.api.nvim_set_keymap('n', '<leader>cpp', ':lua cpp()<cr>', { noremap = true, silent = true })

--compile java
_G.java = function()
	vim.cmd([[exec '!javac %']])
	vim.cmd([[exec "!alacritty -e bash -c 'java % && bash'"]])
end
vim.api.nvim_set_keymap('n', '<leader>jj', ':lua java()<cr>', { noremap = true, silent = true })
