call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
"Plug 'dense-analysis/ale'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neovim/nvim-lspconfig'

"" Rust Plugings
" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Completion framework
Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" See hrsh7th's other plugins for more completion sources!

" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'
call plug#end()

"let g:deoplete#enable_at_startup = 1

set background=dark
colorscheme gruvbox

set relativenumber
set number
set vb
set t_vb=

syntax enable
filetype plugin indent on

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF
-- nvim_lsp object
local nvim_lsp = require'lspconfig'

local opts = {
  tools = {
    autoSetHints = true,
    hover_with_actions = true,
    runnables = {
      use_telescope = true
      },
    inlay_hints = {
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
      },
    },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    loadOutDirsFromCheck = true,
    procMacro = true,
    },
  }

require('rust-tools').setup(opts)
EOF

" Set tab width to 2 columns
set tabstop=2
" Use 2 columns for indentation
set shiftwidth=2
" Use spaces when pressing <tab> key
set expandtab
set wildmenu
set lazyredraw
set scrolloff=15
set mouse=a
set nowrap