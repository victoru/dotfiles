set nocompatible      " Be iMproved
set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'

	NeoBundle 'tpope/vim-fugitive'
	NeoBundle 'kien/ctrlp.vim'
	NeoBundle 'scrooloose/nerdcommenter'
	NeoBundle 'majutsushi/tagbar'
	NeoBundleLazy 'Rykka/riv.vim', {
		  \ 'filetypes' : 'rst'
		  \ }
	NeoBundle 'scrooloose/syntastic'
	NeoBundle 'sjl/gundo.vim'
	NeoBundle 'ack.vim'
	NeoBundle 'kwbdi.vim'
	NeoBundle 'flazz/vim-colorschemes'
	NeoBundle 'Shutnik/jshint2.vim'
	NeoBundleLazy 'fatih/vim-go', {
		  \ 'filetypes' : 'go',
		  \ }
	NeoBundle 'LaTeX-Suite-aka-Vim-LaTeX'
	NeoBundle 'chriskempson/base16-vim'
	NeoBundle 'wavded/vim-stylus'
	NeoBundle 'itchyny/lightline.vim'
	NeoBundle 'bling/vim-bufferline'
	NeoBundle 'godlygeek/tabular'
	NeoBundleLazy 'gabrielelana/vim-markdown', {
		  \ 'filetypes' : ['markdown', 'mkd']
		  \ }
	NeoBundleLazy 'vim-scripts/SQLUtilities', {
		  \ 'filetypes' : 'sql',
		  \ }
	NeoBundle 'aquach/vim-http-client'
	NeoBundle 'tacahiroy/ctrlp-funky'
	NeoBundle 'shougo/unite.vim'
	NeoBundleLazy 'PotatoesMaster/i3-vim-syntax', {
		  \ 'filetypes' : 'i3',
		  \ }

	NeoBundleLazy 'godlygeek/csapprox.git', { 'terminal' : 1 }
	NeoBundleLazy 'thinca/vim-guicolorscheme', { 'terminal' : 1 }

	NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': 'make'}}
	NeoBundle 'Shougo/vimshell', {'depends': ['Shougo/vimproc.vim']}

	NeoBundleLazy 'm2mdas/phpcomplete-extended', {
		\ 'filetypes': 'php',
		\ 'depends': ['Shougo/vimproc.vim'],
		\ 'build': {'unix': 'curl -sS https://getcomposer.org/installer | php -- --install-dir=bin'},
		\ }

	NeoBundleLazy 'vim-php/phpctags', {
		\ 'filetypes': 'php',
		\ }

	NeoBundleLazy 'vim-php/tagbar-phpctags.vim', {
		\ 'filetypes': 'php',
		\ }

	let g:neobundle#install_process_timeout = 300

	NeoBundle 'Valloric/YouCompleteMe', {
		\'build': {'unix': './install.sh --clang-completer --system-libclang --system-boost'},
		\'verbose': 1,
		\}

call neobundle#end()


" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

augroup StuffCmd

augroup END

if neobundle#tap('phpcomplete-extended')
	let phpcomplete_index_composer_command = 'php ' . neobundle#get('phpcomplete-extended').rtp . 'bin/composer.phar'
	call neobundle#untap()
endif



filetype plugin indent on
set undofile
let mapleader = ','

set equalalways     " Equal size splits

set tabstop=4       " Number of spaces that a <Tab> in the file counts for.

set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.

"set expandtab      " Use the appropriate number of spaces to insert a <Tab>.
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

if neobundle#tap('LaTeX-Suite-aka-Vim-LaTeX')
	let g:Tex_DefaultTargetFormat = 'pdf'

	call neobundle#untap()
endif

set dir=~/tmp/vimswap//

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

let g:session_autosave = 'yes'
let g:session_autoload = 'no'

au BufWritePost *awesome/rc.lua :!~/scripts/check_awesome_config


"spelling
"========
nmap <leader>s :setlocal spell spelllang=en_us<cr>

"map <leader>i i<CR><esc>
nmap <leader>q :colorscheme random<cr>:colorscheme<cr>

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

"pydiction
"=========
let g:pydiction_location= '~/src/vim/pydiction/complete-dict'

"------------------------------------------------------------------------------

let g:riv_file_link_style = 2

" vim-markdown
let g:vim_markdown_folding_disabled=1

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

"================================
"Syntastic
"================================

if neobundle#tap('syntastic')
	let g:syntastic_error_symbol='✖'


	"let g:syntastic_warning_symbol='⁈'
	let g:syntastic_warning_symbol='⚠'
	let g:syntastic_check_on_open=1

	nm <F5> :Errors<CR>
	nmap <leader>E :Errors<CR>

	au StuffCmd CursorHold * SyntasticCheck
	call neobundle#untap()
endif

let g:pep8_map='<F6>'

"==============================================================================
" CtrlP.vim
"==============================================================================
if neobundle#tap('ctrlp')
	let g:ctrlp_map = '<leader>p'
	let g:ctrlp_cmd = 'CtrlP'
	map <leader>b :CtrlPBuffer<CR>

	let g:ctrlp_working_path_mode = 'ra'
	"
	set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.un~,*.pyc,*.orig
	let g:ctrlp_custom_ignore = {
	  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
	  \ 'file': '\v\.(pyc|orig|un\~|zip|swp|exe|so|dll)$',
	  \ 'link': 'some_bad_symbolic_links',
	  \ }
	call neobundle#untap()
