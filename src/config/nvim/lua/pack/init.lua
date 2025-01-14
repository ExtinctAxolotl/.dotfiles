local present, packer = pcall(require, "pack.cfg")
if not present then
  error("packer not found")
  return
end

local use = packer.use
packer.reset()

-- packer.nvim
return packer.startup(function()
  use({
    "wbthomason/packer.nvim", -- Packer manages itself hehe
    event = "VimEnter",
  })
  use({
    "lewis6991/impatient.nvim",
  })

  -- the colorscheme
  use({
    "RRethy/nvim-base16",
    config = function()
      require("theme")
    end,
  })

  -- LSP --

  -- nvim-lspconfig: why are you even asking?!
  use({
    "neovim/nvim-lspconfig",
    setup = function()
      require("core.mappings").lsp()
    end,
    config = function()
      require("configs.lsp")
    end,
    after = "nvim-lsp-installer",
  })

  use({
    "williamboman/nvim-lsp-installer",
  })

  -- TELESCOPE --

  -- telescope: can do basically everything
  use({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
    config = function()
      require("configs.telescope")
    end,
    setup = function()
      require("core.mappings").telescope()
    end,
  })

  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  })

  use({
    "stevearc/dressing.nvim",
    config = function()
      require("configs.others").dressing()
    end,
  })

  use({
    "mrjones2014/legendary.nvim",
    config = function()
      require("configs.others").legendary()
    end,
    setup = function()
      require("core.mappings").legendary()
    end,
  })
  -- CMP --
  -- nvim cmp: the best completion plugin
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require("configs.cmp")
    end,
  })

  use({
    "hrsh7th/cmp-nvim-lsp",
    after = "nvim-cmp",
  })
  use({
    "hrsh7th/cmp-nvim-lua",
    after = "nvim-cmp"
  })
  use({
    "hrsh7th/cmp-buffer",
    after = "nvim-cmp",
  })
  use({
    "hrsh7th/cmp-path",
    after = "nvim-cmp",
  })
  use({
    "saadparwaiz1/cmp_luasnip",
    after = "nvim-cmp",
  })
  use({
    "hrsh7th/cmp-calc",
    after = "nvim-cmp",
  })

  -- luasnip: snippets
  use({
    "L3MON4D3/LuaSnip",
    config = function()
      require("configs.snip")
    end,
    after = "nvim-cmp",
  })


  -- lspkind: show completion kind
  use({
    "onsails/lspkind-nvim",
  })

  -- nvim-autopairs: extremly good autopairs
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("configs.autopairs")
    end,
  })

  -- lsp_signature: show the signature
  use({
    "ray-x/lsp_signature.nvim",
    config = function()
      require("configs.others").signature()
    end,
    after = "nvim-lspconfig",
  })

  -- gitsigns: show signs for git in the signcolumn
  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("configs.others").gitsigns()
    end,
    event = "BufRead",
  })

  -- neogit: git in neovim
  use({
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("configs.neogit")
    end,
  })

  -- diffview.nvim: better diff view
  use({
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function ()
      require("configs.diffview")
    end
  })

  -- surround: edit surroundings
  use({
    "tpope/vim-surround",
  })

  -- align: align text
  use({
    "RRethy/nvim-align",
    module = "align",
    cmd = { "Align" },
  })

  -- toggleterm: supercharge the terminal
  use({
    "akinsho/toggleterm.nvim",
    config = function()
      require("configs.term")
    end,
    setup = function()
      require("core.mappings").term()
    end,
  })

  -- suda: just edit sudo files (no sudo -e :DDDD)
  use({
    "lambdalisue/suda.vim",
    config = function()
      require("configs.others").suda()
    end,
  })

  -- repeat: explains itself, repeats stuff
  use({
    "tpope/vim-repeat",
  })
  -- startup time: measure startup time
  -- kinda not useful anymore? (impatient.profile? nvm impatient doesn't work)
  use({
    "dstein64/vim-startuptime",
    cmd = { "StartupTime" },
  })

  -- Comment.nvim: TJ approved commenting plugin :D
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("configs.commenting")
    end,
  })

  -- better_escape.nvim: escape. questions?
  use({
    "max397574/better-escape.nvim",
    config = function()
      require("configs.others").better_escape()
    end,
    event = "InsertEnter",
  })

  -- comment-box: Clarify and beautify your comments using boxes and lines.
  use({
    "LudoPinelli/comment-box.nvim",
    setup = function()
      require("core.mappings").commentbox()
    end,
  })

  -- glow: markdown preview in da nvim
  use({
    "ellisonleao/glow.nvim",
    config = function()
      require("configs.others").glow()
    end,
    module = "glow",
    cmd = { "Glow", "GlowInstall" },
  })

  -- mundo: undo tree
  -- TODO: remove? I am not really using this
  use({
    "simnalamburt/vim-mundo",
    config = function()
      require("configs.others").mundo()
    end,
    cmd = { "MundoHide", "MundoShow", "MundoToggle" },
    setup = function()
      require("core.mappings").mundo()
    end,
  })

  -- nvim-tree: file tree
  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("configs.filetree")
    end,
    -- requires = { "airblade/vim-rooter" },
    setup = function()
      require("core.mappings").filetree()
    end,
    requires = "Airblade/vim-rooter"
  })

  -- focus: window resizing
  use({
    "beauwilliams/focus.nvim",
    config = function()
      require("configs.others").focus()
    end,
    event = "VimEnter",
  })

  -- twilight: focus on the code
  use({
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    module = "twilight",
  })

  -- zen: be the the calmest person ever when code isn't working
  use({
    "Pocco81/TrueZen.nvim",
    config = function()
      require("configs.others").true_zen()
    end,
    cmd = { "TZAtaraxis", "TZFocus", "TZMinimalist" },
    setup = function()
      require("core.mappings").zen()
    end,
  })

  -- indent_blankline: show indent lines
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("configs.others").blankline()
    end,
  })

  -- bufferline: bufferline plugin with style
  use({
    "akinsho/bufferline.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("configs.bufferline")
    end,
    setup = function()
      require("core.mappings").bufferline()
    end,
  })

  -- bufdelete: delete buffers
  use({
    "famiu/bufdelete.nvim",
  })

  -- lualine: a statusline so easy to configure, it's almost boring
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require("configs.statusline")
    end,
  })

  -- treesitter: use this if you exist or i will dropkick you
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("configs.treesitter")
    end,
    run = { ":TSUpdate" },
  })

  -- treesitter playground: the playground for treesitter
  use({
    "nvim-treesitter/playground",
  })

  -- spellsitter: check spelling with treesitter
  use({
    "lewis6991/spellsitter.nvim",
    event = "BufEnter",
    config = function ()
      require("configs.others").spellsitter()
    end,
    disable = true,
  })

  -- colorizer: a colorizer that colorizes colors to show up in neovim
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("configs.others").colorizer()
    end,
    event = "BufReadPre",
  })

  -- editorconfig: self explains itself don't you think?
  use({
    "editorconfig/editorconfig-vim",
  })

  -- alpha: dashboard on steroids
  use({
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("configs.alpha")
    end,
  })

  -- neorg: notes for modern neovim
  use({
    "nvim-neorg/neorg",
    setup = function()
      require("core.mappings").neorg()
    end,
    after = { "nvim-treesitter" },
    config = function()
      require("configs.neorg")
    end,
    wants = "nvim-cmp",
  })

  -- yuck: 🤢 <- this is a compliment
  use({
    setup = vim.cmd("autocmd BufRead,BufNewFile *.yuck setlocal filetype=yuck"),
    "elkowar/yuck.vim",
    ft = "yuck",
  })

  -- jsonc: jsonc support
  use({
    setup = vim.cmd("autocmd BufRead,BufNewFile *.jsonc setlocal filetype=jsonc"),
    "neoclide/jsonc.vim",
    ft = "jsonc",
  })

  -- parinfer: lisp like languages made easy
  use({
    after = "yuck.vim",
    "gpanders/nvim-parinfer",
  })

  -- guess-indent: Guess the indent of files
  use({
    "NMAC427/guess-indent.nvim",
    config = function ()
      require("guess-indent").setup()
    end,
    event = "BufEnter"
  })
end)
-- vim:foldmethod=marker
