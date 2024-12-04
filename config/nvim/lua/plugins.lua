return {
    'wbthomason/packer.nvim',
    'nvim-lualine/lualine.nvim',
    'nvim-lua/plenary.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-path',
    'neovim/nvim-lspconfig',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'nvim-tree/nvim-web-devicons',
    {
        'Olical/conjure',
        config = function()
            vim.g["conjure#mapping#doc_word"] = "gk"
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({
                with_sync = true
            })
        end
    },
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    {
        'windwp/nvim-autopairs',
        config = function()
            require("nvim-autopairs").setup({
                disable_filetype = { "TelescopePrompt", "vim" },
                enable_check_bracket_line = false,
            })
        end
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require("colorizer").setup({
                '*';
            })
        end
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require("Comment").setup()
        end
    },
    {
        'vladdoster/remember.nvim',
        config = function()
            require("remember")
        end
    }
}
