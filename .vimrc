"set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?

let g:byoa_keymap='e-drafting'

" Auto background mode based on .zshrc function
if exists('theme') && theme == 'light'
  set background=light
else
  set background=dark
endif

" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'wheredoesyourmindgo/vim-byoa', { 'branch': 'main' }
"Plug 'rhysd/clever-f.vim'
"Plug 'relastle/bluewery.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
Plug 'sheerun/vim-polyglot' " See http://www.drchip.org/astronaut/vim/#HILINKS for more info.
Plug 'gerw/vim-HiLinkTrace'

Plug 'dense-analysis/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'gcmt/wildfire.vim'
Plug 'preservim/nerdcommenter'

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
Plug 'altercation/vim-colors-solarized'

Plug 'lifepillar/vim-solarized8'

"Plug 'Valloric/MatchTagAlways'

"Plug 'leafgarland/typescript-vim' " Covered by vim-polyglot.
"Plug 'peitalin/vim-jsx-typescript' 
"Plug 'HerringtonDarkholme/yats.vim' " Included in Vim 8.2+.

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Initialize plugin system
call plug#end()


syntax enable
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set number

if (has("termguicolors"))
  set termguicolors
endif

let g:airline_powerline_fonts = 1 " with ligatures
"let g:airline_powerline_fonts = 0 " without ligatures

" Allows for italics in vim. (https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic)
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" mappings
" map semi-colon to escape
"imap `` <esc>

"" Gruvbox
"if (has("termguicolors"))
  "set termguicolors
"endif
"let g:gruvbox_contrast_dark="medium" " one of: soft, medium, hard
"let g:gruvbox_contrast_light="medium" " one of: soft, medium, hard
"set background=dark
"let g:gruvbox_bold=1
"let g:gruvbox_italic=1
""let g:gruvbox_invert_indent_guides=1
"let g:airline_theme='gruvbox'
""let g:lightline = {
  ""\ 'colorscheme': 'gruvbox',
  ""\ }
""colorscheme gruvbox-fork
"colorscheme gruvbox


"" Solarized
""set background=light
"set background=dark
"let g:solarized_termtrans=1 " needs to be before colorscheme to remove gray background
"let g:solarized_bold=1 " needs to be before colorscheme to remove gray background
"let g:solarized_italic=1 " needs to be before colorscheme to remove gray background
"let g:solarized_underline=1 " needs to be before colorscheme to remove gray background
"colorscheme solarized
"let g:airline_theme='solarized'
""let g:lightline = {
  ""\ 'colorscheme': 'solarized'
  ""\ }

" Solarized8
let g:solarized_termtrans=1
let g:solarized_use16=1
let g:solarized_italics=1 " needs to be before colorscheme to remove gray background
"set background=light
"set background=dark
colorscheme solarized8
let g:airline_theme='solarized'
""let g:lightline = {
 ""\ 'colorscheme': 'solarized'
 ""\ }

" Lucius
""let g:lucius_style='dark'  " (default: 'dark') 
"" Set this option to either 'light' or 'dark' for your desired color scheme. It has the same effect as setting the background. 
"let g:lucius_contrast='normal'  " (default: 'normal') 
"" This option determines the contrast to use for text/ui elements. It can be set to 'low', 'normal', or 'high'. At this time there is no 'high' for the light scheme. 
"let g:lucius_contrast_bg='normal' " (default: 'normal') 
""Setting this option makes the background a higher contrast. Current settings are 'normal' and 'high'. 
"let g:lucius_use_bold=1 " (default: 1) 
"" Setting this will cause the color scheme to use bold fonts for some items. 
"let g:lucius_use_underline=1 " (default: 1) 
"colorscheme lucius
"let g:airline_theme='lucius'

"colorscheme bluewery
"set termguicolors
"let g:lightline = { 'colorscheme': 'bluewery' }

"" Gruvbox Material Fork
"" Enable true color 启用终端24位色
"if (has("termguicolors"))
"  set termguicolors
"endif
"" for dark version
"set background=dark
""" for light version
"""set background=light
"" set contrast
"" this configuration option should be placed before `colorscheme gruvbox-material`
"" available values: 'hard', 'medium'(default), 'soft'
"let g:gruvbox_material_background = 'medium'
"let g:gruvbox_material_enable_bold = 1
"let g:gruvbox_material_enable_italic = 1
"let g:gruvbox_material_palette = 'mix'
"colorscheme gruvbox-material-fork
"let g:airline_theme = 'gruvbox_material'
""let g:lightline = {'colorscheme' : 'gruvbox_material'}

" Shift modifier doesn't work with vim in conjunction with ctrl modifier
call togglebg#map("<c-s-s>")

" Enable Lightline or Airline. See vim-airline FAQ or Lightline Readme.
set laststatus=2

" By the way, -- INSERT -- is unnecessary anymore because the mode information is displayed in the statusline.
set noshowmode

" Transparent Background
"hi Normal guibg=NONE ctermbg=NONE
"hi! NonText ctermbg=NONE guibg=NONE


function! ToggleSchemeColor()
  "if g:ayucolor == "light"
      "let g:ayucolor="dark"
  "else
      "let g:ayucolor="light"
  "endif
  "colorscheme ayu
  
  " Swap background
  let &background = ( &background == "dark"? "light" : "dark" )
  if exists("g:colors_name")
      exe "colorscheme " . g:colors_name
  endif

  " Swap Lightline too
  "call lightline#init()
  ""execute 'source' globpath(&rtp, 'autoload/lightline/colorscheme/gruvbox_material.vim')
  "execute 'source' globpath(&rtp, 'autoload/lightline/colorscheme/solarized.vim')
  "call lightline#colorscheme()
  "call lightline#update()
  
  " Swap Airline too
  if exists("g:airline_theme")
      exe "AirlineTheme " . g:airline_theme
  endif
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


"let g:clever_f_smart_case=1

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
