local status, lualine = pcall(require, "lualine")
if (not status) then return end

local fg = '#d1b897'
local bg = '#1a3234'

lualine.setup {
    options = {
        icons_enabled = true,
        theme = {
            normal = {
                a = { fg = fg, bg = bg },
                b = { fg = fg, bg = bg },
                c = { fg = fg, bg = bg },
            }
        },
        section_separators = '',
        component_separators = '',
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {},
        lualine_c = { {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
        } },
        lualine_x = {
            { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' } }
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { {
            'filename',
            file_status = true,
            path = 1
        } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = { 'fugitive' }
}
