local function applyConfig()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    if _G.myConfigCondition == "qwerty" then
        vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

        vim.keymap.set("n", "<C-z>", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<C-x>", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<C-c>", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<C-v>", function() ui.nav_file(4) end)
    elseif _G.myConfigCondition == "coleman" then
        vim.keymap.set("n", "<C-a>", "<Nop>")
        vim.keymap.set("n", "<C-r>", "<Nop>")
        vim.keymap.set("n", "<C-s>", "<Nop>")
        vim.keymap.set("n", "<C-t>", "<Nop>")

        -- Endre disse til høyre hånd??
        vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<leader>r", ui.toggle_quick_menu)

        vim.keymap.set("n", "<C-a>", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<C-r>", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<C-s>", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<C-t>", function() ui.nav_file(4) end)
    end
end

applyConfig()
