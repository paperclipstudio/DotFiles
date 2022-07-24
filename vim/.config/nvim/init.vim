source ~/.config/nvim/general/remapping.vim
source ~/.config/nvim/general/settings.vim

set fileformats=unix

call plug#begin('~/.config/mvim/plugged')
" Style status bar
source ~/.config/nvim/plugins/lightline.vim
Plug 'morhetz/gruvbox'
"" Rust Plugings
" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
Plug 'neovim/nvim-lsp'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Pocco81/AutoSave.nvim'
call plug#end()


set background=dark
colorscheme gruvbox
lua<<EOF
-- require'lspconfig'.rust_analyzer.setup{}
EOF
syntax enable
filetype plugin indent on


lua << EOF
local autosave = require("autosave")

autosave.setup(
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)
EOF
