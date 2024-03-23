return {
  -- {
  --   'folke/flash.nvim',
  --   event = 'VeryLazy',
  --   ---@type Flash.Config
  --   opts = {},
  --   -- stylua: ignore
  --   -- keys = {
  --   --   { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  --   --   { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  --   --   { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
  --   --   { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  --   --   { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  --   -- },
  -- },
  -- {
  --   'ggandor/leap.nvim',
  --   config = function()
  --     require('leap').create_default_mappings()
  --   end,
  -- },
  {
    'ggandor/flit.nvim',
    enabled = true,
    keys = function()
      ---@type LazyKeys[]
      local ret = {}
      for _, key in ipairs { 'f', 'F', 't', 'T' } do
        ret[#ret + 1] = { key, mode = { 'n', 'x', 'o' }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = 'nx' },
  },
  {
    'ggandor/leap.nvim',
    enabled = true,
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, desc = 'Leap forward to' },
      { 'S', mode = { 'n', 'x', 'o' }, desc = 'Leap backward to' },
    },
    config = function(_, opts)
      local leap = require 'leap'
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ 'x', 'o' }, 'x')
      vim.keymap.del({ 'x', 'o' }, 'X')
    end,
  },
}
