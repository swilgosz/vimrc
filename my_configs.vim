"Set line wrap after 150 chars
set tw=150

"Set two spaces tab width
set shiftwidth=2
set tabstop=2


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \   if line("'\"") > 0 && line("'\"") <= line("$") |
      \     exe "normal! g`\"" |
      \   end

set number
set modifiable
"don't add margin on the left
set foldcolumn=0

" Colors
let base16colorspace=256 " access colors present in 256 colorspace
set t_Co=256 " tell vim that terminal supports 256 colors

inoremap § <Esc>
"inoremap <Esc> <Nop>
inoremap jk <esc>

set rnu

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

fun! StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e

  " two lines below are to add extra line on EOF
  " %s/\($\n\s*\)\+\%$//e
  " %s/\%$/\r/

  call cursor(l, c)
endfun
autocmd BufWritePre *.css,*.coffee,*.emblem,*.erb,*.haml,*.html,*.java,*.js,*.md,*.rb,*.sass,*.scss,*.sh,*.slim,*.vim,*.yml :call StripTrailingWhitespaces()

set updatetime=250
set eol
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0

"autocmd BufEnter * sign define dummy
"autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
let g:gitgutter_sign_column_always = 1

function s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

nmap <leader>q :q<cr>
nmap <leader>qa :qa<cr>
nmap <leader>wq :wq<cr>
nmap <leader>ee :e ~/.vim_runtime/vimrcs/plugins_config.vim<cr>
nmap <leader>o :only<cr>


set term=xterm-256color
" faster redrawing
set ttyfast
" disable Background Color Erase (BCE)
set t_ut=

" visually select a search result
nnoremap g/ //e<Enter>v??<Enter>

" if the file is changed outside vim - reload automatically
set autoread

" disable Ex mode
noremap Q <NOP>

" filetype plugin indent on "for slim highliting
" " disable audio bell in MacVim
set vb

" " basic visual config
" set wrap linebreak nolist " line wrapping options
set showbreak=-->         " display at the begining of wrapped lines
" set ruler               " show the cursor position all the time
" "set cursorline          " highlight the line of the cursor
" set showcmd               " show partial commands below the status line
" set scrolloff=3           " have some context

" " show EOL characters
set list
set listchars=tab:▸\
",eol:¬
" set smartcase " ... unless they contain at least one capital letter
"
" "" Tabs and Indents
"set shiftround    " round indent to a multiple of 'shiftwidth'
set autoindent
set smartindent

" "" Control and Splits
if has('mouse')
  set mouse=a
  set ttymouse=xterm2
endif

" " put cursor in the new split
nnoremap <leader>vl <C-w>v<C-w>l
nnoremap <leader>vh <C-w>v<C-w>h
nnoremap <leader>vk <C-w>v<C-w>k
nnoremap <leader>vj <C-w>v<C-w>j

" " more natural split opening
set splitbelow
set splitright

" " double ,, for previous buffer
" nnoremap <leader><leader> <c-^>

" " %% insert the file path of current buffer
" cnoremap %% <C-R>=expand('%:h').'/'<cr>
" map <leader>e :edit %%
" map <leader>v :view %%

" yank to system clipboard
nmap <leader>y "*y
nmap <leader>tn :tabnext<cr>
nmap <leader>tp :tabprevious<cr>

" highlight long lines
nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
  echo "Long lines highlighted"
 else
  call matchdelete(w:longlinehl)
  unl w:longlinehl
  echo "Long lines unhighlighted"
 endif
endfunction
" set clipboard=unnamed


" "paste lines from unnamed register and fix indentation
" nmap <leader>p pV`]=
" nmap <leader>P PV`]=

" " scroll the viewport faster
" nnoremap <C-e> 3<C-e>
" nnoremap <C-y> 3<C-y>

" "" Custom AUTOCMDS
" " Jump to last cursor position uless it's invalid or in an event handler
" autocmd BufReadPost *
" 	\ if line("'\"") > 0 && line("'\"") <= line("$") |
" 	\		exe "normal g`\"" |
" 	\ endif
" ​
"
" " MULTIPURPOSE TAB KEY
" " Indent if at the beginning of a line. Else, do completion.

" function! InsertTabWrapper()
" 	let col = col('.') - 1
" 	if !col || getline('.')[col - 1] !~ '\k'
" 		return "\<tab>"
" 	else
" 		return "\<c-p>"
" 	endif
" endfunction
" inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <s-tab> <c-n>
" ​
" ​

" " RENAME CURRENT FILE
" " function! RenameFile()
" " 	let old_name = expand('%')
" " 	let new_name = input('New file name: ', expand('%'))
" " 	if new_name != '' && new_name != old_name
" " 		exec ':saveas ' . new_name
" " 		exec ':silent !rm ' . old_name
" " 		redraw!
" " 	endif
" " endfunction
" " map <leader>n :call RenameFile()<cr>

" " DEALING WITH TRAILING WHITESPACES
" " highlight them
" match ErrorMsg '\s\+$'
" " remove them ...
" function! TrimWhiteSpace()
"   %s/\s\+$//e
" endfunction
" " ... manually ...
" nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>
" " ... and automatically
" autocmd FileWritePre *    :call TrimWhiteSpace()
" autocmd FileAppendPre *   :call TrimWhiteSpace()
" autocmd FilterWritePre *  :call TrimWhiteSpace()
" autocmd BufWritePre *     :call TrimWhiteSpace()

" " Remove fancy characters COMMAND
"
" function! RemoveFancyCharacters()
" let typo = {}
" 	let typo["“"] = '"'
" 	let typo["”"] = '"'
" 	let typo["‘"] = "'"
" 	let typo["’"] = "'"
" 	let typo["–"] = '--'
" 	let typo["—"] = '---'
" 	let typo["…"] = '...'
" :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
" endfunction
" command! RemoveFancyCharacters :call RemoveFancyCharacters()
" ​
" nmap <silent> <leader>r :CtrlPBuffer<cr>
filetype plugin indent on

