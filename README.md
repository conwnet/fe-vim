# vimrc

vim config for web developer


## usage

### clone and copy files

~~~shell
git clone https://github.com/conwnet/vimrc.git
mv ~/.vimrc ~/.vimrc.bak
mv ~/.vim ~/.vim.bak

mkdir -p ~/.vim
cp vimrc/.vimrc ~/.vimrc
cp vimrc/.vim/coc-settings.json ~/.vim/coc-settings.json
~~~

### install plugins

- install [vim-plug](https://github.com/junegunn/vim-plug)

- open vim
    - vim ~/.vimrc

- install plugins
    - :PlugInstall
    - :CocInstall coc-lists

All done!
