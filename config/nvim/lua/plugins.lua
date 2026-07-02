return {
    'nvim-lua/plenary.nvim',
    {
      'saghen/blink.cmp',
      dependencies = { 'rafamadriz/friendly-snippets' },
      version = '1.*',

      opts = {
        keymap = { preset = 'default' },
        appearance = {
          nerd_font_variant = 'mono'
        },
        completion = { documentation = { auto_show = false } },
        sources = {
          default = { 'lsp', 'path', 'snippets' },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
      },
      opts_extend = { "sources.default" }
    },
    'neovim/nvim-lspconfig',
    'nvim-tree/nvim-web-devicons',
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
    'folke/tokyonight.nvim',
    {
        'nvim-treesitter/nvim-treesitter',
        branch = "main",
        lazy = false,
        build = ":TSUpdate"
    },
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'windwp/nvim-autopairs',
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
