--return {}
return {
    "theprimeagen/harpoon",
    --config = function()
    --    local harpoon = require("harpoon")

    --        harpoon:setup()

    --        vim.keymap.set("n", "<leader>af", function() harpoon:list():append() end)
    --        vim.keymap.set("n", "<C-q>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    --        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
    --        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
    --        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
    --        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
    --end
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>af", mark.add_file, { desc = 'Add File' })
        vim.keymap.set("n", "<C-q>", ui.toggle_quick_menu)

        vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)

    end
}
