" Set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set diffopt+=vertical

" Disabling arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" list and goto buffer
" nnoremap <F5> :buffers<CR>:buffer<Space>
" nnoremap <F4> :bp<bar>sp<bar>bn<bar>bd<CR>.

" emulate copy to clipboard
vnoremap <C-c> "+y
nnoremap <C-c> "+yy

" search and replace visual selection
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" move among buffers with CTRL
nnoremap <C-J> :bnext<CR>
nnoremap <C-K> :bprev<CR>
nnoremap <C-W><C-D> :BD<CR>
nnoremap <C-Space> :e#<CR>

noremap <A-p> :bnext<CR>
nnoremap <A-b> :bprev<CR>
nnoremap <A-d> :BD<CR>
nnoremap <A-t> :e#<CR>

" remap navigation keys to consider virtual lines rather than real ones
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" use bigger steps for j and k
nmap <A-j> 5j
nmap <A-k> 5k
xmap <A-j> 5j
xmap <A-k> 5k

" bépo . instead of k
nmap . k
xmap . k
nmap <A-.> 5k
xmap <A-.> 5k

" use bigger steps for j and k
nmap <A-h> b
nmap <A-l> w
xmap <A-h> b
xmap <A-l> w

" map return key to esc for speed
inoremap <CR> <Esc>
inoremap <A-CR> <CR>
vnoremap <CR> <Esc>

" bépo esc
" inoremap è <Esc>
" vnoremap è <Esc>

" bépo w
nnoremap é w
xnoremap é w

" map backspace to the opposite of J
nnoremap <BS> i<CR>

" quicksave with F2
nnoremap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
inoremap <F2> <ESC>:w<CR>
" remove trailing whitspaces on save
autocmd BufWritePre * :%s/\s\+$//e

" save and restore folds
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

" sane defaults
set autoindent
set hidden
set nu
set wrap
set list
syntax on

" Enable mouse if possible
" if has('mouse')
"     set mouse=a
" endif

