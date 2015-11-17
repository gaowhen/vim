" ==========================================================
"
" maintain by Miko gaowhen.com@gmail.com
"
" ==========================================================

" set the runtime path to include Vundle and initialize
" be iMproved, required
set nocompatible
" required
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" other plugins
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'undofile.vim'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'msanders/snipmate.vim'
Plugin 'skammer/vim-css-color'
Plugin 'suan/vim-instant-markdown'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'walm/jshint.vim'
Plugin 'wavded/vim-stylus'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-scripts/mako.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Chiel92/vim-autoformat'
Plugin 'ternjs/tern_for_vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'Yggdroot/indentLine'
call vundle#end()
filetype plugin indent on

" ====================
" Enviroment
" ====================

" lang
set helplang=cn

" reserve history
set history=500


" =====================
"    CHARCODE
" =====================

if has("multi_byte")
  set encoding=utf-8
  " English messages only
  "language messages zh_CN.utf-8
  if has('win32')
    language english
    let &termencoding=&encoding " 处理consle输出乱码
  endif
  set fencs=utf-8,gbk,chinese,latin1
  set formatoptions+=mM
  set nobomb " 不使用 Unicode 签名
  if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
  endif
else
  echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif


" ====================
" UI
" ====================

if has('gui_running')
  set guioptions-=m
  set guioptions-=T
  map <silent> <F3> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
        \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
        \endif<CR>
  if has('gui_macvim')
    set guioptions+=e
  endif
  if has("win32")
    " Windows 兼容配置
    source $VIMRUNTIME/mswin.vim
    " F11 最大化
    map <f11> :call libcallnr('fullscreen.dll', 'ToggleFullScreen', 0)<cr>
    " 字体配置
    set guifont=Anonymous_Pro:h16
  endif
  if has("unix") && !has('gui_macvim')
    set guifont=Anonymous\ Pro:h18
  endif
  if has("mac") || has("gui_macvim")
    if has("gui_macvim")
      " 启动后自动全屏
      "set fullscreen
      " trick vim 窗口最大化
      set lines=100 columns=400
      "macvim 自有属性，全屏模式下自动最大化
      set fuoptions=maxvert,maxhorz
      " 开启抗锯齿渲染
      set anti
      " MacVim 下的字体配置
      set guifont=Anonymous\ Pro:h20
      "set guifont=monaco:h13
      set transparency=0
      set lines=222 columns=222
      " 使用 MacVim 原生的全屏幕功能
      let s:lines=&lines
      let s:columns=&columns
      func! FullScreenEnter()
        set lines=999 columns=999
        set fu
      endf
      func! FullScreenLeave()
        let &lines=s:lines
        let &columns=s:columns
        set nofu
      endf
      func! FullScreenToggle()
        if &fullscreen
          call FullScreenLeave()
        else
          call FullScreenEnter()
        endif
      endf
    endif
  endif
endif

set ruler " show rulerset number " show line number
set rulerformat=%15(%c%V\ %p%%%)

" 状态栏显示目前所执行的指令
set showcmd

" 因为设定为不换行，所以要显示底部滚动条，不显示左右滚动条和工具栏
set guioptions-=b " 不显示底部的水平滚动条
set guioptions-=r " 隐藏右侧垂直滚动条
set guioptions-=l " 隐藏左侧垂直滚动条
set guioptions-=T " 不显示工具栏
set guioptions-=L " 不显示垂直分割窗口左侧的垂直滚动条


" =====================
" 主题配色
" =====================

if has('syntax')
  " 保证语法高亮
  syntax on
  if has('gui_running')
    "colorscheme yytextmate
    "let g:colors_name="yytextmate"
    colorscheme solarized
    let g:colors_name="solarized"
    set background=dark
  endif
endif

"Highlight current
if has("gui_running")
  set cursorline
  set cursorcolumn
  hi cursorline guibg=#0D142C
  hi CursorColumn guibg=#0D142C
else
  " fold colors
  hi Folded cterm=none ctermbg=none ctermfg=4
  hi FoldColumn cterm=none ctermbg=none ctermfg=4
endif

"
set showmatch
set matchtime=5
hi MatchParen ctermfg=green

" ====================
" GLOBAL CONFIG
" ====================
"
" The 'autoindent' option is reset when the 'paste' option is set
" when having set paste in vimrc file, set paste must exist firstly.
set paste

" 使用空格来替换tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab

" 自动设置 tab 宽度
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 textwidth=79
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType jade setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

filetype plugin indent on
set autoindent
set smartindent

" 自动重新读入
set autoread " 当文件在外部被修改，自动更新该文件
" 设定在任何模式下鼠标都可用
" set mouse
" 插入模式下使用 <BS>、<Del> <C-W> <C-U>
set backspace=indent,eol,start

" 代码折叠
set foldmethod=indent
" 保存文件的折叠状态
au BufWinLeave * silent mkview
" 恢复文件的折叠状态
au BufRead * silent loadview
set nowrap

" 带有如下符号的单词不要被换行分割
" set iskeyword+=_,$,@,%,#,- " 显示tab和空格
set nolist

" indent
let g:indentLine_char = '︙'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'


" 搜索时无视大小写
" set ignorecase
set smartcase
" 高亮显示结果
set hlsearch
" 在输入要搜索的文字时，vim会实时匹配
set incsearch


"cliboard seting
set clipboard+=unnamed " set clipboard

