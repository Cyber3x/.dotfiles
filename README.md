# [](https://github.com/Cyber3x/dotfiles#dotfiles)dotfiles
Configuration files for my setup.

## Components

 - [Neovim](https://github.com/Cyber3x/dotfiles#neovim): Vim based text editor
 - [Alacritty](https://github.com/Cyber3x/dotfiles#alacritty): Terminal emulator
 - [Oh-my-zsh](https://github.com/Cyber3x/dotfiles#oh-my-zsh): Terminal config

## Neovim
Symlinks that need to be created:
```shell
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
```

**Colorscheme**
- [Tokyo Night](https://github.com/folke/tokyonight.nvim)
```vim
let g:tokyonight_style = "storm"
```

**Plugins**
- [NerdTree](https://github.com/preservim/nerdtree): Tree-like file explorer
- [Vim-Startify](https://github.com/mhinz/vim-startify): Start screen
- [Vim-Polyglot](https://github.com/sheerun/vim-polyglot): A collection of language packs
- [Lightline](https://github.com/itchyny/lightline.vim): Status line 
- [Vim-Devicons](https://github.com/ryanoasis/vim-devicons): Icons


## Alacritty

Symlinks:
1. `ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml`

**Colorscheme**
- [Tokyo Night Storm](https://github.com/folke/tokyonight.nvim/blob/main/extras/alacritty_tokyonight_storm.yml)

## Oh-My-Zsh

Symlinks: 
1. `ls -s ~/dotfiles/oh-my-zsh/.zshrc ~/.zshrc`
2. `ls -s ~/dotfiles/oh-my-zsh/.p10k.zsh ~/.p10k.zsh`
 
