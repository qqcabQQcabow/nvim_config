vim.opt.termguicolors = true
function SetColor(color)
    color = color or "solarized"
    vim.cmd.colorscheme(color)
end

SetColor()

