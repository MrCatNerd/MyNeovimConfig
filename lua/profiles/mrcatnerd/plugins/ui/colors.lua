function ColorMyPencils(color)
    color = color or "rose-pine-moon"
    -- color = color or "catppuccin-frappe"
    -- color = color or "tokyonight-storm"

    vim.schedule(function()
        vim.cmd.colorscheme(color)
        require("transparent").toggle(true)
    end)
end

ColorMyPencils()
