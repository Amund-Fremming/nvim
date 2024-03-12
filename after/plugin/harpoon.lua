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
        print("Harpoon qwerty set")
    elseif _G.myConfigCondition == "coleman" then
        -- Endre disse til høyre hånd??
        vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<C-f>", ui.toggle_quick_menu)

        vim.keymap.set("n", "<C-a>", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<C-r>", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<C-s>", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<C-t>", function() ui.nav_file(4) end)
        print("Harpoon coleman set")
    end
end

applyConfig()
