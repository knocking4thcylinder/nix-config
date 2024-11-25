return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal<CR>", {})
		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "rounded",
			default_component_config = {
				indent = {
					padding = 0,
				},
				window = {
					position = "right",
					width = 35,
				},
			},
		})
	end,
}
