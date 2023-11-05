vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw file explorer" })

-- Write file to disk
vim.keymap.set("n", "<C-S>", "<Cmd>write<CR>", { desc = "Save buffer" })

-- Movement
vim.keymap.set("n", "<leader>h", "<Cmd>wincmd h<CR>", { desc = "Move cursor to left window" })
vim.keymap.set("n", "<leader>j", "<Cmd>wincmd j<CR>", { desc = "Move cursor to bottomw window" })
vim.keymap.set("n", "<leader>k", "<Cmd>wincmd k<CR>", { desc = "Move cursor to top window" })
vim.keymap.set("n", "<leader>l", "<Cmd>wincmd l<CR>", { desc = "Move cursor to right window" })

-- Dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

