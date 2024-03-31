-- Define the autocmd group
local group = vim.api.nvim_create_augroup("NetrwRemap", { clear = true })

-- Remap 'u' to navigate up in the file listing within Netrw
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    command = "nnoremap <buffer> u <Up>",
    group = group,
})

local function clearQwertyRemaps()
    vim.g.mapleader = " "
    vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

    -- Moving highlighted text up and down
    vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")
    vim.keymap.set("v", "J", ":m '<-2<CR>gv=gv")

    -- Paste from copy buffer without loosing the buffer
    vim.keymap.set("x", "<leader>p", "\"_dP")

    -- This is going to get me cancelled
    vim.keymap.set("i", "<C-s>", "<Esc>")

    -- For national security
    vim.keymap.set("n", "Q", "<nop>")
end

local function clearColemanRemaps()
    -- Arrow keys
    vim.keymap.set("n", "u", "u", { silent = true })
    vim.keymap.set("n", "n", "n", { silent = true })
    vim.keymap.set("n", "e", "e", { silent = true })
    vim.keymap.set("n", "i", "<Cmd>startinsert<CR>", { silent = true })

    -- Arrow keys visual mode
    vim.keymap.set("v", "u", "u", { silent = true })
    vim.keymap.set("v", "n", "n", { silent = true })
    vim.keymap.set("v", "e", "e", { silent = true })
    vim.keymap.set("v", "i", "i", { silent = true })

    -- Jumping words and lines
    vim.keymap.set("n", "y", "y", { noremap = true, silent = true })
    vim.keymap.set("n", "l", "l", { noremap = true, silent = true })
    vim.keymap.set("n", "Y", "Y", { noremap = true, silent = true })
    vim.keymap.set("n", "L", "L", { noremap = true, silent = true })

    -- Jumping words and lines visual mode
    vim.keymap.set("v", "y", "y", { noremap = true, silent = true })
    vim.keymap.set("v", "l", "l", { noremap = true, silent = true })
    vim.keymap.set("v", "Y", "Y", { noremap = true, silent = true })
    vim.keymap.set("v", "L", "L", { noremap = true, silent = true })

    -- Visual, Insert, Esc
    vim.keymap.set('n', 't', 't', { noremap = true, silent = true })
    vim.keymap.set("n", "<C-s>", "<C-s>", { noremap = true, silent = true })

    -- Delete, Yank, Undo, Paste
    vim.keymap.set("n", "m", "m", { noremap = true, silent = true })
    vim.keymap.set("n", "h", "h", { noremap = true, silent = true })
    vim.keymap.set("n", "hh", "hh", { noremap = true, silent = true })

    -- Delete, Yank, Undo, Paste
    vim.keymap.set("v", "m", "m", { noremap = true, silent = true })
    vim.keymap.set("v", "h", "h", { noremap = true, silent = true })
    vim.keymap.set("v", "hh", "hh", { noremap = true, silent = true })

    -- Set jumping back to normal
    vim.keymap.set("v", "0", "0", { noremap = true, silent = true })
    vim.keymap.set("v", "$", "$", { noremap = true, silent = true })

    -- Jump to top / bottom of document
    vim.keymap.set("n", "gg", "gg", { noremap = true, silent = true })
    vim.keymap.set("n", "G", "G", { noremap = true, silent = true })

    -- Jump to top / bottom of document visual mode
    vim.keymap.set("v", "gg", "gg", { noremap = true, silent = true })
    vim.keymap.set("v", "G", "G", { noremap = true, silent = true })

    -- Append, Remove character
    vim.keymap.set("n", "s", "s", { noremap = true, silent = true })
    vim.keymap.set("n", "a", "a", { noremap = true, silent = true })
end

