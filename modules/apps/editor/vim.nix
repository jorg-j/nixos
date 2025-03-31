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
                  start = [ vim-nix fzfWrapper fzf fzf-vim gruvbox ];
            opt = [];
          };
          vimrcConfig.customRC = ''

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
                        " :set autoindent
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
                        :set hidden

                        " new tab
                        map <F10> <Esc>:tabnew<CR>



                        " File Explorer open file in new buffer
                        map <leader>e <Esc>:E ./<CR>

                        " autocomplete
                        inoremap ,, <C-x><C-n>

                        " duplicate line with edits
                        map <leader>d <Esc>:t.

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
                        set backspace=indent,eol,start " backspace over everything in insert mode


            " Rust

            " Hash Map
            iab rhashcreate = HashMap::new();<HOME>let mut
            iab rhashinsert v.insert( , );<ESC>:s/v/
            iab rhashget v.get();<ESC>:s/v/

            " Match
            iab rmatch match x { foo::baa => outcome }

            " String
            iab rstring String::from("");<LEFT><LEFT><Left>

          '';
        }
    )
  ];
}
