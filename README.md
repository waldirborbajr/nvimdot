# WaldirBorbaJr NVIM dot files

## Install Packer
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Install Fonts

### Download Fonts
https://www.nerdfonts.com/

On Debian:
/usr/local/share/fonts/ to install fonts system-wide
~/.local/share/fonts/ or ~/.fonts to install fonts just for the current user

```
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip
unzip DroidSansMono.zip -d ~/.fonts
fc-cache -fv
```
