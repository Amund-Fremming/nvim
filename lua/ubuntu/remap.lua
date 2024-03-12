local M = {}

M.toggleConfig = function ()
    vim.g.mapleader = " "
    vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

    -- Moving highlighted text up and down
    vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")
    vim.keymap.set("v", "J", ":m '<-2<CR>gv=gv")

    -- Paste from copy buffer without loosing the buffer
    vim.keymap.set("x", "<leader>p", "\"_dP")

    -- Half page jump with cursor in center - DONT WORK!!!!!!!!!!!
    vim.keymap.set("n", "<leader>t", "\"_d")
    vim.keymap.set("v", "<leader>t", "\"_d")

    -- This is going to get me cancelled
    vim.keymap.set("i", "<C-s>", "<Esc>")

    -- For national security
    vim.keymap.set("n", "Q", "<nop>")

    -- Navigation local and global for errors and grep search
    vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
    vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
    vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
    vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

    -- Change all words equal to this word
    vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

    -- Make file executable
    vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

    -- Tmux new session (Needs more setup)
    -- vim.keymap.set("n", "<C-q>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

    -- Saving
    vim.keymap.set("n", "<leader><leader>", "<Cmd>:w<CR>")
end

return M
