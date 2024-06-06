return { -- Autocompletion
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{ -- snippets
			"L3MON4D3/LuaSnip",
		},

		{ -- cmp_luasnip
			"saadparwaiz1/cmp_luasnip",
		},

		{ -- cmp nvim lsp
			"hrsh7th/cmp-nvim-lsp",
		},

		{ -- cpm path
			"hrsh7th/cmp-path",
		},
	},
	config = function()
		local cmp = require("cmp")
		if not cmp then
			return
		end

		local luasnip = require("luasnip")
		if not luasnip then
			return
		end

		local lsp_symbols = {
			Text = "   (Text) ",
			Method = "   (Method)",
			Function = "   (Function)",
			Constructor = "   (Constructor)",
			Field = " ﴲ  (Field)",
			Variable = "[] (Variable)",
			Class = "   (Class)",
			Interface = " ﰮ  (Interface)",
			Module = "   (Module)",
			Property = " 襁 (Property)",
			Unit = "   (Unit)",
			Value = "   (Value)",
			Enum = " 練 (Enum)",
			Keyword = "   (Keyword)",
			Snippet = "   (Snippet)",
			Color = "   (Color)",
			File = "   (File)",
			Reference = "   (Reference)",
			Folder = "   (Folder)",
			EnumMember = "   (EnumMember)",
			Constant = " ﲀ  (Constant)",
			Struct = " ﳤ  (Struct)",
			Event = "   (Event)",
			Operator = "   (Operator)",
			TypeParameter = "   (TypeParameter)",
			Copilot = " (Copilot)",
			Codeium = " (Codeium)",
			DB = "󰆼 (DataBase)",
		}

		cmp.setup({
			sources = {
				{ name = "buffer" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "neorg" },
				{ name = "codeium" },
			},
			mapping = {
				["<cr>"] = cmp.mapping.confirm({ select = true }),
				["<s-tab>"] = cmp.mapping.select_prev_item(),
				["<tab>"] = cmp.mapping.select_next_item(),
				-- map the toggle menu to controle space
				["<C-x>"] = cmp.mapping({
					i = function()
						if cmp.visible() then
							cmp.abort()
						else
							cmp.complete()
						end
					end,
					c = function()
						if cmp.visible() then
							cmp.close()
						else
							cmp.complete()
						end
					end,
				}),
			},
			formatting = {
				fields = { "abbr", "kind", "menu" },
				expandable_indicator = true,
				format = function(entry, item)
					item.kind = lsp_symbols[item.kind]
					item.menu = ({
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[Snippet]",
						neorg = "[Neorg]",
					})[entry.source.name]

					return item
				end,
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
		})
	end,
}
