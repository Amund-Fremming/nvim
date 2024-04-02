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
        vim.keymap.set("n", "<C-z>", "<Nop>")
        vim.keymap.set("n", "<C-x>", "<Nop>")
        vim.keymap.set("n", "<C-c>", "<Nop>")
        vim.keymap.set("n", "<C-v>", "<Nop>")

        -- Endre disse til høyre hånd??
        vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<leader>r", ui.toggle_quick_menu)

        vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
    end
end

applyConfig()
