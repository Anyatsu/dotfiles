return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  {
    'numToStr/Navigator.nvim',
    keys = {
      -- { 'n', 't' },
      -- '<C-j>',
      {
        '<C-j>',
        '<cmd>NavigatorDown<CR>',
        desc = 'Navigator Down',
      },
      {
        '<C-k>',
        '<cmd>NavigatorUp<CR>',
        desc = 'Navigator Up',
      },
      {
        '<C-h>',
        '<cmd>NavigatorLeft<CR>',
        desc = 'Navigator Left',
      },
      {
        '<C-l>',
        '<cmd>NavigatorRight<CR>',
        desc = 'Navigator Right',
      },
    },
    config = function()
      require('Navigator').setup {}
    end,
    enabled = true,
  },

  {
    'https://git.sr.ht/~swaits/zellij-nav.nvim',
    lazy = true,
    event = 'VeryLazy',
    keys = {
      { '<c-h>', '<cmd>ZellijNavigateLeft<cr>', { silent = true, desc = 'navigate left' } },
      { '<c-j>', '<cmd>ZellijNavigateDown<cr>', { silent = true, desc = 'navigate down' } },
      { '<c-k>', '<cmd>ZellijNavigateUp<cr>', { silent = true, desc = 'navigate up' } },
      { '<c-l>', '<cmd>ZellijNavigateRight<cr>', { silent = true, desc = 'navigate right' } },
    },
    opts = {},
    enabled = false,
  },

  {
    'Lilja/zellij.nvim',
    -- If you want to configure the plugin
    --[[
    config = function()
        require('zellij').setup({})
    end
    ]]
    keys = {
      { '<c-h>', '<cmd>ZellijNavigateLeft<cr>', { silent = true, desc = 'navigate left' } },
      { '<c-j>', '<cmd>ZellijNavigateDown<cr>', { silent = true, desc = 'navigate down' } },
      { '<c-k>', '<cmd>ZellijNavigateUp<cr>', { silent = true, desc = 'navigate up' } },
      { '<c-l>', '<cmd>ZellijNavigateRight<cr>', { silent = true, desc = 'navigate right' } },
    },
    opts = {
      -- keys with designated default values.
      -- path = 'zellij', -- Zellij binary path
      -- replaceVimWindowNavigationKeybinds = false, -- Will set keybinds like <C-w>h to left
      -- vimTmuxNavigatorKeybinds = false, -- Will set keybinds like <C-h> to left
      -- debug = false, -- Will log things to /tmp/zellij.nvim
    },
    enabled = false
  },
}
