"输入模式快速按下jj/JJ退出输入模式
"Ctrl-j 切换到下方的分割窗
"Ctrl-k 切换到上方的分割窗口
"Ctrl-l 切换到右侧的分割窗口
"Ctrl-h 切换到左侧的分割窗口
"<F3>打开函数/变量 成员列表
"<F4>对当行一键注释，可视化模式选择文本<F2>多行注释
"<F5>一键运行c/cpp/python
"<F6>打开树形结构目录
"<F7>查看最近打开文件
"<F8>一键格式化python代码
"<F9>打开/关闭粘贴不变形
"Ctrl-j 切换到下方的分割窗口
"Ctrl-k 切换到上方的分割窗口
"Ctrl-l 切换到右侧的分割窗口
"Ctrl-h 切换到左侧的分割窗口
"{{{基础设置
nnoremap <C-K> <C-W><C-K> "Ctrl-j 切换到下方的分割窗口
nnoremap <C-J> <C-W><C-J> "Ctrl-k 切换到上方的分割窗口 
nnoremap <C-L> <C-W><C-L> "Ctrl-l 切换到右侧的分割窗口
nnoremap <C-H> <C-W><C-H> "Ctrl-h 切换到左侧的分割窗口
set pastetoggle=<F9> "<F9>打开/关闭粘贴不变形"
set clipboard=unnamed "剪切板和系统互交
set t_Co=256 "开启256色支持
set background=dark "背景使用黑色
set mouse-=a "禁用鼠标
set nu "显示行数
syntax on "打开语法高亮
inoremap JJ <Esc> "输入模式下JJ为ESC
inoremap jj <Esc> "输入模式下jj为ESC
set autoindent "新增加的行和前一行使用相同的缩进形式
set backspace=eol,start,indent "删除模式
"indent：自动缩进，想用退格键将字段缩进的删掉，必须设置这个选项。否则不响应。
"eol:如果插入模式下在行开头，想通过退格键合并两行，需要设置eol。
"start：要想删除此次插入前的输入，需设置这个
set tabstop=4 "定义tab所等同的空格长度
set shiftwidth=4 "程序中自动缩进所使用的空白长度。
set softtabstop=4 "在编辑的时候（比如按退格或 tab 键）一个 tab 是多少个空格
set expandtab "降tab转换成空格
set smarttab "根据文件中其他地方的缩进空格个数来确定一个 tab 是多少个空格
set hlsearch "搜索时高亮
set ruler "显示标尺
"set showmatch "显示括号配对情况
set incsearch "打开显示查找匹配过程
set ignorecase "搜索忽略大小写
"set undodir=~/.undodir "un~文件储存到~/.undodir目录
set showmode "在底部显示，当前处于命令模式还是插入模式
set showcmd "在底部显示，正在输入的命令
set wildmenu "tap补全/提示命令
set cursorline "高亮当行
set noundofile "禁止生成un~文件
set nobackup "禁止生成~文件
set noswapfile "禁止生成swap文件
set encoding=utf-8 "编码使用utf-8
set fdm=marker "代码折叠模式
set completeopt-=preview
"}}}
 "{{{一键编译
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec '!clang % -o %<'
        exec '!./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!./%<'
    elseif &filetype == 'python'
        exec '!python3 "%"'
    elseif &filetype == 'pyc'
        exec '!python3 "%"'
    elseif &filetype == 'java'
        exec '!javac "%"'
        exec '!java %<'
    elseif &filetype == 'javascript'
        exec '!node "%"'
    elseif &filetype == 'sh'
        exec '!sh "%"'
    endif
endfunc!
"}}}
"{{{插件
filetype plugin indent on
set nocompatible "关闭兼容模式
 "设置运行时路径，包括vundle和初始化
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"{{{vim主题
Plugin 'gosukiwi/vim-atom-dark'
colorscheme atom-dark-256
"}}}
"{{{状态栏主题
Plugin 'Lokaltog/vim-powerline'      "状态栏主题
let g:Powerline_colorscheme='solarized256'   "设置状态栏主题风格
set laststatus=2
"}}}
"{{{缩进线
Plugin 'Yggdroot/indentLine'
let g:indentLine_char='|'                   "缩进指示线符
let g:indentLine_enabled = 1             "开启缩进指示
"}}}
"{{{括号补全
Plugin 'jiangmiao/auto-pairs'
" 增加补全规则
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"} 
"}}}  
"{{{彩色括号
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
"}}}
"{{{格式化python代码
Plugin 'tell-k/vim-autopep8'
let g:autopep8_disable_show_diff=1
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR> "F8一键格式化python代码
"}}} 
"{{{ 一键注释
Plugin 'scrooloose/nerdcommenter'
map <F4> <leader>ci <CR> "可视化模式选择文本f4增加/取消注释"
"}}} 
"{{{文件树
Plugin 'scrooloose/nerdtree'
"<F6>打开文件树形结构列表
nmap <F6> :NERDTreeToggle<CR>
"}}} 
"{{{ 成员列表
Plugin 'majutsushi/tagbar'
"f3打开函数列表
nmap <F3> :TagbarToggle<CR>
""设置窗口宽度
let g:tagbar_width=30
"在右侧窗口中显示
let g:tagbar_right=1
""选择后自动关闭
let g:tagbar_autoclose=1
"}}}
"{{{ 最近打开的文件
Plugin 'vim-scripts/mru.vim'
noremap <F7> :MRU <CR>
"}}}
"{{{语法检测
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
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
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
let g:ale_python_flake8_options = "--max-line-length=1000"
"}}}
"{{{自动补全
Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
"}}}
Plugin 'Yggdroot/LeaderF'
call vundle#end()
"}}}
