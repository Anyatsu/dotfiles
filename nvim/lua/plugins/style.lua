return {

  -- {
  --   'fgheng/winbar.nvim',
  --   opts = {},
  --   config = function()
  --     require('winbar').setup {
  --
  --       enabled = true,
  --
  --       show_file_path = true,
  --       show_symbols = true,
  --
  --       colors = {
  --         path = '', -- you can customize colors like #c946fd
  --         file_name = '',
  --         symbols = '',
  --       },
  --
  --       icons = {
  --         file_icon_default = '・ｶ',
  --         seperator = '>',
  --         editor_state = '笳・,
  --         lock_icon = '・',
  --       },
  --
  --       exclude_filetype = {
  --         'help',
  --         'startify',
  --         'dashboard',
  --         'packer',
  --         'neogitstatus',
  --         'nvimtree',
  --         'trouble',
  --         'alpha',
  --         'lir',
  --         'outline',
  --         'spectre_panel',
  --         'toggleterm',
  --         'qf',
  --       },
  --     }
  --   end,
  -- },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        disabled_filetypes = {
          statusline = {},
          winbar = {
            'help',
            'startify',
            'dashboard',
            'packer',
            'neogitstatus',
            'NvimTree',
            'Trouble',
            'alpha',
            'lir',
            'Outline',
            'spectre_panel',
            'toggleterm',
          },
        },
        icons_enabled = true,
        theme = require('transparent').theme,
        component_separators = '',
        -- section_separators = { left = '薰ｰ', right = '薰ｲ' },
      },

      -- tabline = {
      --   -- lualine_a = { 'buffers' },
      --   lualine_b = { },
      --   lualine_c = { },
      --   lualine_x = {},
      --   lualine_y = {},
      --   lualine_z = { 'tabs' },
      -- },

      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      --
      -- inactive_winbar = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = { 'filename' },
      --   lualine_x = {},
      --   lualine_y = {},
      --   lualine_z = {},
      -- },
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      local highlight = {
        'RainbowRed',
        'RainbowYellow',
        'RainbowBlue',
        'RainbowOrange',
        'RainbowGreen',
        'RainbowViolet',
        'RainbowCyan',
      }
      local hooks = require 'ibl.hooks'
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
        vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
        vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
        vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
        vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
        vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
        vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
      end)

      require('ibl').setup { indent = { highlight = highlight, char = '│' } }
    end,
    -- opts = {}
  },
}
