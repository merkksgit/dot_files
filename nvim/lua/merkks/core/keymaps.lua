-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

------------------- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Move lines
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

-- adjust split sizes
keymap.set("n", "<C-Left>", "<cmd>vertical resize +3<CR>", { desc = "vertical resize" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize -3<CR>", { desc = "vertical resize" })

-- Undotree
vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle, { desc = "Undotree" })

-- Change word under cursor
vim.keymap.set("n", "<leader>ä", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Word Replacer" })

-- Make file executable
vim.keymap.set("n", "<leader>ö", "<cmd>!chmod +x %<CR>", { silent = true })

-- Keep cursor middle when C-d or C-u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")