function! session#on_bufread_list()
  setlocal buftype=nofile
  setlocal bufhidden=wipe
  setlocal nobuflisted
  setlocal noswapfile
  setlocal nowrap
  setlocal nonumber norelativenumber

  " v:oldfilesの上位10件を表示
  call setline(1, v:oldfiles[:9])

  " 読み取り専用＋Enterマッピング
  setlocal readonly
  nnoremap <buffer> <CR> :call session#open_selected()<CR>
endfunction

function! session#open_selected()
  let l:filepath = expand(getline('.'))
  if filereadable(l:filepath)
    execute 'edit ' . fnameescape(l:filepath)
  else
    echohl ErrorMsg | echom 'File not found: ' . l:filepath | echohl None
  endif
endfunction
