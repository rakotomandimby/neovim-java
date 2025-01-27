local mason_base_path = "/home/mihamina/.local/share/nvim/mason"
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- I hardcoded the root_directory : it's on you to make it dynamic
local root_directory = "/home/mihamina/Projects/your-customer/project-n"

-- This can be any directory, I just choosed this because I like it
local workspace_directory = "/tmp/jdtls-workspace"

local jdtls_config = {
  cmd = {
    '/home/mihamina/Apps/jdk/bin/java',                           -- I dont have Java globally (my choice, you may have your setup)
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Xmx8g',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-javaagent:/home/mihamina/Apps/lombok.jar',                  -- Take this Lombok jar from the Lombok website
    '-jar',            mason_base_path .. '/share/jdtls/plugins/org.eclipse.equinox.launcher.jar',
    '-configuration',  mason_base_path .. '/packages/jdtls/config_linux',
    '-data', workspace_directory,
  },
  root_dir = root_directory,
  capabilities = capabilities,
  settings = {
    java = {
      signatureHelp = { enabled = true },
      extendedClientCapabilities = require('jdtls').extendedClientCapabilities,
      maven = { downloadSources = true,},
      referencesCodeLens = { enabled = true },
      references = { includeDecompiledSources = true },
      inlayHints = { parameterNames = { enabled = 'all' }},
      format = { enabled = false },
    },
  },
}

return jdtls_config
