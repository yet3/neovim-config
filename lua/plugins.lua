local fn = vim.fn

vim.g.package_home = fn.stdpath("data") .. "/site/pack/packer/"
local packer_install_dir = vim.g.package_home .. "/opt/packer.nvim"

-- Auto-install packer if not installed
if fn.glob(packer_install_dir) == "" then
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  vim.cmd(string.format("10split |term git clone --depth=1 %s %s", "https://github.com/wbthomason/packer.nvim",
    packer_install_dir))
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")

return require('packer').startup(function(use)
  use({ "lewis6991/impatient.nvim", config = [[require('impatient')]] })
  use({ "wbthomason/packer.nvim", opt = true })
  use 'nvim-lua/plenary.nvim'

  use({ 'lalitmee/cobalt2.nvim', requires = 'tjdevries/colorbuddy.nvim' })
  use({ 'kyazdani42/nvim-web-devicons' })

  use 'j-hui/fidget.nvim'
  use 'nvim-lualine/lualine.nvim'

  use 'b0o/schemastore.nvim'
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  })
  use 'onsails/lspkind-nvim'
  use 'L3MON4D3/LuaSnip'
  use 'glepnir/lspsaga.nvim'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'

  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'jose-elias-alvarez/null-ls.nvim'
  -- use 'MunifTanjim/prettier.nvim'

  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'romgrk/barbar.nvim'

  use {
    'numToStr/Comment.nvim',
    requires = { 'JoosepAlviste/nvim-ts-context-commentstring' }
  }

  use 'ggandor/lightspeed.nvim'

  use 'norcalli/nvim-colorizer.lua'

  use({ 'akinsho/toggleterm.nvim', tag = 'v2.*' })
  use({
    'kyazdani42/nvim-tree.lua',
    tag = 'nightly'
  })
end)
