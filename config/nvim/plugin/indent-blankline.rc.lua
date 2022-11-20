local status, indent_blankline = pcall(require, "indent_blankline")
if (not status) then return end

indent_blankline.setup({
    use_treesitter = true,
    show_trailing_blankline_indent = false
})
