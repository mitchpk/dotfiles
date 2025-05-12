return {
    'nvim-lua/plenary.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-path',
    'neovim/nvim-lspconfig',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'nvim-tree/nvim-web-devicons',
    'ramojus/mellifluous.nvim',
    {
        "zenbones-theme/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
        -- you can set set configuration options here
        -- config = function()
        --     vim.g.zenbones_darken_comments = 45
        --     vim.cmd.colorscheme('zenbones')
        -- end
    },
    {
        'ellisonleao/gruvbox.nvim',
        config = function()
            require('gruvbox').setup({
                bold = false,
                italic = {
                    strings = false,
                    comments = false,
                },
                overrides = {
                    Delimiter = { link = "GruvboxFg1" },
                    ['@variable.member'] = { link = "GruvboxFg1" },
                }
            })
            vim.cmd.colorscheme('gruvbox')
        end
    },
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
