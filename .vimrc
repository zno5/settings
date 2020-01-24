set nocp
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Raimondi/delimitMate'
Plugin 'mhinz/vim-startify'

call vundle#end()            " required
filetype plugin indent on    " required

syn on
colorscheme torte
set nu
set showmatch
set cindent
set smartindent
set ai
set sw=4    " auto indent size. >> or <<
set softtabstop=4    " n-spaces is one tab size
set ts=4        " tab key size
set expandtab
set colorcolumn=81
set hlsearch
set incsearch
set cursorline
hi cursorline guibg=Grey15
set mouse=a
set laststatus=2

if has('win32')
    set clipboard=unnamed
elseif has('macunix')
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif


" 이 옵션은 버퍼를 수정한 직후 버퍼를 감춰지도록 한다.
" 이 방법으로 버퍼를 사용하려면 거의 필수다.
set hidden

set fencs=utf-8,utf-16le,cp949
set fileencoding=utf-8
set enc=utf-8
set ff=unix


let g:airline_theme='simple'

if has('gui_running')
    " https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Meslo/S
    set guifont=MesloLGS\ Nerd\ Font\ Mono:h14

    "set guifont=Menlo\ Regular:h20

    " for korean font... but doesn't work. because powerline font option enabled
    "set guifontwide=Apple\ SD\ Gothic\ Neo\ Regular:h20
    "set guifontwide=AppleSDGothicNeo-Light:h40
    "set guifontwide=Nanum\ Gothic:h20

    let g:airline_powerline_fonts=1
else
    let g:airline_symbols_ascii = 1
endif

" 버퍼 목록 켜기
let g:airline#extensions#tabline#enabled = 1

" 버퍼 번호 보여주기
let g:airline#extensions#tabline#buffer_nr_show = 1

" 파일명만 출력
let g:airline#extensions#tabline#fnamemod = ':t'

" 라인 끝이 공백으로 끝나는지 알려줌
let g:better_whitespace_enabled=1

" delimitMate
let delimitMate_expand_cr=1

" 다음 버퍼로 이동
nmap <leader>l :bnext<CR>

" 이전 버퍼로 이동
nmap <leader>h :bprevious<CR>

" 현재 버퍼를 닫고 이전 버퍼로 이동
" 탭 닫기 단축키를 대체한다.
nmap <leader>bq :bp <BAR> bd #<CR>

vnoremap // y/<C-R>"<CR>

" 라인 끝 공백 보이기
nnoremap <F12>     :ToggleWhitespace<CR>

" 라인 끝 공백 지우기 shift + f12
nnoremap <S-F12>   :StripWhitespace<CR>
