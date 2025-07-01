return {
    {
      "mfussenegger/nvim-dap",
      config = function()
        require("configs.dap")
      end,
    },
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", },
      config = function()
        require("dapui").setup()
      end,
    },
    {
      "mxsdev/nvim-dap-vscode-js",
      dependencies = { "mfussenegger/nvim-dap" },
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "williamboman/mason.nvim" },
      opts = {
        automatic_setup = true,
        ensure_installed = { "js-debug-adapter" },
        handlers = {
          function(config)
            require('mason-nvim-dap').default_setup(config)
          end,
        },
      },
    },
  }

--   And must intall the dap-vscode-js
-- git clone https://github.com/microsoft/vscode-js-debug ~/.local/share/nvim/vscode-js-debug
-- cd ~/.local/share/nvim/vscode-js-debug
-- npm install
-- npm run compile
-- or in PWS
-- cd $env:LOCALAPPDATA\nvim-data
-- git clone https://github.com/microsoft/vscode-js-debug
-- cd vscode-js-debug
-- npm install --legacy-peer-deps
-- npx gulp vsDebugServerBundle
-- mv dist out

-- NetcoreDBG
-- cd $env:LOCALAPPDATA\nvim-data
-- Invoke-WebRequest -Uri https://github.com/Samsung/netcoredbg/releases/download/latest/netcoredbg-win64.zip -OutFile netcoredbg.zip
-- Expand-Archive -Path netcoredbg.zip -DestinationPath netcoredbg