-- Retro Amber Colorscheme for Neovim
-- Matches the Alacritty retro amber CRT theme

local M = {}

-- Amber color palette
M.colors = {
    -- Base colors
    bg = "#0f0a00",
    bg_dark = "#080500",
    bg_light = "#1a1200",
    bg_highlight = "#2a1f00",

    -- Foreground colors
    fg = "#ffb000",
    fg_bright = "#ffc333",
    fg_dim = "#996600",
    fg_dark = "#804000",

    -- Accent variations
    amber = "#ffb000",
    amber_bright = "#ffd966",
    amber_light = "#ffc333",
    amber_dim = "#b37a00",
    amber_dark = "#805500",
    amber_darker = "#4d3000",

    -- Semantic colors (amber variations for different meanings)
    error = "#ff6600",      -- orange-red for errors
    warning = "#ffcc00",    -- bright yellow-amber for warnings
    info = "#ffc333",       -- light amber for info
    hint = "#996600",       -- dim amber for hints
    ok = "#ccaa00",         -- yellow-amber for success

    -- Syntax highlighting (subtle amber variations)
    keyword = "#ffb000",
    string = "#cc8800",
    number = "#ffd966",
    func = "#ffc333",
    type = "#e69500",
    constant = "#ffcc4d",
    variable = "#b37a00",
    comment = "#664400",
    operator = "#996600",
    special = "#f0a000",

    -- UI elements
    border = "#805500",
    selection = "#4d3000",
    cursor_line = "#1a1200",
    line_nr = "#664400",
    line_nr_cur = "#ffb000",
    visual = "#4d3000",
    search = "#805500",
    match = "#996600",

    -- Git colors (amber tinted)
    git_add = "#aa8800",
    git_change = "#cc9900",
    git_delete = "#aa5500",

    -- Diff colors
    diff_add = "#1a1500",
    diff_change = "#1a1200",
    diff_delete = "#1a0a00",
    diff_text = "#2a1f00",

    -- None/transparent
    none = "NONE",
}

