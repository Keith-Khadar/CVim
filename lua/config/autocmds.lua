local hover_group = vim.api.nvim_create_augroup("LspHoverDiagnostics", { clear = true })

vim.api.nvim_create_autocmd("CursorHold", {
  group = hover_group,
  callback = function()
    local diags = vim.diagnostic.get(nil, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
    if #diags > 0 then
      vim.diagnostic.open_float(nil, {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = "",
        scope = "cursor",
      })
        end
  end,
})


local yank_group = vim.api.nvim_create_augroup("HighlightYank", {})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

