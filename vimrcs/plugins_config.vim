"       This requries that you install https://github.com/amix/vimrc !"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize

" Plugin 'thoughtbot/vim-rspec'
call plug#begin('~/.vim/bundle')
Plug 'airblade/vim-gitgutter'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'danro/rename.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'heartsentwined/vim-emblem'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'kchmck/vim-coffee-script'
Plug 'michaeljsmith/vim-indent-object'
Plug 'terryma/vim-multiple-cursors'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sophacles/vim-bundle-mako'
Plug 'terryma/vim-expand-region'
Plug 'thoughtbot/vim-rspec'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'slim-template/vim-slim'
Plug 'scrooloose/syntastic'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mustache/vim-mustache-handlebars'

""""""""""""""""
" sNIPPETS
" Track the engine.
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

""""""""""""""""
" Markdown support
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'Valloric/YouCompleteMe', { 'on': [] }

augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('YouCompleteMe')
                     \| call youcompleteme#Enable() | autocmd! load_us_ycm
augroup END

call plug#end()
 " mru
 " set_tabline
 " yankring

""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
call pathogen#infect('~/.vim_runtime/sources_forked/{}')
call pathogen#infect('~/.vim_runtime/sources_non_forked/{}')
call pathogen#helptags()

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""
if has("win16") || has("win32")
    " Don't do anything
else
    let g:yankring_history_dir = '~/.vim_runtime/temp_dirs/'
endif

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlPClearAllCaches<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 25
let g:ctrlp_custom_ignore = 'bower_components\|node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

""""""""""""""""""""""""""""""
" => AG
""""""""""""""""""""""""""""""

" bind K to grep word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

""""""""""""""""""""""""""""""
" => Emmet
""""""""""""""""""""""""""""""
" Enable all functions in all modes
" let g:user_zen_mode='a'

""""""""""""""""""""""""""""""
" => ultisnips
""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-i>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" CODE FOR YCM + UltiSnips integration
" " If you want :UltiSnipsEdit to split your window.
" https://www.reddit.com/r/vim/comments/2sx567/snipmate_and_youcompleteme_doesnt_work_well/
let g:UltiSnipsEditSplit="vertical"

"   " YouCompleteMe and UltiSnips compatibility, with the helper of supertab
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"




""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1
nnoremap <silent> <leader>d :GitGutterToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:multi_cursor_next_key="<C-s>"
let g:multi_cursor_exit_from_insert_mode=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext http://amix.dk/blog/post/19678
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline config (force color)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="luna"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=120
let g:goyo_heighti=120
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
let g:syntastic_python_checkers=['pyflakes']

" Javascript
let g:syntastic_javascript_checkers = ['jshint']

" Go
let g:syntastic_auto_loc_list = 1
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" Custom CoffeeScript SyntasticCheck
func! SyntasticCheckCoffeescript()
    let l:filename = substitute(expand("%:p"), '\(\w\+\)\.coffee', '.coffee.\1.js', '')
    execute "tabedit " . l:filename
    execute "SyntasticCheck"
    execute "Errors"
endfunc
nnoremap <silent> <leader>l :call SyntasticCheckCoffeescript()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fugitive (Git commands)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"https://github.com/tpope/vim-fugitive

" Fugitive shortcuts
nmap <leader>db :Gblame<cr>
nmap <leader>dv :Gvdiff<cr>
nmap <leader>dw :Gwrite<cr>
nmap <leader>dc :Gcommit<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-rspec commands
"""""""""""""""""""""""""
if has("gui_macvim")
  let g:rspec_runner = "os_x_iterm"
  " let g:rspec_command = "spring rspec --color {spec}"
  let g:rspec_command = "!rspec --drb {spec}"
  " let g:rspec_command = "Dispatch rspec {spec}"
else
  " let g:rspec_runner = "os_x_iterm"
  let g:rspec_command = "!rspec --drb {spec}"
endif

map <Leader>st :call RunCurrentSpecFile()<CR>
map <Leader>ss :call RunNearestSpec()<CR>
map <Leader>sl :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-rails commands
"""""""""""""""""""""""""
"go to alternative file
"in current buffer
nmap <leader>a :AE<cr>
"in vertical split
nmap <leader>va :AV<cr>

"go to relative file
"in current buffer
nmap <leader>r :RE<cr>
"in vertical split
nmap <leader>va :RV<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tmuxline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmuxline_powerline_separators = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'"""
" => tabularize
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'"""
let g:vim_markdown_folding_disabled = 1



"""""""""""""""""""free commands
" <leader>l
" <leader>t
" <leader>a
