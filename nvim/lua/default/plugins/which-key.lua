return {
	"folke/which-key.nvim",
	event = "VeryLazy", -- tells LazyVim to load this plugin later
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 250 -- how long which-key will wait until it pops up, in ms
	end,
	opts = {},
}
