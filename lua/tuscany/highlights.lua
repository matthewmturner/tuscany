local palette = require("tuscany.palette")

local M = {}
local config = require("tuscany.config")

function M.set_highlights()
    local utilities = require("tuscany.utilities")
    local styles = config.options.styles

    local groups = {}
    for group, color in pairs(config.options.groups) do
        groups[group] = utilities.parse_color(color)
    end

    local function make_border(fg)
        fg = fg or groups.border
        return {
            fg = fg,
            bg = (config.options.extend_background_behind_borders and not styles.transparency) and
                palette.surface
                or "NONE",
        }
    end

    local highlights = {}
    local legacy_highlights = {
        ["@attribute.diff"] = { fg = palette.gold },
        ["@boolean"] = { link = "Boolean" },
        ["@class"] = { fg = palette.iris },
        ["@conditional"] = { link = "Conditional" },
        ["@field"] = { fg = palette.iris },
        ["@include"] = { link = "Include" },
        ["@interface"] = { fg = palette.iris },
        ["@macro"] = { link = "Macro" },
        ["@method"] = { fg = palette.terracotta },
        ["@namespace"] = { link = "Include" },
        ["@number"] = { link = "Number" },
        ["@parameter"] = { fg = palette.cobblestone, italic = styles.italic },
        ["@preproc"] = { link = "PreProc" },
        ["@punctuation"] = { fg = palette.white_wine },
        ["@punctuation.bracket"] = { link = "@punctuation" },
        ["@punctuation.delimiter"] = { link = "@punctuation" },
        ["@punctuation.special"] = { link = "@punctuation" },
        ["@regexp"] = { link = "String" },
        ["@repeat"] = { link = "Repeat" },
        ["@storageclass"] = { link = "StorageClass" },
        ["@symbol"] = { link = "Identifier" },
        ["@text"] = { fg = palette.text },
        ["@text.danger"] = { fg = groups.error },
        ["@text.diff.add"] = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
        ["@text.diff.delete"] = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
        ["@text.emphasis"] = { italic = styles.italic },
        ["@text.environment"] = { link = "Macro" },
        ["@text.environment.name"] = { link = "Type" },
        ["@text.math"] = { link = "Special" },
        ["@text.note"] = { link = "SpecialComment" },
        ["@text.strike"] = { strikethrough = true },
        ["@text.strong"] = { bold = styles.bold },
        ["@text.title"] = { link = "Title" },
        ["@text.title.1.markdown"] = { link = "markdownH1" },
        ["@text.title.1.marker.markdown"] = { link = "markdownH1Delimiter" },
        ["@text.title.2.markdown"] = { link = "markdownH2" },
        ["@text.title.2.marker.markdown"] = { link = "markdownH2Delimiter" },
        ["@text.title.3.markdown"] = { link = "markdownH3" },
        ["@text.title.3.marker.markdown"] = { link = "markdownH3Delimiter" },
        ["@text.title.4.markdown"] = { link = "markdownH4" },
        ["@text.title.4.marker.markdown"] = { link = "markdownH4Delimiter" },
        ["@text.title.5.markdown"] = { link = "markdownH5" },
        ["@text.title.5.marker.markdown"] = { link = "markdownH5Delimiter" },
        ["@text.title.6.markdown"] = { link = "markdownH6" },
        ["@text.title.6.marker.markdown"] = { link = "markdownH6Delimiter" },
        ["@text.underline"] = { underline = true },
        ["@text.uri"] = { fg = groups.link },
        ["@text.warning"] = { fg = groups.warn },
        ["@todo"] = { link = "Todo" },

        -- lukas-reineke/indent-blankline.nvim
        IndentBlanklineChar = { fg = palette.muted, nocombine = true },
        IndentBlanklineSpaceChar = { fg = palette.muted, nocombine = true },
        IndentBlanklineSpaceCharBlankline = { fg = palette.muted, nocombine = true },
    }
    local default_highlights = {
        ColorColumn = { bg = palette.surface },
        Conceal = { bg = "NONE" },
        CurSearch = { fg = palette.base, bg = palette.gold },
        Cursor = { fg = palette.text, bg = palette.highlight_high },
        CursorColumn = { bg = palette.overlay },
        CursorLine = { bg = palette.overlay },
        CursorLineNr = { fg = palette.text, bold = styles.bold },
        DiffAdd = { bg = groups.git_add, blend = 20 },
        DiffChange = { bg = groups.git_change, blend = 20 },
        DiffDelete = { bg = groups.git_delete, blend = 20 },
        DiffText = { bg = groups.git_text, blend = 40 },
        diffAdded = { link = "DiffAdd" },
        diffChanged = { link = "DiffChange" },
        diffRemoved = { link = "DiffDelete" },
        Directory = { fg = palette.iris, bold = styles.bold },
        ErrorMsg = { fg = groups.error, bold = styles.bold },
        FloatBorder = make_border(),
        FloatTitle = { fg = palette.iris, bg = groups.panel, bold = styles.bold },
        FoldColumn = { fg = palette.muted },
        Folded = { fg = palette.text, bg = groups.panel },
        IncSearch = { link = "CurSearch" },
        LineNr = { fg = palette.muted },
        MatchParen = { fg = palette.pine, bg = palette.pine, blend = 25 },
        ModeMsg = { fg = palette.white_wine },
        MoreMsg = { fg = palette.iris },
        NonText = { fg = palette.muted },
        Normal = { fg = palette.text, bg = palette.night },
        NormalFloat = { bg = groups.panel },
        NormalNC = { fg = palette.text, bg = config.options.dim_inactive_windows and palette._nc or palette.base },
        NvimInternalError = { link = "ErrorMsg" },
        Pmenu = { fg = palette.white_wine, bg = groups.panel },
        PmenuExtra = { fg = palette.muted, bg = groups.panel },
        PmenuExtraSel = { fg = palette.white_wine, bg = palette.overlay },
        PmenuKind = { fg = palette.iris, bg = groups.panel },
        PmenuKindSel = { fg = palette.white_wine, bg = palette.overlay },
        PmenuSbar = { bg = groups.panel },
        PmenuSel = { fg = palette.text, bg = palette.overlay },
        PmenuThumb = { bg = palette.muted },
        Question = { fg = palette.gold },
        RedrawDebugClear = { fg = palette.base, bg = palette.gold },
        RedrawDebugComposed = { fg = palette.base, bg = palette.pine },
        RedrawDebugRecompose = { fg = palette.base, bg = palette.red_wine },
        Search = { fg = palette.base, bg = palette.terracotta },
        SignColumn = { fg = palette.text, bg = "NONE" },
        SpecialKey = { fg = palette.iris },
        SpellBad = { sp = palette.white_wine, undercurl = true },
        SpellCap = { sp = palette.white_wine, undercurl = true },
        SpellLocal = { sp = palette.white_wine, undercurl = true },
        SpellRare = { sp = palette.white_wine, undercurl = true },
        StatusLine = { fg = palette.white_wine, bg = groups.panel },
        StatusLineNC = { fg = palette.muted, bg = groups.panel, blend = 60 },
        StatusLineTerm = { fg = palette.base, bg = palette.pine },
        StatusLineTermNC = { fg = palette.base, bg = palette.pine, blend = 60 },
        Substitute = { link = "IncSearch" },
        TabLine = { fg = palette.white_wine, bg = groups.panel },
        TabLineFill = { bg = groups.panel },
        TabLineSel = { fg = palette.text, bg = palette.overlay, bold = styles.bold },
        Title = { fg = palette.iris, bold = styles.bold },
        VertSplit = { fg = groups.border },
        Visual = { bg = palette.highlight_med },
        WarningMsg = { fg = groups.warn, bold = styles.bold },
        WildMenu = { link = "IncSearch" },
        WinBar = { fg = palette.white_wine, bg = groups.panel },
        WinBarNC = { fg = palette.muted, bg = groups.panel, blend = 60 },
        WinSeparator = { fg = groups.border },

        DiagnosticError = { fg = groups.error },
        DiagnosticHint = { fg = groups.hint },
        DiagnosticInfo = { fg = groups.info },
        DiagnosticOk = { fg = groups.ok },
        DiagnosticWarn = { fg = groups.warn },
        DiagnosticDefaultError = { link = "DiagnosticError" },
        DiagnosticDefaultHint = { link = "DiagnosticHint" },
        DiagnosticDefaultInfo = { link = "DiagnosticInfo" },
        DiagnosticDefaultOk = { link = "DiagnosticOk" },
        DiagnosticDefaultWarn = { link = "DiagnosticWarn" },
        DiagnosticFloatingError = { link = "DiagnosticError" },
        DiagnosticFloatingHint = { link = "DiagnosticHint" },
        DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
        DiagnosticFloatingOk = { link = "DiagnosticOk" },
        DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
        DiagnosticSignError = { link = "DiagnosticError" },
        DiagnosticSignHint = { link = "DiagnosticHint" },
        DiagnosticSignInfo = { link = "DiagnosticInfo" },
        DiagnosticSignOk = { link = "DiagnosticOk" },
        DiagnosticSignWarn = { link = "DiagnosticWarn" },
        DiagnosticUnderlineError = { sp = groups.error, undercurl = true },
        DiagnosticUnderlineHint = { sp = groups.hint, undercurl = true },
        DiagnosticUnderlineInfo = { sp = groups.info, undercurl = true },
        DiagnosticUnderlineOk = { sp = groups.ok, undercurl = true },
        DiagnosticUnderlineWarn = { sp = groups.warn, undercurl = true },
        DiagnosticVirtualTextError = { fg = groups.error, bg = groups.error, blend = 10 },
        DiagnosticVirtualTextHint = { fg = groups.hint, bg = groups.hint, blend = 10 },
        DiagnosticVirtualTextInfo = { fg = groups.info, bg = groups.info, blend = 10 },
        DiagnosticVirtualTextOk = { fg = groups.ok, bg = groups.ok, blend = 10 },
        DiagnosticVirtualTextWarn = { fg = groups.warn, bg = groups.warn, blend = 10 },

        Boolean = { fg = palette.terracotta },
        Character = { fg = palette.gold },
        Comment = { fg = palette.comment, italic = styles.italic },
        Conditional = { fg = palette.pine },
        Constant = { fg = palette.gold },
        Debug = { fg = palette.terracotta },
        Define = { fg = palette.iris },
        Delimiter = { fg = palette.white_wine },
        Error = { fg = palette.red_wine },
        Exception = { fg = palette.pine },
        Float = { fg = palette.gold },
        Function = { fg = palette.terracotta },
        Identifier = { fg = palette.text },
        Include = { fg = palette.pine },
        Keyword = { fg = palette.pine },
        Label = { fg = palette.iris },
        LspCodeLens = { fg = palette.white_wine },
        LspCodeLensSeparator = { fg = palette.muted },
        LspInlayHint = { fg = palette.muted, bg = palette.muted, blend = 10 },
        LspReferenceRead = { bg = palette.highlight_med },
        LspReferenceText = { bg = palette.highlight_med },
        LspReferenceWrite = { bg = palette.highlight_med },
        Macro = { fg = palette.iris },
        Number = { fg = palette.gold },
        Operator = { fg = palette.white_wine },
        PreCondit = { fg = palette.iris },
        PreProc = { link = "PreCondit" },
        Repeat = { fg = palette.pine },
        Special = { fg = palette.iris },
        SpecialChar = { link = "Special" },
        SpecialComment = { fg = palette.iris },
        Statement = { fg = palette.pine, bold = styles.bold },
        StorageClass = { fg = palette.iris },
        String = { fg = palette.gold },
        Structure = { fg = palette.iris },
        Tag = { fg = palette.iris },
        Todo = { fg = palette.terracotta, bg = palette.terracotta, blend = 20 },
        Type = { fg = palette.iris },
        TypeDef = { link = "Type" },
        Underlined = { fg = palette.iris, underline = true },

        healthError = { fg = groups.error },
        healthSuccess = { fg = groups.info },
        healthWarning = { fg = groups.warn },

        htmlArg = { fg = palette.iris },
        htmlBold = { bold = styles.bold },
        htmlEndTag = { fg = palette.white_wine },
        htmlH1 = { link = "markdownH1" },
        htmlH2 = { link = "markdownH2" },
        htmlH3 = { link = "markdownH3" },
        htmlH4 = { link = "markdownH4" },
        htmlH5 = { link = "markdownH5" },
        htmlItalic = { italic = styles.italic },
        htmlLink = { link = "markdownUrl" },
        htmlTag = { fg = palette.white_wine },
        htmlTagN = { fg = palette.text },
        htmlTagName = { fg = palette.iris },

        markdownDelimiter = { fg = palette.white_wine },
        markdownH1 = { fg = groups.h1, bold = styles.bold },
        markdownH1Delimiter = { link = "markdownH1" },
        markdownH2 = { fg = groups.h2, bold = styles.bold },
        markdownH2Delimiter = { link = "markdownH2" },
        markdownH3 = { fg = groups.h3, bold = styles.bold },
        markdownH3Delimiter = { link = "markdownH3" },
        markdownH4 = { fg = groups.h4, bold = styles.bold },
        markdownH4Delimiter = { link = "markdownH4" },
        markdownH5 = { fg = groups.h5, bold = styles.bold },
        markdownH5Delimiter = { link = "markdownH5" },
        markdownH6 = { fg = groups.h6, bold = styles.bold },
        markdownH6Delimiter = { link = "markdownH6" },
        markdownLinkText = { link = "markdownUrl" },
        markdownUrl = { fg = groups.link, sp = groups.link, underline = true },

        mkdCode = { fg = palette.iris, italic = styles.italic },
        mkdCodeDelimiter = { fg = palette.terracotta },
        mkdCodeEnd = { fg = palette.iris },
        mkdCodeStart = { fg = palette.iris },
        mkdFootnotes = { fg = palette.iris },
        mkdID = { fg = palette.iris, underline = true },
        mkdInlineURL = { link = "markdownUrl" },
        mkdLink = { link = "markdownUrl" },
        mkdLinkDef = { link = "markdownUrl" },
        mkdListItemLine = { fg = palette.text },
        mkdRule = { fg = palette.white_wine },
        mkdURL = { link = "markdownUrl" },

        --- Identifiers
        ["@variable"] = { fg = palette.text, italic = styles.italic },
        ["@variable.builtin"] = { fg = palette.red_wine, bold = styles.bold },
        ["@variable.parameter"] = { fg = palette.cobblestone, italic = styles.italic },
        ["@variable.member"] = { fg = palette.iris },

        ["@constant"] = { fg = palette.gold },
        ["@constant.builtin"] = { fg = palette.gold, bold = styles.bold },
        ["@constant.macro"] = { fg = palette.gold },

        ["@module"] = { fg = palette.text },
        ["@module.builtin"] = { fg = palette.text, bold = styles.bold },
        ["@label"] = { link = "Label" },

        --- Literals
        ["@string"] = { link = "String" },
        ["@string.regexp"] = { fg = palette.iris },
        ["@string.escape"] = { fg = palette.pine },
        ["@string.special"] = { link = "String" },
        ["@string.special.symbol"] = { link = "Identifier" },
        ["@string.special.url"] = { fg = groups.link },

        ["@character"] = { link = "Character" },
        ["@character.special"] = { link = "Character" },

        ["@boolean"] = { link = "Boolean" },
        ["@number"] = { link = "Number" },
        ["@number.float"] = { link = "Number" },
        ["@float"] = { link = "Number" },

        --- Types
        ["@type"] = { fg = palette.iris },
        ["@type.builtin"] = { fg = palette.iris, bold = styles.bold },

        -- ["@attribute"] = {},
        ["@property"] = { fg = palette.iris, italic = styles.italic },

        --- Functions
        ["@function"] = { fg = palette.terracotta },
        ["@function.builtin"] = { fg = palette.terracotta, bold = styles.bold },
        ["@function.macro"] = { link = "Function" },
        ["@function.method"] = { fg = palette.terracotta },
        ["@function.method.call"] = { fg = palette.terracotta },

        ["@constructor"] = { fg = palette.iris },
        ["@operator"] = { link = "Operator" },

        --- Keywords
        ["@keyword"] = { link = "Keyword" },
        ["@keyword.operator"] = { fg = palette.white_wine },
        ["@keyword.import"] = { fg = palette.pine },
        ["@keyword.storage"] = { fg = palette.iris },
        ["@keyword.repeat"] = { fg = palette.pine },
        ["@keyword.return"] = { fg = palette.red_wine },
        ["@keyword.debug"] = { fg = palette.terracotta },
        ["@keyword.exception"] = { fg = palette.pine },
        ["@keyword.conditional"] = { fg = palette.pine },
        ["@keyword.conditional.ternary"] = { fg = palette.pine },
        ["@keyword.directive"] = { fg = palette.iris },
        ["@keyword.directive.define"] = { fg = palette.iris },

        --- Punctuation
        ["@punctuation.delimiter"] = { fg = palette.white_wine },
        ["@punctuation.bracket"] = { fg = palette.white_wine },
        ["@punctuation.special"] = { fg = palette.white_wine },

        --- Comments
        ["@comment"] = { link = "Comment" },
        ["@comment.error"] = { fg = groups.error },
        ["@comment.warning"] = { fg = groups.warn },
        ["@comment.todo"] = { fg = groups.todo, bg = groups.todo, blend = 20 },
        ["@comment.hint"] = { fg = groups.hint, bg = groups.hint, blend = 20 },
        ["@comment.info"] = { fg = groups.info, bg = groups.info, blend = 20 },
        ["@comment.note"] = { fg = groups.note, bg = groups.note, blend = 20 },

        --- Markup
        ["@markup.strong"] = { bold = styles.bold },
        ["@markup.italic"] = { italic = styles.italic },
        ["@markup.strikethrough"] = { strikethrough = true },
        ["@markup.underline"] = { underline = true },

        ["@markup.heading"] = { fg = palette.iris, bold = styles.bold },

        ["@markup.quote"] = { fg = palette.text },
        ["@markup.math"] = { link = "Special" },
        ["@markup.environment"] = { link = "Macro" },
        ["@markup.environment.name"] = { link = "@type" },

        ["@markup.link.markdown_inline"] = { fg = palette.white_wine },
        ["@markup.link.label.markdown_inline"] = { fg = palette.iris },
        ["@markup.link.url"] = { fg = groups.link },

        ["@markup.raw.delimiter.markdown"] = { fg = palette.white_wine },

        ["@markup.list"] = { fg = palette.pine },
        ["@markup.list.checked"] = { fg = palette.iris, bg = palette.iris, blend = 10 },
        ["@markup.list.unchecked"] = { fg = palette.text },

        -- Markdown headings
        ["@markup.heading.1.markdown"] = { link = "markdownH1" },
        ["@markup.heading.2.markdown"] = { link = "markdownH2" },
        ["@markup.heading.3.markdown"] = { link = "markdownH3" },
        ["@markup.heading.4.markdown"] = { link = "markdownH4" },
        ["@markup.heading.5.markdown"] = { link = "markdownH5" },
        ["@markup.heading.6.markdown"] = { link = "markdownH6" },
        ["@markup.heading.1.marker.markdown"] = { link = "markdownH1Delimiter" },
        ["@markup.heading.2.marker.markdown"] = { link = "markdownH2Delimiter" },
        ["@markup.heading.3.marker.markdown"] = { link = "markdownH3Delimiter" },
        ["@markup.heading.4.marker.markdown"] = { link = "markdownH4Delimiter" },
        ["@markup.heading.5.marker.markdown"] = { link = "markdownH5Delimiter" },
        ["@markup.heading.6.marker.markdown"] = { link = "markdownH6Delimiter" },

        ["@diff.plus"] = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
        ["@diff.minus"] = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
        ["@diff.delta"] = { bg = groups.git_change, blend = 20 },

        ["@tag"] = { link = "Tag" },
        ["@tag.attribute"] = { fg = palette.white_wine },
        ["@tag.delimiter"] = { fg = palette.white_wine },
        ["@tag.builtin.tsx"] = { fg = palette.iris },

        --- Non-highlighting captures
        ["@conceal"] = { link = "Conceal" },
        ["@conceal.markdown"] = { fg = palette.white_wine },

        --- Semantic
        ["@lsp.type.comment"] = {},
        ["@lsp.type.comment.c"] = { link = "@comment" },
        ["@lsp.type.comment.cpp"] = { link = "@comment" },
        ["@lsp.type.enum"] = { link = "@type" },
        ["@lsp.type.interface"] = { link = "@interface" },
        ["@lsp.type.keyword"] = { link = "@keyword" },
        ["@lsp.type.namespace"] = { link = "@namespace" },
        ["@lsp.type.namespace.python"] = { link = "@variable" },
        ["@lsp.type.parameter"] = { link = "@parameter" },
        ["@lsp.type.property"] = { link = "@property" },
        ["@lsp.type.variable"] = {}, -- defer to treesitter for regular variables
        ["@lsp.type.variable.svelte"] = { link = "@variable" },
        ["@lsp.type.type.typescriptreact"] = { fg = palette.red_wine },
        ["@lsp.type.interface.typescriptreact"] = { fg = palette.red_wine },
        ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
        ["@lsp.typemod.operator.injected"] = { link = "@operator" },
        ["@lsp.typemod.string.injected"] = { link = "@string" },
        ["@lsp.typemod.variable.constant"] = { link = "@constant" },
        ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
        ["@lsp.typemod.variable.injected"] = { link = "@variable" },

        --- Plugins
        -- lewis6991/gitsigns.nvim
        GitSignsAdd = { link = "SignAdd" },
        GitSignsChange = { link = "SignChange" },
        GitSignsDelete = { link = "SignDelete" },
        SignAdd = { fg = groups.git_add, bg = "NONE" },
        SignChange = { fg = groups.git_change, bg = "NONE" },
        SignDelete = { fg = groups.git_delete, bg = "NONE" },

        -- folke/flash.nvim
        FlashLabel = { fg = palette.base, bg = palette.red_wine },

        -- folke/which-key.nvim
        WhichKey = { fg = palette.iris },
        WhichKeyBorder = make_border(),
        WhichKeyDesc = { fg = palette.gold },
        WhichKeyFloat = { bg = groups.panel },
        WhichKeyGroup = { fg = palette.iris },
        WhichKeyIcon = { fg = palette.pine },
        WhichKeyIconAzure = { fg = palette.pine },
        WhichKeyIconBlue = { fg = palette.pine },
        WhichKeyIconCyan = { fg = palette.iris },
        WhichKeyIconGreen = { fg = palette.pine },
        WhichKeyIconGrey = { fg = palette.white_wine },
        WhichKeyIconOrange = { fg = palette.terracotta },
        WhichKeyIconPurple = { fg = palette.iris },
        WhichKeyIconRed = { fg = palette.red_wine },
        WhichKeyIconYellow = { fg = palette.gold },
        WhichKeyNormal = { link = "NormalFloat" },
        WhichKeySeparator = { fg = palette.white_wine },
        WhichKeyTitle = { link = "FloatTitle" },
        WhichKeyValue = { fg = palette.terracotta },

        -- lukas-reineke/indent-blankline.nvim
        IblIndent = { fg = palette.overlay },
        IblScope = { fg = palette.iris },
        IblWhitespace = { fg = palette.overlay },

        -- hrsh7th/nvim-cmp
        CmpItemAbbr = { fg = palette.white_wine },
        CmpItemAbbrDeprecated = { fg = palette.white_wine, strikethrough = true },
        CmpItemAbbrMatch = { fg = palette.text, bold = styles.bold },
        CmpItemAbbrMatchFuzzy = { fg = palette.text, bold = styles.bold },
        CmpItemKind = { fg = palette.white_wine },
        CmpItemKindClass = { link = "StorageClass" },
        CmpItemKindFunction = { link = "Function" },
        CmpItemKindInterface = { link = "Type" },
        CmpItemKindMethod = { link = "PreProc" },
        CmpItemKindSnippet = { link = "String" },
        CmpItemKindVariable = { link = "Identifier" },

        -- nvim-telescope/telescope.nvim
        TelescopeBorder = make_border(),
        TelescopeMatching = { fg = palette.terracotta },
        TelescopeNormal = { link = "NormalFloat" },
        TelescopePromptNormal = { link = "TelescopeNormal" },
        TelescopePromptPrefix = { fg = palette.white_wine },
        TelescopeSelection = { fg = palette.text, bg = palette.overlay },
        TelescopeSelectionCaret = { fg = palette.terracotta, bg = palette.overlay },
        TelescopeTitle = { fg = palette.iris, bold = styles.bold },

        -- rcarriga/nvim-dap-ui
        DapUIBreakpointsCurrentLine = { fg = palette.gold, bold = styles.bold },
        DapUIBreakpointsDisabledLine = { fg = palette.muted },
        DapUIBreakpointsInfo = { link = "DapUIThread" },
        DapUIBreakpointsLine = { link = "DapUIBreakpointsPath" },
        DapUIBreakpointsPath = { fg = palette.iris },
        DapUIDecoration = { link = "DapUIBreakpointsPath" },
        DapUIFloatBorder = make_border(),
        DapUIFrameName = { fg = palette.text },
        DapUILineNumber = { link = "DapUIBreakpointsPath" },
        DapUIModifiedValue = { fg = palette.iris, bold = styles.bold },
        DapUIScope = { link = "DapUIBreakpointsPath" },
        DapUISource = { fg = palette.iris },
        DapUIStoppedThread = { link = "DapUIBreakpointsPath" },
        DapUIThread = { fg = palette.gold },
        DapUIValue = { fg = palette.text },
        DapUIVariable = { fg = palette.text },
        DapUIWatchesEmpty = { fg = palette.red_wine },
        DapUIWatchesError = { link = "DapUIWatchesEmpty" },
        DapUIWatchesValue = { link = "DapUIThread" },

        -- folke/noice.nvim
        NoiceCursor = { fg = palette.highlight_high, bg = palette.text },

        -- folke/trouble.nvim
        TroubleText = { fg = palette.white_wine },
        TroubleCount = { fg = palette.iris, bg = palette.surface },
        TroubleNormal = { fg = palette.text, bg = groups.panel },

        -- echasnovski/mini.nvim
        MiniHipatternsFixme = { fg = palette.base, bg = groups.error, bold = styles.bold },
        MiniHipatternsHack = { fg = palette.base, bg = groups.warn, bold = styles.bold },
        MiniHipatternsNote = { fg = palette.base, bg = groups.info, bold = styles.bold },
        MiniHipatternsTodo = { fg = palette.base, bg = groups.hint, bold = styles.bold },


        -- github/copilot.vim
        CopilotSuggestion = { fg = palette.muted, italic = styles.italic },

        -- nvim-treesitter/nvim-treesitter-context
        TreesitterContext = { bg = palette.overlay },
        TreesitterContextLineNumber = { fg = palette.terracotta, bg = palette.overlay },

        -- RRethy/vim-illuminate
        IlluminatedWordRead = { link = "LspReferenceRead" },
        IlluminatedWordText = { link = "LspReferenceText" },
        IlluminatedWordWrite = { link = "LspReferenceWrite" },

        -- MagicDuck/grug-far.nvim
        GrugFarHelpHeader = { fg = palette.pine },
        GrugFarHelpHeaderKey = { fg = palette.gold },
        GrugFarHelpWinActionKey = { fg = palette.gold },
        GrugFarHelpWinActionPrefix = { fg = palette.iris },
        GrugFarHelpWinActionText = { fg = palette.pine },
        GrugFarHelpWinHeader = { link = "FloatTitle" },
        GrugFarInputLabel = { fg = palette.iris },
        GrugFarInputPlaceholder = { link = "Comment" },
        GrugFarResultsActionMessage = { fg = palette.iris },
        GrugFarResultsChangeIndicator = { fg = groups.git_change },
        GrugFarResultsHeader = { fg = palette.pine },
        GrugFarResultsLineNo = { fg = palette.iris },
        GrugFarResultsLineColumn = { link = "GrugFarResultsLineNo" },
        GrugFarResultsMatch = { link = "CurSearch" },
        GrugFarResultsPath = { fg = palette.iris },
        GrugFarResultsStats = { fg = palette.iris },
    }
    local transparency_highlights = {
        DiagnosticVirtualTextError = { fg = groups.error },
        DiagnosticVirtualTextHint = { fg = groups.hint },
        DiagnosticVirtualTextInfo = { fg = groups.info },
        DiagnosticVirtualTextOk = { fg = groups.ok },
        DiagnosticVirtualTextWarn = { fg = groups.warn },

        FloatBorder = { fg = palette.muted, bg = "NONE" },
        FloatTitle = { fg = palette.iris, bg = "NONE", bold = styles.bold },
        Folded = { fg = palette.text, bg = "NONE" },
        NormalFloat = { bg = "NONE" },
        Normal = { fg = palette.text, bg = "NONE" },
        NormalNC = { fg = palette.text, bg = config.options.dim_inactive_windows and palette._nc or "NONE" },
        Pmenu = { fg = palette.white_wine, bg = "NONE" },
        PmenuKind = { fg = palette.iris, bg = "NONE" },
        SignColumn = { fg = palette.text, bg = "NONE" },
        StatusLine = { fg = palette.white_wine, bg = "NONE" },
        StatusLineNC = { fg = palette.muted, bg = "NONE" },
        TabLine = { bg = "NONE", fg = palette.white_wine },
        TabLineFill = { bg = "NONE" },
        TabLineSel = { fg = palette.text, bg = "NONE", bold = styles.bold },

        -- ["@markup.raw"] = { bg = "none" },
        ["@markup.raw.markdown_inline"] = { fg = palette.gold },
        -- ["@markup.raw.block"] = { bg = "none" },

        TelescopeNormal = { fg = palette.white_wine, bg = "NONE" },
        TelescopePromptNormal = { fg = palette.text, bg = "NONE" },
        TelescopeSelection = { fg = palette.text, bg = "NONE", bold = styles.bold },
        TelescopeSelectionCaret = { fg = palette.terracotta },

        WhichKeyFloat = { bg = "NONE" },
        WhichKeyNormal = { bg = "NONE" },

        IblIndent = { fg = palette.overlay, bg = "NONE" },
        IblScope = { fg = palette.iris, bg = "NONE" },
        IblWhitespace = { fg = palette.overlay, bg = "NONE" },

        TreesitterContext = { bg = "NONE" },
        TreesitterContextLineNumber = { fg = palette.terracotta, bg = "NONE" },
    }

    if config.options.enable.legacy_highlights then
        for group, highlight in pairs(legacy_highlights) do
            highlights[group] = highlight
        end
    end
    for group, highlight in pairs(default_highlights) do
        highlights[group] = highlight
    end
    if styles.transparency then
        for group, highlight in pairs(transparency_highlights) do
            highlights[group] = highlight
        end
    end

    -- Reconcile highlights with config
    if config.options.highlight_groups ~= nil and next(config.options.highlight_groups) ~= nil then
        for group, highlight in pairs(config.options.highlight_groups) do
            local existing = highlights[group] or {}
            -- Traverse link due to
            -- "If link is used in combination with other attributes; only the link will take effect"
            -- see: https://neovim.io/doc/user/api.html#nvim_set_hl()
            while existing.link ~= nil do
                existing = highlights[existing.link] or {}
            end
            local parsed = vim.tbl_extend("force", {}, highlight)

            if highlight.fg ~= nil then
                parsed.fg = utilities.parse_color(highlight.fg) or highlight.fg
            end
            if highlight.bg ~= nil then
                parsed.bg = utilities.parse_color(highlight.bg) or highlight.bg
            end
            if highlight.sp ~= nil then
                parsed.sp = utilities.parse_color(highlight.sp) or highlight.sp
            end

            if (highlight.inherit == nil or highlight.inherit) and existing ~= nil then
                parsed.inherit = nil
                highlights[group] = vim.tbl_extend("force", existing, parsed)
            else
                parsed.inherit = nil
                highlights[group] = parsed
            end
        end
    end

    for group, highlight in pairs(highlights) do
        if config.options.before_highlight ~= nil then
            config.options.before_highlight(group, highlight, palette)
        end
        if highlight.blend ~= nil and (highlight.blend >= 0 and highlight.blend <= 100) and highlight.bg ~= nil then
            highlight.bg = utilities.blend(highlight.bg, highlight.blend_on or palette.base,
                highlight.blend / 100)
        end
        vim.api.nvim_set_hl(0, group, highlight)
    end

    --- Terminal
    if config.options.enable.terminal then
        vim.g.terminal_color_0 = palette.overlay     -- black
        vim.g.terminal_color_8 = palette.white_wine  -- bright black
        vim.g.terminal_color_1 = palette.red_wine    -- red
        vim.g.terminal_color_9 = palette.red_wine    -- bright red
        vim.g.terminal_color_2 = palette.pine        -- green
        vim.g.terminal_color_10 = palette.pine       -- bright green
        vim.g.terminal_color_3 = palette.gold        -- yellow
        vim.g.terminal_color_11 = palette.gold       -- bright yellow
        vim.g.terminal_color_4 = palette.iris        -- blue
        vim.g.terminal_color_12 = palette.iris       -- bright blue
        vim.g.terminal_color_5 = palette.iris        -- magenta
        vim.g.terminal_color_13 = palette.iris       -- bright magenta
        vim.g.terminal_color_6 = palette.terracotta  -- cyan
        vim.g.terminal_color_14 = palette.terracotta -- bright cyan
        vim.g.terminal_color_7 = palette.text        -- white
        vim.g.terminal_color_15 = palette.text       -- bright white

        -- Support StatusLineTerm & StatusLineTermNC from vim
        --       vim.cmd([[
        -- augroup rose-pine
        -- 	autocmd!
        -- 	autocmd TermOpen * if &buftype=='terminal'
        -- 		\|setlocal winhighlight=StatusLine:StatusLineTerm,StatusLineNC:StatusLineTermNC
        -- 		\|else|setlocal winhighlight=|endif
        -- 	autocmd ColorSchemePre * autocmd! rose-pine
        -- augroup END
        -- ]])
    end
end

function M.colorscheme()
    -- config.extend_options({ variant = variant })

    vim.opt.termguicolors = true
    if vim.g.colors_name then
        vim.cmd("hi clear")
        vim.cmd("syntax reset")
    end
    vim.g.colors_name = "tuscany"

    M.set_highlights()
end

---@param options Options
function M.setup(options)
    config.extend_options(options or {})
end

return M
