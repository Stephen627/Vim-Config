-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

vim.opt.packpath = vim.fn.stdpath('config') .. '/vendor'

-- Install packer if it doesn't exist
local fn = vim.fn
local install_path = fn.stdpath('config')..'/vendor/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end


local packer = require('packer')
packer.init({
    package_root = vim.fn.stdpath('config') .. '/vendor/pack'
})


return packer.startup(function()
    use 'wbthomason/packer.nvim' -- Always
    -- Disabling because they need more setup
    -- use 'mfussenegger/nvim-dap'
    -- use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }

    -- Libraries basically everything relies on
    use 'nvim-lua/plenary.nvim' -- Always
    use 'nvim-lua/popup.nvim' -- Always

    -- Theme
    use { 'catppuccin/nvim', as = 'catppuccin' } -- Always

    -- LSP features and setup
    -- Load when entering TS/JS/PHP/CSS/SCSS
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'folke/lsp-colors.nvim'

    -- Completion engine with sources
    -- Load when entering TS/JS/PHP/CSS/SCSS
    use 'hrsh7th/nvim-cmp'
    use { 'hrsh7th/cmp-nvim-lsp', requires = { 'hrsh7th/nvim-cmp' } }
    use { 'hrsh7th/cmp-buffer', requires = { 'hrsh7th/nvim-cmp' } }
    use { 'hrsh7th/cmp-path', requires = { 'hrsh7th/nvim-cmp' } }
    use { 'hrsh7th/cmp-cmdline', requires = { 'hrsh7th/nvim-cmp' } }

    -- Snippets
    -- Load when entering TS/JS/PHP/CSS/SCSS/HTML
    use 'rafamadriz/friendly-snippets'
    use { 'hrsh7th/vim-vsnip', requires = { 'rafamadriz/friendly-snippets' } }
    use { 'hrsh7th/cmp-vsnip', requires = { 'hrsh7th/vim-vsnip', 'hrsh7th/nvim-cmp' } }

    -- Nice icons
    -- Always
    use 'kyazdani42/nvim-web-devicons'

    -- File navigation
    -- Always
    use 'kyazdani42/nvim-tree.lua'

    -- Popup terminal
    -- Always
    use 'akinsho/toggleterm.nvim'

    -- Easier buffer commands
    -- Always
    use 'moll/vim-bbye'

    -- File and buffer status line
    -- Always
    use 'hoob3rt/lualine.nvim'
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    -- Git signs in files
    -- Always
    use 'lewis6991/gitsigns.nvim'

    -- File finder
    -- Always
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
          { 'nvim-telescope/telescope-live-grep-args.nvim' },
        },
        config = function()
          require('telescope').load_extension('live_grep_args')
        end
    }
    use 'nvim-telescope/telescope-ui-select.nvim'

    -- Command helper
    -- Always
    use 'mrjones2014/legendary.nvim'
    use 'stevearc/dressing.nvim'

    -- Notifications 
    -- Always
    use {
    'rcarriga/nvim-notify',
    config = function ()
      require("notify").setup {
        stages = 'fade_in_slide_out',
        background_colour = 'FloatShadow',
        timeout = 3000,
      }
      vim.notify = require('notify')
    end
  }

    -- Laravel helpers
    -- Load when entering PHP
    use 'noahfrederick/vim-laravel'
end)
