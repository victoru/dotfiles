" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif
" NeoBundle {{{
set nocompatible 
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': 'make'}}
NeoBundle 'Shougo/neocomplete.vim'

NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundle 'evanmiller/nginx-vim-syntax'
NeoBundle 'elzr/vim-json'

NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'majutsushi/tagbar'
NeoBundleLazy 'nanotech/jellybeans.vim'
NeoBundleLazy 'Rykka/riv.vim', {
            \ 'filetypes' : 'rst'
            \ }

NeoBundle 'scrooloose/syntastic'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'ack.vim'
NeoBundle 'kwbdi.vim'
NeoBundle 'Shutnik/jshint2.vim'
NeoBundleLazy 'fatih/vim-go', {
            \ 'filetypes' : 'go',
            \ }

NeoBundle 'LaTeX-Suite-aka-Vim-LaTeX'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'

NeoBundleLazy 'lambdalisue/vim-gita', {
            \ 'autoload': {
            \   'commands': ['Gita'],
            \}}

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-obsession'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'godlygeek/tabular'
NeoBundleLazy 'gabrielelana/vim-markdown', {
            \ 'filetypes' : ['markdown', 'mkd']
            \ }
NeoBundleLazy 'vim-scripts/SQLUtilities', {
            \ 'filetypes' : 'sql',
            \ }
NeoBundle 'aquach/vim-http-client'
NeoBundle 'shougo/unite.vim'
NeoBundle 'Shougo/unite-outline', {'depends': ['shougo/unite.vim']}
NeoBundleLazy 'PotatoesMaster/i3-vim-syntax', {
            \ 'filetypes' : 'i3',
            \ }
NeoBundleLazy 'godlygeek/csapprox.git', { 'terminal' : 1 }
NeoBundleLazy 'thinca/vim-guicolorscheme', { 'terminal' : 1 }
if neobundle#is_installed('vimproc.vim')
    NeoBundleLazy 'Shougo/vimshell.vim', {
                \ 'commands' : [{ 'name' : 'VimShell',
                \                 'complete' : 'customlist,vimshell#complete'},
                \               ],
                \ 'mappings': '<Plug>',
                \ 'depends': ['Shougo/vimproc.vim']
                \ }

    "NeoBundleLazy 'm2mdas/phpcomplete-extended', {
    "\ 'filetypes': 'php',
    "\ 'depends': ['Shougo/vimproc.vim'],
    "\ 'build': {'unix': 'curl -sS https://getcomposer.org/installer | php -- --install-dir=bin'},
    "\ }

endif
NeoBundleLazy 'vim-php/phpctags', {
            \ 'build': {'unix': 'make'},
            \ 'filetypes': 'php',
            \ }

if neobundle#is_installed('tagbar')
    NeoBundleLazy 'vim-php/tagbar-phpctags.vim', {
                \ 'filetypes': 'php',
                \ }
endif

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"}}}

" Options {{{
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
syntax enable

set foldmethod=indent
set hidden
set colorcolumn=80

let mapleader = ','

set undodir=~/tmp/vimswap//

set undofile

set pastetoggle=<F12>

set equalalways     " Equal size splits

set tabstop=4       " Number of spaces that a <Tab> in the file counts for.

set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.

set expandtab      " Use the appropriate number of spaces to insert a <Tab>.
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

"set textwidth=79   " Maximum width of text that is being inserted. A longer
" line will be broken after white space to get this width.

set formatoptions=c,q,r,t   " This is a sequence of letters which describes how
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

"set t_Co=256
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    "set t_ut=y
endif
set encoding=utf-8
" Vim can not recognize the character code of your vimrc when :scriptencoding
" is defined before :set encoding. When writing :set encoding, it should be
" described before :scriptencoding.
"
scriptencoding utf-8
"set cursorline cursorcolumn
"" For multi-byte character support (CJK support, for example):
""set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1
"" according to 'shiftwidth'. 'tabstop' is used in other
"" places. A <BS> will delete a 'shiftwidth' worth of space
"" at the start of the line.

""set textwidth=79   " Maximum width of text that is being inserted. A longer
"" line will be broken after white space to get this width.

" Mappings {{{

" Use <C-Space>.
nmap <C-Space>  <C-@>
cmap <C-Space>  <C-@>

