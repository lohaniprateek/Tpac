local M = {}

function M.apply_base()
	local popup_bg = "#24303b"
	local popup_fg = "#ebdbb2"
	local popup_sel_bg = "#d65d0e"
	local popup_sel_fg = "#1d2021"
	local popup_border = "#7daea3"
	local popup_title = "#89b482"
	local popup_docs_bg = "#1f2a33"
	local popup_docs_border = "#83a598"
	local popup_match = "#fe8019"
	local popup_muted = "#a89984"
	local cmd_bg = "#282828"
	local cmd_fg = "#ebdbb2"
	local cmd_border = "#d79921"
	local cmd_search_border = "#fe8019"
	local cmd_prompt = "#83a598"
	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalFloat", { fg = popup_fg, bg = popup_bg })
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = popup_border, bg = popup_bg })
	vim.api.nvim_set_hl(0, "Pmenu", { fg = popup_fg, bg = popup_bg })
	vim.api.nvim_set_hl(0, "PmenuSel", { fg = popup_sel_fg, bg = popup_sel_bg, bold = true })
	vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#2b2f30" })
	vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#5f87af" })
	vim.api.nvim_set_hl(0, "CmpPmenu", { fg = popup_fg, bg = popup_bg })
	vim.api.nvim_set_hl(0, "CmpPmenuBorder", { fg = popup_border, bg = popup_bg })
	vim.api.nvim_set_hl(0, "CmpPmenuSel", { fg = popup_sel_fg, bg = popup_sel_bg, bold = true })
	vim.api.nvim_set_hl(0, "CmpDoc", { fg = popup_fg, bg = popup_docs_bg })
	vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = popup_docs_border, bg = popup_docs_bg })
	vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = popup_match, bold = true })
	vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = popup_match, bold = true })
	vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = popup_muted, bg = popup_bg, italic = true })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { fg = cmd_fg, bg = cmd_bg })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = cmd_border, bg = cmd_bg })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { fg = cmd_search_border, bg = cmd_bg })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { fg = cmd_border, bg = cmd_bg, bold = true })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePrompt", { fg = cmd_prompt, bg = cmd_bg, bold = true })
	vim.api.nvim_set_hl(0, "NoicePopupmenu", { fg = popup_fg, bg = popup_bg })
	vim.api.nvim_set_hl(0, "NoicePopupmenuBorder", { fg = popup_border, bg = popup_bg })
	vim.api.nvim_set_hl(0, "NoicePopupmenuSelected", { fg = popup_sel_fg, bg = popup_sel_bg, bold = true })
	vim.api.nvim_set_hl(0, "NoicePopupmenuMatch", { fg = popup_title, bg = popup_bg, bold = true })
end

return M
