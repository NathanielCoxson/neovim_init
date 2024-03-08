-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
 
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- auto close brackets
  -- use 'm4xshen/autoclose.nvim'

  -- tab out of brackets
  use {
      'abecodes/tabout.nvim',
      config = function()
          require('tabout').setup {
              tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
              backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
              act_as_tab = true, -- shift content if tab out is not possible
              act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
              default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
              default_shift_tab = '<C-d>', -- reverse shift default action,
              enable_backwards = true, -- well ...
              completion = true, -- if the tabkey is used in a completion pum
              tabouts = {
                  {open = "'", close = "'"},
                  {open = '"', close = '"'},
                  {open = '`', close = '`'},
                  {open = '(', close = ')'},
                  {open = '[', close = ']'},
                  {open = '{', close = '}'}
              },
              ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
              exclude = {} -- tabout will ignore these filetypes
          }
      end,
      wants = {'nvim-treesitter'}, -- or require if not used so far
      after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
  }

  use({
	  'rose-pine/neovim', 
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end	   
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('windwp/nvim-ts-autotag')
  use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
          require("nvim-autopairs").setup {}
      end
  }
  use('nvim-treesitter/playground')
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment these if you want to manage LSP servers from neovim
		  -- {'williamboman/mason.nvim'},
		  -- {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }
end)
