require('tokyonight').setup({
    on_colors = function(colors)
        vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = colors.comment })
        vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.fg_sidebar })
        vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = colors.comment })
    end
})
vim.cmd.colorscheme('tokyonight')
