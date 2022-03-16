" Note: Skip initialization for vim-tiny or vim-small.
" if 0 | endif
"
"
" set t_Co=256
" let g:python_host_prog='/opt/local/bin/python'
" let g:python3_host_prog='/opt/local/bin/python3'
" let g:python3_host_prog='/usr/local/bin/python3'
" let g:python_host_prog='/usr/local/bin/python3'
let g:python_host_prog='/usr/local/bin/python2'
let g:python3_host_prog='/Users/victorunegbu/.local/share/virtualenvs/.nvim-6Xe7ujW9/bin/python'

set textwidth=0 wrapmargin=0
if &compatible
    set nocompatible               " Be iMproved
endif

if has('nvim')
    let s:editor_root=expand("~/.nvim")
    let $PATH = '/Users/victorunegbu/.local/share/virtualenvs/.nvim-6Xe7ujW9/bin:/Users/victorunegbu/.nvim/node_modules/.bin:' . $PATH
else
    let s:editor_root=expand("~/.vim")
endif

let s:dein=s:editor_root . expand("/bundle/repos/github.com/Shougo/dein.vim")
let &rtp = s:dein . ',' . &rtp

if dein#load_state(expand('$XDG_CACHE_HOME/dein'))
    call dein#begin(expand('$XDG_CACHE_HOME/dein'))
    call dein#add(expand(s:dein))

    call dein#add('dhruvasagar/vim-table-mode')
    call dein#add('prettier/vim-prettier', {'build': 'npm install'})
    call dein#add('jceb/vim-orgmode')
    call dein#add('tpope/vim-speeddating')

    call dein#add('Shougo/vimproc.vim', {'build': 'make'})
    "call dein#add('Shougo/vimfiler')
    call dein#add('fatih/vim-go', {'on_ft': 'go'})

    call dein#add('honza/vim-snippets')
    call dein#add('SirVer/ultisnips')


    call dein#add('tpope/vim-vinegar')
    call dein#add('dracula/vim')

    call dein#add('godlygeek/tabular')
    call dein#add('jwalton512/vim-blade')
    call dein#add('mustache/vim-mustache-handlebars')
    call dein#add('w0rp/ale')
    call dein#add('stephpy/vim-yaml')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('ambv/black')
    call dein#add('nvie/vim-flake8')
    call dein#add('posva/vim-vue')
    " call dein#add('zchee/deoplete-go', { 'build': 'make'})
    "call dein#add('deoplete-plugins/deoplete-go', {'build': 'make'})
    call dein#add('stamblerre/gocode', { 'rtp': 'nvim/'})
    call dein#add('sheerun/vim-polyglot')
    call dein#add('nvim-treesitter/nvim-treesitter', { 'hook_post_update': ':TSUpdate' })
    call dein#add('folke/tokyonight.nvim')
    set termguicolors
    call dein#add('glacambre/firenvim', { 'hook_post_update': { _ -> firenvim#install(0) } })
    "if exists('g:started_by_firenvim')
    "endif

    function! OnUIEnter(event) abort
      if 'Firenvim' ==# get(get(nvim_get_chan_info(a:event.chan), 'client', {}), 'name', '')

        nnoremap <Esc><Esc> :call firenvim#focus_page()<CR>
        au TextChanged * ++nested write
        au TextChangedI * ++nested write
        nnoremap <space> :set lines=28 columns=110 <CR>

        let s:fontsize = 14
        function! AdjustFontSizeF(amount)
          let s:fontsize = s:fontsize+a:amount
          execute "set guifont=Fantasque\\ Sans\\ Mono:h" . s:fontsize
          call rpcnotify(0, 'Gui', 'WindowMaximized', 1)
        endfunction

        noremap  <C-=> :call AdjustFontSizeF(1)<CR>
        noremap  <C--> :call AdjustFontSizeF(-1)<CR>
        inoremap <C-=> :call AdjustFontSizeF(1)<CR>
        inoremap <C--> :call AdjustFontSizeF(-1)<CR>


        au TextChanged * ++nested write
        au TextChangedI * ++nested write
      endif
    endfunction
    autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
        " call dein#add('Shougo/neocomplete.vim')
        " call dein#add('nvim-treesitter/nvim-treesitter')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
        " call dein#add('godlygeek/csapprox.git', { 'terminal' : 1, 'lazy': 1 })
        " call dein#add('thinca/vim-guicolorscheme', { 'terminal' : 1 })

    "call dein#add('othree/yajs.vim')
    "call dein#add('othree/es.next.syntax.vim')

    call dein#add('Shougo/denite.nvim')
    "call dein#add('Shougo/unite-outline', {'depends': ['Shougo/denite.vim']})
    "call dein#add('Shougo/neomru.vim', {'depends': ['Shougo/denite.vim']})

    "call dein#add('osyo-manga/vim-anzu')

    call dein#add('blueyed/vim-diminactive')

    "" colorschemes
    "call dein#add('nanotech/jellybeans.vim')
    " call dein#add('morhetz/gruvbox')
    ""call dein#add('ninja/sky')
    call dein#add('flazz/vim-colorschemes')
    call dein#add('jacoborus/tender')
    call dein#add('alessandroyorba/alduin')

    call dein#add('itchyny/lightline.vim')
    call dein#add('bling/vim-bufferline')
    call dein#add('majutsushi/tagbar')

    call dein#add('pangloss/vim-javascript')
    call dein#add('ternjs/tern_for_vim')

    "call dein#add(expand('~/src/kamailio/utils/misc/vim'))

    call dein#add('elzr/vim-json')
    call dein#add('pearofducks/ansible-vim')
    call dein#add('Glench/Vim-Jinja2-Syntax', {'on_ft': 'jinja'})
    call dein#add('gu-fan/riv.vim', {'on_ft' : 'rst'})
    call dein#add('gu-fan/InstantRst', {'on_ft' : 'rst'})
    call dein#add('gu-fan/rhythm.css', {'on_ft' : 'rst'})
    call dein#add('PotatoesMaster/i3-vim-syntax', {'on_ft' : 'i3'})

    call dein#add('vim-scripts/ack.vim')
    call dein#add('vim-scripts/kwbdi.vim')

    call dein#add('airblade/vim-gitgutter')
    call dein#add('tpope/vim-fugitive')

    call dein#add('scrooloose/nerdcommenter')
    call dein#add('sjl/gundo.vim')

    call dein#add('ntpeters/vim-better-whitespace')
    call dein#add('nathanaelkane/vim-indent-guides')

    call dein#add('plasticboy/vim-markdown')

    call dein#add('vim-php/tagbar-phpctags.vim', {
        \ 'hook_post_update': "
        \ !sh -c 'curl -SsL http://vim-php.com/phpctags/install/phpctags.phar
        \ > ~/bin/phpctags && chmod +x ~/bin/phpctags'",
        \ 'on_ft': 'php', 'depends': ['tagbar']})

    call dein#add('hashivim/vim-terraform')
    call dein#add('editorconfig/editorconfig-vim')
    call dein#add('getgauge-contrib/neovim-gauge')
    call dein#add('google/vim-jsonnet')

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
filetype plugin indent on
syntax enable

