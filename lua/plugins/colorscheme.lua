return {
    {
        "sainnhe/sonokai",
        priority = 1000,
        config = function()
            vim.g.sonokai_transparent_background = "1"
            vim.g.sonokai_enable_italic = "1"
            vim.g.sonokai_style = "andromeda"
            vim.cmd.colorscheme("sonokai")
            vim.cmd([[highlight Comment gui=bold ctermbg=10 guifg=LightGreen]])
            vim.cmd([[highlight StatusLine guibg=NONE gui=bold]])
            -- vim.cmd([[highlight LineNr guifg=#ffdb99]])
            vim.cmd([[highlight LineNr guifg=#999999]])
            -- vim.cmd([[highlight CursorLineNr guifg=#FFA500 gui=bold]])
            vim.cmd([[highlight CursorLineNr guifg=#fafa07 gui=bold]])
            vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
        end,
    },
    -- {
    --
    --     "loctvl842/monokai-pro.nvim",
    --     lazy = false,    -- Asegura que el tema se cargue inmediatamente
    --     priority = 1000, -- Da prioridad al tema
    --     config = function()
    --         require("monokai-pro").setup({
    --             transparent_background = true, -- **¡Aquí se agrega el modo transparente!**
    --             theme_style = "classic",
    --             -- Puedes añadir más configuraciones aquí si monokai-pro las soporta,
    --             -- como la variante del tema (por ejemplo, "classic", "spectrum", etc.)
    --             -- theme_style = "classic",
    --         })
    --         vim.cmd.colorscheme("monokai-pro")
    --         vim.cmd([[highlight Comment gui=bold ctermbg=10 guifg=LightGreen]])
    --         vim.cmd([[highlight StatusLine guibg=NONE gui=bold]])
    --         vim.cmd([[highlight LineNr guifg=#FFA500]])
    --         vim.cmd([[highlight CursorLineNr guifg=#FFA500 gui=bold]])
    --     end,
    -- },
}
