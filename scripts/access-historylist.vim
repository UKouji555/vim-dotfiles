function! ShowFileList()
  let g:dotfile_original_winid = win_getid()
  new
  setlocal buftype=nofile
  setlocal bufhidden=wipe
  setlocal nobuflisted
  setlocal noswapfile
  setlocal nowrap
  setlocal nonumber norelativenumber
  call setline(1, v:oldfiles[:9])
  setlocal readonly
  nnoremap <buffer> <CR> :call OpenSelectedFile()<CR>
endfunction

function! OpenSelectedFile()
  let l:filepath = getline('.')
  let l:filepath = expand(l:filepath)
  let l:history_buf = bufnr('%')
  execute 'bd! ' . l:history_buf
  if filereadable(l:filepath)
    call win_execute(g:dotfile_original_winid, 'edit ' . fnameescape(l:filepath))
  else
    echohl ErrorMsg | echom 'File not found: ' . l:filepath | echohl None
  endif
endfunction

command! AccessHistoryList call ShowFileList()
