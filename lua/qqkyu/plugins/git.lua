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
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal { ']c', bang = true }
            else
              gitsigns.nav_hunk 'next'
            end
          end, { desc = 'Jump to next git [c]hange' })

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal { '[c', bang = true }
            else
              gitsigns.nav_hunk 'prev'
            end
          end, { desc = 'Jump to previous git [c]hange' })

          -- Actions
          map('v', '<leader>hs', function()
            gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = 'git [s]tage hunk' })
          map('v', '<leader>hr', function()
            gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = 'git [r]eset hunk' })

          map('n', '<leader>hp', gitsigns.preview_hunk, { desc = "git [p]review hunk" })
          map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = "git preview hunk [i]nline" })

          map('n', '<leader>hb', function()
            gitsigns.blame_line({ full = true })
          end, { desc = "git [b]lame line" })

          map('n', '<leader>hd', gitsigns.diffthis, { desc = "git [d]iff against index" })

          map('n', '<leader>hD', function()
            gitsigns.diffthis('~')
          end, { desc = "git [D]iff against last commit" })

          map('n', '<leader>hQ', function() gitsigns.setqflist('all') end,
            { desc = "Show hunks quickfix list for whole repository" })
          map('n', '<leader>hq', gitsigns.setqflist, { desc = "Show hunks quickfix list" })

          -- Toggles
          map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "[T]oggle git show [b]lame line" })
          map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = "[T]oggle inline [w]ord diff" })
        end,
      }
    end,
  },
}
