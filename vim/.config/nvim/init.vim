source ~/.config/nvim/general/remapping.vim
source ~/.config/nvim/general/settings.vim

set fileformats=unix

call plug#begin('~/.config/mvim/plugged')
" Style status bar
source ~/.config/nvim/plugins/lightline.vim
Plug 'vhda/verilog_systemverilog.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
"Plug 'dense-analysis/ale'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neovim/nvim-lspconfig'
"Plug 'noahfrederick/vim-composer', {'for': ['php']}
Plug 'sheerun/vim-polyglot'
" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
"Plug 'tpope/vim-dispatch', {'for': ['php']}
"Plug 'tpope/vim-projectionist', {'for': ['php']}
"Plug 'noahfrederick/vim-laravel', {'for': ['php']}

"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'

"" Rust Plugings
" Collection of common configurations for the Nvim LSP client
"Plug 'neovim/nvim-lspconfig'

" Completion framework
""Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
""Plug 'hrsh7th/cmp-nvim-lsp'

" Snippet completion source for nvim-cmp
""Plug 'hrsh7th/cmp-vsnip'

" Other usefull completion sources
""Plug 'hrsh7th/cmp-path'
""Plug 'hrsh7th/cmp-buffer'

" See hrsh7th's other plugins for more completion sources!

" To enable more of the features of rust-analyzer, such as inlay hints and more!
"Plug 'simrat39/rust-tools.nvim'
call plug#end()

"let g:deoplete#enable_at_startup = 1

set background=dark
colorscheme gruvbox
lua<<EOF
require'lspconfig'.rust_analyzer.setup{}
EOF
syntax enable
filetype plugin indent on

" NERDTREE
" Open with control F
nmap <C-f> :NERDTreeToggle<CR>
" Close if the only thing open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
" set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
" et shortmess+=c

" Configure LSP
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF
-- nvim_lsp object
-- local nvim_lsp = require'lspconfig'

-- local opts = {
--  tools = {
    --autoSetHints = true,
    --hover_with_actions = true,
    --runnables = {
      --use_telescope = true
      --},
    --inlay_hints = {
      --show_parameter_hints = false,
      --parameter_hints_prefix = "",
      --other_hints_prefix = "",
      --},
    --},

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  --server = {
    --loadOutDirsFromCheck = true,
    --procMacro = true,
    --},
  --}

--require('rust-tools').setup(opts)
--EOF
