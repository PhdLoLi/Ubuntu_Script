set number
"显示行号
syntax on
"语法高亮

filetype on

set cindent
"按照C语法自动缩进
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
"设置缩进长度
"详见http://dddspace.com/2010/03/vim-indentation-and-space-config.html
set showmatch
"显示括号对应
set incsearch
"实时显示搜索结果
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,utf-16,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"编码设置
"set guifont=Menlo:h16:cANSI
set guifont=Menlo:h13
"设置字体
if has('gui_running')
    set background=dark
else
    set background=light
endif

"colorscheme skittles_berry 
"设置颜色主题
"设置透明度

filetype plugin on
ino <c-j> <c-r>=TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>

"Set mapleader
let mapleader = ","

"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc
"Fast relaoding of the .zshrc
map <silent> <leader>zsh :e ~/.zshrc<cr>
"Set tags
map <silent> <F9> :TlistToggle<cr>
set tags=tags;
    set autochdir
"Avoiding the Esc key
:imap jj <Esc>
"Slove Coding 
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window =1
map <silent> <leader>t :TlistToggle<cr>


"搜索字符串高亮
set hlsearch

" Always show status line, even for one window
set laststatus=2

"  Show line, column number, and relative position within a file in the status line
set ruler

if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let s .= i . ')'
            let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#' )
            let file = bufname(buflist[winnr - 1])
            let file = fnamemodify(file, ':p:t')
            if file == ''
                let file = '[NEW]'
            else
                let m = 0       " &modified counter
                let bc = len(tabpagebuflist(i))     "counter to avoid last ' '
                " loop through each buffer in a tab
                for b in tabpagebuflist(i)
                    " check and ++ tab's &modified count
                    if getbufvar( b, "&modified" )
                        let m += 1
                        break
                    endif
                endfor
                " add modified label + where n pages in tab are modified
                if m > 0
                    let file = '+ '.file
                endif
            endif
            let s .= ' '.file.' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
endif
