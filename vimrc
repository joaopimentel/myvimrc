colorscheme candycode

call pathogen#infect()
filetype plugin indent on

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" use mouse
"set ttymouse=xterm2
set mouse=n
set nomousehide

" Smart tabbing / autoindenting
set nocompatible
set autoindent
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

set laststatus=2

" Mapping to NERDTree
nnoremap <C-n> :NERDTreeToggle<cr>
" close NERDTree on open
let NERDTreeQuitOnOpen = 1

" TagList options
let Tlist_Close_On_Select = 0 "close taglist window once we selected something
let Tlist_Exit_OnlyWindow = 1 "if taglist window is the only window left, exit vim
let Tlist_Show_Menu = 1 "show Tags menu in gvim
let Tlist_Show_One_File = 1 "show tags of only one file
let Tlist_GainFocus_On_ToggleOpen = 1 "automatically switch to taglist window
let Tlist_Highlight_Tag_On_BufEnter = 1 "highlight current tag in taglist window
let Tlist_Process_File_Always = 1 "even without taglist window, create tags file, required for displaying tag in statusline
let Tlist_Use_Right_Window = 1 "display taglist window on the right
"let Tlist_Ctags_Cmd = /path/to/exuberant/ctags

nnoremap <A-n> :TlistToggle<cr>
nnoremap <F6> :TlistShowPrototype<cr>

" line numbers
set nu

" ignore .pyc files on NERDTree
let NERDTreeIgnore = ['\.pyc$']

" highlight all found words
set hlsearch

" syntastic things
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
" (somewhat)fancy statusline
set statusline=%<\ %f\ %m%r%y%{SyntasticStatuslineFlag()}%=line:\ %l\ of\ %L,\ col:\ %c%V
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" window navigation with Alt+direction
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" text scroll with Ctrl+direction
noremap <C-Up> <C-Y>
noremap <C-Down> <C-E>

"window swapping:
" \mw -> mark window to swap
" \pw -> paste window (swap with present window)
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
"Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
"Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
"Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
"Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
"Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

noremap <silent> <Leader>mw :call MarkWindowSwap()<CR>
noremap <silent> <Leader>pw :call DoWindowSwap()<CR>

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar"""
set guioptions-=l
set guioptions-=L
set guioptions-=R

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Open python file with all folds open (using http://www.vim.org/scripts/script.php?script_id=2462)
autocmd Syntax python normal zR

" Ctrl+Del to delete whole word on insert mode
:imap <C-Del> <C-O>dw
" Ctrl+Backspace to delete whole word back on insert mode
:imap <C-BS> <C-O>db
