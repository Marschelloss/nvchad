require "nvchad.mappings"

local map = vim.keymap.set

-- Normal Mode
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>f<leader>", "<cmd>Telescope resume<cr>", { desc = "Buffer close" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("n", "<leader>d/", "<cmd>noh<cr>", { desc = "Turn off highlighting until the next search" })

map("n", "<ESC>", "<cmd>q<cr>", { desc = "Close buffer" })
map("n", "<leader>q", ":bdelete<cr>", { desc = "Buffer close" })

map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
map(
	"n",
	"<leader>E",
	"<cmd>NvimTreeToggle<cr><cmd>NvimTreeCollapse<cr>",
	{ desc = "Toggle NvimTree to the project root" }
)

map("n", "d", '"_d', { desc = "Delete without remove yank" })
map("n", "D", '"_D', { desc = "Delete without remove yank" })
map("n", "c", '"_c', { desc = "Replace without remove yank" })
map("n", "x", '"_x', { desc = "Remove without remove yank" })

map("n", "<S-Up>", '<cmd>lua MiniMove.move_line("up")<cr>', { desc = "Move - line up" })
map("n", "<S-Down>", '<cmd>lua MiniMove.move_line("down")<cr>', { desc = "Move - line down" })
map("n", "<S-Left>", '<cmd>lua MiniMove.move_line("left")<cr>', { desc = "Move - line left" })
map("n", "<S-Right>", '<cmd>lua MiniMove.move_line("right")<cr>', { desc = "Move - line right" })
map("n", "<S-k>", '<cmd>lua MiniMove.move_line("up")<cr>', { desc = "Move - line up" })
map("n", "<S-j>", '<cmd>lua MiniMove.move_line("down")<cr>', { desc = "Move - line down" })
map("n", "<S-h>", '<cmd>lua MiniMove.move_line("left")<cr>', { desc = "Move - line left" })
map("n", "<S-l>", '<cmd>lua MiniMove.move_line("right")<cr>', { desc = "Move - line right" })

map("n", "C", "<cmd>%bd|e#<cr>", { desc = "Close all buffers except the current one" })
map(
	"n",
	"<leader>gg",
	--[[ '<cmd>lua require("nvchad.term").toggle { pos = "float", id = "floatTerm", cmd = "lazygit" }<CR>', ]]
	'<cmd>LazyGit<CR>',
	{ desc = "LazyGit" }
)

map({ "n", "v" }, "<leader>la", "<cmd>Lspsaga code_action<CR>", { desc = "Lsp Code action" })
map({ "n", "v" }, "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", { desc = "Lsp Documentation" })
map({ "n", "v" }, "<leader>ld", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = "Lsp cursor diagnostics" })

-- Simply remove if you want the default live_grep from telescope
map(
	{ "n", "v" },
	"<leader>fw",
	"<cmd>lua require('telescope.builtin').live_grep({ additional_args = { '--fixed-strings' }})<CR>",
	{ desc = "Search a string" }
)

map({ "n" }, "t", "<cmd>Telescope terms<CR>", { desc = "Terminal List" })

local lastTermIdUsed = 1

map({ "n" }, "<leader>t", function()
	require("nvchad.term").toggle({ pos = "float", id = lastTermIdUsed })
end, { desc = "Terminal Toggle Floating" })

for id = 1, 9 do
	map({ "n" }, id .. "<leader>t", function()
		require("nvchad.term").toggle({ pos = "float", id = id })
		lastTermIdUsed = id
	end, { desc = "Terminal Toggle to " .. id })
end

-- Harpoon
--[[ for num = 1, 9 do
	map({ "n" }, "<leader>" .. num, function()
		require("harpoon"):list():select(num)
	end, { desc = "Harpoon - Go to " .. num })
end ]]

-- Window
map("n", "|", '<cmd>vsplit<CR>', { desc = "Vertical Split"})
map("n", "\\", '<cmd>split<CR>', { desc = "Horizontal Split"})
map("v", "|", '<cmd>vsplit<CR>', { desc = "Vertical Split"})
map("v", "\\", '<cmd>split<CR>', { desc = "Horizontal Split"})

map("n", "<C-h>", '<cmd>wincmd h<CR>', { desc = "Move to left Window"})
map("n", "<C-j>", '<cmd>wincmd j<CR>', { desc = "Move to down Window"})
map("n", "<C-k>", '<cmd>wincmd k<CR>', { desc = "Move to up Window"})
map("n", "<C-l>", '<cmd>wincmd l<CR>', { desc = "Move to right Window"})

-- Visual mode
map("v", "d", '"_d', { desc = "Delete without remove yank" })
map("v", "D", '"_D', { desc = "Delete without remove yank" })
map("v", "p", '"_dP', { desc = "Paste without remove yank" })
map("v", "P", '"_dP', { desc = "Paste without remove yank" })

map("v", "<S-Up>", '<cmd>lua MiniMove.move_selection("up")<cr>', { desc = "Move - selection up" })
map("v", "<S-Down>", '<cmd>lua MiniMove.move_selection("down")<cr>', { desc = "Move - selection down" })
map("v", "<S-Left>", '<cmd>lua MiniMove.move_selection("left")<cr>', { desc = "Move - selection left" })
map("v", "<S-Right>", '<cmd>lua MiniMove.move_selection("right")<cr>', { desc = "Move - selection right" })
map("v", "<S-k>", '<cmd>lua MiniMove.move_selection("up")<cr>', { desc = "Move - selection up" })
map("v", "<S-j>", '<cmd>lua MiniMove.move_selection("down")<cr>', { desc = "Move - selection down" })
map("v", "<S-h>", '<cmd>lua MiniMove.move_selection("left")<cr>', { desc = "Move - selection left" })
map("v", "<S-l>", '<cmd>lua MiniMove.move_selection("right")<cr>', { desc = "Move - selection right" })

-- Terminal Mode
map("t", "<ESC>", '<C-\\><C-n>', { desc = "Exit Terminal Mode"})
map("t", "<S-ESC>", '<C-\\><C-n><cmd>q<CR>', { desc = "Exit Terminal Mode"})

