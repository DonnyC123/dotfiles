-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use 4-space indentation everywhere (matches the verible formatter config).
vim.opt.shiftwidth = 4 -- size of an indent
vim.opt.tabstop = 4 -- number of spaces a <Tab> counts for
vim.opt.softtabstop = 4 -- spaces a <Tab>/<BS> feels like while editing
vim.opt.expandtab = true -- expand tabs to spaces

-- Disable format-on-save globally. Toggle at runtime with <leader>uf (buffer)
-- or <leader>uF (global); format manually any time with <leader>cf.
vim.g.autoformat = false
