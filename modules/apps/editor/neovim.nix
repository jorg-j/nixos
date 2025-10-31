{
  config,
  pkgs,
  vars,
  ...
}: {

  environment.systemPackages = with pkgs; [
    neovim           # Neovim itself
    ripgrep          # For Telescope live_grep
    fd               # For Telescope file finder
    tree-sitter      # Treesitter CLI
    glow             # Markdown preview (for glow.nvim)
    zk               # Zettelkasten CLI (if available)
    gcc
    wl-clipboard
    wayclip
    # nodejs           # Optional: Needed for some plugins
  ];
  fonts.packages = with pkgs; [ nerd-fonts._0xproto ];


  environment.variables.EDITOR = "nvim";
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    configure = {
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [fzf-vim gruvbox];
      };
      customRC = ''
        :set number

        " generate backups dir and set backups to on
        " silent !mkdir ~/.vim/backups > /dev/null 2>&1
        " set backup
        " set backupdir=/tmp      " save backup files (~) to /tmp

        " Programming
        :set tabstop=4
        :set expandtab
        :set ignorecase
        :set smartcase
        :set mouse=a
        :set autoindent
        syntax on
        syntax enable

        " search
        :set wildmode=list:longest,list:full

        " Terminal
        nnoremap <F6> :wa \| vertical botright term ++kill=term<CR>
        " \t terminal
        map <leader>t :vertical botright term ++kill=term<CR>

        " python
        autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

        " \s will refresh the vimrc file
        map <leader>s :source ~/.vimrc<CR>

        " allow eaasier navigation between splits ctrl + h j k l
        nnoremap <C-J> <C-W><C-J>
        nnoremap <C-K> <C-W><C-K>
        nnoremap <C-L> <C-W><C-L>
        nnoremap <C-H> <C-W><C-H>


        " set the split to right and below
        :set splitright
        :set splitbelow

        " buffer
        nnoremap <leader>b :ls<CR>:b<Space>


        " Spelling
        iab tks thanks
        iab teh the
        iab iv I've
        iab dont don't
        iab im I'm


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
        colorscheme gruvbox
      '';
    };
  };
}
