packadd vim-jetpack
call jetpack#begin()
call jetpack#load_toml(expand('~/.dotfiles/dein.toml'))
call jetpack#add('tani/vim-jetpack', {'opt': 1})
call jetpack#add('nathanaelkane/vim-indent-guides')
call jetpack#add('lambdalisue/vim-fern')
call jetpack#end()

""nnoremap [h :AccessHistoryList<CR>
""
""if filereadable(expand('~/.dotfiles/scripts/access-historylist.vim'))
""  source ~/.dotfiles/scripts/access-historylist.vim
""endif

" --- AccessHistoryList キーマッピングとコマンド定義 ---
command! AccessHistoryList edit session://list
nnoremap [h :AccessHistoryList<CR>

" --- session://list を開いたときに内容を初期化 ---
augroup plugin-session
  autocmd!
  autocmd BufReadCmd session://list call session#on_bufread_list()
augroup END
