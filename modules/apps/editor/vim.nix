{
  config,
  pkgs,
  vars,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (
      with import <nixpkgs> {};
        vim_configurable.customize {
          # Specifies the vim binary name
          # E.g. set this to "my-vim" and you need to type "my-vim" to open this vim
          # This allows to have multiple vim packages installed (e.g. with a different set of plugins)
          name = "vim";
          vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
            start = [vim-nix];
            opt = [];
          };
          vimrcConfig.customRC = ''

            :set nocompatible
            :set number

            " generate backups dir and set backups to on
            " silent !mkdir ~/.vim/backups > /dev/null 2>&1
            set backup
            set backupdir=/tmp      " save backup files (~) to /tmp

            " Programming
            :set tabstop=4
            :set expandtab
            :set ignorecase
            :set smartcase
            :set mouse=a
            autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
            :set autoindent
            syntax on
            syntax enable

            " Terminal
            nnoremap <F6> :wa \| vertical botright term ++kill=term<CR>
            " \t terminal
            map <leader>t :vertical botright term ++kill=term<CR>

            " \s will refresh the vimrc file
            map <leader>s :source ~/.vimrc<CR>


            " Spelling
            iab tks thanks
            iab teh the
            iab iv I've
            iab dont don't
            iab im I'm


            " Gherkin
            iab gv GIVEN
            iab tn THEN
            iab wn WHEN
            iab n and


            set softtabstop=4       " number of spaces in tab when editing

            filetype indent on      " load filetype-specific indent files
            filetype on             " Enable file type detection
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
