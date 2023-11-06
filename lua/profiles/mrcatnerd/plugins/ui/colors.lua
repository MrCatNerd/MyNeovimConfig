function ColorMyPencils(color)
    -- color = color or "rose-pine-moon"
    color = color or "catppuccin-frappe"

    vim.schedule(function()
        vim.cmd.colorscheme(color)
        require("transparent").toggle(true)
    end)
end

ColorMyPencils()