" set highlight search but possibility to escape it as well
set hlsearch
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" set shortcuts for vimdiff
if &diff
    set cursorline
    map ] ]c
    map [ [c
    hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
    hi DiffChange ctermbg=white  guibg=#ececec gui=none   cterm=none
    hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
endif

" set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
" set t_Co=256

" Specify a directory for plugins
" - For vim: ~/.vim/plugged
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'scrooloose/nerdtree' " file explorer
    Plug 'qpkorr/vim-bufkill' " keep unsaved buffers
    Plug 'tpope/vim-fugitive' " git plugin
    Plug 'fatih/vim-go'
    Plug 'maralla/completor.vim' " or whichever you use
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete

    Plug 'zchee/deoplete-go', {'build': {'unix': 'make'}} " autocomplete for go
    Plug 'jodosha/vim-godebug' " Debugger integration via delve
    Plug 'sebdah/vim-delve'

    Plug 'w0rp/ale' "linter
    Plug 'psf/black'

    Plug 'flazz/vim-colorschemes'

    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'

    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'nvie/vim-flake8'
    Plug 'sudar/vim-arduino-snippets'

    Plug 'guns/vim-clojure-static'
    Plug 'tpope/vim-fireplace'
    Plug 'tpope/vim-classpath'

    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/goyo.vim'

    Plug 'tikhomirov/vim-glsl'

    Plug 'rust-lang/rust.vim'

    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'

    Plug 'posva/vim-vue'
    call plug#end()
endif
"
"----------------------------------------------
" Plugin: overtone
"----------------------------------------------
inoremap <F3> <ESC>:w<CR>:Eval<CR>
nnoremap <F3> :w<CR>:Eval<CR>
vnoremap <F3> :'<,'>Eval<CR>:w<CR>

"----------------------------------------------
" Plugin: vim-airline/vim-airline
"----------------------------------------------
" Show status bar by default.
set laststatus=2
" Enable top tabline.
let g:airline#extensions#tabline#enabled = 1
" Disable showing tabs in the tabline. This will ensure that the buffers are
" what is shown in the tabline at all times.
let g:airline#extensions#tabline#show_tabs = 0
"" airline conf
let g:airline_powerline_fonts = 1
" or use : AirlineTheme ravenpower
let g:airline_theme = 'dark_minimal'

"----------------------------------------------
" Plugin: scrooloose/nerdtree
"----------------------------------------------
nnoremap <C-o> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Files to ignore
let NERDTreeIgnore = [
    \ '\~$',
    \ '\.pyc$',
    \ '^\.DS_Store$',
    \ '^node_modules$',
    \ '^.ropeproject$',
    \ '^__pycache__$'
\]

" Close vim if NERDTree is the only opened window.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Show hidden files by default.
let NERDTreeShowHidden = 1

"----------------------------------------------
" Plugin: sebdah/vim-delve
"----------------------------------------------
" Set the Delve backend.
let g:delve_backend = "native"

"----------------------------------------------
" Plugin: w0rp/ale
"----------------------------------------------
" Error and warning signs.
let g:ale_sign_error = '●'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

"----------------------------------------------
" Plugin: Shougo/deoplete.nvim
"----------------------------------------------
if has('nvim')
    " Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
endif

" Disable deoplete when in multi cursor mode
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

"----------------------------------------------
" Plugin: flazz/vim-colorschemes
"----------------------------------------------
" let g:solarized_termcolors=256
" colorscheme af
" colorscheme darkdot
" colorscheme carvedwood
colorscheme birds-of-paradise
hi Normal ctermbg=none
" Highlight line 80
hi ColorColumn ctermbg=black guibg=grey
set colorcolumn=80

"----------------------------------------------
" Plugin: 'junegunn/fzf.vim'
"----------------------------------------------
nnoremap <c-p> :FZF<cr>
nnoremap <c-f> :Lines<cr>
nnoremap <a-r> :History:<cr>
nnoremap <a-o> :History<cr>
" browse ctags based on word under cursor
nnoremap <S-R> :Tags <C-R><C-W><CR>

"----------------------------------------------
" Plugin: plasticboy/vim-markdown
"----------------------------------------------
" Disable folding
let g:vim_markdown_folding_disabled = 1

" Auto shrink the TOC, so that it won't take up 50% of the screen
let g:vim_markdown_toc_autofit = 1

"----------------------------------------------
" Plugin: SirVer/ultisnips
"----------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-²>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"----------------------------------------------
" Plugin: nvie/vim-flake8
"----------------------------------------------
let g:flake8_error_marker='⚠'     " set error marker to 'EE'
let g:flake8_warning_marker='⚠'   " set warning marker to 'WW'
let g:flake8_pyflake_marker=''     " disable PyFlakes warnings
let g:flake8_complexity_marker=''  " disable McCabe complexity warnings
let g:flake8_naming_marker=''      " disable naming warnings

"----------------------------------------------
" Plugin: junegunn/limelight.vim
"----------------------------------------------
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Goyo integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"----------------------------------------------
" Plugin: prabirshrestha/vim-lsp
"----------------------------------------------
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
    " let g:ale_linters = {'rust': ['rls']}
endif

"----------------------------------------------
" Language: Default
"----------------------------------------------
set expandtab
set shiftwidth =4
set softtabstop =4

"----------------------------------------------
" Language: Glsl
"----------------------------------------------
" autocmd BufNewFile,BufReadPost *.glsl set filetype=c
" au BufNewFile,BufReadPost *.glsl ALEDisable
au FileType glsl set expandtab
au FileType glsl set shiftwidth=2
au FileType glsl set softtabstop=2
au FileType glsl set tabstop=2

"----------------------------------------------
" Language: Arduino
"----------------------------------------------
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
au FileType cpp nmap <F5> :make<Space>upload<CR>

"----------------------------------------------
" Language: Golang
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" vim-go conf
let g:go_fmt_command                 = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types       = 1
let g:go_highlight_fields            = 1
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_operators         = 1
let g:go_highlight_structs           = 1
let g:go_highlight_types             = 1
let g:go_auto_sameids                = 1
let g:go_auto_type_info              = 1

" Go to definition
au FileType go nmap <F10> <Plug>(go-def)
" Save, and switch to GoDebug
au FileType go nmap <F5> :w \| :GoDebug<CR> \| :wincmd h \| :startinsert<CR>
au FileType go nmap <F4> :GoToggleBreakpoint<CR>
au FileType go nmap <F6> <Plug>(go-def-split)
au FileType go nmap <F7> <Plug>(go-doc)

"----------------------------------------------
" Language: Bash
"----------------------------------------------
au FileType sh set noexpandtab
au FileType sh set shiftwidth=2
au FileType sh set softtabstop=2
au FileType sh set tabstop=2

"----------------------------------------------
" Language: fish
"----------------------------------------------
au FileType fish set expandtab
au FileType fish set shiftwidth=2
au FileType fish set softtabstop=2
au FileType fish set tabstop=2

"----------------------------------------------
" Language: CSS
"----------------------------------------------
au FileType css set expandtab
au FileType css set shiftwidth=2
au FileType css set softtabstop=2
au FileType css set tabstop=2

"----------------------------------------------
" Language: HTML
"----------------------------------------------
au FileType html set expandtab
au FileType html set shiftwidth=2
au FileType html set softtabstop=2
au FileType html set tabstop=2

"----------------------------------------------
" Language: JavaScript
"----------------------------------------------
au FileType javascript set expandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

"----------------------------------------------
" Language: JSON
"----------------------------------------------
au FileType json set expandtab
au FileType json set shiftwidth=2
au FileType json set softtabstop=2
au FileType json set tabstop=2

"----------------------------------------------
" Language: Markdown
"----------------------------------------------
" au FileType markdown setlocal spell
au FileType markdown set expandtab
au FileType markdown set shiftwidth=4
au FileType markdown set softtabstop=4
au FileType markdown set tabstop=4

"----------------------------------------------
" Language: Python
"----------------------------------------------
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4
au FileType python nnoremap <F2> :Black<CR>:w<CR>
au FileType python inoremap <F2> <ESC>:Black<CR>:w<CR>

"----------------------------------------------
" Language: C++
"----------------------------------------------
au FileType cpp set smartindent
au FileType cpp set expandtab
au FileType cpp set shiftwidth=2
au FileType cpp set softtabstop=2
au FileType cpp set tabstop=2
au FileType cpp set showmatch
" intelligent comments
au FileType cpp set comments=sl:/*,mb:\ *,elx:\ */
" switch between header/source with F4
au FileType cpp map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" goto definition with F12
au FileType cpp map <F12> <C-]>


"----------------------------------------------
" Language: YAML
"----------------------------------------------
au FileType yaml set expandtab
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2


"----------------------------------------------
" Language: Octave
"----------------------------------------------
" autocmd FileType matlab setlocal keywordprg=info\ octave\ --vi-keys\ --index-search
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

"----------------------------------------------
" Language: Rust
"----------------------------------------------
let b:ale_linters = {'rust': ['rls','cargo','rustc']}
let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_completion_enabled = 1
let g:rustfmt_emit_files = 1

au FileType rust nmap <F5> :w \| :Cargo run<CR>
