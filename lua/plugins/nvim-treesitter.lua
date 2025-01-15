return {
'nvim-treesitter/nvim-treesitter',
build = ':TSUpdate',
opts = {
  ensure_installed = { 'lua', 'markdown', 'vim', 'vimdoc', 'java' },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'ruby', 'markdown' },
  },
  indent = { enable = true, disable = { 'ruby' } },
},
config = function(_, opts)
  require('nvim-treesitter.configs').setup(opts)
end,
}
