"输入模式快速按下jj/JJ退出输入模式
"Ctrl-j 切换到下方的分割窗
"Ctrl-k 切换到上方的分割窗口
"Ctrl-l 切换到右侧的分割窗口
"Ctrl-h 切换到左侧的分割窗口
"<F3>打开函数/变量 成员列表
"<F4>对当行一键注释，可视化模式选择文本<F2>多行注释
"<F5>一键运行c/cpp/python
"<F6>查看最近打开文件
"<F7>打开树形结构目录
"<F8>一键格式化python代码
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Ctrl-j 切换到下方的分割窗口
"Ctrl-k 切换到上方的分割窗口
"Ctrl-l 切换到右侧的分割窗口
"Ctrl-h 切换到左侧的分割窗口
set clipboard=unnamed
set t_Co=256'
set background=dark
filetype plugin on
set mouse-=a
syntax enable
set nu
syntax on
inoremap JJ <Esc>
inoremap jj <Esc> "jj为ESC
set autoindent
set backspace=eol,start,indent
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set cindent
set background=dark
set hlsearch
set ruler
set showmatch
set incsearch
set ignorecase
set nobackup
set showmode
set wildmenu
set cursorline"高亮当行
set undofile
set nobackup
set noswapfile
set encoding=utf-8
set fdm=marker
set clipboard=unnamed 
"f5一键编译
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec '!clang % -o %<'
        exec '!./%<'
    elseif &filetype == 'cpp'
        exec '!clang++ % -o %<'
        exec '!./%<'
    elseif &filetype == 'python'
        exec '!python %'
    endif
endfunc!


set nocompatible "关闭兼容模式
 "设置运行时路径，包括vundle和初始化
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/vim-powerline'      "状态栏主题
let g:Powerline_colorscheme='solarized256'   "设置状态栏主题风格"
Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
Plugin 'Yggdroot/indentLine'
let g:indentLine_char='|'                   "缩进指示线符
let g:indentLine_enabled = 1             "开启缩进指示"
Plugin 'w0rp/ale'
"异步语法检查"
set fenc=
let g:ale_set_highlights = 0
"自定义error和warning图标
"let g:ale_sign_error = '✗'
"let g:ale_sign_warning = '⚡'
""在vim自带的状态栏中整合ale
"let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK'    ]
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
""打开文件时不进行检查
let g:ale_lint_on_enter = 0

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告"
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
""<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
""使用clang对c和c++进行语法检查，对python使用flake8进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['flake8'],
\}
let g:ale_python_flake8_options = "--max-line-length=1000""
Plugin 'jiangmiao/auto-pairs'
" 增加补全规则1：逗号后补全空格。例如，输入：','，输出：', '
Plugin 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
Plugin 'tell-k/vim-autopep8'
let g:autopep8_disable_show_diff=1
Plugin 'scrooloose/nerdcommenter'
"Plugin 'Yggdroot/LeaderF'
Plugin 'scrooloose/nerdtree'
"f7打开文件树形结构列表
nmap <F7> :NERDTreeToggle<CR>
Plugin 'majutsushi/tagbar'
"f3打开函数列表
nmap <F3> :TagbarToggle<CR>
""设置窗口宽度
let g:tagbar_width=30
"在右侧窗口中显示
let g:tagbar_right=1
""选择后自动关闭
let g:tagbar_autoclose=1
Plugin 'vim-scripts/mru.vim'
call vundle#end()
filetype plugin indent on     " required!
let g:ycm_disable_signature_help = 1
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR> "F8一键格式化python代码
map <F4> <leader>ci <CR> "可视化模式选择文本f4增加/取消注释"
noremap <F6> :MRU <CR>
"colorscheme atom-dark-256
colorscheme atom-dark-256
