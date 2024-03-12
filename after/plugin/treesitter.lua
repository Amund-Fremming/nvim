require("nvim-treesitter.install").prefer_git = true

require'nvim-treesitter.configs'.setup {
	ensure_installed = { "javascript", "typescript", "c_sharp", "c", "lua", "vim" },

	sync_install = false,

	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	}
}
