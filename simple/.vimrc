syntax on                      "语法支持

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType make setlocal noexpandtab

set clipboard+=unnamed "use System clipboard on Mac
"set autoindent              "设置自动缩进
set bs=2                    "在insert模式下用退格键删除
set mouse=a
"set expandtab     "是否在缩进和遇到 Tab 键时使用空格替代；使用 noexpandtab 取消设置
set tabstop=8               "制表符的宽度，参考ceph
"set softtabstop=4 "软制表符宽度，设置为非零数值后使用 Tab 键和 Backspace 时光标移动的格数等于该数值，但实际插入的字符仍受 tabstop 和 expandtab 控制
set number                  "显示行号
set autoread                "文件在Vim之外修改过，自动重新读入
set showbreak=↪             "显示换行符
set backspace=indent,eol,start "允许任意地方使用backspace键
set completeopt=longest,menuone,preview "更好的insert模式自动完成

set hidden              "switching buffers without saving
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set wildmenu            " show enhanced completion 
set wildmode=list:longest "together with wildmenu
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files
set visualbell          "flash screen when bell rings
set cursorline          "highline cursor line
set ttyfast             "indicate faster terminal connection
set laststatus=2        "always show status line
set cpoptions+=J
set lbr                 " break the line by words
set scrolloff=3         " show at least 3 lines around the current cursor position
set sidescroll=1
set sidescrolloff=10
set virtualedit+=block
set lazyredraw
"set list
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

"快速退出vim
    nnoremap <leader>q :qa!<CR> "清空搜索结果高亮显示

"搜索相关的设置
    set gdefault   "all matches in a line a subsituted instead of one.
    set showmatch  " show matching brackets/parenthesis
    set incsearch  " find as you type search
    set hlsearch   " 高亮搜索结果
    set magic      " 根据vim说明默认开启此参数
    set ignorecase " 忽略大小写
    set smartcase  " case sensitive when uc present
    nnoremap <leader>/ :nohlsearch<CR> "清空搜索结果高亮显示

"在屏幕中各子窗口之间切换
    noremap <C-h> <C-w>h
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-l> <C-w>l

" tab navigation mappings
    map tn :tabn<CR>
    map tp :tabp<CR>
    map tm :tabm
    map tt :tabnew<cr>
    map ts :tab split<CR>
    map <C-S-Right> :tabn<CR>
    imap <C-S-Right> <ESC>:tabn<CR>
    map <C-S-Left> :tabp<CR>
    imap <C-S-Left> <ESC>:tabp<CR>

"代码折叠相关配置
"    set foldmethod=syntax       "代码折叠 共有6中方式如下
        "1. manual 手工定义折叠
        "2. indent 用缩进表示折叠
        "3. expr　 用表达式来定义折叠
        "4. syntax 用语法高亮来定义折叠
        "5. diff   对没有更改的文本进行折叠
        "6. marker 用标志折叠
"    vnoremap <Space> zah "空格键折叠，h是为了解决Space会导致焦点右移一位的问题
"设置菜单和帮助的语言，默认改为英语
    set fileencodings=utf-8,gbk "使用utf-8或gbk打开文件
    set encoding=utf8
    set langmenu=en_US.UTF-8
    language message en_US.UTF-8

"pathogen是Vim用来管理插件的插件
    call pathogen#infect()

"jellybeans配色方案配置
    colorscheme jellybeans

" Airline ------------------------------
    let g:airline_powerline_fonts = 1
    let g:airline_enable_branch=1
    let g:airline_enable_syntastic=1
    let g:airline_detect_paste=1

    let g:airline#extensions#whitespace#enabled = 0
    let g:airline#extensions#tabline#enabled = 1 
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'

    " to use fancy symbols for airline, uncomment the following lines and use a
    " patched font (more info on the README.rst)
    if !exists('g:airline_symbols')
       let g:airline_symbols = {}
    endif
    let g:airline_left_sep = '⮀'
    let g:airline_left_alt_sep = '⮁'
    let g:airline_right_sep = '⮂'
    let g:airline_right_alt_sep = '⮃'
    let g:airline_symbols.branch = '⭠'
    let g:airline_symbols.readonly = '⭤'
    let g:airline_symbols.linenr = '⭡'

"Unite 聚合搜索
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])
    call unite#set_profile('files', 'context.smartcase', 1)
    
    let g:unite_data_directory='~/.vim/.cache/unite'
    let g:unite_enable_start_insert=1
    let g:unite_source_history_yank_enable=1
    let g:unite_source_rec_max_cache_files=5000
    
    if executable('ag')
      let g:unite_source_grep_command='ag'
      let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
      let g:unite_source_grep_recursive_opt=''
    elseif executable('ack')
      let g:unite_source_grep_command='ack'
      let g:unite_source_grep_default_opts='--no-heading --no-color -C4'
      let g:unite_source_grep_recursive_opt=''
    endif
    
    function! s:unite_settings()
      nmap <buffer> Q <plug>(unite_exit)
      nmap <buffer> <esc> <plug>(unite_exit)
      imap <buffer> <esc> <plug>(unite_exit)
      imap <buffer> <C-j>   <Plug>(unite_select_next_line)
      imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    endfunction
    autocmd FileType unite call s:unite_settings()

    nmap <space> [unite]
    nnoremap [unite] <nop>
    
    nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_mru file_rec/async buffer bookmark<cr><c-u>
    nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async<cr><c-u>
    nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
    nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
    nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
    nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
    nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
    nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>

"Tagbar配置
    let g:tagbar_width=26
    noremap <silent> <F4> :TagbarToggle<CR>
    let g:tagbar_autofocus = 1

" NeoComplCache ------------------------------
    " most of them not documented because I'm not sure how they work
    " (docs aren't good, had to do a lot of trial and error to make
    " it play nice)
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_enable_auto_select = 1
    let g:neocomplcache_enable_fuzzy_completion = 1
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_fuzzy_completion_start_length = 1
    let g:neocomplcache_auto_completion_start_length = 1
    let g:neocomplcache_manual_completion_start_length = 1
    let g:neocomplcache_min_keyword_length = 1
    let g:neocomplcache_min_syntax_length = 1
    " complete with workds from any opened file
    let g:neocomplcache_same_filetype_lists = {}
    let g:neocomplcache_same_filetype_lists._ = '_'

"NerdTree配置
    map <F3> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.o','\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
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

"Autoclose自动成对补充括号插件
    nmap <Leader>x <Plug>ToggleAutoCloseMappings

"vim-go & gotags config
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_fmt_command = "goimports"
    au FileType go nmap <leader>r <Plug>(go-run)
    au FileType go nmap <leader>b <Plug>(go-build)
    au FileType go nmap <leader>t <Plug>(go-test)
    au FileType go nmap <leader>c <Plug>(go-coverage) 
    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
    \ }

"自定义快捷扫描ctags命令
command Ctags !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
"command Ctags !ctags -R .
command Hex %!xxd
command Asc %!xxd -r

command Gotags !gotags -R . >tags

