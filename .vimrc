" General {
	set shortmess=atI
    set nocompatible                " 关闭 vi 兼容模式
	
	set t_Co=256
	set background=dark
	set showmatch

	syntax on                   	" Syntax highlighting
    set mouse=a                 	" Automatically enable mouse usage
    set mousehide               	" Hide the mouse cursor while typing
    scriptencoding utf-8
	set history=1000                " Store a ton of history
	set spell                       " Spell checking on
    set hidden						" Allow buffer switching without saving
    set nobackup                    " 覆盖文件时不备份
    set autochdir                   " 自动切换当前目录为当前文件所在的目录
    set backupcopy=yes              " 设置备份时的行为为覆盖
    set noerrorbells " 关闭错误信息响铃
" }

" Vim UI {
	set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    "highlight clear CursorLineNr   " Remove highlight color from current line number

	set ruler                       " Show the ruler
	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
	set showcmd                 	" Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    set guioptions-=T " 隐藏工具栏
    set guioptions-=m " 隐藏菜单栏

	set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
"}

" Formatting {
    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    set smartindent                 " 开启新行时使用智能自动缩进
    set foldenable                  " 开启折叠
    set foldmethod=syntax           " 设置语法折叠
    setlocal foldlevel=1            " 设置折叠层数为
"}

"Auto Complete {
	:inoremap ( ()<ESC>i
	:inoremap ) <c-r>=ClosePair(')')<CR>
	:inoremap { {<CR>}<ESC>O
	:inoremap } <c-r>=ClosePair('}')<CR>
	:inoremap [ []<ESC>i
	:inoremap ] <c-r>=ClosePair(']')<CR>
	:inoremap " ""<ESC>i
	:inoremap ' ''<ESC>i
	function! ClosePair(char)
		if getline('.')[col('.') - 1] == a:char
			return "\<Right>"
		else
			return a:char
		endif
	endfunction	
"}

" Plugins {
    filetype plugin indent on

    " Specify a directory for plugins
    call plug#begin('~/.vim/plugged')

    "Plug 'https://github.com/vim-scripts/c.vim.git'
    Plug 'https://github.com/scrooloose/nerdtree.git'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'Lokaltog/vim-powerline'
    Plug 'flazz/vim-colorschemes'

    " Initialize plugin system
    call plug#end()

    " nerdtree
    map <F2> :NERDTreeToggle<CR>

    " cpp-enhanced-highlight
    let g:cpp_class_scope_highlight = 1
    let g:cpp_member_variable_highlight = 1
    let g:cpp_concepts_highlight = 1
    let g:cpp_experimental_simple_template_highlight = 1

    " vim-powerline
    let g:Powerline_symbols = 'fancy'
    set encoding=utf-8 
    set laststatus=2

    " vim-colorschemes
    colorscheme molokai
" }
