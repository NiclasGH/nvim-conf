return {
    { "folke/neoconf.nvim", cmd = "Neoconf" },

    "folke/neodev.nvim",

    "numToStr/Comment.nvim",

    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },

    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

    { "folke/todo-comments.nvim", event = "VimEnter", dependencies = { "nvim-lua/plenary.nvim" }, opts = { signs = false } },

    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({})
            vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
        end,
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        trigger_events = {"InsertLeave"},
        config = function()
            require("nvim-surround").setup({
                -- Use :ASToggle to toggle autosave
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    -- "Pocco81/auto-save.nvim",
}
