"Automatic reloading of .vimrc"
autocmd! bufwritepost .vimrc source %

"Better copy paste"
set pastetoggle=<F2>
set clipboard=unnamed

"Rebind <Leader> key
let mapleader=","

"Show Whitespace"
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/

"Color Scheme"
set t_Co=256
color wombat256mod

"Enable syntax highlighting"
filetype off
filetype plugin indent on
syntax on

"Showing line numbers and length"
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=44

" Real programmers dont use TABs but spaces"
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

"Disable stupid backup and swap files - they trigger too many events
"for file system watchers
set nobackup
set nowritebackup
set noswapfile

"Setup Pathogen to manage your plugins
call pathogen#infect()


"============================================================================
"Python IDE Setup
"============================================================================

"Settings for Powerling
set laststatus=2

"Settings for ctrlp
let g:ctrlp_max_height=30
set wildignore+=*.pyc
set wildignore+=*_bundle/*
set wildignore+=*/coverage/*

"Settings for python-mode
map <Leader>p :call RopeGotoDefinition()<CR>
let ropevim_enable_shorcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() #BREAKPOINT<C-c>

"Better navigation through omnicomplete option list
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

"Python folding
set nofoldenable
