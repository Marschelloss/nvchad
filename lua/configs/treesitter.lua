local options = {
	ensure_installed = {
		-- Lua & Vim
		"lua",
		"vim",
		"vimdoc",

		-- JS/TS related
		"javascript",
		"typescript",
		"tsx",
		"astro",

		-- Generic files
		"json",
		"regex",
		"bash",
		"gitignore",
		"markdown",
		"markdown_inline",
		"dockerfile",
		"yaml",

		-- Web / App related
		"graphql",
		"css",
		"html",

		-- Others
		"hyprlang",
		"csv",
    "c",
    "devicetree",
	},

	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = { enable = true },
}

return options
