local M = {}

local function clearQwertyRemaps()
    print("Cleared Qwerty remaps")
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
end

local function clearColemanRemaps()
    print("Cleared Coleman remaps")
    -- Arrow keys
    vim.keymap.set("n", "u", "u", {silent = true})
    vim.keymap.set("n", "n", "n", {silent = true})
    vim.keymap.set("n", "e", "e", {silent = true})
    vim.keymap.set("n", "i", "<Cmd>startinsert<CR>", {silent = true})

    -- Arrow keys visual mode
    vim.keymap.set("v", "u", "u", {silent = true})
    vim.keymap.set("v", "n", "n", {silent = true})
    vim.keymap.set("v", "e", "e", {silent = true})
    vim.keymap.set("v", "i", "i", {silent = true})

    -- Jumping words and lines
    vim.keymap.set("n", "y", "y", {noremap = true, silent = true})
    vim.keymap.set("n", "l", "l", {noremap = true, silent = true})
    vim.keymap.set("n", "Y", "Y", {noremap = true, silent = true})
    vim.keymap.set("n", "L", "L", {noremap = true, silent = true})

    -- Jumping words and lines visual mode
    vim.keymap.set("v", "y", "y", {noremap = true, silent = true})
    vim.keymap.set("v", "l", "l", {noremap = true, silent = true})
    vim.keymap.set("v", "Y", "Y", {noremap = true, silent = true})
    vim.keymap.set("v", "L", "L", {noremap = true, silent = true})

    -- Visual, Insert, Esc
    vim.keymap.set('n', 't', 't', {noremap = true, silent = true})
    vim.keymap.set("n", "<C-s>", "<Esc>", {noremap = true, silent = true})

    -- Delete, Yank, Undo, Paste
    vim.keymap.set("n", "m", "m", {noremap = true, silent = true})
    vim.keymap.set("n", "h", "h", {noremap = true, silent = true})

    -- Delete, Yank, Undo, Paste
    vim.keymap.set("v", "m", "m", {noremap = true, silent = true})
    vim.keymap.set("v", "h", "h", {noremap = true, silent = true})

    -- Set jumping back to normal
    vim.keymap.set("v", "0", "0", {noremap = true, silent = true})
    vim.keymap.set("v", "$", "$", {noremap = true, silent = true})
end

M.toggleConfig = function()
    if _G.myConfigCondition == "coleman" then
        clearQwertyRemaps()
        _G.myConfigCondition = "coleman"
        require("coleman_remap").toggleConfig()
        print("coleman config set")
    else
        clearColemanRemaps()
        _G.myConfigCondition = "qwerty"
        require("default_remap").toggleConfig()
        print("qwert config set")
    end
end

return M
