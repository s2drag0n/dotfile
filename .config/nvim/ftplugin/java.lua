local home = os.getenv 'HOME'
-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local jdt_install_path = home .. "/.local/share/nvim/mason/packages/jdtls/"

-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local workspace_dir = home .. "/document/work/java/code" .. project_name

-- 自动克隆 java-debug 仓库并设置初始化选项
local java_debug_path = vim.fn.expand("$HOME/java-debug")

if vim.fn.isdirectory(java_debug_path) == 0 then
  print "Cloning java-debug repository..."
  os.execute "git clone https://github.com/microsoft/java-debug ~/java-debug"
  os.execute "cd ~/java-debug && ./mvnw clean install"
end

local bundles_1 = {
  vim.fn.glob(java_debug_path .. "/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.52.0.jar", true),
}

-- 自动克隆 vscode-java-test 仓库并构建插件
local vscode_java_test_path = vim.fn.expand "$HOME/vscode-java-test"

if vim.fn.isdirectory(vscode_java_test_path) == 0 then
  print "Cloning vscode-java-test repository..."
  os.execute("git clone https://github.com/microsoft/vscode-java-test " .. vscode_java_test_path)
  print "Installing dependencies..."
  os.execute("cd " .. vscode_java_test_path .. "&& npm install")
  print "Building plugin..."
  os.execute("cd " .. vscode_java_test_path .. "npm run build-plugin")
end

vim.list_extend(bundles_1, vim.split(vim.fn.glob((vscode_java_test_path .. "/server/*.jar")), "\n"))

local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    "java", -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    -- 💀
    "-jar",
    jdt_install_path .. "/plugins/org.eclipse.equinox.launcher_1.6.800.v20240304-1850.jar",
    -- 💀
    "-configuration",
    jdt_install_path .. "/config_mac",

    -- 💀
    "-data",
    workspace_dir,
  },

  -- 💀
  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew" },

  settings = {
    java = {
      signatureHelp = { enabled = true },
      extendedClientCapabilities = 'extendedClientCapabilities',
      maven = {
        downloadSources = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },
      format = {
        enabled = true,
      },
    },
  },


  init_options = {
    bundles = bundles_1,
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require("jdtls").start_or_attach(config)
