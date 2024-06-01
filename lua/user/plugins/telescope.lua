return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod

		local trouble = require("trouble")
		local trouble_telescope = require("trouble.sources.telescope")

		-- or create your custom action
		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix")
			end,
		})

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						["<C-t>"] = trouble_telescope.open,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = require("which-key") -- for conciseness
		keymap.register({
			["<leader>bb"] = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },

			["<leader>fb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			["<leader>fc"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
			["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find files" },
			["<leader>fp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
			["<leader>ft"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
			["<leader>fs"] = { "<cmd>Telescope grep_string<cr>", "Find String" },
			["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help" },
			["<leader>fH"] = { "<cmd>Telescope highlights<cr>", "Highlights" },
			["<leader>fi"] = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
			["<leader>fl"] = { "<cmd>Telescope resume<cr>", "Last Search" },
			["<leader>fM"] = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
			["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
			["<leader>fR"] = { "<cmd>Telescope registers<cr>", "Registers" },
			["<leader>fk"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			["<leader>fC"] = { "<cmd>Telescope commands<cr>", "Commands" },

			["<leader>go"] = { "<cmd>Telescope git_status<cr>", "Open changed file" },
			["<leader>gb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			["<leader>gc"] = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
			["<leader>gC"] = {
				"<cmd>Telescope git_bcommits<cr>",
				"Checkout commit(for current file)",
			},

			["<leader>ls"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			["<leader>lS"] = {
				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				"Workspace Symbols",
			},
			["<leader>le"] = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
		})
	end,
}
