local M = {}

local MODIFIED_ICON = "●"

local function buf_label(bufnr)
    local name = vim.api.nvim_buf_get_name(bufnr)
    if name == "" then
        name = "[No Name]"
    else
        name = vim.fn.fnamemodify(name, ":t")
    end

    if vim.bo[bufnr].modified then
        name = name .. " " .. MODIFIED_ICON
    end

    return name
end

function M.tabline()
    local line = ""

    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(bufnr)
           and vim.bo[bufnr].buftype == "" then

            local hl = (bufnr == vim.api.nvim_get_current_buf())
                and "%#TabLineSel#"
                or "%#TabLine#"

            line = line
                .. hl
                .. " "
                .. bufnr
                .. ":"
                .. buf_label(bufnr)
                .. " "
        end
    end

    return line .. "%#TabLineFill#"
end

vim.api.nvim_set_hl(0, "TabLine", { fg = "#888888", bg = "#1e1e1e" })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#ffffff", bg = "#3c3c3c", bold = true })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#1e1e1e" })


return M
