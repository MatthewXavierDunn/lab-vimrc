# Lab `.vimrc`

[![License MIT](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)](https://github.com/MatthewXavierDunn/lab-vimrc/blob/main/LICENSE)
![Vim](https://img.shields.io/badge/VIM-%2311AB00.svg?style=falt-square&logo=vim&logoColor=white)

Lab compatible .vimrc config

![lab vimrc screenshot](/lab-vimrc.png)

## Installation Instructions (Unix Systems)

1. Download the `.vimrc` file and put in the home directory `~`.
```bash
curl -fLo ~/.vimrc \
  https://raw.githubusercontent.com/MatthewXavierDunn/lab-vimrc/main/.vimrc
```
3. Install [`vim-plug`](https://github.com/junegunn/vim-plug) by running the following command:
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
3. Source the `.vimrc` file by opening it in `vim`:
```bash
vim ~/.vimrc
```
4. Run the `:PlugInstall` command to install all plugins specified in `.vimrc`.
5. Reload `vim` to allow the plugins to take affect.
