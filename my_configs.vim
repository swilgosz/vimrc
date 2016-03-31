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

"don't add margin on the left
set foldcolumn=0

" Colors
let base16colorspace=256 " access colors present in 256 colorspace
set t_Co=256 " tell vim that terminal supports 256 colors
let g:ackprg = 'ag --nogroup --nocolor --column'

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

inoremap § <Esc>
"inoremap <Esc> <Nop>
set rnu

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
" colorscheme
let base16colorspace=256  " Access colors present in 256 colorspace
if has("gui_running")
  set background=dark
  let g:colors_name="monokai"
  colorscheme base16-monokai
else
  set background=dark
  let g:colors_name="monokai"
  colorscheme base16-monokai
endif

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
    call cursor(l, c)
endfun

autocmd BufWritePre *.css,*.coffee,*.erb,*.haml,*.html,*.java,*.js,*.rb,*.sass,*.scss,*.slim  :call StripTrailingWhitespaces()
set updatetime=250
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

nmap <leader>wq :wq<cr>
