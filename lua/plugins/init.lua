return {
  -- Visual
  {
    event = "VeryLazy",
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    config = function()
      vim.opt.termguicolors = true

      require("nvim-highlight-colors").setup {
        custom_colors = {
          { label = "bg%-accent", color = "#3D27C2FF" },
          { label = "bg%-elevated%-primary", color = "#FFFDF7FF" },
          { label = "bg%-elevated%-secondary", color = "#FFFBE9FF" },
          { label = "bg%-elevated%-tertiary", color = "#FFFDF7FF" },
          { label = "bg%-primary", color = "#FFFDF7FF" },
          { label = "bg%-secondary", color = "#FFFBE9FF" },
          { label = "bg%-tertiary", color = "#FFFDF7FF" },
          { label = "border%-accent", color = "#3D27C2FF" },
          { label = "border%-contrast%-max", color = "#131313FF" },
          { label = "border%-contrast%-max%-2", color = "#131313FF" },
          { label = "border%-contrast%-mid", color = "#BBBAC1FF" },
          { label = "border%-error", color = "#FF2123FF" },
          { label = "border%-success", color = "#259E4DFF" },
          { label = "btn%-primary", color = "#FFCD1FFF" },
          { label = "btn%-primary%-disabled", color = "#BBBAC1FF" },
          { label = "btn%-primary%-hover", color = "#F8D477FF" },
          { label = "btn%-primary%-pressed", color = "#F8D477FF" },
          { label = "ctn%-accent", color = "#3D27C2FF" },
          { label = "ctn%-accent%-2", color = "#D59856FF" },
          { label = "ctn%-accent%-3", color = "#FFEB9DFF" },
          { label = "ctn%-error", color = "#FF2123FF" },
          { label = "ctn%-error%-light", color = "#FFB8ACFF" },
          { label = "ctn%-success", color = "#57BC71FF" },
          { label = "ctn%-success%-hard", color = "#08813AFF" },
          { label = "ctn%-success%-light", color = "#ADDFB5FF" },
          { label = "ctn%-warning", color = "#F76C14FF" },
          { label = "icon%-primary", color = "#131313FF" },
          { label = "txt%-accent", color = "#3D27C2FF" },
          { label = "txt%-error", color = "#E20000FF" },
          { label = "txt%-inactif", color = "#8D8C91FF" },
          { label = "txt%-primary", color = "#131313FF" },
          { label = "txt%-secondary", color = "#19191CFF" },
          { label = "txt%-success", color = "#08813AFF" },
        },
      }
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      opts.git.enable = true
      opts.git.ignore = false
      opts.actions.open_file.quit_on_open = true
      opts.filters.dotfiles = false
      opts.view.float = {
        enable = true,
        quit_on_focus_loss = true,
        open_win_config = {
          relative = "editor",
          width = 40,
          height = 40,
          row = 2,
          col = 8,
          border = "rounded",
        },
      }
      opts.view.side = "right"
      opts.view.width = width
      opts.view.height = height
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("noice").setup {
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        lsp = {
          signature = {
            enabled = false,
          },
          hover = {
            enabled = false,
          },
        },
        progress = {
          enabled = false,
        },
        signature = { enabled = false },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
          ["vim.lsp.util.stylize_markdown"] = false,
          ["cmp.entry.get_documentation"] = false, -- requires hrsh7th/nvim-cmp
        },
      }
    end,
    init = function()
      vim.g.lsp_handlers_enabled = false
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    dependencies = { "jay-babu/project.nvim" },
    opts = function(_, opts)
      opts.patterns = { ".git" }
      require("telescope").load_extension "projects"
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    main = "rainbow-delimiters.setup",
  },
  {
    "jay-babu/project.nvim",
    main = "project_nvim",
    event = "VeryLazy",
    opts = { ignore_lsp = { "lua_ls" } },
  },

  -- Utils
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },
  {
    {
      "kdheepak/lazygit.nvim",
      cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
      },
      -- optional for floating window border decoration
      dependencies = {
        "nvim-telescope/telescope.nvim",
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      ---LHS of toggle mappings in NORMAL mode
      toggler = {
        line = "<leader><leader>/",
        block = "<leader>/",
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        line = "<leader><leader>/",
        block = "<leader>/",
      },
      mappings = {
        basic = true,
        extra = false,
      },
    },
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup()
    end,
  },
  {
    "echasnovski/mini.cursorword",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.cursorword").setup()
    end,
  },
  {
    "echasnovski/mini.move",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.move").setup()
    end,
  },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = { -- note how they're inverted to above example
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    keys = {
      { -- lazy style key map
        "<leader>u",
        "<cmd>Telescope undo<cr>",
        desc = "undo history",
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension "undo"
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "ray-x/lsp_signature.nvim",
      opts = {
        hint_enable = true, -- disable hints as it will crash in some terminal
      },
    },
  },

  -- Override plugin definition options
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
  },
  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- Better code action UI
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {}
    end,
  },
}
