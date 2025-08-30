return {
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
          local gitsigns = require('gitsigns')

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map({ 'n', 'v' }, ']c', function()
            if vim.wo.diff then
              return ']c'
            else
              gitsigns.nav_hunk('next')
            end
          end)

          map({ 'n', 'v' }, '[c', function()
            if vim.wo.diff then
              return '[c'
            else
              gitsigns.nav_hunk('prev')
            end
          end)

          -- Actions
          map('n', '<leader>hs', gitsigns.stage_hunk, { desc = "Stage hunk" })
          map('n', '<leader>hr', gitsigns.reset_hunk, { desc = "Reset hunk" })

          map('n', '<leader>hp', gitsigns.preview_hunk, { desc = "Preview hunk" })
          map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })

          map('n', '<leader>hb', function()
            gitsigns.blame_line({ full = true })
          end, { desc = "Show blame for the current line" })

          map('n', '<leader>hd', gitsigns.diffthis, { desc = "Show diff of the current buffer" })

          map('n', '<leader>hD', function()
            gitsigns.diffthis('~')
          end, { desc = "Show diff of the current buffer" })

          map('n', '<leader>hQ', function() gitsigns.setqflist('all') end,
            { desc = "Show hunks quickfix list for whole repository" })
          map('n', '<leader>hq', gitsigns.setqflist, { desc = "Show hunks quickfix list" })

          -- Toggles
          map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "Toggle inline blame" })
          map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = "Toggle inline word diff" })

          -- Text object
          map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
        end,
      }
    end,
  },
}
