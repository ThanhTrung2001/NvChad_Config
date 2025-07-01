local dap = require("dap")

-- Enable debug logging (remove this after fixing)
dap.set_log_level('DEBUG')

-- Setup dap-vscode-js with proper path
require("dap-vscode-js").setup({
  -- Windows path
  debugger_path = vim.fn.stdpath("data") .. "/vscode-js-debug",
  adapters = { 
    "pwa-node", 
    "pwa-chrome", 
    "pwa-msedge", 
    "node-terminal",
    "pwa-extensionHost" 
  },
})

-- JavaScript configurations
dap.configurations.javascript = {
  {
    type = "pwa-chrome",
    request = "launch",
    name = "Launch Chrome (localhost)",
    url = "http://localhost:3000", -- Angular:4200 | React:3000
    webRoot = "${workspaceFolder}",
    sourceMaps = true,
    protocol = "inspector",
    port = 3000,
    webRoot = "${workspaceFolder}",
  },
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch Node",
    program = "${file}",
    cwd = "${workspaceFolder}",
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
    args = {},
  },
  {
    type = "pwa-node",
    request = "attach",
    name = "Attach to Node",
    processId = require("dap.utils").pick_process,
    cwd = "${workspaceFolder}",
    sourceMaps = true,
    protocol = "inspector",
  },
}

-- TypeScript uses same config as JavaScript
dap.configurations.typescript = dap.configurations.javascript

-- DAP UI setup
local dapui = require("dapui")
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25,
      position = "bottom",
    },
  },
  controls = {
    enabled = true,
    element = "repl",
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
  },
})

-- Auto open/close UI
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
