set spell spelllang=en

call plug#begin('~/.local/share/nvim/plugged')

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
filetype plugin on
Plug 'scrooloose/nerdtree'
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction
Plug 'soli/prolog-vim'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex'}
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'mxw/vim-prolog'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-perl/vim-perl'
Plug 'c9s/perlomni.vim'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'coot/atp_vim'
let g:deoplete#enable_at_startup = 1
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = 'usr/local/bin/python3'
call plug#end()
colorscheme Tomorrow-Night-Eighties  
syntax on 
filetype on
filetype plugin on
filetype indent on

function! LooksLikePerl6 ()
  if getline(1) =~# '^#!.*/bin/.*perl6'
    set filetype=perl6
  else
    for i in [1,2,3,4,5]
      if getline(i) == 'use v5.16;'
        set filetype=perl6
        break
      endif
    endfor
  endif
endfunction

au bufRead *.pm,*.t,*.pl call LooksLikePerl6()
