local status, packer = pcall(require, "packer")
if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'neovim/nvim-lspconfig'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'
    use 'nvim-tree/nvim-web-devicons'
    use 'onsails/lspkind.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({
                with_sync = true
            })
        end
    }
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use {
        'windwp/nvim-autopairs',
        config = function()
            require("nvim-autopairs").setup({
                disable_filetype = { "TelescopePrompt", "vim" },
                enable_check_bracket_line = false,
            })
        end
    }
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require("colorizer").setup({
                '*';
            })
        end
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require("gitsigns").setup()
        end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require("Comment").setup()
        end
    }
    use {
        'sainnhe/gruvbox-material',
        config = function()
            vim.cmd [[
                let g:gruvbox_material_background = 'hard'
                let g:gruvbox_material_transparent_background = 1
                let g:gruvbox_material_better_performance = 1
                let g:gruvbox_material_sign_column_background = 'grey'
                colorscheme gruvbox-material
            ]]
        end
    }
end)
