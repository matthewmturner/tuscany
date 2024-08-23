local highlights = require("tuscany.highlights")

local M = {}

---@alias TuscanyTheme 'tuscany-auto' | 'tuscany-night' | 'tuscany-day'

---@type TuscanyTheme
M.theme = 'tuscany-night'


---@param opts? table<'variant', TuscanyTheme>
function M.setup(opts)
    opts = opts or {}
    if opts.variant then
        M.load_theme(opts.variant)
    end
end

---@param theme? TuscanyTheme
function M.load_theme(theme)
    if theme == 'tuscany-auto' then
        -- Do some work to get system theme
        print('Getting system settings')
    elseif theme == 'tuscany-night' then
        highlights.colorscheme()
    else
        print('Setting up tuscany-day')
    end
end

return M
