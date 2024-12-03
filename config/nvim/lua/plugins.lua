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
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require("gitsigns").setup()
        end
    },
    {
        'ellisonleao/gruvbox.nvim',
        config = function()
            require("gruvbox").setup({
                italic = {
                    strings = false,
                },
                overrides = {
                    ["@punctuation.bracket"] = { link = "GruvboxFg1" },
                    ["@punctuation.delimiter"] = { link = "GruvboxGray" },
                    GitSignsAdd = { link = "GruvboxGreenSign" },
                    GitSignsChange = { link = "GruvboxOrangeSign" },
                    GitSignsDelete = { link = "GruvboxRedSign" },
                },
            })
            --vim.cmd("colorscheme gruvbox")
        end
    },
    {
        "zenbones-theme/zenbones.nvim",
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.api.nvim_create_autocmd({ "ColorScheme" }, {
                pattern = "zenburned",
                callback = function(params)
                    local base = require(params.match)
                    vim.api.nvim_set_hl(0, "Comment", { fg = "#44b340" })
                    vim.api.nvim_set_hl(0, "Constant", { fg = "#2ec09c" })
                    vim.api.nvim_set_hl(0, "Type", { fg = "#8cde94" })
                    vim.api.nvim_set_hl(0, "Boolean", { fg = "#7ad0c6" })
                    vim.api.nvim_set_hl(0, "Number", { fg = "#7ad0c6" })
                    vim.api.nvim_set_hl(0, "Special", { fg = "#8cde94"  })
                    vim.api.nvim_set_hl(0, "PreProc", { fg = "#8cde94"  })
                    vim.api.nvim_set_hl(0, "Statement", { fg = base.Function.fg.hex })
                    vim.api.nvim_set_hl(0, "Delimiter", { fg = base.Identifier.fg.hex })
                    vim.api.nvim_set_hl(0, "Function", { fg = base.Identifier.fg.hex })
                end,
            })

            vim.g.zenburned = {
                transparent_background = true,
                italic_comments = false
            }

            vim.cmd.colorscheme('zenburned')
        end
    }
}
