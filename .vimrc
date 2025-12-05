set number
syntax on
set tabstop=2
set autoindent
set mouse=a

" Copiar
"vnoremap <S-y> "+y
vnoremap <S-y> :w !xclip -selection clipboard<CR><CR>

" Pegar
"map <S-p> "+gP
nmap <S-p> :r !xclip -o -selection clipboard<CR>

" Seleccionar todo (control + A)
nnoremap <C-a> ggVG

