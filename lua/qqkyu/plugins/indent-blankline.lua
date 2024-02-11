return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
    config = function()
      local highlight = {
        "PersianPlum",
        "MustardGreen",
        "MughalGreen",
        "PoliceBlue",
        "MetallicBlue",
        "JapaneseViolet",
      }

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "PersianPlum", { fg = '#662121' })
        vim.api.nvim_set_hl(0, "MustardGreen", { fg = '#767621' })
        vim.api.nvim_set_hl(0, "MughalGreen", { fg = '#216631' })
        vim.api.nvim_set_hl(0, "PoliceBlue", { fg = '#325a5e' })
        vim.api.nvim_set_hl(0, "MetallicBlue", { fg = '#324b7b' })
        vim.api.nvim_set_hl(0, "JapaneseViolet", { fg = '#562155' })
      end)
      require('ibl').setup {
        indent = { highlight = highlight },
      }
    end,
  },
}
