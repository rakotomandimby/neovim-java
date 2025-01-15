
 return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      require "configs.lspconfig"
    end,
  }
