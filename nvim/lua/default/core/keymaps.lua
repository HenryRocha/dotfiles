vim.g.mapleader = " " -- use <SPACE> as leader key
local keymap = vim.keymap

-- Searching
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<C-Left>", "<c-w>h", { desc = "Move to left split" })
keymap.set("n", "<C-Right>", "<c-w>l", { desc = "Move to right split" })
keymap.set("n", "<C-Up>", "<c-w>j", { desc = "Move to split above" })
keymap.set("n", "<C-Down>", "<c-w>k", { desc = "Move to split below" })

-- Tab management
keymap.set("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<C-W>", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<C-PageUp>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<C-PageDown>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew<CR>", { desc = "Open current buffer in new tab" })

-- Common keybinds
keymap.set({ "n", "i" }, "<C-s>", "<cmd>write<CR>", { desc = "Writes file" })
