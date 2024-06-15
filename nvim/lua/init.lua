-- CMDpalette setup
-- open commandline keymap
vim.keymap.set("n", ";", "<Plug>(cmdpalette)")

-- CMDpalette options:

-- require("cmdpalette").setup({
--   win = {
--     height = 0.2,
--     width = 0.5,
--     border = "rounded",
--     row_off = -2,
--     -- Title requires nvim-0.9 or higher.
--     title = "Cmdpalette",
--     title_pos = "center",
--   },
--   sign = {
--     text = ":",
--   },
--   buf = {
--     filetype = "vim",
--     syntax = "vim",
--   },
--   delete_confirm = true,
--   show_title = true,
-- })
