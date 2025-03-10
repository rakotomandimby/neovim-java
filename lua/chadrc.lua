-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

M.ui = {
  tabufline = {
    enabled= false
  },
  statusline = {
    default = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    theme = "vscode",
    modules = {
      file = function()
        local icon = "󰈚"
        local path = vim.api.nvim_buf_get_name(M.stbufnr())
        local name = (path == "" and "Empty") or path:match "([^/\\]+)[/\\]*$"
        name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(M.stbufnr()), ":.")

        if name ~= "Empty" then
          local devicons_present, devicons = pcall(require, "nvim-web-devicons")

          if devicons_present then
            local ft_icon = devicons.get_icon(name)
            icon = (ft_icon ~= nil and ft_icon) or icon
          end
        end
        return "    " .. icon .. " " .. name .. "    "
      end

    },
  },
}
M.base46 = {
  theme = "flexoki-light",
}
return M
