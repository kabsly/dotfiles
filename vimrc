filetype plugin on
filetype indent on
set shell=bash
set nocompatible
syntax enable

" ----- Editor Options ----- "

" Viewing options
set nu
set rnu
set shiftwidth=4
set tabstop=4
set bs=2
set so=1
set sj=5 " Scroll 5ln when leaving the screen
set nowrap
set lazyredraw	" Performance improvements
set showmatch
set ruler		" Always show cursor position
set completeopt-=preview
set background=light
highlight Pmenu ctermbg=white ctermfg=black

set autoindent
set smarttab
set hidden " Switch buffers without saving

set wildmenu
set wildignore=*.o,*.class,*.pyc

" Clipboard settings
set history=50
set clipboard=unnamed	" Yank files to the system clipboard

set laststatus=2
set ttimeoutlen=50

set path+=**

" Search options
set ignorecase	" Ignore case when searching
set smartcase   " Handle case smartly
set hlsearch	" Highlight the search
set incsearch	" Incremental search

" Backup file options
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//


" ----- Custom functions ----- "
function! CmdLine(str)
	exe "menu Foo.bar :" . a:str
	emenu Foo.bar
	unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
	let l:saved_reg = @"
	execute "normal! vgvy"

	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")

	if a:direction == 'gv'
		call CmdLine("Ag \"" . l:pattern . "\" " )
	elseif a:direction == 'replace'
		call CmdLine("%s" . '/'. l:pattern . '/')
	endif

	let @/ = l:pattern
	let @" = l:saved_reg
endfunction

" ----- Custom Settings ----- "

" Netrw file browser options
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\$\+'

" ----- Custom Commands ----- "
autocmd! bufwritepost .vimrc source ~/.vimrc " Automatically reload vimrc

" Sudo save a file without restarting vim
command W w !sudo tee % > /dev/null

" ----- Custom Hotkeys ----- "

let mapleader=","
let g:mapleader=","

" Exit mode by pressing kj really fast
inoremap kj <ESC>
cnoremap kj <ESC>
vnoremap kj <ESC>

" Tab switching
nnoremap <TAB> :bn<CR>

" Automatically clear search by pressing enter
nnoremap <CR> :noh<CR><CR>

" Navigation shortcuts
nnoremap <leader>fa :Ack<SPACE>
nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>fb :CtrlPBuffer<CR>
nnoremap <leader>fm :CtrlPMixed<CR>

" Misc hotkeys
nnoremap <leader>r :register<CR>
nnoremap <leader>vv :e ~/.vimrc<CR>

" V-mode search by pressing * or # by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" ----- Plugins ----- "

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " Required for Vundle

Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'mileszs/ack.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao-auto-pairs'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc' " Required for easy-tags
Plugin 'fholgado/minibufexpl.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

" ----- Plugin Options ----- "

" Airline
let g:airline_theme='base16'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatusLineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" EasyTags
autocmd VimEnter * silent! UpdateTags
