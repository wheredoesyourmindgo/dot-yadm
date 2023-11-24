" Auto background mode based on .zshrc function
if exists('theme') && theme == 'light'
  set background=light
else
  set background=dark
endif

" download vim-plug if missing (this is handled by yadm bootstrap)
" if empty(glob("~/.vim/autoload/plug.vim"))
"   silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
"   autocmd VimEnter * silent! PlugInstall
" endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'bkad/CamelCaseMotion'
Plug 'chrisbra/matchit'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'rhysd/clever-f.vim'
"Plug 'relastle/bluewery.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
"Plug 'machakann/vim-sandwich'
Plug 'sheerun/vim-polyglot' " See http://www.drchip.org/astronaut/vim/#HILINKS for more info.
Plug 'gerw/vim-HiLinkTrace'
Plug 'dense-analysis/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'gcmt/wildfire.vim'
Plug 'preservim/nerdcommenter'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-EnhancedJumps'

" Lightline
"Plug 'itchyny/lightline.vim'

" Indent Guides
"Plug 'nathanaelkane/vim-indent-guides'

" Indent Lines
Plug 'Yggdroot/indentLine'

" Gruvbox
"Plug 'morhetz/gruvbox'
"Plug 'wheredoesyourmindgo/gruvbox-fork' " Forked from 'morhetz/gruvbox'
"Plug 'wheredoesyourmindgo/gruvbox-material-fork' " Forked from 'sainnhe/gruvbox-material'

"Solarized
""Plug 'altercation/vim-colors-solarized'
"Plug 'lifepillar/vim-solarized8'

"Plug 'Valloric/MatchTagAlways'

"Plug 'leafgarland/typescript-vim' " Covered by vim-polyglot.
"Plug 'peitalin/vim-jsx-typescript'
"Plug 'HerringtonDarkholme/yats.vim' " Included in Vim 8.2+.

" Airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'


" Initialize plugin system
call plug#end()


syntax enable
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set number

" if (has("termguicolors"))
  " set termguicolors
" endif

" let g:airline_powerline_fonts = 1 " with ligatures
""let g:airline_powerline_fonts = 0 " without ligatures

" Allows for italics in vim. (https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic)
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" mappings
" map semi-colon to escape
"imap `` <esc>

" Solarized8
"let g:solarized_termtrans=1
"let g:solarized_use16=1
"let g:solarized_italics=1 " needs to be before colorscheme to remove gray background
""set background=light
""set background=dark
"colorscheme solarized8
"let g:airline_theme='solarized'
""let g:lightline = {
 ""\ 'colorscheme': 'solarized'
 ""\ }


" Shift modifier doesn't work with vim in conjunction with ctrl modifier
"call togglebg#map("<c-s-s>")

" Enable Lightline or Airline. See vim-airline FAQ or Lightline Readme.
" set laststatus=2

" By the way, -- INSERT -- is unnecessary anymore because the mode information is displayed in the statusline.
" set noshowmode

" Transparent Background
hi Normal guibg=NONE ctermbg=NONE
hi! NonText ctermbg=NONE guibg=NONE

" Hide Statusline
set laststatus=0

function! ToggleSchemeColor()
  " Swap background
  " let &background = ( &background == "dark"? "light" : "dark" )
  " if exists("g:colors_name")
  "     exe "colorscheme " . g:colors_name
  " endif

  " Swap Lightline too
  "call lightline#init()
  ""execute 'source' globpath(&rtp, 'autoload/lightline/colorscheme/gruvbox_material.vim')
  "execute 'source' globpath(&rtp, 'autoload/lightline/colorscheme/solarized.vim')
  "call lightline#colorscheme()
  "call lightline#update()

  " Swap Airline too
  " if exists("g:airline_theme")
      " exe "AirlineTheme " . g:airline_theme
  " endif
endfunction

"nnoremap <silent><c-o> :call ToggleSchemeColor()<CR>

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