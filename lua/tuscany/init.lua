local highlights = require("tuscany.highlights")

local M = {}

---@alias TuscanyTheme 'tuscany-auto' | 'tuscany-night' | 'tuscany-day'

---@type TuscanyTheme
M.theme = 'tuscany-night'


---@param opts? table<'theme', TuscanyTheme>
function M.setup(opts)
    opts = opts or {}
    if opts.theme then
        print("Theme in opts, setting")
        M.theme = opts.theme
    end
end

---@param theme? TuscanyTheme
function M.load_theme(theme)
    print("Loading theme: ", theme)
    if theme == 'tuscany-auto' then
        -- Do some work to get system theme
        print('Getting system settings')
    elseif theme == 'tuscany-night' then
        print('Setting up tuscany-night')
        highlights.colorscheme()
    else
        print('Setting up tuscany-day')
    end
end

return M
