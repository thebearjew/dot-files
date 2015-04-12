" Informative echo line
function! utils#showToggles()
  echom "<F1> NERDTree | <F2> Tagbar | <F3> Paste mode | <F4> Spellcheck | <F5> Reload rc | <F6> Highlighting |" .
        \" <F7> Whitechars | <F8> Syntastic | <F9> Test whole file | <F10> Test current | <F11> Run in REPL | <F12> This message"
endfunction

" Copy and paste function using xclip
function! utils#clipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction

function! utils#clipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

" When cycling ignore NERDTree and Tagbar
function! utils#intelligentCycling()
  " Cycle firstly
  wincmd w
  " Handle where you are now
  if &buftype ==# 'nofile'
    call utils#intelligentCycling()
  endif
endfunction

" Run current file
function! utils#runCurrentFile()
  :T ruby %
endfunction

" Run NERDTreeFind or Toggle based on current buffer
function! utils#nerdWrapper()
  if &filetype ==# ''
    :NERDTreeToggle
  else
    :NERDTreeFind
  endif
endfunction

" Run built-in terminal in vertical split
function! utils#newVertTerm()
  wincmd v
  vertical resize 80
  :terminal
endfunction

" Run built-in terminal in horizontal split
function! utils#newTerm()
  wincmd s
  resize 15
  :terminal
endfunction
