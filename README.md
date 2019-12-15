# fe-vim

vim config for frontend developer

## Install

### install neovim

using [neovim](https://github.com/neovim/neovim) for better experience

### clone and copy files

~~~shell
$ git clone https://github.com/conwnet/fe-vim.git
$ mv /path/to/nvim/init.vim /path/to/nvim/init.vim.bak
$ mv /path/to/nvim/coc-settings.json /path/to/nvim/coc-settings.json.bak

$ cd fe-vim
$ cp init.vim /path/to/nvim/init.vim
$ mv coc-settings.json /path/to/nvim/coc-settings.json
~~~

### install plugins

- install [vim-plug](https://github.com/junegunn/vim-plug)

- open vim
    - vim /path/to/nvim/init.vim

- install plugins
    - :PlugInstall
    - :CocInstall coc-lists
    - :CocInstall coc-git

All done!
