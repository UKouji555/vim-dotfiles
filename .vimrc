packadd vim-jetpack
call jetpack#begin()
call jetpack#load_toml(expand('~/.dotfiles/dein.toml'))
call jetpack#add('tani/vim-jetpack', {'opt': 1})
call jetpack#add('nathanaelkane/vim-indent-guides')
call jetpack#add('lambdalisue/vim-fern')
call jetpack#end()
