local dap = require("dap")
local dapui = require("dapui")

dapui.setup({})
require("dap-go").setup({
  delve = {
    build_flags = {
      "-tags=dev",
    },
  },
})

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
