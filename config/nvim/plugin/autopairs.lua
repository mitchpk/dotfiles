local npairs = require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

npairs.setup({
    disable_filetype = { "TelescopePrompt", "vim" },
    enable_check_bracket_line = false,
})

npairs.add_rule(Rule('<', '>'):with_pair(
  cond.before_regex('%a+:?:?$', 3)
):with_move(function(opts)
  return opts.char == '>'
end))
