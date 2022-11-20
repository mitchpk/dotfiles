local status, indent_blankline = pcall(require, "indent_blankline")
if (not status) then return end

indent_blankline.setup({
    --use_treesitter = true,
    show_first_indent_level = true,
    show_end_of_line = true,
})
