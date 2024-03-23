return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function()
      local function filenameFirst(_, path)
        local tail = vim.fs.basename(path)
        local parent = vim.fs.dirname(path)
        if parent == '.' then
          return tail
        end
        return string.format('%s\t\t%s', tail, parent)
      end

      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-\\>'] = require('telescope.actions').file_vsplit,
            },
          },
        },
        pickers = {
          find_files = {
            path_display = filenameFirst,
            find_command = { 'rg', '-uu', '--files', '--hidden', '-g', '!.git/', '-g', '!node_modules', '-g', '!tmp/', '-g', '!build/', '-g', '!.next/' },
            -- find_command = {
            --   'fd',
            --   '--type',
            --   'f',
            --   '--no-ignore-vcs'
            -- }
          },
          colorscheme = {
            enable_preview = true,
          },
        },
      }

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
    end,
  },
}
