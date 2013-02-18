syn on                      "语法支持

set autoindent              "设置自动缩进
set ai                      "自动缩进
set bs=2                    "在insert模式下用退格键删除
set laststatus=2            "总是显示状态行
set expandtab     "是否在缩进和遇到 Tab 键时使用空格替代；使用 noexpandtab 取消设置
autocmd FileType make setlocal noexpandtab "Makefile中允许使用tab
set tabstop=8               "制表符的宽度，参考ceph
"set shiftwidth=2            "缩进的空格数，参考ceph 这个配置会影响折叠的展开，所以暂时屏蔽
set softtabstop=8 "软制表符宽度，设置为非零数值后使用 Tab 键和 Backspace 时光标移动的格数等于该数值，但实际插入的字符仍受 tabstop 和 expandtab 控制
set number                  "显示行号
set autoread                "文件在Vim之外修改过，自动重新读入
set showbreak=↪             "显示换行符
set backspace=indent,eol,start "允许任意地方使用backspace键
set completeopt=longest,menuone,preview "更好的insert模式自动完成

set hidden 		"switching buffers without saving
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" show enhanced completion 
set wildmode=list:longest "together with wildmenu
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files
set visualbell		"flash screen when bell rings
set cursorline		"highline cursor line
set ttyfast		"indicate faster terminal connection
set laststatus=2	"always show status line
set cpoptions+=J
set lbr			" break the line by words
set scrolloff=3		" show at least 3 lines around the current cursor position
set sidescroll=1
set sidescrolloff=10
set virtualedit+=block
set mouse=a
set lazyredraw
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set splitbelow
set splitright
set fillchars=diff:⣿
" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*" 

" Resize splits when the window is resized
au VimResized * :wincmd =

"保证vim在reopen一个文件时定位到同一行
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

"设置mapleader前缀
    let mapleader = ','

"搜索相关的设置
set gdefault "all matches in a line a subsituted instead of one.
set showmatch					" show matching brackets/parenthesis
set incsearch					" find as you type search
set hlsearch					" 高亮搜索结果
set magic                       " 根据vim说明默认开启此参数
set ignorecase					" 忽略大小写
set smartcase					" case sensitive when uc present
nmap <silent> <leader>/ :nohlsearch<CR> "清空搜索结果高亮显示
nnoremap n nzzzv "保持搜索结果在屏幕中央位置
nnoremap N Nzzzv "保持搜索结果在屏幕中央位置

"在屏幕中各子窗口之间切换
    noremap <C-h> <C-w>h
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-l> <C-w>l

"在标签页和buffer之间切换
    nnoremap tn :tabnext<cr>
    nnoremap tp :tabprev<cr>
    nnoremap tt :tabnew<cr>
    nnoremap <leader>bn :bnext<cr>
    nnoremap <leader>bp :bprev<cr>

"代码折叠相关配置
    set foldmethod=indent       "代码折叠 共有6中方式如下
        "1. manual 手工定义折叠
        "2. indent 用缩进表示折叠
        "3. expr　 用表达式来定义折叠
        "4. syntax 用语法高亮来定义折叠
        "5. diff   对没有更改的文本进行折叠
        "6. marker 用标志折叠
    nnoremap <Space> zah "空格键折叠，h是为了解决Space会导致焦点右移一位的问题
    vnoremap <Space> zah "空格键折叠，h是为了解决Space会导致焦点右移一位的问题
    "下面这段是自定义折叠后显示的代码信息
    function! MyFoldText() " {{{
        let line = getline(v:foldstart)
        
        let nucolwidth = &fdc + &number * &numberwidth
        let windowwidth = winwidth(0) - nucolwidth - 3
        let foldedlinecount = v:foldend - v:foldstart
        
        " expand tabs into spaces
        let onetab = strpart('          ', 0, &tabstop)
        let line = substitute(line, '\t', onetab, 'g')
        
        let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
        let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
        return '+' . foldedlinecount . line . '…' . repeat(" ",fillcharcount)
    endfunction
    set foldtext=MyFoldText()

"设置菜单和帮助的语言，默认改为英语
    set fileencodings=utf-8,gbk "使用utf-8或gbk打开文件
    set encoding=utf8
    set langmenu=en_US.UTF-8
    language message en_US.UTF-8

"pathogen是Vim用来管理插件的插件
    call pathogen#infect()

"powerline状态栏的配置 
    set guifont=PowerlineSymbols\ for\ Powerline
    set nocompatible
    set t_Co=256
    let g:Powerline_symbols = 'fancy'

"taglist配置
    let Tlist_Show_One_File = 1            "只显示当前文件的taglist，默认是显示多个
    let Tlist_Exit_OnlyWindow = 1          "如果taglist是最后一个窗口，则退出vim
    let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist
    let Tlist_GainFocus_On_ToggleOpen = 1  "打开taglist时，光标保留在taglist窗口
    nmap <silent> <F4> :TlistToggle <CR>   "绑定F4为快捷键

"jellybeans配色方案配置
    colorscheme jellybeans

"NerdTree配置
    map <F3> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
    let NERDTreeChDirMode=2     "setting root dir in NT also sets VIM's cd
    let NERDTreeQuitOnOpen=0 "the Nerdtree window will be close after a file is opend.
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1

"rainbow_parentheses括号匹配着色插件配置
    nnoremap <leader>R :RainbowParenthesesToggle<cr>
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
        \ ['black',       'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['red',         'firebrick3'],
        \ ]
    let g:rbpt_max = 16

"Fugitive配置
    nnoremap <Leader>gs :Gstatus<CR>
    nnoremap <Leader>gr :Gremove<CR>
    nnoremap <Leader>gl :Glog<CR>
    nnoremap <Leader>gb :Gblame<CR>
    nnoremap <Leader>gm :Gmove 
    nnoremap <Leader>gp :Ggrep 
    nnoremap <Leader>gR :Gread<CR>
    nnoremap <Leader>gg :Git 
    nnoremap <Leader>gd :Gdiff<CR>

"Supertab配置
    let g:SuperTabDefaultCompletionType = "<c-n>"
    let g:SuperTabLongestHighlight = 1

"Autoclose自动成对补充括号插件
    nmap <Leader>x <Plug>ToggleAutoCloseMappings

"自定义快捷扫描ctags命令
command Ctags !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
command Hex %!xxd
command Asc %!xxd -r

