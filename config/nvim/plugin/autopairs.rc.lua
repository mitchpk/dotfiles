local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
    disable_filetype = { "TelescopePrompt", "vim" },
    enable_check_bracket_line = false,
})
