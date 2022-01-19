# neovim nightly

	git clone https://aur.archlinux.org/neovim-nightly-bin.git
	makepkg -si
	mkdir -p ~/.config/nvim/pack
	nvim ~/.config/nivm/init.vim

        

	sudo pacman -S ranger
	ranger --copy-config=all
	sudo pacman -S glib2
	append "map DD shell gio trash %s" to rc.conf(~/.config/ranger/)

	append to ~/.config/ranger/commands.py
```python
		class empty(Command):
		""":empty

		Empties the trash directory ~/.Trash
		"""

		def execute(self):
			self.fm.run("rm -rf /home/myname/.Trash/{*,.[^.]*}")
```

	sudo pacman -S python-pygments

	replace of ~/.config/ranger/scope.sh
```bash
# PYGMENTIZE_STYLE=${PYGMENTIZE_STYLE:-autumn}
 47 PYGMENTIZE_STYLE=${PYGMENTIZE_STYLE:-monokai}
```
	ranger --copy-config=rifle

	sudo pacman -S xdg-utils atool
	git clone https://aur.archlinux.org/nerd-fonts-fira-code.git
	git clone https://aur.archlinux.org/nerd-fonts-fira-mono.git
	git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

	echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf

	git submodule add https://github.com/kevinhwang91/rnvimr pack/ranger/opt/rnvimr

	git clone https://aur.archlinux.org/python-pillow-simd.git
	git clone https://aur.archlinux.org/python-ueberzug-git.git
```vim 
	" Make Ranger replace netrw and be the file explorer
	let g:rnvimr_ex_enable = 1

	nmap <space>r :RnvimrToggle<CR>
```

Add the following lines to your ~/.config/ranger/rc.conf.
	set preview_images true
	set preview_images_method ueberzug

## lanaguage server

git clone https://aur.archlinux.org/cmake-language-server.git

sudo pacman -S ccls
sudo pacman -S clang (clangd)
git clone https://aur.archlinux.org/pyright.git
git clone https://aur.archlinux.org/ghcup-hs-bin.git
ghcup tui install hls
git clone https://aur.archlinux.org/lua-language-server.git

### nvim-lspconfig

### completiong-nvim

    git submodle add https://github.com/nvim-lua/completion-nvim.git ~/.config/nvim/pack/lsp/opt/completion-nvim

## fzf

	sudo pacman -S fzf
	sudo pacman -S ripgrep
	sudo -S ctags	; universal-ctags-git
	sudo pacman -S the_silver_searcher
	pacman -S fd

## vim-gitgutter

	git submodule add https://github.com/airblade/vim-gitgutter.git /path
	cd  .. /opt
	nvim -u NONE -c "helptags vim-gitgutter/doc" -c q

## ranger

### marker

    make marker -> "n  n stand for current directory
    goto marker -> `n

    copy -> yy
    cut -> dd
    paste -> pp

    tab -> shit N tab

    rename -> cw
### xsel

    eXchangeSeLect
    -i input
    -o output
    -b buffer clipboard
    -p primarh buffer
    -s secondary buffer
    -c clear
    -d delete and more request app to delete selected contents

### lua

	https://github.com/RishabhRD/archrice/blob/master/.config/nvim/init.lua
