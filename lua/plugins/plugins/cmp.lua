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

		local symbols = {
			Text = "󰉿",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰜢",
			Variable = "󰀫",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "󰑭",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "󰈇",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "󰙅",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰊄",
			Copilot = "",
			Codeium = "",
			DB = "󰆼",
		}
		local names = {
			Text = " Text",
			Method = " Method",
			Function = " Function",
			Constructor = " Constructor",
			Field = " Field",
			Variable = " Variable",
			Class = " Class",
			Interface = " Interface",
			Module = " Module",
			Property = " Property",
			Unit = " Unit",
			Value = " Value",
			Enum = " Enum",
			Keyword = " Keyword",
			Snippet = " Snippet",
			Color = " Color",
			File = " File",
			Reference = " Reference",
			Folder = " Folder",
			EnumMember = " EnumMember",
			Constant = " Constant",
			Struct = " Struct",
			Event = " Event",
			Operator = " Operator",
			TypeParameter = " TypeParameter",
			Copilot = " Copilot",
			Codeium = " Codeium",
			DB = " DataBase",
		}
		local sources = {
			buffer = "Buffer",
			nvim_lsp = "Lsp",
			luasnip = "Snippet",
			neorg = "Neorg",
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
					item.kind = symbols[item.kind] .. " " .. names[item.kind]
					item.menu = sources[entry.source.name]

					return item
				end,
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})
	end,
}
