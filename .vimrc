set t_Co=256

syntax enable
set number
set relativenumber

" Do not activate hlsearch by default. See below that F3 lets you toggle it.
" set hlsearch

set incsearch
set ignorecase " often you want to ignore case when searching for text
set smartcase  " will turn on case-sensitivity only if the text to search contains uppercase characters, which is what you often want
set autoindent

set tabstop=4
set shiftwidth=4
set expandtab

"This makes sure a minimum number of lines is always visible above the cursor
set scrolloff=15

" set background=light
let hour = strftime("%H")
if 6 <= hour && hour < 18
  set background=light
else
  set background=dark
endif

colorscheme PaperColor

" <Leader>bg will switch color scheme between light and dark
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

"<Leader> = \ by default

" source $MYVIMRC reloads the saved $MYVIMRC
:nmap <Leader>s :source $MYVIMRC

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
:nmap <Leader>v :e $MYVIMRC

"-----------------------------------
"This unsets the "last search pattern" register by hitting return
"nnoremap <CR> :noh<CR><CR>

"Get out of insert mode with `
"imap ` <Esc>

"set cursorline
"hi CursorLine term=NONE cterm=NONE ctermbg=none ctermfg=none

hi ModeMsg ctermfg=white ctermbg=darkred

" Change Color when entering Insert Mode
" autocmd InsertEnter * highlight  CursorLine ctermbg=darkred ctermfg=white

" Revert Color to default when leaving Insert Mode
" autocmd InsertLeave * highlight  CursorLine ctermbg=none ctermfg=none

" enable status line always
set laststatus=2

" redraw only when we need to.
set lazyredraw

set wildmenu            " visual autocomplete for command menu

" Indicate that the specified cscope commands must put their results in the quickfix window.
" The minus sign indicates to clear the quickfix window before putting the results.
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-

" Shift-F3 = previous match
" nnoremap <C-[>O1;2R N

" F3 = next match
" nnoremap <F3> n

" Toggle search results highlighting
nnoremap <F3> :set hlsearch!<CR>

" Shift-F4 = previous error in quickfix window
nnoremap <C-[>O1;2S :cp<CR>

" F4 = next error in quickfix window
nnoremap <F4> :cn<CR>

" https://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
" Double escape clears search pattern
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

" Note the trailing space
inoremap <C-B> <3 

"set switchbuf+=usetab,newtab

" This is for CTRL+n autocompletion while in insert mode.
" The above command will change the 'completeopt' option so that Vim's popup menu doesn't select the first completion item, but rather just inserts the longest common text of all matches; and the menu will come up even if there's only one match. (The longest setting is responsible for the former effect and the menuone is responsible for the latter.) 
set completeopt=longest,menuone
