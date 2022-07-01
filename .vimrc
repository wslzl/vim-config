" General {
    set shortmess=atI
    set nocompatible                " 关闭 vi 兼容模式
    set t_Co=256
    syntax  enable
    syntax on
    set background=dark
    set showmatch

    set mouse=a                     " Automatically enable mouse usage
    set mousehide                   " Hide the mouse cursor while typing
    scriptencoding utf-8
    set history=1024                " Store a ton of history
    set spell                       " Spell checking on
    set hidden                      " Allow buffer switching without saving
    set nobackup                    " 覆盖文件时不备份
    set autochdir                   " 自动切换当前目录为当前文件所在的目录
    set backupcopy=yes              " 设置备份时的行为为覆盖
    set noerrorbells                " 关闭错误信息响铃
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
    set showcmd                     " Show partial commands in status line and
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

" encoding {
    set encoding=utf-8
" }

"Auto Complete {
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set completeopt-=preview

    :inoremap ( ()<ESC>i
    :inoremap ) <c-r>=ClosePair(')')<CR>
    :inoremap [ []<ESC>i
    :inoremap ] <c-r>=ClosePair(']')<CR>
    :inoremap { {<CR>}<ESC>O
    :inoremap } <c-r>=ClosePair('}')<CR>
    :inoremap ' ''<ESC>i
    :inoremap " ""<ESC>i
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
    Plug 'preservim/nerdtree'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'Lokaltog/vim-powerline'
    Plug 'flazz/vim-colorschemes'
    Plug 'google/vim-codefmt'
    Plug 'google/vim-maktaba'
    Plug 'pboettch/vim-cmake-syntax'
    Plug 'ycm-core/YouCompleteMe'

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

    " vim-codefmt
    map <F3> :FormatCode<CR>

    " YouCompleteMe
    set runtimepath+=~/.vim/plugged/YouCompleteMe
    let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
    let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
    let g:syntastic_ignore_files=[".*\.py$"]
    let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
    let g:ycm_complete_in_comments = 1
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
    let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
    let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
    let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
    let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
    let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
    let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |            " 回车即选中当前项
    nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|     " 跳转到定义处
    "let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项
" }