" Visual mode keymappings: "{{{
" <TAB>: indent.
xnoremap <TAB>  >
" <S-TAB>: unindent.
xnoremap <S-TAB>  <

" Indent
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv
"}}}

" Command-line mode keymappings:"{{{
" <C-a>, A: move to head.
cnoremap <C-a>          <Home>
" <C-b>: previous char.
cnoremap <C-b>          <Left>
" <C-d>: delete char.
cnoremap <C-d>          <Del>
" <C-e>, E: move to end.
cnoremap <C-e>          <End>
" <C-f>: next char.
cnoremap <C-f>          <Right>
" <C-n>: next history.
cnoremap <C-n>          <Down>
" <C-p>: previous history.
cnoremap <C-p>          <Up>
" <C-k>, K: delete to end.
cnoremap <C-k> <C-\>e getcmdpos() == 1 ?
            \ '' : getcmdline()[:getcmdpos()-2]<CR>
" <C-y>: paste.
cnoremap <C-y>          <C-r>*
"}}}

" [Space]: Other useful commands "{{{
" Smart space mapping.
" Notice: when starting other <Space> mappings in noremap, disappeared [Space].
nmap  <Space>   [Space]
xmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
xnoremap  [Space]   <Nop>

" Toggle options. "{{{
function! ToggleOption(option_name)
    execute 'setlocal' a:option_name.'!'
    execute 'setlocal' a:option_name.'?'
endfunction  "}}}

" Toggle relativenumber.
nnoremap <silent> [Space].
            \ :<C-u>call ToggleOption('relativenumber')<CR>
"nnoremap <silent> [Space]m
"\ :<C-u>call ToggleOption('paste')<CR>:set mouse=<CR>
" Toggle highlight.
nnoremap <silent> [Space]/
            \ :<C-u>call ToggleOption('hlsearch')<CR>
" Toggle cursorline.
nnoremap <silent> [Space]cl
            \ :<C-u>call ToggleOption('cursorline')<CR>
" Set autoread.
"nnoremap [Space]ar
"\ :<C-u>setlocal autoread<CR>
" Set spell check.
"nmap <leader>s :setlocal spell spelllang=en_us<cr>
nnoremap [Space]sp
            \ :<C-u>call ToggleOption('spell')<CR>
nnoremap [Space]w
            \ :<C-u>call ToggleOption('wrap')<CR>

" }}}

" Easily edit .vimrc and .gvimrc "{{{
nnoremap <silent> [Space]ev  :<C-u>edit $MYVIMRC<CR>
" Load .gvimrc after .vimrc edited at GVim.
nnoremap <silent> [Space]rv :<C-u>source $MYVIMRC \|
            \ echo "source $MYVIMRC"<CR>
"}}}

" Useful save mappings.
nnoremap <silent> <Leader><Leader> :<C-u>update<CR>

" Exchange gj and gk to j and k. "{{{
command! -nargs=? -bar -bang ToggleGJK call s:ToggleGJK()
nnoremap <silent> [Space]gj :<C-u>ToggleGJK<CR>
xnoremap <silent> [Space]gj :<C-u>ToggleGJK<CR>
function! s:ToggleGJK()
    if exists('b:enable_mapping_gjk') && b:enable_mapping_gjk
        let b:enable_mapping_gjk = 0
        noremap <buffer> j j
        noremap <buffer> k k
        noremap <buffer> gj gj
        noremap <buffer> gk gk

        xnoremap <buffer> j j
        xnoremap <buffer> k k
        xnoremap <buffer> gj gj
        xnoremap <buffer> gk gk
    else
        let b:enable_mapping_gjk = 1
        noremap <buffer> j gj
        noremap <buffer> k gk
        noremap <buffer> gj j
        noremap <buffer> gk k

        xnoremap <buffer> j gj
        xnoremap <buffer> k gk
        xnoremap <buffer> gj j
        xnoremap <buffer> gk k
    endif
endfunction"}}}


nnoremap <leader>v V`]

"remap f1 to esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap jk <Esc>

" Up Down Left Right resize splits
nnoremap <up> <c-w>+
nnoremap <down> <c-w>-
nnoremap <left> <c-w><
nnoremap <right> <c-w>>

" H and L keys for buffer movement
noremap H :bp<CR>
noremap L :bn<CR>

" remove trailing whitespaces
nnoremap <leader>W ms:%s/\s\+$//e \| let @/=''<CR>`s

"stop annoying jumping hash
"inoremap # X<BS>#
inoremap # X<BS>#
set cinkeys-=0#
set indentkeys-=0#

" Use ranger as vim file manager
fun! RangerChooser()
    let sfilename = printf("/tmp/vimranger_chosenfile_%s", system('echo -n $RANDOM'))

    let cmd = printf("sil !ranger --choosefile=%s %s", sfilename, expand("%:p:h"))
    if has("gui_running") && (has("gui_gtk") || has("gui_motif"))
        let cmd = substitute(cmd, '!', '! urxvt -name vimranger -e ', '')
    endif
    exec cmd
    redraw!
    if filereadable(sfilename)
        exec 'edit ' . system('cat ' . sfilename)
        call system('rm ' . sfilename)
    endif
    redraw!
endfun
map ,r :call RangerChooser()<CR>

"save as root
command! W w !sudo tee % > /dev/null

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

"mimic alt keys
execute "set <M-h>=\eh"
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
execute "set <M-l>=\el"

nmap <silent> <M-k> :wincmd k<CR>
nmap <silent> <M-j> :wincmd j<CR>
nmap <silent> <M-h> :wincmd h<CR>
nmap <silent> <M-l> :wincmd l<CR>

"}}}

" Create crosshair effect
augroup Crosshair
    au!
    autocmd WinLeave *  setlocal nocursorcolumn
    autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline cursorcolumn
    " invert current line colors
    au ColorScheme,VimEnter,BufWinEnter,WinEnter * hi CursorLine cterm=reverse
    au ColorScheme,VimEnter,BufWinEnter,WinEnter * hi CursorColumn cterm=reverse
augroup END

" Color {{{
augroup ColorCmds
    au!

    au ColorScheme,VimEnter * hi normal ctermbg=NONE
    au ColorScheme,VimEnter * hi nontext ctermbg=NONE

    autocmd BufWinEnter,WinEnter * setlocal colorcolumn=80
    autocmd BufWinLeave,WinLeave * setlocal colorcolumn=0

    " Highlight TODO, FIXME, NOTE, etc.
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
augroup END

if has('gui_running')
    colorscheme jellybeans
    set guifont=PragmataProForPowerline
    set guioptions=aegit
endif

if has('gui')
    NeoBundleSource csapprox
    "colorscheme jellybeans
    "colorscheme flatcolor
    "colorscheme symfony
    set background=dark
    colorscheme darkspectrum

    "if neobundle#tap('jellybeans.vim')
    ""256ctermfg and 256ctermbg
    "let g:jellybeans_overrides = {
    "\    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
    "\              'ctermfg': 'Black', 'ctermbg': 'Yellow',
    "\              'attr': 'bold' },
    "\}

    "colorscheme jellybeans
    "call neobundle#untap()
    "endif
else
    " Use guicolorscheme.vim
    "NeoBundleSource vim-guicolorscheme
    "autocmd StuffCmd VimEnter,BufAdd * GuiColorScheme candy
    colorscheme candy
endif
"}}}

" Plugins {{{
if neobundle#tap('phpcomplete-extended')
    let g:phpcomplete_index_composer_command = 'php ' .
                \ neobundle#get('phpcomplete-extended').rtp . 'bin/composer.phar'

    augroup StuffCmd
        " Use phpcomplete-extend's omnicompleter
        autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
    augroup END

    call neobundle#untap()
endif

if neobundle#tap('phpctags')
    let $PATH = $PATH . ":"  . neobundle#get('phpctags').rtp

    call neobundle#untap()
endif

if neobundle#tap('LaTeX-Suite-aka-Vim-LaTeX')
    let g:Tex_DefaultTargetFormat = 'pdf'

    call neobundle#untap()
endif

let g:session_autosave = 'yes'
let g:session_autoload = 'no'

if neobundle#tap('kwbdi.vim')
    nmap <C-W>! <Plug>Kwbd

    call neobundle#untap()
endif

if neobundle#tap('gundo.vim')
    "Gundo
    map <leader>g :GundoToggle<cr>
    map <F3> :GundoToggle<cr>

    call neobundle#untap()
endif

if neobundle#tap('riv.vim')
    let g:riv_file_link_style = 2
    call neobundle#untap()
endif

if neobundle#tap('vim-markdown')
    "let g:vim_markdown_folding_disabled=1
    call neobundle#untap()
endif

if neobundle#tap('syntastic')
    "let g:syntastic_error_symbol='✖'
    let g:syntastic_error_symbol='⇒'

    let g:syntastic_warning_symbol='⚠'
    let g:syntastic_check_on_open=1

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    nm <F5> :Errors<CR>
    nmap <leader>E :Errors<CR>

    augroup StuffCmd
        au CursorHold * SyntasticCheck
    augroup END

    call neobundle#untap()
endif

if neobundle#tap('tagbar')
    nmap <F8> :TagbarToggle<CR>
    "let g:tagbar_autoclose = 1
    "let g:tagbar_width=
    "
    "let g:tagbar_iconchars = ['▶', '▼']
    "let g:tagbar_iconchars = ['►', '↳']

    let g:tagbar_type_go = {
                \ 'ctagstype' : 'go',
                \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
                \ ],
                \ 'sro' : '.',
                \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
                \ },
                \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
                \ },
                \ 'ctagsbin'  : 'gotags',
                \ 'ctagsargs' : '-sort -silent'
                \ }
    call neobundle#untap()
endif
"ctrlp-funky
if neobundle#tap('ctrlp-funky')
    nnoremap <Leader>fu :CtrlPFunky<Cr>
    " narrow the list down with a word under cursor
    nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
    call neobundle#untap()
endif
if neobundle#tap('vim-gitgutter')
    let g:gitgutter_max_signs = 1000
    call neobundle#untap()
endif

if neobundle#tap('vim-bufferline')
    let g:bufferline_echo = 0
    call neobundle#untap()
endif

if neobundle#tap('lightline.vim')
    "get rid of the extraneous default vim mode information that is now provided by lightline
    set noshowmode
    set laststatus=2
    let g:lightline = {
                \ 'colorscheme': 'Tomorrow_Night',
                \ 'active': {
                \   'left': [ [ 'mode', 'paste', 'command' ],
                \             [ 'git_branch', 'git_traffic', 'git_status'],
                \             [ 'readonly', 'filename', 'modified' ],
                \             ['bufferline'] ],
                \   'right': [ [ 'syntastic', 'lineinfo' ],
                \              ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
                \ },
                \ 'tabline': {
                \   'left': [
                \   ],
                \ },
                \ 'component_function': {
                \   'mode': 'MyMode',
                \   'readonly': 'MyReadonly',
                \   'modified': 'MyModified',
                \   'filename': 'MyFilename',
                \   'bufferline': 'MyBufferline',
                \   'fileformat': 'MyFileformat',
                \   'filetype': 'MyFiletype',
                \   'git_branch': 'g:lightline.my.git_branch',
                \   'git_traffic': 'g:lightline.my.git_traffic',
                \   'git_status': 'g:lightline.my.git_status',
                \   'fileencoding': 'MyFileencoding',
                \ },
                \ 'component_expand': {
                \   'syntastic': 'SyntasticStatuslineFlag',
                \ },
                \ 'component_type': {
                \   'syntastic': 'error',
                \ },
                \ 'component_visible_condition': {
                \   'readonly': '(&filetype!="help"&& &readonly)',
                \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
                \ },
                \ 'separator': { 'left': '', 'right': '▓' },
                \ 'subseparator': { 'left': '|', 'right': '⌠' }
                \ }

    let g:lightline.my = {}
    function! g:lightline.my.git_branch() " {{{
        let mark = ' '
        return winwidth(0) > 70 ? mark.gita#statusline#preset('branch') : ''
    endfunction " }}}
    function! g:lightline.my.git_traffic() " {{{
        return winwidth(0) > 70 ? gita#statusline#preset('traffic') : ''
    endfunction " }}}
    function! g:lightline.my.git_status() " {{{
        return winwidth(0) > 70 ? gita#statusline#preset('status') : ''
    endfunction " }}}

    augroup AutoSyntastic
        autocmd!
        autocmd BufWritePost *.c,*.cpp call s:syntastic()
    augroup END

    function! s:syntastic()
        SyntasticCheck
        call lightline#update()
    endfunction

    function! MyMode()
        let fname = expand('%:t')
        return fname == '__Tagbar__' ? 'Tagbar' :
                    \ fname == 'unite' ? 'UNITE' :
                    \ fname == '__Gundo__' ? 'Gundo' :
                    \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
                    \ winwidth(0) > 60 ? lightline#mode() : ''
    endfunction

    function! MyModified()
        return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
    endfunction

    function! MyReadonly()
        let mark = ''
        return &ft !~? 'help' && &readonly ? mark : ''
    endfunction

    function! MyFilename()
        let fname = expand('%:t')
        return fname == '__Tagbar__' ? g:lightline.fname :
                    \ fname =~ '__Gundo\|NERD_tree' ? '' :
                    \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
                    \ &ft == 'vimshell' ? vimshell#get_status_string() :
                    \ ('' != fname ? fname : '[No Name]') .
                    \ ('' != MyModified() ? ' ' . MyModified() : '')
    endfunction

    function! MyFileformat()
        return winwidth(0) > 70 ? &fileformat : ''
    endfunction

    function! MyFiletype()
        return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
    endfunction

    function! MyFileencoding()
        return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
    endfunction

    let g:tagbar_status_func = 'TagbarStatusFunc'

    function! TagbarStatusFunc(current, sort, fname, ...) abort
        let g:lightline.fname = a:fname
        return lightline#statusline(0)
    endfunction
    function! MyBufferline()
        call bufferline#refresh_status()
        let b = g:bufferline_status_info.before
        let c = g:bufferline_status_info.current
        let a = g:bufferline_status_info.after
        let alen = strlen(a)
        let blen = strlen(b)
        let clen = strlen(c)
        let w = winwidth(0) * 4 / 11
        if w < alen+blen+clen
            let whalf = (w - strlen(c)) / 2
            let aa = alen > whalf && blen > whalf ? a[:whalf] : alen + blen < w - clen || alen < whalf ? a : a[:(w - clen - blen)]
            let bb = alen > whalf && blen > whalf ? b[-(whalf):] : alen + blen < w - clen || blen < whalf ? b : b[-(w - clen - alen):]
            return (strlen(bb) < strlen(b) ? '...' : '') . bb . c . aa . (strlen(aa) < strlen(a) ? '...' : '')
        else
            return b . c . a
        endif
    endfunction

    call neobundle#untap()

endif

if neobundle#tap('vimshell.vim') "{{{
    " <C-Space>: switch to vimshell.
    nmap <C-@>  <Plug>(vimshell_switch)
    nnoremap !  q:VimShellExecute<Space>
    nnoremap [Space]i  q:VimShellInteractive<Space>
    nnoremap [Space]t  q:VimShellTerminal<Space>

    let g:vimshell_force_overwrite_statusline = 0

    call neobundle#untap()
endif "}}}

if neobundle#tap('vim-go')
    let g:go_fmt_command = "goimports"
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1

    "autocmd BufRead *  call Hidecolumnsingo()

    function! Hidecolumnsingo()
        if &ft == 'go'
            set colorcolumn=80
        endif
    endfunction

    augroup StuffCmd
        " Run commands, such as go run with <leader>r for the current file or go build
        " and go test for the current package with <leader>b and <leader>t. Display a
        " beautiful annotated source code to see which functions are covered with
        " <leader>c.
        au FileType go nmap <leader>gr <Plug>(go-run)
        au FileType go nmap <leader>gb <Plug>(go-build)
        au FileType go nmap <leader>gt <Plug>(go-test)
        au FileType go nmap <leader>gc <Plug>(go-coverage)

        " Open the relevant Godoc for the word under the cursor with <leader>gd or
        " open it vertically with <leader>gv
        au FileType go nmap <Leader>gdd <Plug>(go-doc)
        au FileType go nmap <Leader>gdv <Plug>(go-doc-vertical)

        " Show type info for the word under your cursor with <leader>i (useful if you have disabled auto showing type info via g:go_auto_type_info)
        au FileType go nmap <Leader>i <Plug>(go-info)

        " Replace gd (Goto Declaration) for the word under your cursor (replaces current buffer)
        au FileType go nmap gd <Plug>(go-def)



        " Or open the definition/declaration in a new vertical, horizontal or tab for the word under your cursor

        au FileType go nmap <Leader>gds <Plug>(go-def-split)
        au FileType go nmap <Leader>gdv <Plug>(go-def-vertical)
        au FileType go nmap <Leader>gdt <Plug>(go-def-tab)
    augroup END

    call neobundle#untap()
endif

if neobundle#tap('neocomplete.vim')
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return neocomplete#close_popup() . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction

    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()

    call neobundle#untap()
endif

set wildignore=*/tmp/*,*.so,*.swp,*.zip,*.un~,*.pyc,*.orig
set wildignore+=.swp,.swo,~$,.git,.svn/,.hg/
set wildignore+=^tags$,.taghl$,.ropeproject/,node_modules/
set wildignore+=log/,tmp/,obj/,/vendor/gems/,/vendor/cache/
set wildignore+=.bundle/,.sass-cache/,/tmp/cache/assets/.*/sprockets/
set wildignore+=/tmp/cache/assets/.*/sass/,thirdparty/,Debug/
set wildignore+=Release/,.pyc$,pb2.py$,.class$,.jar$
set wildignore+=.min.js$,.jpg$,.jpeg$,.bmp$,.png$
set wildignore+=.gif$,.o$,.out$,.obj$,.rbc$,.rbo$
set wildignore+=.gem$,.zip$,.tar.gz$,.tar.bz2$,.rar$,.tar.xz$

if neobundle#tap('unite.vim')
    let g:unite_force_overwrite_statusline = 0
    let g:unite_source_history_yank_enable = 1

    "call unite#filters#sorter_default#use(['sorter_rank'])

    let g:unite_source_rec_max_cache_files = 0
    let g:unite_winheight = 10

    if executable('ag')
        " Using ag as recursive command.
        let g:unite_source_rec_async_command = 
                    \ 'ag --follow --nocolor --nogroup --hidden -g ""'

        " Use ag in unite grep source.
        let g:unite_source_grep_command = 'ag'
        let g:unite_source_grep_default_opts =
                    \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
                    \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
        let g:unite_source_grep_recursive_opt = ''
    elseif executable('ack')
        " Using ack as recursive command.
        let g:unite_source_rec_async_command = 'ack -f --nofilter'

        " Use ack in unite grep source.
        let g:unite_source_grep_command = 'ack'
        let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
        let g:unite_source_grep_recursive_opt = ''
    endif

    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#custom#source('file_rec/async', 'max_candidates', 25)

    " Fuzzy matching for plugins not using matcher_default as filter
    call unite#custom#source('outline,line,grep,session', 'matchers', ['matcher_fuzzy'])

    ""let g:unite_source_rec_max_cache_files = 0
    ""call unite#custom#source('file_rec,file_rec/async,file_mru,file,buffer,grep',
    "\ 'max_candidates', 0)

    " Prettier prompt
    nnoremap <leader>p :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
    nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank   history/yank<cr>
    nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer buffer<cr>
    nnoremap [Space]mru :<C-u>Unite -no-split -buffer-name=mru -start-insert file_mru<cr>
    "nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
    "
    " Unite grep:$buffers<cr> " grep contents of buffers

    " Custom mappings for the unite buffer
    augroup StuffCmd
        autocmd FileType unite call s:unite_settings()
    augroup END

    function! s:unite_settings()
        let neocomplete#disable_auto_complete = 1
        " Enable navigation with control-j and control-k in insert mode
        imap <buffer> <C-j>   <Plug>(unite_select_next_line)
        imap <buffer> <C-k>   <Plug>(unite_select_previous_line)

        nmap <buffer> <nowait> <C-c> <Plug>(unite_exit)
        imap <buffer> <nowait> <C-c> <Plug>(unite_exit)
    endfunction

    call neobundle#untap()
endif
" }}}
if neobundle#tap('vim-indent-guides')
    let g:indent_guides_auto_colors = &tabstop
    "autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
    "autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
    call neobundle#untap()
endif

if neobundle#tap('vim-airline')
    set noshowmode
    set laststatus=2
    let g:airline_theme='dark'
    let g:airline#extensions#bufferline#enabled = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline_left_sep=''
    let g:airline_right_sep='▓'
    let g:airline_powerline_fonts = 1
    "let g:airline_symbols.readonly = ''

    "let g:airline_section_a = airline#section#create(['mode', 'paste', 'iminsert'])
    "let g:airline_section_b = airline#section#create(['mode', '::', 'branch'])
    "let g:airline_section_c = airline#section#create(['mode', '::', 'branch'])
    "let g:airline_section_x = airline#section#create(['mode', '::', 'branch'])
    "let g:airline_section_y = airline#section#create(['mode', '::', 'branch'])
    "let g:airline_section_z = airline#section#create(['mode', '::', 'branch'])


"\ 'separator': { 'left': '', 'right': '▓' },
"\ 'subseparator': { 'left': '|', 'right': '⌠' }
    call neobundle#untap()
endif
