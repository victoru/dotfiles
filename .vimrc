let vam_install_path = expand('$HOME') . '/.vim/vim-addons'

fun! EnsureVamIsOnDisk(vam_install_path)
  let is_installed_c = "isdirectory(a:vam_install_path.'/vim-addon-manager/autoload')"
  if eval(is_installed_c)
    return 1
  else
    if 1 == confirm("Clone VAM into ".a:vam_install_path."?","&Y\n&N")
      call confirm("Remind yourself that most plugins ship with ".
                  \"documentation (README*, doc/*.txt). It is your ".
                  \"first source of knowledge. If you can't find ".
                  \"the info you're looking for in reasonable ".
                  \"time ask maintainers to improve documentation")
      call mkdir(a:vam_install_path, 'p')
      execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(a:vam_install_path, 1).'/vim-addon-manager'
      " VAM runs helptags automatically when you install or update plugins
      exec 'helptags '.fnameescape(a:vam_install_path.'/vim-addon-manager/doc')
    endif
    return eval(is_installed_c)
  endif
endf

fun! SetupVAM()
  " Set advanced options like this:
  " let g:vim_addon_manager = {}
  " let g:vim_addon_manager['key'] = value
  "     Pipe all output into a buffer which gets written to disk
  " let g:vim_addon_manager['log_to_buf'] =1

  " Example: drop git sources unless git is in PATH. Same plugins can
  " be installed from www.vim.org. Lookup MergeSources to get more control
  " let g:vim_addon_manager['drop_git_sources'] = !executable('git')
  " let g:vim_addon_manager.debug_activation = 1
			  
"\ '^\%(c\|cpp\)$': [ 'plugin-for-c-development' ],
  let ft_addons = {
    \ 'rst': ['riv']
    \ }

  " VAM install location:
  let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
  if !EnsureVamIsOnDisk(vam_install_path)
    echohl ErrorMsg
    echomsg "No VAM found!"
    echohl NONE
    return
  endif
  exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

  " Tell VAM which plugins to fetch & load:
  call vam#ActivateAddons(['ctrlp', 'Gundo', 'CSApprox', 'Powerline', 'riv',
  			               \ 'Syntastic', 'The_NERD_Commenter', 'kwbdi', 
                           \ 'snipmate', 'ack', 'Tagbar', 
                           \ 'Buffergator', 'SuperTab%1643', 'python_fold'], 
  \ {'auto_install' : 0})

  " sample: call vam#ActivateAddons(['pluginA','pluginB', ...], {'auto_install' : 0})

  " Addons are put into vam_install_path/plugin-name directory
  " unless those directories exist. Then they are activated.
  " Activating means adding addon dirs to rtp and do some additional
  " magic

  " How to find addon names?
  " - look up source from pool
  " - (<c-x><c-p> complete plugin names):
  " You can use name rewritings to point to sources:
  "    ..ActivateAddons(["github:foo", .. => github://foo/vim-addon-foo
  "    ..ActivateAddons(["github:user/repo", .. => github://user/repo
  " Also see section "2.2. names of addons and addon sources" in VAM's documentation
endfun
call SetupVAM()

set nocompatible
filetype plugin indent on
syntax enable
set foldmethod=indent
set foldlevel=99
set hidden
set t_Co=256
"set term=xterm-256color
set term=screen-256color
set encoding=utf-8
set laststatus=2
set colorcolumn=80
set undofile
set pastetoggle=<F12>

set background=dark

let mapleader = ','

" seems to move line segment beginning with # the the line below
let @c = '^dt#o"€kb'

set cursorline cursorcolumn

if has('gui_running')
    colorscheme jellybeans
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L
    "set guioptions-=M
    set guifont=EnvyCodeRforPowerline
else
    "colorscheme billw
    "colorscheme candycode
    "colorscheme blazer
    "colorscheme nucolors
    "colorscheme muon
    "colorscheme zenburn
    "colorscheme lucius
    colorscheme jellybeans
endif

autocmd WinEnter * setlocal cursorline cursorcolumn
"hi CursorLine ctermbg=4
"hi CursorColumn ctermbg=4
hi CursorLine cterm=reverse gui=reverse
hi CursorColumn cterm=reverse gui=reverse

autocmd WinLeave * setlocal nocursorline nocursorcolumn
au ColorScheme,VimEnter * hi normal ctermbg=NONE
au ColorScheme,VimEnter * hi nontext ctermbg=NONE

au ColorScheme * hi CursorLine cterm=reverse gui=reverse
au ColorScheme * hi CursorColumn cterm=reverse gui=reverse


