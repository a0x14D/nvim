return {
	"lethc/bracey.vim",
	build = "npm install --prefix server",
	dependencies = {
		"barrett-ruth/live-server.nvim",
		"ray-x/web-tools.nvim",
	},

	config = function()
		require("live-server").setup()
		require("web-tools").setup()
	end,
}