"}}}


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<a-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Options {{{

set hidden
set colorcolumn=80
set noshowmode

set undodir=~/tmp/vim/undo//
set backupdir=~/tmp/vim/backup//
set directory=~/tmp/vim/swap//
set undofile

set scrolloff=5         " keep at least 5 lines above/below
set sidescrolloff=5     " keep at least 5 lines left/right
set pastetoggle=<F12>
set equalalways         " Equal size splits
set tabstop=4           " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4        " Number of spaces to use for each step of (auto)indent.
set showcmd             " Show (partial) command in status line.
set number              " Show line numbers.

set showmatch           " When a bracket is inserted, briefly jump to the matching
                        " one. The jump is only done if the match can be seen on the
                        " screen. The time to show the match can be set with
                        " 'matchtime'.

set expandtab           " Use the appropriate number of spaces to insert a <Tab>.
                        " Spaces are used in indents with the '>' and '<' commands
                        " and when 'autoindent' is on. To insert a real tab when
                        " 'expandtab' is on, use CTRL-V <Tab>.

set smarttab            " When on, a <Tab> in front of a line inserts blanks
                        " according to 'shiftwidth'. 'tabstop' is used in other
                        " places. A <BS> will delete a 'shiftwidth' worth of space
                        " at the start of the line.

set hlsearch            " When there is a previous search pattern, highlight all
                        " its matches.

set incsearch           " While typing a search command, show immediately where the
                        " so far typed pattern matches.

set ignorecase          " Ignore case in search patterns.

set smartcase           " Override the 'ignorecase' option if the search pattern
                        " contains upper case characters.

set backspace=2         " Influences the working of <BS>, <Del>, CTRL-W
                        " and CTRL-U in Insert mode. This is a list of items,
                        " separated by commas. Each item allows a way to backspace
                        " over something.

set ruler               " Show the line and column number of the cursor position,
                        " separated by a comma.
set synmaxcol=250       " set max syntax highlighting column to sane level

" Mappings
" ========

" [Space]: Other useful commands "{{{
" Smart space mapping.
" Notice: when starting other <Space> mappings in noremap, disappeared [Space].
nmap  <Space>   [Space]
xmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
xnoremap  [Space]   <Nop>

let mapleader = '[Space]'
" let apleader = '\'

" jetpack: fly through buffers
nnoremap <leader>l :ls<cr>:b<space>

" Visual mode keymappings
" <TAB>: indent.
xnoremap <TAB>  >
" <S-TAB>: unindent.
xnoremap <S-TAB>  <

" Indent
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv

""Smart way to move between windows:
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

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

"" Use <C-Space>.
"nmap <C-Space>  <C-@>
"cmap <C-Space>  <C-@>

"nnoremap  [Space]   <Nop>
"xnoremap  [Space]   <Nop>

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
nnoremap <silent> [Space]/ :<C-u>call ToggleOption('hlsearch')<CR>
" Toggle cursorline.
nnoremap <silent> [Space]cl :<C-u>call ToggleOption('cursorline')<CR>
" nnoremap <silent> [Space]cc :<C-u>call ToggleOption('cursorcolumn')<CR>
" Set autoread.
"nnoremap [Space]ar
"\ :<C-u>setlocal autoread<CR>
" Set spell check.
"nmap <leader>s :setlocal spell spelllang=en_us<cr>
nnoremap [Space]sp :<C-u>call ToggleOption('spell')<CR>
nnoremap [Space]w :<C-u>call ToggleOption('wrap')<CR>

" }}}

" Easily edit .vimrc and .gvimrc "{{{
nnoremap <silent> [Space]ev  :<C-u>edit $MYVIMRC<CR>
" Load .gvimrc after .vimrc edited at GVim.
nnoremap <silent> [Space]rv :<C-u>source $MYVIMRC \|
            \ echo "source $MYVIMRC"<CR>
"}}}

" Useful save mappings.
nnoremap <silent> <Leader><Leader> :<C-u>update<CR>
nnoremap <leader>v V`]

"remap f1 to esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap jk <Esc>

inoremap <C-c> <ESC>
nnoremap <C-c> <ESC>
inoremap <C-c> <ESC>


" Up Down Left Right resize splits
nnoremap <up> <c-w>+
nnoremap <down> <c-w>-
nnoremap <left> <c-w><
nnoremap <right> <c-w>>

" H and L keys for buffer movement
noremap H :bp<CR>
noremap L :bn<CR>

noremap j gj
noremap k gk

" remove trailing whitespaces
nnoremap <leader>W :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" nnoremap <leader>W :%s/\s\+$//e


" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

"save as root
"command! WW w !sudo tee % > /dev/null

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

"}}}

" Create crosshair effect
augroup Crosshair
    au!
    autocmd WinLeave *  setlocal nocursorcolumn nocursorline
    autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline cursorcolumn
    " invert current line colors
    au ColorScheme,VimEnter,BufWinEnter,WinEnter * hi CursorLine cterm=reverse
    au ColorScheme,VimEnter,BufWinEnter,WinEnter * hi CursorColumn cterm=reverse
augroup END

" Color {{{
augroup ColorCmds
    au!

    "au ColorScheme,VimEnter myspecialcolors hi normal ctermbg=red guibg=red
    au ColorScheme * hi normal ctermbg=none
    au ColorScheme * hi nontext ctermbg=none
    "if has('nvim')
        au ColorScheme * hi normal guibg=NONE
        au ColorScheme * hi nontext guibg=NONE
    "endif

    autocmd BufWinEnter,WinEnter * setlocal colorcolumn=80
    autocmd BufWinLeave,WinLeave * setlocal colorcolumn=0

    " Highlight TODO, FIXME, NOTE, etc.
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|???\)')
    set colorcolumn=80
augroup END

"}}}
" Enter automatically into the files directory
"autocmd BufEnter * silent! lcd %:p:h

augroup StuffCmd
    autocmd!
augroup END
if dein#tap('majutsushi/tagbar')
    let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
    let g:tagbar_type_make = {
        \ 'kinds':[
            \ 'm:macros',
            \ 't:targets'
        \ ]
    \}
    let g:tagbar_type_yaml = {
                \ 'kinds':[
                    \ 'a:anchors',
                    \ 'k:regex'
                \ ]
    \}
endif

if dein#tap('alduin')
"Decription 	Add variables to .vimrc 	Screenshot
"dark gray background 	colorscheme alduin 	Screenshot
"black background 	let g:alduin_Shout_Become_Ethereal = 1 	Screenshot
"gray to black @ 5pm 	let g:alduin_Contract_Vampirism = 1 	Screenshot
"underline matching parens 	let g:alduin_Shout_Aura_Whisper = 1 	Screenshot
"adds dark red color 	let g:alduin_Shout_Fire_Breath = 1 	Screenshot
"removes background from Strings 	let g:alduin_Shout_Animal_Allegiance = 1 	Screenshot
"removes cursorline 	let g:alduin_Shout_Clear_Skies = 1 	Screenshot

endif



if has('termguicolors')     " set true colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

if has('gui_running')
    colorscheme jellybeans
    set guifont=Fantasque\ Sans\ Mono\ 10
    set guioptions=c
else
    hi! Normal ctermbg=NONE guibg=NONE
    hi! NonText ctermbg=NONE guibg=NONE
    "let g:rehash256 = 1
    set background=dark
    "colorscheme adventurous
    " colorscheme afterglow
    "colorscheme advantage
    " colorscheme ChocolateLiquor
    "colorscheme Atelier_ForestLight
    " colorscheme Atelier_DuneDark
    "colorscheme Atelier_EstuaryDark
    " colorscheme Dark
    "colorscheme DimSlate
    " colorscheme BlackSea
    "colorscheme afterglow
    " colorscheme Benokai
    " colorscheme Atelier_SeasideDark
    "colorscheme alduin
    let g:tokyonight_style = "night"
    colorscheme tokyonight
endif

if dein#tap('deoplete.nvim')

    let g:deoplete#enable_at_startup = 1
    " neocomplete like
    set completeopt+=noinsert
    " deoplete.nvim recommend
    set completeopt+=noselect

    let g:deoplete#sources#go#sort_class = ['func', 'type', 'var', 'const']
    "
    " Plugin key-mappings.
    inoremap <expr><C-g>     deoplete#undo_completion()
    inoremap <expr><C-l>     deoplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return deoplete#close_popup() . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? deoplete#close_popup() : "\<CR>"
    endfunction

        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
        "inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

        inoremap <expr><C-y>  deoplete#close_popup()."\<C-y>"
        inoremap <expr><C-e>  deoplete#cancel_popup()."\<C-e>"
        "let g:neocomplete#enable_auto_select = 1
        "let g:neocomplete#enable_at_startup = 1                      " use neocomplete
        "let g:neocomplete#enable_smart_case = 1                      " use smartcase
        "let g:neocomplete#enable_auto_delimiter = 1                  " enable auto delimiter
        "let g:neocomplete#max_list = 15                              " max complete reminder list
        "let g:neocomplete#sources#syntax#min_keyword_length = 3      " set minimum syntax keyword length
    endif

" Plugins {{{
if dein#tap('vimfiler')
    map <leader>r :VimFiler <CR>
endif

if dein#tap('phpcomplete-extended')
    let g:phpcomplete_index_composer_command = 'php ' .
                \ dein#get('phpcomplete-extended').rtp . 'bin/composer.phar'

    augroup StuffCmd
        " Use phpcomplete-extend's omnicompleter
        autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
    augroup END
endif

if dein#tap('phpctags')
    let $PATH = $PATH . ":"  . dein#get('phpctags').rtp
endif

if dein#tap('LaTeX-Suite-aka-Vim-LaTeX')
    let g:Tex_DefaultTargetFormat = 'pdf'
endif

if dein#tap('kwbdi.vim')
    nmap <C-W>! <Plug>Kwbd
endif

if dein#tap('gundo.vim')
    "Gundo
    map <leader>g :GundoToggle<cr>
    map <F3> :GundoToggle<cr>
endif

if dein#tap('riv.vim')
    let g:riv_file_link_style = 2
endif

if dein#tap('vim-markdown')
    "let g:vim_markdown_folding_disabled=1
    "let g:vim_markdown_no_default_key_mappings=1
endif

if dein#tap('tagbar')
    nmap <F8> :TagbarToggle<CR>

    function! TagbarStatusFunc(current, sort, fname, ...) abort
        let g:lightline.fname = a:fname
      return lightline#statusline(0)
    endfunction

    let g:tagbar_status_func = 'TagbarStatusFunc'

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
endif

if dein#tap('vim-gitgutter')
    let g:gitgutter_max_signs = 1000
endif

if dein#tap('vim-bufferline')
    let g:bufferline_echo = 0

endif
"" TOOO FARRR
if dein#tap('lightline.vim')
    set laststatus=2
    let g:nomodefiletypes = ['gundo', 'tagbar']
    let g:lightline = {
                \ 'colorscheme': 'darcula',
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ],
                \             [ 'fugitive', 'filename' ],
                \             [ 'go' ] ],
                \   'right': [ [ 'ale', 'lineinfo' ],
                \              ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
                \ },
                \ 'component_function': {
                \   'fileencoding': 'MyFileencoding',
                \   'fileformat': 'MyFileformat',
                \   'filename': 'MyFilename',
                \   'percent': 'LightLinePercent',
                \   'filetype': 'MyFiletype',
                \   'fugitive': 'MyFugitive',
                \   'mode': 'MyMode',
                \   'go': 'LightLineGo',
                \   'lineinfo': 'LightLineInfo',
                \ },
                \ 'subseparator': { 'left': '|', 'right': '|' },
                \ 'component_expand': {
                \   'ale': 'LinterStatus',
                \ },
                \ 'component_type': {
                \   'ale': 'error',
                \ },
                \ 'component_visible_condition': {
                \   'readonly': '(&filetype!="help"&& &readonly)',
                \ }
                \ }

    augroup reload_vimrc
    autocmd!
        autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
    augroup END

    function! LinterStatus() abort
        let l:counts = ale#statusline#Count(bufnr(''))

        let l:all_errors = l:counts.error + l:counts.style_error
        let l:all_non_errors = l:counts.total - l:all_errors

        return l:counts.total == 0 ? 'OK' : printf(
        \   '%dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
    endfunction

    function! MyFugitive()
        try
            if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
              let mark = '⭠ '  " edit here for cool mark
              let _ = fugitive#head()
              return _ !=# '' ? mark._ : ''
            endif
        catch
        endtry
        return ''


        "if !exists('*fugitive#head') || (exists('*fugitive#head') && strlen(fugitive#head()))
            "if floor(((strlen(fugitive#head()) * 1.0) / winwidth(0)) * 100) < 25
                "return '⭠ ' . fugitive#head()
            "endif
        "endif
        "return ''
    endfunction

    function! MyReadonly()
         " ⭤
        let icon = ''
        if &ft == "help" || &readonly
            return icon
        endif
        return ''
    endfunction

    function! LightLinePercent()
      return &ft =~? 'vimfiler' ? '' : (100 * line('.') / line('$')) . '%'
    endfunction

    function! LightLineGo()
      return exists('*go#jobcontrol#Statusline') ? go#jobcontrol#Statusline() : ''
    endfunction

	function! LightLineInfo()
	  return winwidth(0) > 60 ? printf("%3d:%-2d", line('.'), col('.')) : ''
	endfunction


    function! MyFilename()
        let fname = expand('%:t')
        return  ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ fname == '__Tagbar__' ? g:lightline.fname :
                \ fname =~ '__Gundo\|NERD_tree' ? '' :
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
				\ ('' != MyModified() ? ' ' . MyModified() : '')
    endfunction

    function! MyMode()
      let fname = expand('%:t')
      return fname == '__Tagbar__' ? 'Tagbar' :
            \ fname == 'ControlP' ? 'CtrlP' :
            \ fname == '__Gundo__' ? 'Gundo' :
            \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
            \ fname =~ 'NERD_tree' ? 'NERDTree' :
            \ &ft == 'denite' ? denite#get_status_mode() :
            \ &ft == 'vimfiler' ? 'VimFiler' :
            \ &ft == 'vimshell' ? 'VimShell' :
            \ winwidth(0) > 60 ? lightline#mode() : ''
    endfunction

    function! MyModified()
        return &ft =~ 'help' || !&modified ? '' : '+' "&modifiable ? '' : '-'
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

    "function! MyFileencoding()
        "return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
        "%{ALEGetStatusLine()}
    "endfunction

endif

if dein#tap('vim-go')
    let g:go_fmt_command = "goimports"

    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1

    nm <F5> :GoErrCheck<CR>
    nmap <leader>E :GoErrCheck<CR>


    "let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
    let g:go_list_type = "locationlist"

    "autocmd BufRead *  call Hidecolumnsingo()

    augroup StuffCmd
        if has('nvim')
            au FileType go nmap <leader>rt <Plug>(go-run-tab)
            au FileType go nmap <Leader>rs <Plug>(go-run-split)
            au FileType go nmap <Leader>rv <Plug>(go-run-vertical)
        endif
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

endif

"set wildignore=*/tmp/*,*.so,*.swp,*.zip,*.un~,*.pyc,*.orig
"set wildignore+=.swp,.swo,~$,.git,.svn/,.hg/
"set wildignore+=^tags$,.taghl$,.ropeproject/,node_modules/
"set wildignore+=log/,tmp/,obj/,/vendor/gems/,/vendor/cache/
"set wildignore+=.bundle/,.sass-cache/,/tmp/cache/assets/.*/sprockets/
"set wildignore+=/tmp/cache/assets/.*/sass/,thirdparty/,Debug/
"set wildignore+=Release/,.pyc$,pb2.py$,.class$,.jar$
"set wildignore+=.min.js$,.jpg$,.jpeg$,.bmp$,.png$
"set wildignore+=.gif$,.o$,.out$,.obj$,.rbc$,.rbo$
"set wildignore+=.gem$,.zip$,.tar.gz$,.tar.bz2$,.rar$,.tar.xz$

if dein#tap('denite.nvim')
    if executable('ag')
        call denite#custom#var('file_rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
        " Ag command on grep source
        call denite#custom#var('grep', 'command', ['ag'])
        call denite#custom#var('grep', 'default_opts',
                \ ['-i', '--vimgrep'])
        call denite#custom#var('grep', 'recursive_opts', [])
        call denite#custom#var('grep', 'pattern_opt', [])
        call denite#custom#var('grep', 'separator', ['--'])
        call denite#custom#var('grep', 'final_opts', [])

    elseif executable('ack')
        call denite#custom#var('file_rec', 'command',
        \ ['ack', '-f', '--follow', '--nocolor', '--nogroup', '-g', ''])
        call denite#custom#var('grep', 'command', ['ack'])
        call denite#custom#var('grep', 'default_opts',
                \ ['--ackrc', $HOME.'/.ackrc', '-H',
                \  '--nopager', '--nocolor', '--nogroup', '--column'])
        call denite#custom#var('grep', 'recursive_opts', [])
        call denite#custom#var('grep', 'pattern_opt', ['--match'])
        call denite#custom#var('grep', 'separator', ['--'])
        call denite#custom#var('grep', 'final_opts', [])
    endif
	"call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
        "\ [ '.git/', '.ropeproject/', '__pycache__/',
        "\ 'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])⇧

    nnoremap <leader>p :<C-u>Denite -buffer-name=files file_rec<cr>
    nnoremap <leader>b :<C-u>Denite -buffer-name=search%`bufnr('%')` line<cr>
    function! DeniteSettings()
        let neocomplete#disable_auto_complete = 1
        let deoplete#disable_auto_complete = 1
        " Enable navigation with control-j and control-k in insert mode
        " Change mappings.
        call denite#custom#map(
              \ 'insert',
              \ '<C-j>',
              \ '<denite:move_to_next_line>',
              \ 'noremap'
              \)
        call denite#custom#map(
              \ 'insert',
              \ '<C-k>',
              \ '<denite:move_to_previous_line>',
              \ 'noremap'
              \)
        call denite#custom#map(
              \ 'insert',
              \ '<C-c>',
              \ '<denite:quit>',
              \ 'noremap nowait'
              \)
        call denite#custom#map('insert', "<C-t>", '<denite:do_action:tabopen>')

        " Change matchers.
        call denite#custom#source(
        \ 'file_mru', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])
        call denite#custom#source(
        \ 'file_rec', 'matchers', ['matcher_cpsm'])

        " Change sorters.
        call denite#custom#source(
        \ 'file_rec', 'sorters', ['sorter_sublime'])

        " Define alias
        call denite#custom#alias('source', 'git', 'file/rec')
        call denite#custom#var('git', 'command',
              \ ['git', 'ls-files', '-co', '--exclude-standard'])

        call denite#custom#alias('source', 'file/rec/git', 'file/rec')
        call denite#custom#var('file/rec/git', 'command',
              \ ['git', 'ls-files', '-co', '--exclude-standard'])

        let s:menus = {}
        let s:menus.git = {}
        let s:menus.git.command_candidates = [
            \ [' git status', 'Gstatus'],
            \ [' git diff', 'Gvdiff'],
            \ [' git commit', 'Gcommit'],
            \ [' git stage/add', 'Gwrite'],
            \ [' git checkout', 'Gread'],
            \ [' git rm', 'Gremove'],
            \ [' git cd', 'Gcd'],
            \ [' git push', 'exe "Git! push -u origin " input("branch: ")'],
            \ [' git pull', 'exe "Git! pull " input("branch: ")'],
            \ [' git fetch', 'Gfetch'],
            \ [' git merge', 'Gmerge'],
            \ [' git browse', 'Gbrowse'],
            \ [' git head', 'Gedit HEAD^'],
            \ [' git parent', 'edit %:h'],
            \ [' git log commit buffers', 'Glog --'],
            \ [' git log current file', 'Glog -- %'],
            \ [' git log last n commits', 'exe "Glog -" input("num: ")'],
            \ [' git log first n commits', 'exe "Glog --reverse -" input("num: ")'],
            \ [' git log until date', 'exe "Glog --until=" input("day: ")'],
            \ [' git log grep commits',  'exe "Glog --grep= " input("string: ")'],
            \ [' git log pickaxe',  'exe "Glog -S" input("string: ")'],
            \ [' git index', 'exe "Gedit " input("branchname\:filename: ")'],
            \ [' git mv', 'exe "Gmove " input("destination: ")'],
            \ [' git grep',  'exe "Ggrep " input("string: ")'],
            \ [' git prompt', 'exe "Git! " input("command: ")'],
            \ ]
        " Append ' --' after log to get commit info commit buffers
        call denite#custom#var('menu', 'menus', s:menus)

        " call denite#custom#option('default', 'prompt', '>')
        " call denite#custom#option('default', 'short_source_names', v:true)
        call denite#custom#option('default', {
              \ 'auto_accel': v:true,
              \ 'prompt': '>',
              \ 'source_names': 'short',
        \ })

    endfunction
    call DeniteSettings()
    "augroup StuffCmd
    " autocmd BufNewFile \[denite\] :set filetype=denite
      "autocmd!
  "autocmd FileType denite sleep 1 | call s:denite_settings()
  "autocmd FileType denite call s:denite_settings()
  " autocmd FileType denite :echom "I am far"
  "autocmd FileType denite call s:denite_settings()
    "augroup END


endif

if dein#tap('unite.vim')
    let g:unite_force_overwrite_statusline = 0
    let g:unite_source_history_yank_enable = 1

    " call unite#filters#sorter_default#use(['sorter_rank'])

    let g:unite_source_rec_max_cache_files = 0
    let g:unite_winheight = 10

    if executable('ag')
        " Using ag as recursive command.
        let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
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
        "let g:unite_source_grep_command = 'ack'
        let g:unite_source_grep_command = ['ack', '-f', '--nofilter']
        let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
        let g:unite_source_grep_recursive_opt = ''
    endif

	"" Interface for Git
	"let g:unite_source_menu_menus.git = {
		"\ 'description' : 'Fugitive interface',
		"\}
	"let g:unite_source_menu_menus.git.command_candidates = [
		"\[' git status', 'Gstatus'],
		"\[' git diff', 'Gvdiff'],
		"\[' git commit', 'Gcommit'],
		"\[' git stage/add', 'Gwrite'],
		"\[' git checkout', 'Gread'],
		"\[' git rm', 'Gremove'],
		"\[' git cd', 'Gcd'],
		"\[' git push', 'exe "Git! push -u origin " input("branch: ")'],
		"\[' git pull', 'exe "Git! pull " input("branch: ")'],
		"\[' git fetch', 'Gfetch'],
		"\[' git merge', 'Gmerge'],
		"\[' git browse', 'Gbrowse'],
		"\[' git head', 'Gedit HEAD^'],
		"\[' git parent', 'edit %:h'],
		"\[' git log commit buffers', 'Glog --'],
		"\[' git log current file', 'Glog -- %'],
		"\[' git log last n commits', 'exe "Glog -" input("num: ")'],
		"\[' git log first n commits', 'exe "Glog --reverse -" input("num: ")'],
		"\[' git log until date', 'exe "Glog --until=" input("day: ")'],
		"\[' git log grep commits',  'exe "Glog --grep= " input("string: ")'],
		"\[' git log pickaxe',  'exe "Glog -S" input("string: ")'],
		"\[' git index', 'exe "Gedit " input("branchname\:filename: ")'],
		"\[' git mv', 'exe "Gmove " input("destination: ")'],
		"\[' git grep',  'exe "Ggrep " input("string: ")'],
		"\[' git prompt', 'exe "Git! " input("command: ")'],
		"\] " Append ' --' after log to get commit info commit buffers
	"nnoremap <silent> <Leader>g :Unite -direction=botright -silent -buffer-name=git menu:git<CR>

    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#custom#source('file_rec/async', 'max_candidates', 75)

    " Fuzzy matching for plugins not using matcher_default as filter
    call unite#custom#source('outline,line,grep,session', 'matchers', ['matcher_fuzzy'])

    ""let g:unite_source_rec_max_cache_files = 0
    ""call unite#custom#source('file_rec,file_rec/async,file_mru,file,buffer,grep',
    "\ 'max_candidates', 0)

    " Prettier prompt
    "nnoremap <leader>p :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
    if has('nvim')
        nnoremap <leader>p :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/neovim:!<cr>
    else
        nnoremap <leader>p :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async<cr>
    endif
    nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank -start-insert history/yank<cr>
    nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer -start-insert buffer<cr>
    nnoremap <leader>mru :<C-u>Unite -no-split -buffer-name=mru -start-insert file_mru<cr>
    nno <leader>cd :<C-u>Unite directory_mru directory -start-insert -buffer-name=cd -default-action=cd<CR>
    "nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr> "
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

    " tagbarlike functionality
    " :Unite -vertical -winwidth=35 outline

endif
" }}}

if dein#tap('vim-anzu')
    " mapping
    nmap n <Plug>(anzu-n-with-echo)
    nmap N <Plug>(anzu-N-with-echo)
    nmap * <Plug>(anzu-star-with-echo)
    nmap # <Plug>(anzu-sharp-with-echo)

    " clear status
    nmap <Esc><Esc> <Plug>(anzu-clear-search-status)

    " statusline
    set statusline=%{anzu#search_status()}
endif


if dein#tap('vim-indent-guides')
    let g:indent_guides_auto_colors = &tabstop
    "autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
    "autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
endif

if dein#tap('ntpeters/vim-better-whitespace')
    let g:show_spaces_that_precede_tabs=1
endif

function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction


"autocmd FileType denite :echom 'autocmd filetype' . &filetype
"autocmd BufWinEnter,WinEnter * :echom 'autocmd enter with filetype: '.&filetype . ' - ' .&buftype
"autocmd BufNewFile \[denite\] :echom 'WTF'
