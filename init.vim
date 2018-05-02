nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <F4> :bp<bar>sp<bar>bn<bar>bd<CR>.

" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <C-W><C-D> :BD<CR>

set autoindent

set hidden

syntax on

set wrap

"autocmd FileType matlab setlocal keywordprg=info\ octave\ --vi-keys\ --index-search
 autocmd FileType octave setlocal keywordprg=uxterm\ -e\ info\ octave\ --vi-keys\ --index-search

" Octave syntax 
augroup filetypedetect 
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave 
  augroup END 

" Use keywords from Octave syntax language file for autocomplete 
if has("autocmd") && exists("+omnifunc") 
   autocmd Filetype octave 
   \ if &omnifunc == "" | 
   \ setlocal omnifunc=syntaxcomplete#Complete | 
   \ endif 
endif 

" set shortcuts for vimdiff
if &diff
	set cursorline
	map ] ]c
	map [ [c
	hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
	hi DiffChange ctermbg=white  guibg=#ececec gui=none   cterm=none
	hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
endif

set expandtab
set shiftwidth=4
set softtabstop=4

set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Specify a directory for plugins
" - For vim: ~/.vim/plugged
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-fugitive'

call plug#end()

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
map <C-o> :NERDTreeToggle<CR>