" 重启后撤销历史可用 persistent undo
" Set hidden to undo buffer
set hidden
set undofile
set undolevels=1000
set undodir=~/.undodir
au BufWritePre ~/.undodir/* setlocal noundofile


" 控制台响铃
set noerrorbells
" close visual bell
set novisualbell
set vb t_vb=

" 设置相对行号
"set nu
set rnu

" =====================
" AutoCmd 自动运行
" =====================

filetype plugin indent on " 打开文件类型检测

if has("autocmd")
  augroup vimrcEx " 记住上次文件位置
    au!
    autocmd FileType text setlocal textwidth=80
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
  augroup END

  " JavaScript 语法高亮
  au FileType html,javascript let g:javascript_enable_domhtmlcss = 1
  au BufRead,BufNewFile *.js setf jquery
  " 给各语言文件添加 Dict
	au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
	au FileType css setlocal dict+=~/.vim/dict/css.dict
	au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict

  " CSS3 语法支持
  au BufRead,BufNewFile *.css set ft=css syntax=css3
  " 将指定文件的换行符转换成 UNIX 格式
  au FileType php,javascript,html,css,python,vim,vimwiki set ff=unix
  " auto switch to current file path
  " autocmd BufRead * :lcd! %:p:h
  " jade syntax
  au BufRead,BufNewFile *.jade set filetype=jade
  " compile coffeescript on write
  au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!
endif

" 自动载入VIM配置文件
autocmd! bufwritepost vimrc source $MYVIMRC

" 关闭VIM的时候保存会话，按 F5 读取会话
set sessionoptions=buffers,sesdir,help,tabpages,winsize
au VimLeave * mks! ~/Session.vim
nmap <F5> :so ~/Session.vim<CR>

" auto remove trailing whitespace
autocmd BufWritePre * StripWhitespace


" =====================
" HOT KEYS
" =====================

"设置','为leader快捷键
let mapleader = ","
let g:mapleader = ","

"设置快速保存和退出
"快速保存为,s
"快速退出（保存）为,w
"快速退出（不保存）为,q
nmap <leader>s :w!<cr>
nmap <leader>w :wq!<cr>
nmap <leader>q :q!<cr>
nmap <C-t>   :tabnew<cr>
nmap <C-n>   :tabnext<cr>
nmap <C-k>   :tabclose<cr>
nmap <C-Tab> :tabnext<cr>


" 按下 Q 不进入 Ex 模式，而是退出
nmap q :x<cr>

" 快速重载入 vimrc
nmap <leader>s : source ~/.vim/vimrc <CR>
" 快速编辑 vimrc
nmap <leader>e : e ~/.vim/vimrc <CR>
map <silent> <leader>rc :tabe ~/.vim/vimrc<cr>

" 选中一段文字并全文搜索这段文字
vnoremap  *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap  #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

if has("gui_macvim")
  " Set input method off
  set imdisable
  " 如果为空文件，则自动设置当前目录为桌面
  lcd ~/Desktop/
endif

" 可视化模式下使用 tab 和 shift-tab 缩进
nmap <tab>      v>
nmap <s-tab>    v<
vmap <tab>      >gv
vmap <s-tab>    <gv


" =====================
" PLUGIN CONFIG
" =====================

" Use spacebar toggle fold
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" NERDTree
map td :NERDTreeToggle <CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 显示 NERDTree Bookmark
let NERDTreeShowBookmarks=1
" 当不带参数打开Vim时自动加载项目树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" 设置 burexploer 快捷键
nmap <C-e> :BufExplorer<cr>
nmap <f2>  :BufExplorer<cr>


" =====================
" PLUGIN MANAGMENT
" =====================
"
set wildmenu
set wildmode=longest:full,full

" status bar
set laststatus=2
"set statusline=%t\ %1*%m%*\ %1*%r%*\ %1*%h%*\ %1*%w%*%=\ [%{VimBuddy()}]\ [%Y:%{toupper(&ff)}:%{toupper(&fenc!=''?&fenc:&enc)}]\ [ASCII:%b]\ [%l%2*/%L(%p%%)%*,%v]

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" ctrlfs
nnoremap <F3> :CtrlSF<space>
"nmap <F3> <ESC>:CtrlSF <c-r><c-w><CR>
nmap <C-F3> <ESC>:CtrlSFOpen<CR>

augroup vimrc_autocmds
  autocmd!
  " highlight characters past column 120
  autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
  autocmd FileType python match Excess /\%120v.*/
  autocmd FileType python set nowrap
  augroup END

" vim airline
let g:airline_section_a = airline#section#create(['mode', ' ', 'brnach'])
let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%f'])
let g:airline_section_c = airline#section#create(['filetype'])
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_inactive_collapse=1

" tern for ivm
" 鼠标停留在方法内时显示参数提示
let g:tern_show_argument_hints = 'on_hold'
" 补全时显示函数类型定义
let g:tern_show_signature_in_pum = 1
" 跳转到浏览器
nnoremap <leader>tb :TernDocBrowse<cr>
" 显示变量定义
nnoremap <leader>tt :TernType<cr>
" 跳转到定义处
nnoremap <leader>tf :TernDef<cr>
" 显示文档
nnoremap <leader>td :TernDoc<cr>
" 预览窗口显示定义处代码
nnoremap <leader>tp :TernDefPreview<cr>
" 变量重命名
nnoremap <leader>tr :TernRename<cr>
" location 列表显示全部引用行
nnoremap <leader>ts :TernRefs<cr>
