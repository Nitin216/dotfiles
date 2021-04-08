vim.cmd [[packadd vimball]]

return require('packer').startup {
  function(use)
    use 'wbthomason/packer.nvim'

    -- local local_use = function(first, second)
    --   local plug_path, home
    --   if second == nil then
    --     plug_path = first
    --     home = "~"
    --   else
    --     plug_path = second
    --     home =first
    --   end

    --   if vim.fn.isdirectory(vim.fn.expand("~/plugins/" .. plug_path)) == 1 then
    --     use("~/plugins/" .. plug_path)
    --   else
    --     use(string.format('%s/%s', home, plug_path))
    --   end
    -- end


    -- External Plugins
    use 'nvim-lua/lsp_extensions.nvim'
    use 'mhinz/vim-startify'
    use 'dstein64/vim-startuptime'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
   use {
      'nvim-telescope/telescope-fzf-writer.nvim',
      requires = {
        "nvim-telescope/telescope.nvim"
      }
    }
    use 'google/vim-searchindex'
    use 'tpope/vim-surround'
    use 'tpope/vim-dispatch'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-scriptease'
    use 'reasonml-editor/vim-reason-plus'
    -- use {'junegunn/fzf', run = './install --all'}
    -- use 'junegunn/fzf.vim'
    use 'keith/swift.vim'
    use 'udalov/kotlin-vim'
    use {'ThePrimeagen/vim-be-good', run = './install.sh'}
    use 'wincent/pinnacle'
    use 'mbbill/undotree'
    use 'chriskempson/base16-vim'
    use 'junegunn/goyo.vim'
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'  }
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'nvim-lua/lsp-status.nvim'
    use 'glepnir/lspsaga.nvim'
    use 'tjdevries/astronauta.nvim'
    use 'rhysd/committia.vim'
    use 'yuezk/vim-js'
    use 'maxmellon/vim-jsx-pretty'
    use { 'HerringtonDarkholme/yats.vim', run = 'rm -rf UltiSnips'}
    use 'kevinoid/vim-jsonc'
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      }
    }
    use 'honza/vim-snippets'
    use 'SirVer/ultisnips'
    use 'mlaursen/vim-react-snippets'
    use 'kyazdani42/nvim-web-devicons'
    -- use 'kyazdani42/nvim-tree.lua'
    use 'hrsh7th/nvim-compe'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/playground'
    use 'mattn/emmet-vim'
    use 'romainl/vim-qf'

    use 'norcalli/nvim-terminal.lua'
    --[[
      Colorscheme
    --]]
    use  {'sonph/onehalf' , rtp = 'vim'}
    use {
      'yamatsum/nvim-web-nonicons',
      requires = {'kyazdani42/nvim-web-devicons'}
    }
    use 'onsails/lspkind-nvim'
    use 'tjdevries/colorbuddy.nvim'
    use 'tami5/sql.nvim'
    use 'nvim-telescope/telescope-frecency.nvim'
    use 'nvim-telescope/telescope-cheat.nvim'

  end,
  config = {
    _display = {
      open_fn = function(name)
        -- Can only use plenary when we have our plugins.
        -- We can only get plenary wehn we don't ahve our plugins
        local ok, float_win = pcall(function()
          return require('plenary.window.float').percentage_range_window(0.8, 0.8)
        end)

        if not ok then
          vim.cmd [[65vnew [packer] ]]
          return vim.api.nvim_get_current_win(), vim.api.nvim_get_current_buf()
        end

        local bufnr = float_win.bufnr
        local win = float_win.win_id

        vim.api.nvim_buf_set_name(bufnr, name)
        vim.api.nvim_win_set_option(win, 'winblend', 10)

        return win, bufnr
      end
    },
  }
}