endif

"tagbar
"==============================================================================
"Tagbar
"==============================================================================
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
"==============================================================================
" ctrlp-funky
"==============================================================================
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>


"==============================================================================
"statusline / lightline
"==============================================================================
set laststatus=2
set noshowmode


if neobundle#tap('lightline.vim')
"\ 'colorscheme': 'wombat',
	let g:lightline = {
		\ 'active': {
		\   'left': [ [ 'mode', 'paste', 'command' ],
		\             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
		\   'right': [ [ 'syntastic', 'lineinfo' ],
		\ 			   ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
		\ },
		\ 'component_function': {
		\   'fugitive': 'MyFugitive',
		\ 	'mode': 'MyMode',
		\ 	'readonly': 'MyReadonly',
		\ 	'modified': 'MyModified',
		\ 	'filename': 'MyFilename',
		\ },
		\ 'component_expand': {
		\   'syntastic': 'SyntasticStatuslineFlag',
		\ },
		\ 'component_type': {
		\   'syntastic': 'error',
		\ },
		\ 'subseparator': { 'left': '|', 'right': '|' }
		\ }

	function! MyFugitive()
	  let _ = fugitive#head()
	  let mark = '⭠ '
	  return strlen(_) ? mark._ : ''
	endfunction

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
			\ fname == 'ControlP' ? 'CtrlP' :
			\ fname == '__Gundo__' ? 'Gundo' :
			\ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
			\ winwidth(0) > 60 ? lightline#mode() : ''
	endfunction

	function! MyModified()
	  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
	endfunction

	function! MyReadonly()
	  let mark = '⭤'
	  return &ft !~? 'help' && &readonly ? mark : ''
	endfunction

	function! MyFilename()
	  let fname = expand('%:t')
	  return fname == 'ControlP' ? g:lightline.ctrlp_item :
			\ fname == '__Tagbar__' ? g:lightline.fname :
			\ fname =~ '__Gundo\|NERD_tree' ? '' :
			\ &ft == 'vimfiler' ? vimfiler#get_status_string() :
			\ &ft == 'vimshell' ? vimshell#get_status_string() :
			\ ('' != fname ? fname : '[No Name]') .
			\ ('' != MyModified() ? ' ' . MyModified() : '')
	endfunction


	let g:ctrlp_status_func = {
	  \ 'main': 'CtrlPStatusFunc_1',
	  \ 'prog': 'CtrlPStatusFunc_2',
	  \ }

	function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
	  let g:lightline.ctrlp_regex = a:regex
	  let g:lightline.ctrlp_prev = a:prev
	  let g:lightline.ctrlp_item = a:item
	  let g:lightline.ctrlp_next = a:next
	  return lightline#statusline(0)
	endfunction

	function! CtrlPStatusFunc_2(str)
	  return lightline#statusline(0)
	endfunction

	let g:tagbar_status_func = 'TagbarStatusFunc'

	function! TagbarStatusFunc(current, sort, fname, ...) abort
		let g:lightline.fname = a:fname
	  return lightline#statusline(0)
	endfunction

	call neobundle#untap()
endif

"==============================================================================
" Use ranger as vim file manager
"==============================================================================
fun! RangerChooser()
	let s:filename = printf("/tmp/vimranger_chosenfile_%s", system('echo -n $RANDOM'))

	let cmd = printf("sil !ranger --choosefile=%s %s", s:filename, expand("%:p:h"))
	if has("gui_running") && (has("gui_gtk") || has("gui_motif"))
		let cmd = substitute(cmd, '!', '! urxvt -name vimranger -e ', '')
	endif
	exec cmd
	redraw!
	if filereadable(s:filename)
		exec 'edit ' . system('cat ' . s:filename)
		call system('rm ' . s:filename)
	endif
	redraw!
endfun
map ,r :call RangerChooser()<CR>

"==============================================================================
"save as root
"==============================================================================
command! W w !sudo tee % > /dev/null


"==============================================================================
" autocmd
"==============================================================================
augroup StuffCmd
	autocmd!
	autocmd WinEnter * setlocal cursorline cursorcolumn
	hi CursorLine cterm=reverse gui=reverse
	hi CursorColumn cterm=reverse gui=reverse

	autocmd WinLeave * setlocal nocursorline nocursorcolumn
	au ColorScheme,VimEnter * hi normal ctermbg=NONE
	au ColorScheme,VimEnter * hi nontext ctermbg=NONE

	" Create crosshair effect by inversing current line and column colors
	au ColorScheme * hi CursorLine cterm=reverse gui=reverse
	au ColorScheme * hi CursorColumn cterm=reverse gui=reverse

	" Highlight TODO, FIXME, NOTE, etc.
	autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
	autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')

	" Use phpcomplete-extend's omnicompleter
	autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
augroup END


let g:vimshell_force_overwrite_statusline = 0

"colorscheme flatcolor
"colorscheme symfony
set background=dark
if has('gui_running')
	colorscheme jellybeans
	set guifont=PragmataProForPowerline
	set guioptions=aegit
endif

if has('gui')
	NeoBundleSource csapprox
	colorscheme mango
else
	" Use guicolorscheme.vim
	NeoBundleSource vim-guicolorscheme
	autocmd StuffCmd VimEnter,BufAdd * GuiColorScheme mango
endif
