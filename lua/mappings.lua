require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<F5>", function() require("dap").continue() end, { desc = "Start/Continue Debugger" })
map("n", "<F10>", function() require("dap").step_over() end, { desc = "Step Over" })
map("n", "<F11>", function() require("dap").step_into() end, { desc = "Step Into" })
map("n", "<F12>", function() require("dap").step_out() end, { desc = "Step Out" })
map("n", "<Leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
map("n", "<Leader>dr", function() require("dap").repl.toggle() end, { desc = "Toggle REPL" })
map("n", "<Leader>du", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
