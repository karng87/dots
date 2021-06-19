# dots

## neovim
    pip3 uninstall neovim
    pip3 uninstall pynvim
    pip3 install pynvim

    pip2 uninstall neovim
    pip2 uninstall pynvim
    pip2 install pynvim

    pip uninstall neovim
    pip uninstall pynvim
    pip install pynvim
    
## texlive 
### tlmgr (TextLive Mgr)
    edit TEXMFDIST/scripts/texlive/tlmgr.pl
        replace 
            $Master = "$Master/../.."; 
                with 
            $Master = "${Master}/../../..";
    edit bashrc
        TEXMFDIST=/usr/share/texmf-dist
        alias tlmgr='${TEXMFDIST}/scripts/texlive/tlmgr.pl --usermode'

    shell> tlmgr option repository https://mirror.kakao.com/CTAN/
    shell> tlmgr install package_name
