call plug#begin()

if exists('g:vscode')
  " VSCode extension
  Plug 'tpope/vim-repeat'
  Plug 'chrisbra/matchit'
  Plug 'bkad/CamelCaseMotion'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-line'
  Plug 'kana/vim-textobj-user'
  Plug 'tpope/vim-surround'
  Plug 'rhysd/clever-f.vim'
else
  " ordinary Neovim
  Plug 'tpope/vim-repeat'
  Plug 'bkad/CamelCaseMotion'
  Plug 'chrisbra/matchit'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'rhysd/clever-f.vim'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-line'
  Plug 'kana/vim-textobj-user'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  "Plug 'machakann/vim-sandwich'
  Plug 'sheerun/vim-polyglot' " See http://www.drchip.org/astronaut/vim/#HILINKS for more info.
  Plug 'gerw/vim-HiLinkTrace'
  Plug 'dense-analysis/ale'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'gcmt/wildfire.vim'
  Plug 'preservim/nerdcommenter'
  Plug 'f-person/auto-dark-mode.nvim'
  Plug 'inkarkat/vim-ingo-library'
  Plug 'inkarkat/vim-EnhancedJumps'
  " Indent Guides
  "Plug 'nathanaelkane/vim-indent-guides'
  " Indent Lines
  Plug 'Yggdroot/indentLine'
  "Plug 'Valloric/MatchTagAlways'
  "Plug 'leafgarland/typescript-vim' " Covered by vim-polyglot.
  "Plug 'peitalin/vim-jsx-typescript'
  "Plug 'HerringtonDarkholme/yats.vim' " Included in Vim 8.2+.
endif

" Initialize plugin system
call plug#end()


syntax enable
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set number

" if (has("termguicolors"))
"   set termguicolors
" endif

" Allows for italics in vim. (https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic)
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" mappings
" map semi-colon to escape
"imap `` <esc>

" Enable Lightline or Airline. See vim-airline FAQ or Lightline Readme.
set laststatus=2

" By the way, -- INSERT -- is unnecessary anymore because the mode information is displayed in the statusline.
" set noshowmode

" Transparent Background
hi Normal guibg=NONE ctermbg=NONE
hi! NonText ctermbg=NONE guibg=NONE

" Hide Statusline
set laststatus=0

" Show Highlight Scope w/ F10
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" misc
" let... didn't work, but 'map' did.
" let mapleader = " "
map <space> <leader>

" Enable Highlight Search
set hlsearch" Highlight while search
set incsearch" Case Insensitivity Pattern Matching
set ignorecase" Overrides ignorecase if pattern contains upcase
set smartcase
" Press <leader> Esc to remove search highlights
" noremap <silent> <leader><cr> :noh<cr>
noremap <silent> <leader><esc> :noh<cr>

" This selects the next closest text object.
" map ß <Plug>(wildfire-fuel)
" map <leader>s <Plug>(wildfire-fuel)
" This selects the previous closest text object.
" vmap ® <Plug>(wildfire-water)
" vmap <leader>r <Plug>(wildfire-water)
"nmap <leader><Enter> <Plug>(wildfire-quick-select)

" hybrid line numbers
" turn hybrid line numbers on
:set number relativenumber
:set nu rnu
" turn hybrid line numbers off
:set nonumber norelativenumber
:set nonu nornu
" toggle hybrid line numbers
:set number! relativenumber!
:set nu! rnu!

" auto-toggle hybrid line numbers
:set number
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

" use matchit plugin
:packadd! matchit

" setup folding
set nofoldenable
set foldmethod=syntax

" Clever-f
let g:clever_f_smart_case=1
let g:clever_f_fix_key_direction=1

" Enhanced Jumps
let g:EnhancedJumps_no_mappings=1


if exists('g:vscode')
  " load vscode stuff...
else
  " ordinary Neovim

  " Lua Scripts
  lua require('autotheme')

  " Auto background mode based on .zshrc function
  if exists('theme') && theme == 'light'
    set background=light
  else
    set background=dark
  endif

endif
