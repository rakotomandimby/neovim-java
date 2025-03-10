require "nvchad.mappings"

-- add yours here

-- Unmap <TAB> to prevent triggering an error
vim.keymap.del("n", "<TAB>")
vim.keymap.del("n", "<leader>x")



local map = vim.keymap.set
-- remap <leader>x to close buffer
local function close_buffer()
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.bo[bufnr].modified then
    print("Buffer has unsaved changes. Save or discard changes before closing.")
    return
  end
  vim.api.nvim_buf_delete(bufnr, { force = true })
end

-- Map <leader>x to the custom close_buffer function
map("n", "<leader>x", close_buffer, { desc = "Close buffer" })


map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Resize window mappings
map("n", "<C-Right>", "<C-w>10>", { desc = "Increase window size by 10" })
map("n", "<C-Left>", "<C-w>10<", { desc = "Decrease window size by 10" })