" For multi-byte character support (CJK support, for example):
"set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1

set equalalways     " Equal size splits

set tabstop=4       " Number of spaces that a <Tab> in the file counts for.

set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.

set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.

set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.

set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.

set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.

set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.

set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.

set ignorecase      " Ignore case in search patterns.

set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.

set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.

"set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
set smartindent

"set textwidth=79    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.

set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.  q
                    "           Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode.
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.

"set mouse=a         " Enable the use of the mouse.
set dir=~/tmp/vimswap//

set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos

"remap f1 to esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Arrow keys for buffer movement
noremap <left> :bp<CR>
noremap <right> :bn<CR>

" remove trailing whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
"stop annoying jumping hash
"inoremap # X<BS>#
inoremap # X<BS>#
set cinkeys-=0#
set indentkeys-=0#

"save as root
command! W w !sudo tee % > /dev/null

let g:session_autosave = 'yes'
let g:session_autoload = 'no'

au BufWritePost *awesome/rc.lua :!~/scripts/check_awesome_config

" VCS commands
nmap <leader>vs :VCSStatus<CR>
nmap <leader>vc :VCSCommit<CR>
nmap <leader>vb :VCSBlame<CR>
nmap <leader>va :VCSAdd<CR>
nmap <leader>vd :VCSVimDiff<CR>
nmap <leader>vl :VCSLog<CR>
nmap <leader>vu :VCSUpdate<CR>
"------------------------------------------------------------------------------

"spelling
"========
nmap <leader>s :setlocal spell spelllang=en_us<cr>

map <leader>i i<CR><esc>
nmap <C-W>! <Plug>Kwbd
nmap <leader>q :colorscheme random<cr>:colorscheme<cr>


"Tagbar
"======
nmap <F8> :TagbarToggle<CR>
"let g:tagbar_autoclose = 1
"let g:tagbar_width=

"Buffer Gator {{{

    let g:buffergator_display_regime = "bufname"
    " default: 'basename"
    " Sets the default sort regime for buffer listing:
        ""basename": display buffer basename first,
                    "followed by directory [default]
        ""filepath": display full buffer filepath
        ""bufname": display buffer name
"}}}

"Powerline
"=========
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')
let g:Powerline_colorscheme = 'wonton'
let g:Powerline_symbols = 'fancy'

"
"Gundo
map <leader>g :GundoToggle<cr>
"------------------------------------------------------------------------------

"Syntastic
"=========
let g:syntastic_error_symbol='X'
let g:syntastic_warning_symbol='!'
let g:syntastic_check_on_open=1

nm <F5> :Errors<CR>
let g:pep8_map='<F6>'


"show syntastic error window
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nmap <leader>E :Errors<CR>
au CursorHold * SyntasticCheck
"------------------------------------------------------------------------------

"pydiction
"=========
let g:pydiction_location= '~/src/vim/pydiction/complete-dict'

"------------------------------------------------------------------------------

" CtrlP.vim
"===========
let g:ctrlp_map = '<leader>p'

let g:path_to_matcher = "/home/victor/bin/matcher"
let g:ctrlp_match_func = { 'match': 'GoodMatch' }

"let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files . -co --exclude-standard']
"let g:ctrlp_user_command = ['.hg/', 'hg --cwd %s locate -I .']
let g:ctrlp_user_command = 'find %s -type f' 
let g:ctrlp_working_path_mode = 'r'
"let g:ctrlp_working_path_mode = 'ra'
"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.un~,*.pyc
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$|\.pyc$'

function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)

  " Create a cache file if not yet exists
  let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
  if !( filereadable(cachefile) && a:items == readfile(cachefile) )
    call writefile(a:items, cachefile)
  endif
  if !filereadable(cachefile)
    return []
  endif

  " a:mmode is currently ignored. In the future, we should probably do
  " something about that. the matcher behaves like "full-line".
  let cmd = g:path_to_matcher.' --limit '.a:limit.' --manifest '.cachefile.' '
  if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
    let cmd = cmd.'--no-dotfiles '
  endif
  let cmd = cmd.a:str

  return split(system(cmd), "\n")

endfunction


" Use ranger as vim file manager
fun! RangerChooser()
  exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
  if filereadable('/tmp/chosenfile')
    exec 'edit ' . system('cat /tmp/chosenfile')
    call system('rm /tmp/chosenfile')
  endif
  redraw!
endfun
map ,r :call RangerChooser()<CR>


let g:riv_file_link_style = 2
