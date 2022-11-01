{ config, pkgs, vars, ... }:
{
  environment.systemPackages = with pkgs;
    [
        (
        with import <nixpkgs> {};

        vim_configurable.customize {
            # Specifies the vim binary name
            # E.g. set this to "my-vim" and you need to type "my-vim" to open this vim
            # This allows to have multiple vim packages installed (e.g. with a different set of plugins)
            name = "vim";
            vimrcConfig.customRC = ''
            syntax on
            syntax enable
            set backupdir=/tmp      " save backup files (~) to /tmp
            set tabstop=4           " number of visual spaces per TAB
            set softtabstop=4       " number of spaces in tab when editing
            set expandtab           " tabs are spaces
            filetype indent on      " load filetype-specific indent files
            filetype on             " Enable file type detection
            set number              " show line numbers
            set showcmd             " show command in bottom bar
            set cursorline          " highlight current line
            set wildmenu            " visual autocomplete for command menu
            set lazyredraw          " redraw only when we need to.
            set showmatch           " highlight matching [{()}]
            set incsearch           " search as characters are entered
            set hlsearch            " highlight matches
            colorscheme industry
            set backspace=indent,eol,start " backspace over everything in insert mode
            '';
        }
        )
    ];
}