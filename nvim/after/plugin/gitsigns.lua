require('gitsigns').setup({
    sign_priority = 6,
    on_attach = function(bufnr)
        local gitsigns = require('gitsigns')
        Map('n', '<leader>hr', gitsigns.reset_hunk, {buffer = bufnr})
        Map('n', '<leader>hn', gitsigns.next_hunk, {buffer = bufnr})
        Map('n', '<leader>hp', gitsigns.prev_hunk, {buffer = bufnr})
        Map('n', '<leader>hb', function() gitsigns.blame() end, {buffer = bufnr})
    end
})
