call pathogen#infect()
autocmd VimEnter * NERDTree "启动Vim时自动打开nerdtree
let NERDTreeShowBookmarks=1 "一直显示书签
let NERDTreeChDirMode=2 "打开书签时，自动将Vim的pwd设为打开的目录，如果你的项目有tags文件，你会发现这个命令很有帮助
"设置语法高亮的配色，在GUI界面里使用我自定义的tristones.vim
if has("gui_running")
colorscheme molokai 
else
colorscheme slate
endif

filetype on
filetype plugin on

" Platform
function! MySys()
if has("win32") || has("win64")
    return "windows"
elseif has("mac")
return "mac"
else
    return "linespacenux"
  endif
endfunction

"if MySys() == 'mac' || MySys() == 'linux'
		"set shell=/bin/bash\ -l
"endif

"代码折叠
"set fdm=marker
"set fdm=manual
set fdm=indent
"let g:php_folding = 3 "php代码折叠
"folding settings
"set foldmethod=indent   "fold based on indent
"set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
"set foldlevel=1         "this is just what i use
"set fdm=indent
"查找编码的规则（vim7默认都用utf-8，打开包含gbk字符的文件会出现乱码）
set termencoding=utf-8 
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"GUI界面里的字体，默认有抗锯齿
set guifont=Monaco:h14
set guifontwide=STXihei:h16
"行间距，如果默认值太小，代码会非常纠结
set linespace=4                                                                       
"用<>调整缩进时的长度
set shiftwidth=4
"制表符的长度，统一为4个空格的宽度
set tabstop=4
"初始窗口的宽度
"set columns=125
"初始窗口的高度
"set lines=45
"初始窗口的位置
"winpos 52 42
"显示行号
set number
"行号栏的宽度
set numberwidth=4
"禁止自动换行
set nowrap
"在输入命令时列出匹配项目，也就是截图底部的效果
set wildmenu
"显示光标位置
set ruler
set hlsearch "高亮显示搜索结果
syntax enable "语法高亮
set ignorecase     "搜索时忽略大小写
"分割窗口时保持相等的宽/高
set equalalways
"set ci  "使用C语言的规则自动缩进，当你敲回车时会自动缩进，所有类C语言（PHP，JAVA）都试用，比smartindent更智能 
"set ai  "(no)autoindent	 ai	 自动缩进，即为新行自动添加与当前行同等的缩进
set si "smartindent 智能缩进，即为新行自动添加与当前行同等的缩进。
"匹配括号的规则，增加针对html的<>
"set matchpairs=(:),{:},[:],<:>
set matchpairs=(:),{:},[:]
"让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）
set whichwrap=b,s,<,>,[,]
"取消自动备份
set nobackup
"保存关闭文件之前保留一个备份
set writebackup
 
"js语法高亮脚本的设置
let g:javascript_enable_domhtmlcss=1
 
"设置自定义的<leader>快捷键
let mapleader=","
let g:mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost vimrc source ~/.vimrc
 
let g:jslint_neverAutoRun=1
autocmd BufRead * :lcd! %:p:h
" filetype
autocmd BufNewFile,BufRead *.vm setlocal ft=html

" for AutoComplPop
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

""""""""""""""""""""""""""""""
" bufExplorer插件的设置
""""""""""""""""""""""""""""""
let g:bufExplorerSortBy='mru'
let g:bufExplorerSplitRight=0     
let g:bufExplorerSplitVertical=1    
let g:bufExplorerSplitVertSize = 30 
let g:bufExplorerUseCurrentWindow=1 
"autocmd BufWinEnter \[Buf\ List\] setl nonumber
 
""""""""""""""""""""""""""""""
" netrw插件的快捷键
""""""""""""""""""""""""""""""
"let g:netrw_winsize = 30
"nmap <silent> <leader>fe :Sexplore!<cr>
"use space bar fold/unfold code
:nnoremap <space> za 
""""""""""""""""""""""""""""""
" NERDTree插件的快捷键
""""""""""""""""""""""""""""""
nmap <silent> <leader>nt :NERDTree<cr>
nmap <silent> <leader>ng :NERDTreeToggle<cr> 
" taglists setting
nmap <silent> <leader>tg :TlistToggle<CR>
"let Tlist_Use_SingleClick=1
"Tlist_Process_File_Always=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_Menu=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Close_OnSelect=1
let Tlist_Compact_Format=1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 30
let Tlist_Inc_Winwidth = 0

let g:tlist_javascript_settings = 'javascript;f:function;c:class;o:object;m:method;s:string;a:array;n:constant'
 
"vim 输入法
"set noimd
set noimdisable "切换到 normal,insert,search 模式时使用英文输入法
set iminsert=0
set imsearch=0
if has("gui_running")
set imactivatekey=S
inoremap <ESC> <ESC>:set iminsert=2<CR>
endif

"把常用的ctrl快捷键映射到苹果键上（只保留cmd+c/cmd+v/cmd+z原有的功能）
if MySys() == "mac"
	map <D-y> <C-y>
	map <D-e> <C-e>
	map <D-f> <C-f>
	map <D-b> <C-b>
	map <D-u> <C-u>
	map <D-d> <C-d>
	map <D-w> <C-w>
	map <D-r> <C-r>
	map <D-o> <C-o>
	map <D-i> <C-i>
	map <D-g> <C-g>
	map <D-p> <C-p>
	map <D-n> <C-n>
	map <D-a> <C-a>
	cmap <D-d> <C-d>
	imap <D-e> <C-e>
	imap <D-y> <C-y>
endif
"添加html格式的注释
"map <F12> <ESC>0i<!--<ESC>$a--><ESC>
"map <F11> <ESC>04x$hh3x<ESC>
"map ee :e ~/.vimrc

