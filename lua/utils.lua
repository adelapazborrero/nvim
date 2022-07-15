-- auto-indent on newline
local npairs = require 'nvim-autopairs'

_G.MUtils = {}

MUtils.completion_confirm = function()
    if vim.fn.pumvisible() ~= 0 then
        return npairs.esc '<cr>'
    else
        return npairs.autopairs_cr()
    end
end
