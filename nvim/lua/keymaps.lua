vim.keymap.set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })


--Telescope
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'TelescopeResults',
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd('TelescopeParent', '\t\t.*$')
      vim.api.nvim_set_hl(0, 'TelescopeParent', { link = 'Comment' })
    end)
  end,
})

vim.keymap.set({ 'n' }, '<leader>sk', '<cmd>Telescope keymaps<CR>', { desc = 'Search keymaps' })

local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end

vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>st', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').lsp_dynamic_workspace_symbols,
  { desc = '[W]orkspace [S]ymbols' })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>,', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- Misc
vim.keymap.set({ 'n', 'i' }, '<c-s>', '<CMD>w<CR>', { desc = 'Save File' })
vim.keymap.set('n', '<leader>qq', '<CMD>qa<CR>', { desc = 'Quit all' })
vim.keymap.set('n', '<leader>p', 'po<Esc>k', { desc = 'Paste with newline' })
vim.keymap.set('n', '<leader>l', '<CMD>Lazy<CR>', { desc = 'Open Lazy' })

-- Buffers
vim.keymap.set('n', '<leader>bp', '<c-6>', { desc = 'Previous buffer' })

-- Windows
vim.keymap.set('n', '<leader>wo', '<C-W>o', { desc = 'Delete other windows', remap = true })
vim.keymap.set('n', '<leader>wd', '<C-W>c', { desc = 'Delete window', remap = true })
vim.keymap.set('n', '<leader>w-', '<C-W>s', { desc = 'Split window below', remap = true })
vim.keymap.set('n', '<leader>w|', '<C-W>v', { desc = 'Split window right', remap = true })
vim.keymap.set('n', '<leader>-', '<C-W>s', { desc = 'Split window below', remap = true })
vim.keymap.set('n', '<leader>|', '<C-W>v', { desc = 'Split window right', remap = true })

--Tabs
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>l", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>h", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

--Git
vim.keymap.set('n', '<leader>ga', '<CMD>!git commit --amend --no-edit<CR>',
  { desc = 'Commit amend without edit', remap = true })
vim.keymap.set('n', '<leader>gc', require('neogit').action('commit', 'commit'), { desc = 'Commit', remap = true })
