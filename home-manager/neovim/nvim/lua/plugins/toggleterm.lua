return {
	"akinsho/toggleterm.nvim",
	config = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local Term = Terminal:new({
			direction = "float",
			float_opts = {
				border = "rounded",
			},
		})
		function _Term_toggle()
			Term:toggle()
		end

		require("toggleterm").setup({
			shell = "/bin/nu",
		})
		vim.keymap.set("n", "<C-\\>", "<CMD>lua _Term_toggle()<CR>")
	end,
}
