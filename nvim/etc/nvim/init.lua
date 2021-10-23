if (vim.env.XDG_DATA_HOME == nil) then
  vim.env.XDG_DATA_HOME = vim.env.HOME .. '/.local/share'
end
vim.g.python_host_prog = vim.env.HOME .. '/.pyenv/versions/2.7.18/bin/python'
--vim.g.python3_host_prog = vim.env.XDG_DATA_HOME .. '/virtualenvs/.nvim-6Xe7ujW9/bin/python'

for opt_name, opt_value in pairs({
  hidden = true,
  colorcolumn = "80",
  showmode = false,
  signcolumn = "yes:1",

  -- double slash to write full paths, prevent clobbering
  undodir = vim.env.XDG_DATA_HOME .. "/nvim/undo//",
  backupdir = vim.env.XDG_DATA_HOME .. "/nvim/backup//,/tmp//",
  directory = vim.env.XDG_DATA_HOME .. "/nvim/swap//",
  undofile = true,

  scrolloff = 5,             -- keep at least 5 lines above/below
  sidescrolloff = 5,         -- keep at least 5 lines left/right
  pastetoggle = "<F12>",
  equalalways = true,        -- Equal size splits
  tabstop = 2,               -- Number of spaces that a <Tab> in the file counts for.
  shiftwidth = 2,            -- Number of spaces to use for each step of (auto)indent.
  showcmd = true,            -- Show (partial) command in status line.
  number = true,             -- Show line numbers.
  ruler = true,              -- Show the line and column number of the cursor position,
                             -- separated by a comma.

  showmatch = true,          -- When a bracket is inserted, briefly jump to the matching
                             -- one. The jump is only done if the match can be seen on the
                             -- screen. The time to show the match can be set with
                             -- 'matchtime'.

  expandtab = true,          -- Use the appropriate number of spaces to insert a <Tab>.
                             -- Spaces are used in indents with the '>' and '<' commands
                             -- and when 'autoindent' is on. To insert a real tab when
                             -- 'expandtab' is on, use CTRL-V <Tab>.

  smarttab = true,           -- When on, a <Tab> in front of a line inserts blanks
                             -- according to 'shiftwidth'. 'tabstop' is used in other
                             -- places. A <BS> will delete a 'shiftwidth' worth of space
                             -- at the start of the line.

  hlsearch = true,           -- When there is a previous search pattern, highlight all
                             -- its matches.

  incsearch = true,          -- While typing a search command, show immediately where the
                             -- so far typed pattern matches.

  ignorecase = true,         -- Ignore case in search patterns.

  smartcase = true,          -- Override the 'ignorecase' option if the search pattern
                             -- contains upper case characters.

  backspace = "2",           -- Influences the working of <BS>, <Del>, CTRL-W
                             -- and CTRL-U in Insert mode. This is a list of items,
                             -- separated by commas. Each item allows a way to backspace
                             -- over something.
}) do
  vim.o[opt_name] = opt_value
end

require('impatient').enable_profile()
require('plugins')
require('packer_compiled')

vim.g.tokyonight_style = "night"
vim.g.colors_name = "tokyonight"

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '[Space]', {})
vim.api.nvim_set_keymap('', '[Space]', '<Nop>', { noremap = true })
vim.g.mapleader = '[Space]'
vim.g.maplocalleader = '[Space]'

-- Visual mode keymappings
-- <TAB>: indent.
vim.api.nvim_set_keymap('x', '<TAB>', '>', { noremap = true })
-- <S-TAB>: unindent.
vim.api.nvim_set_keymap('x', '<S-TAB>', '<', { noremap = true })

vim.api.nvim_set_keymap('n', '>', '>>', { noremap = true })
vim.api.nvim_set_keymap('n', '<', '<<', { noremap = true })
vim.api.nvim_set_keymap('x', '>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('x', '<', '<gv', { noremap = true })

-- Command-line mode keymappings:"{{{
vim.api.nvim_set_keymap('c', '<C-a>', '<Home>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-b>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-d>', '<Del>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-e>', '<End>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-f>', '<Right>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-n>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-p>', '<Up>', { noremap = true })
-- <C-k>, K: delete to end.
vim.api.nvim_set_keymap('c', '<C-k>', [[<C-\>e getcmdpos() == 1 ? "" : getcmdline()[:getcmdpos()-2]<CR>]], { noremap = true })
-- <C-y>: paste.
vim.api.nvim_set_keymap('c', '<C-y>', '<C-r>*', { noremap = true })

-- vim.api.nvim_set_keymap('n', '[Space]ev', ':<C-u>edit $MYVIMRC<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[Space]rv', ':<C-u>source $MYVIMRC | echo "source $MYVIMRC"<CR>', { noremap = true, silent = true })

-- Useful save mappings?
vim.api.nvim_set_keymap('n', '<Leader><Leader>', ':<C-u>update<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>v', 'V`]', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-c>', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-c>', '<ESC>', { noremap = true })

-- Up Down Left Right resize splits
vim.api.nvim_set_keymap('n', '<up>', '<c-w>+', { noremap = true })
vim.api.nvim_set_keymap('n', '<down>', '<c-w>-', { noremap = true })
vim.api.nvim_set_keymap('n', '<left>', '<c-w><', { noremap = true })
vim.api.nvim_set_keymap('n', '<right>', '<c-w>>', { noremap = true })


-- H and L keys for buffer movement
vim.api.nvim_set_keymap('', 'H', ':bp<CR>', { noremap = true })
vim.api.nvim_set_keymap('', 'L', ':bn<CR>', { noremap = true })

vim.api.nvim_set_keymap('', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('', 'k', 'gk', { noremap = true })

-- remove trailing whitespaces
vim.api.nvim_set_keymap('n', '<Leader>W', [[:let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>]], { noremap = true })

-- git gutter?
vim.cmd('highlight! link SignColumn LineNr')
vim.cmd([[
augroup reload_vimrc
autocmd!
    autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END
augroup Crosshair
    au!
    autocmd WinLeave *  setlocal nocursorcolumn nocursorline
    autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline cursorcolumn
    " invert current line colors
    au ColorScheme,VimEnter,BufWinEnter,WinEnter * hi CursorLine cterm=reverse
    au ColorScheme,VimEnter,BufWinEnter,WinEnter * hi CursorColumn cterm=reverse
augroup END

autocmd VimEnter * silent exec "!kill -s SIGWINCH" getpid()
autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
]])
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
--vim.cmd([[
  --vim.o.updatetime = 250
  --vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]
--]])
--

--Highlight line number instead of having icons in sign column
--See the properties of the signs with sign list.
vim.cmd [[
  highlight LspDiagnosticsLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  highlight LspDiagnosticsLineNrWarning guibg=#51412A guifg=#FFA500 gui=bold
  highlight LspDiagnosticsLineNrInformation guibg=#1E535D guifg=#00FFFF gui=bold
  highlight LspDiagnosticsLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

  sign define DiagnosticSignError text= texthl=LspDiagnosticsSignError linehl= numhl=LspDiagnosticsLineNrError
  sign define DiagnosticSignWarn text= texthl=LspDiagnosticsSignWarning linehl= numhl=LspDiagnosticsLineNrWarning
  sign define DiagnosticSignInfo text= texthl=LspDiagnosticsSignInformation linehl= numhl=LspDiagnosticsLineNrInformation
  sign define DiagnosticSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=LspDiagnosticsLineNrHint
]]
