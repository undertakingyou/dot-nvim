-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well.

-- Originally copied from kickstart.nvim

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
    'mfussenegger/nvim-dap-python',
  },
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    {
      '<leader>dc',
      function()
        require('dap').continue()
      end,
      desc = '[D]ebug: Start/[C]ontinue',
    },
    {
      '<leader>dsi',
      function()
        require('dap').step_into()
      end,
      desc = '[D]ebug: [S]tep [I]nto',
    },
    {
      '<leader>dso',
      function()
        require('dap').step_over()
      end,
      desc = '[D]ebug: [S]tep [O]ver',
    },
    {
      '<leader>dsu',
      function()
        require('dap').step_out()
      end,
      desc = '[D]ebug: [S]tep O[u]t',
    },
    {
      '<leader>db',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = '[D]ebug: Toggle [B]reakpoint',
    },
    {
      '<leader>dB',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = '[D]ebug: Set [B]reakpoint with condition',
    },
    {
      '<leader>dq',
      function()
        require('dap').terminate()
      end,
      desc = '[D]ebug: Terminate/[Q]uit',
    },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      '<leader>dtu',
      function()
        require('dapui').toggle()
      end,
      desc = '[D]ebug: [T]oggle [U]I.',
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
        'node2',
        'js',
      },
    }

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup()

    -- Change breakpoint icons
    vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
    vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
    local breakpoint_icons = vim.g.have_nerd_font
        and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
      or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
    for type, icon in pairs(breakpoint_icons) do
      local tp = 'Dap' .. type
      local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
      vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    end

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ GoLang                                                   │
    -- ╰──────────────────────────────────────────────────────────╯
    require('dap-go').setup {
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has 'win32' == 0,
      },
    }

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Python                                                   │
    -- ╰──────────────────────────────────────────────────────────╯
    local dappy = require 'dap-python'
    -- use the python associated through the python debugger
    dappy.setup '~/.config/local/share/nvim/mason/packages/debugpy/venv/bin/python'

    -- Add Python test configurations to DAP
    dap.configurations.python = dap.configurations.python or {}
    table.insert(dap.configurations.python, {
      type = 'python',
      request = 'launch',
      name = 'Debug: Method',
      program = function()
        return dappy.test_method { config = { justMyCode = false } }
      end,
      console = 'integratedTerminal',
    })
    table.insert(dap.configurations.python, {
      type = 'python',
      request = 'launch',
      name = 'Debug: Class',
      program = function()
        return dappy.test_class { config = { justMyCode = false } }
      end,
      console = 'integratedTerminal',
    })

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Adapters                                                 │
    -- ╰──────────────────────────────────────────────────────────╯
    dap.adapters['node'] = {
      type = 'server',
      host = 'localhost',
      port = '${port}',
      executable = {
        command = 'node',
        args = { vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js', '${port}' },
      },
    }

    dap.adapters['chrome'] = {
      type = 'server',
      host = 'localhost',
      port = '${port}',
      executable = {
        command = 'node',
        args = { vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js', '${port}' },
      },
    }
  end,
}
