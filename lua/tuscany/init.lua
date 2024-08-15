local M = {}

function M.setup(opts)
    opts = opts or {}
    print("Opts in setup", opts)
    vim.g.colors_name = "tuscany"
end

function M.load_theme()
    print("Loading theme")
end

return M
