return {
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = { options = vim.opt.sessionoptions:get() },
  -- stylua: ignore
  keys = {
    { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  },
  },

  {
    'Pocco81/auto-save.nvim',
    config = function()
      require('auto-save').setup {
        execution_message = {
          message = function() -- message to print on save
            return ''
          end,
          dim = 0.18, -- dim the color of `message`
          cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
        },
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
    enabled = true,
  },

  {
    'm4xshen/hardtime.nvim',
    dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
    opts = {
      max_count = 4,
      disable_mouse = false
    },
    enabled = false
  },

  {
    'echasnovski/mini.files',
    version = '*',
    keys = {
      {
        '<leader>E',
        function()
          require('mini.files').open()
        end,
        desc = 'Open mini in root',
      },
      {
        '<leader>e',
        function()
          require('mini.files').open(vim.api.nvim_buf_get_name(0))
        end,
        desc = 'Open mini in current directory',
      },
    },
    config = function()
      require('mini.files').setup {
        windows = {
          preview = true,
        },
      }
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    enabled = true,
  },

 -- Used for lsp operations
  {
    'stevearc/oil.nvim',
    opts = {
      float = {
        padding = 10,
        max_width = 40,
      },
    },
    config = function()
      require('oil').setup {}

      -- vim.api.nvim_create_autocmd('User', {
      --   pattern = 'OilEnter',
      --   callback = vim.schedule_wrap(function(args)
      --     local oil = require 'oil'
      --     if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
      --       oil.select { preview = true }
      --     end
      --   end),
      -- })
    end,
    keys = {
      -- { '<leader>e', '<CMD>split | Oil<CR>', desc = 'Restore Session' },
      { '<leader>fo', '<CMD>Oil --float<CR>', desc = 'Open Oil' },
    },
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    enabled = true,
  },

  {
    'echasnovski/mini.pairs',
    version = '*',
    config = function()
      require('mini.pairs').setup()
    end,
  },
}
