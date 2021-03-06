-- install packer
local path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local repo = "https://github.com/wbthomason/packer.nvim"

if vim.fn.empty(vim.fn.glob(path)) > 0 then
  print("Installing packer.nvim…")
  vim.fn.system({"git", "clone", repo, path})
  vim.cmd("packadd packer.nvim")
  vim.cmd("PackerSync")
  print("packer.nvim installed!")
end

vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile ]])

-- load plugins
local startup = function(use)
  -- Packer can manage itself
  use {"wbthomason/packer.nvim"}

  -- Startup
  use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.opts)
    end
  }

  -- Colorscheme / Themes
  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

  -- Developments
  use 'jiangmiao/auto-pairs'

  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup{
        direction = 'float',
      }
    end
  }

  use({
    "tpope/vim-fugitive",
    requires = { "tpope/vim-rhubarb" },
    config = function()
      local opts = { noremap = true, silent = true }
      local mappings = {
        { "n", "<leader>gc", [[<Cmd>Git commit<CR>]], opts },
        { "n", "<leader>gp", [[<Cmd>Git push<CR>]], opts },
        { "n", "<leader>gs", [[<Cmd>G<CR>]], opts },
      }

      for _, m in pairs(mappings) do
        vim.api.nvim_set_keymap(unpack(m))
      end
    end,
  })
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require("config.gitsigns")
    end
  }

  -- Notify
  use {
    'rcarriga/nvim-notify',
    config = function ()
      require('config.notify')
    end
  }

  -- GOLang
  use({ "fatih/vim-go", run = ":GoUpdateBinaries", ft = { "go" } })

  -- Searching Files/Tags
  use { 'ibhagwan/fzf-lua',
    requires = {
      'vijaymarupudi/nvim-fzf',
      'kyazdani42/nvim-web-devicons'
    }
  }

  -- Colorize
  use {
    'norcalli/nvim-colorizer.lua',
    config = function ()
      require'colorizer'.setup()
    end
  }

  -- Syntax highlight
  use {
    "nvim-treesitter/nvim-treesitter",
    run = "TSUpdate",
    config = function()
      require("config.treesitter")
    end,
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    requires = {{"williamboman/nvim-lsp-installer"}},
    config = function()
      require("config.lsp")
    end,
  }

  -- Completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "f3fora/cmp-spell",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "saadparwaiz1/cmp_luasnip",
      "quangnguyen30192/cmp-nvim-tags",
      "lukas-reineke/cmp-rg",
      "petertriho/cmp-git",
    },
    config = function()
      require("config.cmp")
    end,
  }
  use {
    "mhartington/formatter.nvim",
    config = function()
      require("config.formatter")
    end,
  }
  use {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("config.symbols_outline")
    end,
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("config.trouble")
    end,
  }

  use {"npxbr/go.nvim", requires = {"nvim-lua/plenary.nvim"}, ft = {"go"}}
  use {"folke/lua-dev.nvim", ft = {"lua"}}
  use {"fladson/vim-kitty"}

  -- code comments
  use {
    "b3nj5m1n/kommentary",
    config = function()
      require("config.kommentary")
    end,
  }

  -- Buffer
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function ()
      require("bufferline").setup{}
    end
  }

  -- Folders
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

  -- status & tab lines
  use {
    "hoob3rt/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons", opt = true},
    config = function()
      require("config.lualine")
    end,
  }
  use {
    "jose-elias-alvarez/buftabline.nvim",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = function()
      require("config.buftabline")
    end,
  }

  -- visual hints
  use {"markonm/traces.vim"}
  use {
    "winston0410/range-highlight.nvim",
    requires = {"winston0410/cmd-parser.nvim"},
    config = function()
      require("config.traces")
    end,
  }
  use {"lukas-reineke/indent-blankline.nvim"}
  use {
    "ntpeters/vim-better-whitespace",
    config = function()
      require("config.better_whitespace")
    end,
  }
  use {"tversteeg/registers.nvim"}

  -- navigation & selection
  use {
    "phaazon/hop.nvim",
    as = "hop",
    config = function()
      require("config.hop")
    end,
  }
  use {
    "terryma/vim-expand-region",
    config = function()
      require("config.expand_region")
    end,
  }

  -- Packer Sync
  if packer_bootstrap then
    require('packer').sync()
  end

end

return require("packer").startup(startup)
