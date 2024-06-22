-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",

term = {
    -- hl = "Normal:term,WinSeparator:WinSeparator",
    -- sizes = { sp = 0.3, vsp = 0.2 },
    float = {
      relative = "editor",
      row = 0.1,
      col = 0.045,
      width = 0.9,
      height = 0.8,
      border = "single",
    },
  },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.plugins = "plugins"

M.ui.nvdash = {
  load_on_startup = true,

  header = {
    "           ",
    "           ",
    "           ",
    "           ",
    "           ",
    "  ⟋|､      ",
    " (°､ ｡ 7   ",
    " |､  ~ヽ   ",
    " じしf_,)〳",
  },

  buttons = {
    { "  Projects", "", "Telescope projects" },
    { "  Themes  ", "", "Telescope themes" },
    { "  Mappings", "", "NvCheatsheet" },
  },
}

return M
