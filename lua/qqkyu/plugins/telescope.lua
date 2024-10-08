return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    keys = {
      { '<leader>?',       "<Cmd>Telescope oldfiles<CR>", desc = '[?] Find recently opened files' },
      { '<leader><space>', "<Cmd>Telescope buffers<CR>",  desc = '[ ] Find existing buffers' },
      {
        '<leader>/',
        function()
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          })
        end,
        desc = '[/] Fuzzily search in current buffer'
      },

      { '<leader>gf', "<Cmd>Telescope git_files<CR>",   desc = 'Search [G]it [F]iles' },
      { '<leader>sf', "<Cmd>Telescope find_files<CR>",  desc = '[S]earch [F]iles' },
      { '<leader>sh', "<Cmd>Telescope help_tags<CR>",   desc = '[S]earch [H]elp' },
      { '<leader>sw', "<Cmd>Telescope grep_string<CR>", desc = '[S]earch current [W]ord' },
      { '<leader>sg', "<Cmd>Telescope live_grep<CR>",   desc = '[S]earch by [G]rep' },
      { '<leader>sd', "<Cmd>Telescope diagnostics<CR>", desc = '[S]earch [D]iagnostics' },
      { '<leader>sr', "<Cmd>Telescope resume<CR>",      desc = '[S]earch [R]esume' },
      { '[d',         vim.diagnostic.goto_prev,         desc = 'Go to previous diagnostic message' },
      { ']d',         vim.diagnostic.goto_next,         desc = 'Go to next diagnostic message' },
      { '<leader>e',  vim.diagnostic.open_float,        desc = 'Open floating diagnostic message' },
      { '<leader>q',  vim.diagnostic.setloclist,        desc = 'Open diagnostics list' },
    },
    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
      }

      pcall(require('telescope').load_extension, 'fzf')
    end,
  }
}
