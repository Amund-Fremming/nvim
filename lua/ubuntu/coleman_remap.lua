local M = {}

M.toggleConfig = function()
    vim.g.mapleader = " "
    vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

    -- Moving highlighted text up and down
    vim.keymap.set("v", "E", ":m '>+1<CR>gv=gv")
    vim.keymap.set("v", "U", ":m '<-2<CR>gv=gv")

    -- Paste from copy buffer without loosing the buffer
    vim.keymap.set("x", "<leader>p", "\"_dP")

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

    -- Arrow keys
    vim.keymap.set("n", "u", "<Up>", {silent = true})
    vim.keymap.set("n", "n", "<Left>", {silent = true})
    vim.keymap.set("n", "e", "<Down>", {silent = true})
    vim.keymap.set("n", "i", "<Right>", {silent = true})

    -- Arrow keys visual mode
    vim.keymap.set("v", "u", "<Up>", {silent = true})
    vim.keymap.set("v", "n", "<Left>", {silent = true})
    vim.keymap.set("v", "e", "<Down>", {silent = true})
    vim.keymap.set("v", "i", "<Right>", {silent = true})

    -- Jumping words and lines
    vim.keymap.set("n", "y", "w", {noremap = true, silent = true})
    vim.keymap.set("n", "l", "b", {noremap = true, silent = true})
    vim.keymap.set("n", "Y", "$", {noremap = true, silent = true})
    vim.keymap.set("n", "L", "0", {noremap = true, silent = true})

    -- Jumping words and lines visual mode
    vim.keymap.set("v", "y", "w", {noremap = true, silent = true})
    vim.keymap.set("v", "l", "b", {noremap = true, silent = true})
    vim.keymap.set("v", "Y", "$", {noremap = true, silent = true})
    vim.keymap.set("v", "L", "0", {noremap = true, silent = true})

    -- Visual, Insert, Esc
    vim.keymap.set('n', 't', '<Cmd>startinsert<CR>', {noremap = true, silent = true})
    vim.keymap.set("n", "<C-t>", "<Esc>", {noremap = true, silent = true})

    -- Delete, Yank, Undo, Paste
    vim.keymap.set("n", "m", "u", {noremap = true, silent = true})
    vim.keymap.set("n", "h", "y", {noremap = true, silent = true})

    -- Delete, Yank, Undo, Paste
    vim.keymap.set("v", "m", "u", {noremap = true, silent = true})
    vim.keymap.set("v", "h", "y", {noremap = true, silent = true})

    -- Save
    vim.keymap.set("n", "<leader><leader>", "<Cmd>:w<CR>")

    -- Jump to top / bottom of document
    -- Jump to top / bottom of document visual mode
    -- append
    -- Replace character / remove character
end

return M
