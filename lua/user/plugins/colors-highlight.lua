return {
	"brenoprata10/nvim-highlight-colors",
	event = "VeryLazy",

	config = function()
		require("nvim-highlight-colors").setup({
			enable_tailwind = true,
			render = "background",
			enable_named_colors = true,
		})
	end,
}