function M.setup()
    local c = M.colors

    -- Reset highlighting
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "retro_amber"

    -- Helper function
    local function hi(group, opts)
        vim.api.nvim_set_hl(0, group, opts)
    end

    -- Editor UI
    hi("Normal", { fg = c.fg, bg = c.bg })
    hi("NormalFloat", { fg = c.fg, bg = c.bg_dark })
    hi("NormalNC", { fg = c.fg_dim, bg = c.bg })
    hi("Cursor", { fg = c.bg, bg = c.fg })
    hi("CursorLine", { bg = c.cursor_line })
    hi("CursorColumn", { bg = c.cursor_line })
    hi("ColorColumn", { bg = c.bg_light })
    hi("LineNr", { fg = c.line_nr })
    hi("CursorLineNr", { fg = c.line_nr_cur, bold = true })
    hi("SignColumn", { fg = c.fg_dim, bg = c.bg })
    hi("VertSplit", { fg = c.border, bg = c.bg })
    hi("WinSeparator", { fg = c.border, bg = c.bg })
    hi("Folded", { fg = c.fg_dim, bg = c.bg_light })
    hi("FoldColumn", { fg = c.fg_dim, bg = c.bg })
    hi("StatusLine", { fg = c.fg, bg = c.bg_highlight })
    hi("StatusLineNC", { fg = c.fg_dim, bg = c.bg_light })
    hi("TabLine", { fg = c.fg_dim, bg = c.bg_light })
    hi("TabLineFill", { bg = c.bg })
    hi("TabLineSel", { fg = c.fg_bright, bg = c.bg_highlight })
    hi("Title", { fg = c.fg_bright, bold = true })
    hi("Visual", { bg = c.visual })
    hi("VisualNOS", { bg = c.visual })
    hi("Search", { fg = c.bg, bg = c.search })
    hi("IncSearch", { fg = c.bg, bg = c.fg_bright })
    hi("CurSearch", { fg = c.bg, bg = c.fg_bright })
    hi("Substitute", { fg = c.bg, bg = c.warning })
    hi("MatchParen", { fg = c.fg_bright, bg = c.match, bold = true })
    hi("ModeMsg", { fg = c.fg_bright })
    hi("MoreMsg", { fg = c.info })
    hi("Question", { fg = c.info })
    hi("WarningMsg", { fg = c.warning })
    hi("ErrorMsg", { fg = c.error, bold = true })
    hi("NonText", { fg = c.amber_darker })
    hi("SpecialKey", { fg = c.amber_darker })
    hi("Whitespace", { fg = c.amber_darker })
    hi("EndOfBuffer", { fg = c.bg_light })
    hi("Directory", { fg = c.amber_light })
    hi("Conceal", { fg = c.fg_dim })
    hi("Pmenu", { fg = c.fg, bg = c.bg_light })
    hi("PmenuSel", { fg = c.fg_bright, bg = c.selection })
    hi("PmenuSbar", { bg = c.bg_highlight })
    hi("PmenuThumb", { bg = c.amber_dim })
    hi("WildMenu", { fg = c.bg, bg = c.fg })
    hi("FloatBorder", { fg = c.border, bg = c.bg_dark })
    hi("WinBar", { fg = c.fg, bg = c.bg })
    hi("WinBarNC", { fg = c.fg_dim, bg = c.bg })

    -- Syntax highlighting
    hi("Comment", { fg = c.comment, italic = true })
    hi("Constant", { fg = c.constant })
    hi("String", { fg = c.string })
    hi("Character", { fg = c.string })
    hi("Number", { fg = c.number })
    hi("Boolean", { fg = c.number })
    hi("Float", { fg = c.number })
    hi("Identifier", { fg = c.variable })
    hi("Function", { fg = c.func })
    hi("Statement", { fg = c.keyword })
    hi("Conditional", { fg = c.keyword })
    hi("Repeat", { fg = c.keyword })
    hi("Label", { fg = c.keyword })
    hi("Operator", { fg = c.operator })
    hi("Keyword", { fg = c.keyword })
    hi("Exception", { fg = c.keyword })
    hi("PreProc", { fg = c.special })
    hi("Include", { fg = c.special })
    hi("Define", { fg = c.special })
    hi("Macro", { fg = c.special })
    hi("PreCondit", { fg = c.special })
    hi("Type", { fg = c.type })
    hi("StorageClass", { fg = c.type })
    hi("Structure", { fg = c.type })
    hi("Typedef", { fg = c.type })
    hi("Special", { fg = c.special })
    hi("SpecialChar", { fg = c.special })
    hi("Tag", { fg = c.keyword })
    hi("Delimiter", { fg = c.fg_dim })
    hi("SpecialComment", { fg = c.comment, bold = true })
    hi("Debug", { fg = c.warning })
    hi("Underlined", { fg = c.info, underline = true })
    hi("Ignore", { fg = c.fg_dark })
    hi("Error", { fg = c.error, bold = true })
    hi("Todo", { fg = c.bg, bg = c.warning, bold = true })

    -- Diagnostics
    hi("DiagnosticError", { fg = c.error })
    hi("DiagnosticWarn", { fg = c.warning })
    hi("DiagnosticInfo", { fg = c.info })
    hi("DiagnosticHint", { fg = c.hint })
    hi("DiagnosticOk", { fg = c.ok })
    hi("DiagnosticVirtualTextError", { fg = c.error, bg = c.bg_light })
    hi("DiagnosticVirtualTextWarn", { fg = c.warning, bg = c.bg_light })
    hi("DiagnosticVirtualTextInfo", { fg = c.info, bg = c.bg_light })
    hi("DiagnosticVirtualTextHint", { fg = c.hint, bg = c.bg_light })
    hi("DiagnosticUnderlineError", { sp = c.error, undercurl = true })
    hi("DiagnosticUnderlineWarn", { sp = c.warning, undercurl = true })
    hi("DiagnosticUnderlineInfo", { sp = c.info, undercurl = true })
    hi("DiagnosticUnderlineHint", { sp = c.hint, undercurl = true })

    -- Git signs
    hi("GitSignsAdd", { fg = c.git_add })
    hi("GitSignsChange", { fg = c.git_change })
    hi("GitSignsDelete", { fg = c.git_delete })
    hi("GitSignsAddNr", { fg = c.git_add })
    hi("GitSignsChangeNr", { fg = c.git_change })
    hi("GitSignsDeleteNr", { fg = c.git_delete })
    hi("GitSignsAddLn", { bg = c.diff_add })
    hi("GitSignsChangeLn", { bg = c.diff_change })
    hi("GitSignsDeleteLn", { bg = c.diff_delete })

    -- Diff
    hi("DiffAdd", { bg = c.diff_add })
    hi("DiffChange", { bg = c.diff_change })
    hi("DiffDelete", { fg = c.git_delete, bg = c.diff_delete })
    hi("DiffText", { bg = c.diff_text })

    -- Treesitter
    hi("@variable", { fg = c.fg })
    hi("@variable.builtin", { fg = c.variable })
    hi("@variable.parameter", { fg = c.variable })
    hi("@variable.member", { fg = c.fg_dim })
    hi("@constant", { fg = c.constant })
    hi("@constant.builtin", { fg = c.constant })
    hi("@constant.macro", { fg = c.constant })
    hi("@module", { fg = c.type })
    hi("@label", { fg = c.keyword })
    hi("@string", { fg = c.string })
    hi("@string.documentation", { fg = c.comment })
    hi("@string.regexp", { fg = c.special })
    hi("@string.escape", { fg = c.special })
    hi("@character", { fg = c.string })
    hi("@boolean", { fg = c.number })
    hi("@number", { fg = c.number })
    hi("@number.float", { fg = c.number })
    hi("@type", { fg = c.type })
    hi("@type.builtin", { fg = c.type })
    hi("@type.definition", { fg = c.type })
    hi("@attribute", { fg = c.special })
    hi("@property", { fg = c.fg_dim })
    hi("@function", { fg = c.func })
    hi("@function.builtin", { fg = c.func })
    hi("@function.call", { fg = c.func })
    hi("@function.macro", { fg = c.special })
    hi("@function.method", { fg = c.func })
    hi("@function.method.call", { fg = c.func })
    hi("@constructor", { fg = c.type })
    hi("@operator", { fg = c.operator })
    hi("@keyword", { fg = c.keyword })
    hi("@keyword.coroutine", { fg = c.keyword })
    hi("@keyword.function", { fg = c.keyword })
    hi("@keyword.operator", { fg = c.operator })
    hi("@keyword.import", { fg = c.special })
    hi("@keyword.storage", { fg = c.keyword })
    hi("@keyword.repeat", { fg = c.keyword })
    hi("@keyword.return", { fg = c.keyword })
    hi("@keyword.debug", { fg = c.warning })
    hi("@keyword.exception", { fg = c.keyword })
    hi("@keyword.conditional", { fg = c.keyword })
    hi("@keyword.directive", { fg = c.special })
    hi("@keyword.directive.define", { fg = c.special })
    hi("@punctuation.delimiter", { fg = c.fg_dim })
    hi("@punctuation.bracket", { fg = c.fg_dim })
    hi("@punctuation.special", { fg = c.special })
    hi("@comment", { fg = c.comment, italic = true })
    hi("@comment.documentation", { fg = c.comment })
    hi("@comment.error", { fg = c.error })
    hi("@comment.warning", { fg = c.warning })
    hi("@comment.todo", { fg = c.bg, bg = c.warning })
    hi("@comment.note", { fg = c.bg, bg = c.info })
    hi("@markup.strong", { bold = true })
    hi("@markup.italic", { italic = true })
    hi("@markup.strikethrough", { strikethrough = true })
    hi("@markup.underline", { underline = true })
    hi("@markup.heading", { fg = c.fg_bright, bold = true })
    hi("@markup.quote", { fg = c.comment, italic = true })
    hi("@markup.math", { fg = c.special })
    hi("@markup.link", { fg = c.info, underline = true })
    hi("@markup.link.label", { fg = c.info })
    hi("@markup.link.url", { fg = c.string, underline = true })
    hi("@markup.raw", { fg = c.string })
    hi("@markup.list", { fg = c.keyword })
    hi("@tag", { fg = c.keyword })
    hi("@tag.attribute", { fg = c.variable })
    hi("@tag.delimiter", { fg = c.fg_dim })

    -- LSP
    hi("LspReferenceText", { bg = c.selection })
    hi("LspReferenceRead", { bg = c.selection })
    hi("LspReferenceWrite", { bg = c.selection })
    hi("LspSignatureActiveParameter", { fg = c.fg_bright, bold = true })
    hi("LspCodeLens", { fg = c.comment })
    hi("LspInlayHint", { fg = c.comment, bg = c.bg_light })

    -- Telescope
    hi("TelescopeNormal", { fg = c.fg, bg = c.bg })
    hi("TelescopeBorder", { fg = c.border, bg = c.bg })
    hi("TelescopePromptNormal", { fg = c.fg, bg = c.bg })
    hi("TelescopePromptBorder", { fg = c.amber_dim, bg = c.bg })
    hi("TelescopePromptTitle", { fg = c.bg, bg = c.amber })
    hi("TelescopePreviewTitle", { fg = c.bg, bg = c.amber_dim })
    hi("TelescopeResultsTitle", { fg = c.bg, bg = c.amber_dark })
    hi("TelescopeSelection", { fg = c.fg_bright, bg = c.selection })
    hi("TelescopeSelectionCaret", { fg = c.amber_bright })
    hi("TelescopeMatching", { fg = c.fg_bright, bold = true })
    hi("TelescopePromptPrefix", { fg = c.amber })
    hi("TelescopeResultsBorder", { fg = c.border, bg = c.bg })
    hi("TelescopePreviewBorder", { fg = c.border, bg = c.bg })

    -- NvimTree
    hi("NvimTreeNormal", { fg = c.fg, bg = c.bg })
    hi("NvimTreeNormalNC", { fg = c.fg, bg = c.bg })
    hi("NvimTreeRootFolder", { fg = c.amber_bright, bold = true })
    hi("NvimTreeFolderName", { fg = c.fg })
    hi("NvimTreeFolderIcon", { fg = c.amber_dim })
    hi("NvimTreeEmptyFolderName", { fg = c.fg_dim })
    hi("NvimTreeOpenedFolderName", { fg = c.amber_light })
    hi("NvimTreeSymlink", { fg = c.info })
    hi("NvimTreeSpecialFile", { fg = c.special })
    hi("NvimTreeImageFile", { fg = c.fg })
    hi("NvimTreeIndentMarker", { fg = c.border })
    hi("NvimTreeGitDirty", { fg = c.git_change })
    hi("NvimTreeGitNew", { fg = c.git_add })
    hi("NvimTreeGitDeleted", { fg = c.git_delete })
    hi("NvimTreeGitStaged", { fg = c.git_add })

    -- Bufferline
    hi("BufferLineFill", { bg = c.bg_dark })
    hi("BufferLineBackground", { fg = c.fg_dim, bg = c.bg_light })
    hi("BufferLineBuffer", { fg = c.fg_dim, bg = c.bg_light })
    hi("BufferLineBufferVisible", { fg = c.fg, bg = c.bg_light })
    hi("BufferLineBufferSelected", { fg = c.fg_bright, bg = c.bg, bold = true })
    hi("BufferLineTab", { fg = c.fg_dim, bg = c.bg_light })
    hi("BufferLineTabSelected", { fg = c.fg_bright, bg = c.bg })
    hi("BufferLineTabClose", { fg = c.error, bg = c.bg_light })
    hi("BufferLineSeparator", { fg = c.bg_dark, bg = c.bg_light })
    hi("BufferLineSeparatorSelected", { fg = c.bg_dark, bg = c.bg })
    hi("BufferLineSeparatorVisible", { fg = c.bg_dark, bg = c.bg_light })
    hi("BufferLineIndicatorSelected", { fg = c.amber })
    hi("BufferLineModified", { fg = c.warning })
    hi("BufferLineModifiedSelected", { fg = c.warning })
    hi("BufferLineModifiedVisible", { fg = c.warning })

    -- Indent Blankline
    hi("IblIndent", { fg = c.bg_highlight })
    hi("IblScope", { fg = c.amber_dark })
    hi("IndentBlanklineChar", { fg = c.bg_highlight })
    hi("IndentBlanklineContextChar", { fg = c.amber_dark })

    -- Noice & Notify
    hi("NoiceCmdlinePopup", { fg = c.fg, bg = c.bg_dark })
    hi("NoiceCmdlinePopupBorder", { fg = c.border })
    hi("NoiceCmdlineIcon", { fg = c.amber })
    hi("NotifyERRORBorder", { fg = c.error })
    hi("NotifyWARNBorder", { fg = c.warning })
    hi("NotifyINFOBorder", { fg = c.info })
    hi("NotifyDEBUGBorder", { fg = c.hint })
    hi("NotifyTRACEBorder", { fg = c.comment })
    hi("NotifyERRORIcon", { fg = c.error })
    hi("NotifyWARNIcon", { fg = c.warning })
    hi("NotifyINFOIcon", { fg = c.info })
    hi("NotifyDEBUGIcon", { fg = c.hint })
    hi("NotifyTRACEIcon", { fg = c.comment })
    hi("NotifyERRORTitle", { fg = c.error })
    hi("NotifyWARNTitle", { fg = c.warning })
    hi("NotifyINFOTitle", { fg = c.info })
    hi("NotifyDEBUGTitle", { fg = c.hint })
    hi("NotifyTRACETitle", { fg = c.comment })

    -- LspSaga
    hi("SagaBorder", { fg = c.border })
    hi("SagaNormal", { bg = c.bg_dark })
    hi("HoverBorder", { fg = c.border, bg = c.bg_dark })

    -- DAP UI
    hi("DapUIScope", { fg = c.amber })
    hi("DapUIType", { fg = c.type })
    hi("DapUIValue", { fg = c.fg })
    hi("DapUIModifiedValue", { fg = c.warning, bold = true })
    hi("DapUIDecoration", { fg = c.amber_dim })
    hi("DapUIThread", { fg = c.ok })
    hi("DapUIStoppedThread", { fg = c.amber })
    hi("DapUISource", { fg = c.type })
    hi("DapUILineNumber", { fg = c.amber_dim })
    hi("DapUIFloatBorder", { fg = c.border })
    hi("DapUIWatchesEmpty", { fg = c.error })
    hi("DapUIWatchesValue", { fg = c.ok })
    hi("DapUIWatchesError", { fg = c.error })
    hi("DapUIBreakpointsPath", { fg = c.amber_dim })
    hi("DapUIBreakpointsInfo", { fg = c.ok })
    hi("DapUIBreakpointsCurrentLine", { fg = c.fg_bright, bold = true })
    hi("DapUIBreakpointsDisabledLine", { fg = c.comment })
    hi("DapUICurrentFrameName", { fg = c.fg_bright, bold = true })
    hi("DapUIStepOver", { fg = c.amber })
    hi("DapUIStepInto", { fg = c.amber })
    hi("DapUIStepBack", { fg = c.amber })
    hi("DapUIStepOut", { fg = c.amber })
    hi("DapUIStop", { fg = c.error })
    hi("DapUIPlayPause", { fg = c.ok })
    hi("DapUIRestart", { fg = c.ok })
    hi("DapUIUnavailable", { fg = c.comment })
    hi("DapUIWinSelect", { fg = c.amber_bright, bold = true })

    -- Flash
    hi("FlashBackdrop", { fg = c.comment })
    hi("FlashLabel", { fg = c.bg, bg = c.amber_bright, bold = true })
    hi("FlashMatch", { fg = c.fg_bright, bg = c.selection })
    hi("FlashCurrent", { fg = c.bg, bg = c.amber })

    -- Lualine (will be configured separately)
    hi("lualine_a_normal", { fg = c.bg, bg = c.amber, bold = true })
    hi("lualine_b_normal", { fg = c.fg, bg = c.bg_highlight })
    hi("lualine_c_normal", { fg = c.fg_dim, bg = c.bg_light })

    -- Cmp
    hi("CmpItemAbbrDeprecated", { fg = c.comment, strikethrough = true })
    hi("CmpItemAbbrMatch", { fg = c.fg_bright, bold = true })
    hi("CmpItemAbbrMatchFuzzy", { fg = c.fg_bright })
    hi("CmpItemKindVariable", { fg = c.variable })
    hi("CmpItemKindInterface", { fg = c.type })
    hi("CmpItemKindText", { fg = c.fg })
    hi("CmpItemKindFunction", { fg = c.func })
    hi("CmpItemKindMethod", { fg = c.func })
    hi("CmpItemKindKeyword", { fg = c.keyword })
    hi("CmpItemKindProperty", { fg = c.fg_dim })
    hi("CmpItemKindUnit", { fg = c.number })
end

return M
