syn on                      "语法支持

"common conf {{             通用配置
set autoindent              " indent at the same level of the previous line
set ai                      "自动缩进
set bs=2                    "在insert模式下用退格键删除
set laststatus=2            "总是显示状态行
set expandtab               "以下三个配置配合使用，设置tab和缩进空格数
set shiftwidth=2
set tabstop=2
"set cursorline              "为光标所在行加下划线
set number                  "显示行号
set autoread                "文件在Vim之外修改过，自动重新读入

"use sane regx"
set gdefault					" the /g flag on :s substitutions by default
nnoremap / /\v
vnoremap / /\v

"search with ease
set gdefault "all matches in a line a subsituted instead of one.
set showmatch					" show matching brackets/parenthesis
set incsearch					" find as you type search
set hlsearch					" highlight search terms
set magic
set ignorecase					" case insensitive search
set smartcase					" case sensitive when uc present

set fileencodings=uft-8,gbk "使用utf-8或gbk打开文件
set hls                     "检索时高亮显示匹配项
set helplang=cn             "帮助系统设置为中文
set foldmethod=indent       "代码折叠 共有6中方式如下
"1. manual //手工定义折叠
"2. indent //用缩进表示折叠
"3. expr　 //用表达式来定义折叠
"4. syntax //用语法高亮来定义折叠
"5. diff   //对没有更改的文本进行折叠
"6. marker //用标志折叠

set langmenu=en_US.UTF-8
language message en_US.UTF-8
set encoding=utf8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"}}

"设置mapleader前缀
let mapleader = ','

"状态栏的配置 
"powerline{
    set guifont=PowerlineSymbols\ for\ Powerline
    set nocompatible
    set t_Co=256
    let g:Powerline_symbols = 'fancy'
"}

"pathogen是Vim用来管理插件的插件
"pathogen{
call pathogen#infect()
"}

"taglist{
    let Tlist_Show_One_File = 1
    "只显示当前文件的taglist，默认是显示多个
    let Tlist_Exit_OnlyWindow = 1
    "如果taglist是最后一个窗口，则退出vim
    let Tlist_Use_Right_Window = 1         
    "在右侧窗口中显示taglist
    let Tlist_GainFocus_On_ToggleOpen = 1
    "打开taglist时，光标保留在taglist窗口
    "let Tlist_Ctags_Cmd='/usr/bin/ctags'
    "设置ctags命令的位置
    "nnoremap <leader>tl : Tlist<CR>
    "设置关闭和打开taglist窗口的快捷键
"}
"

"清空搜索结果高亮
nmap <silent> <leader>/ :nohlsearch<CR>

runtime macros/matchit.vim
map <tab> %

set matchtime=3 "Tenths of a second to show a matching pattern
set showbreak=↪ " show break when the line is wraped.

"保持搜索结果在屏幕中央位置
nnoremap n nzzzv
nnoremap N Nzzzv

" Don't move on *
nnoremap * *<c-o>

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

"屏幕中子窗口更改大小
nnoremap <c-left> 5<c-w>>
nnoremap <c-right> 5<c-w><

"在屏幕中各子窗口之间切换
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"在标签页和buffer之间切换
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprev<cr>
nnoremap tn :tabnext<cr>
nnoremap tp :tabprev<cr>
nnoremap tt :tabnew<cr>

"使用快捷键打开或关闭插件窗口
nmap <silent> <F3> :NERDTreeToggle <CR>
nmap <silent> <F4> :TlistToggle <CR>

let NERDTreeKeepTreeInNewTab=1

"自定义快捷扫描ctags命令
command Ctags !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
