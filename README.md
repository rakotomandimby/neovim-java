# My Neovim Setup that works with Java

I sometimes take Java project and I dont want to use another tool to such as Eclipse nor Netbeans...

I took some times to make this work.

**Note** : I use NvChad

# Steps

- Have Java installed
- Install ["mfussenegger/nvim-jdtls"](https://github.com/mfussenegger/nvim-jdtls)
- Install "jdtls" from Mason
- Adjust the content of `lua/configs/jdtls.lua` [link](lua/configs/jdtls.lua) to your local configuration (see comments)
- Check how "jdtls" is setup in `./lua/configs/lspconfig.lua` [link](lua/configs/lspconfig.lua)
- Enjoy

# Problems? Suggestions?

Just open an issue or file a pull request.
