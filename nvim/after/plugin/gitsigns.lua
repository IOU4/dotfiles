require('gitsigns').setup({
    sign_priority = 6,
    on_attach = function(bufnr)
        local gitsigns = require('gitsigns')
        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end
        map('n', '<leader>hr', gitsigns.reset_hunk)
        map('n', '<leader>hn', gitsigns.next_hunk)
        map('n', '<leader>hp', gitsigns.prev_hunk)
        map('v', '<leader>hs', function() gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end)
        map('v', '<leader>hr', function() gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end)
        map('n', '<leader>hp', gitsigns.preview_hunk)
        map('n', '<leader>hi', gitsigns.preview_hunk_inline)
        map('n', '<leader>hb', function() gitsigns.blame_line({ full = true }) end)
    end
})