local function applyConfig()
    -- Half page jump with cursor in center - DONT WORK!!!!!!!!!!!
    -- vim.api.nvim_set_keymap('n', '<C-u>', ':HalfPageUp<CR>zz', { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('n', '<C-d>', ':HalfPageDown<CR>zz', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-d>', '<nop>', { noremap = true, silent = true })

    if _G.myConfigCondition == "qwerty" then
        clearColemanRemaps()
        vim.g.mapleader = " "
        vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

        -- Moving highlighted text up and down
        vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")
        vim.keymap.set("v", "J", ":m '<-2<CR>gv=gv")

        -- Paste from copy buffer without loosing the buffer
        vim.keymap.set("x", "<leader>p", "\"_dP")

        -- Half page jump with cursor in center - TODO

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

        -- Get ful error message inside window
        vim.keymap.set("n", "<leader>e", "<cmd>:lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

        -- Make file executable
        vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

        -- Tmux new session (Needs more setup)
        -- vim.keymap.set("n", "<C-q>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

        -- Saving
        vim.keymap.set("n", "<leader><leader>", "<Cmd>:w<CR>")
    elseif _G.myConfigCondition == "coleman" then
        clearQwertyRemaps()
        vim.g.mapleader = " "
        vim.keymap.set("n", "<leader>pp", vim.cmd.Ex)

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
        vim.keymap.set("n", "u", "<Up>", { silent = true })
        vim.keymap.set("n", "n", "<Left>", { silent = true })
        vim.keymap.set("n", "e", "<Down>", { silent = true })
        vim.keymap.set("n", "i", "<Right>", { silent = true })

        -- Arrow keys visual mode
        vim.keymap.set("v", "u", "<Up>", { silent = true })
        vim.keymap.set("v", "n", "<Left>", { silent = true })
        vim.keymap.set("v", "e", "<Down>", { silent = true })
        vim.keymap.set("v", "i", "<Right>", { silent = true })

        -- Jumping words and lines
        vim.keymap.set("n", "y", "w", { noremap = true, silent = true })
        vim.keymap.set("n", "l", "b", { noremap = true, silent = true })
        vim.keymap.set("n", "Y", "$", { noremap = true, silent = true })
        vim.keymap.set("n", "L", "0", { noremap = true, silent = true })

        -- Jumping words and lines visual mode
        vim.keymap.set("v", "y", "w", { noremap = true, silent = true })
        vim.keymap.set("v", "l", "b", { noremap = true, silent = true })
        vim.keymap.set("v", "Y", "$", { noremap = true, silent = true })
        vim.keymap.set("v", "L", "0", { noremap = true, silent = true })

        -- Jumping words and lines operation mode
        vim.keymap.set("o", "y", "w", { noremap = true, silent = true })
        vim.keymap.set("o", "l", "b", { noremap = true, silent = true })
        vim.keymap.set("o", "Y", "$", { noremap = true, silent = true })
        vim.keymap.set("o", "L", "0", { noremap = true, silent = true })

        -- Visual, Insert, Esc
        vim.keymap.set('n', 't', '<Cmd>startinsert<CR>', { noremap = true, silent = true })
        vim.keymap.set("n", "<C-t>", "<Esc>", { noremap = true, silent = true })

        -- Delete, Yank, Undo, Paste
        vim.keymap.set("n", "m", "u", { noremap = true, silent = true })
        vim.keymap.set("n", "h", "y", { noremap = true, silent = true })
        vim.keymap.set("n", "hh", "yy", { noremap = true, silent = true })

        -- Delete, Yank, Undo, Paste
        vim.keymap.set("v", "m", "u", { noremap = true, silent = true })
        vim.keymap.set("v", "h", "y", { noremap = true, silent = true })
        vim.keymap.set("v", "hh", "yy", { noremap = true, silent = true })

        -- Save
        vim.keymap.set("n", "<leader><leader>", "<Cmd>:w<CR>")

        -- Jump to top / bottom of document
        vim.keymap.set("n", "<leader>u", "gg", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>e", "G", { noremap = true, silent = true })

        -- Jump to top / bottom of document visual mode
        vim.keymap.set("v", "<leader>u", "gg", { noremap = true, silent = true })
        vim.keymap.set("v", "<leader>e", "G", { noremap = true, silent = true })

        -- Append, Replace character, remove character
        vim.keymap.set("n", "s", "a", { noremap = true, silent = true })
        vim.keymap.set("n", "a", "x", { noremap = true, silent = true })

        -- Get ful error message inside window
        vim.keymap.set("n", "<leader>o", "<cmd>:lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })



        -- Esc
        -- hvordan få brukt ctrl, kanskje remappe æ
    end
end

applyConfig()
