"""" Esto es Vim, no vi
if &compatible
  set nocompatible " Desactivamos compatibilidad con vi
endif

let g:python3_host_prog = '/usr/bin/python3'

"""" Usamos vim-plug para administrar los plugins
"""" asi que aca lo instalamos en caso de que no este instalado.
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Inicio de config de vim-plug y requerimientos de plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" Cargamos los plugins desde el directorio que los contiene
call plug#begin(expand('~/.config/nvim/plugged'))

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins a instalar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" Esquema de colores
Plug 'nanotech/jellybeans.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'


"""" Snippets
Plug 'SirVer/ultisnips' "Engine
Plug 'mlaursen/vim-react-snippets' " ReactJS y Typescript snippets
Plug 'honza/vim-snippets' "Snippets repo


"""" Lenguajes/Frameworks

" HTML
Plug 'othree/html5.vim'

" Ruby/Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Elixir
"Plug 'elixir-lang/vim-elixir'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Javascript
Plug 'pangloss/vim-javascript'

" ReactJS
Plug 'maxmellon/vim-jsx-pretty'

" Svelte
Plug 'evanleck/vim-svelte', {'branch': 'main'}

" Astro
Plug 'wuelnerdotexe/vim-astro'

"""" Herramientas
"NERDTree navegador de carpetas y archivos
Plug 'preservim/nerdtree'

" vim-airline barra de estado e informacion
Plug 'vim-airline/vim-airline'

" vim-fugitive soporte Git en Vim y complemento para vim-airline
Plug 'tpope/vim-fugitive'

" neoformat formateador de codigo para multiples lenguajes
Plug 'sbdchd/neoformat'

" vim-commentary comentar/descomentar codigo
Plug 'tpope/vim-commentary'

" vim-surround rodear texto con ", ', (), [], {}, etc
Plug 'tpope/vim-surround'

" identLine muestra lineas verticales para cada nivel de identacion
Plug 'Yggdroot/indentLine'

" delimitMate Cierra automaticamente comillas, parentesis, etc
Plug 'Raimondi/delimitMate'

" emmet-vim expande extructuras de etiquetas html en un comando basico.
" Ctrl-y ,
Plug 'mattn/emmet-vim'

" Configuraciones para LSP en NVIM
Plug 'neovim/nvim-lspconfig'

" Motor de autocompletado
Plug 'hrsh7th/cmp-nvim-lsp' " Source NVIM LSP para el plugin de autocompleado nvim-cmp
Plug 'hrsh7th/cmp-buffer'   " Soporte para usar el buffer como source de autocompletado en nvim-cmp
Plug 'hrsh7th/cmp-path'     " Soporte para autocompletar rutas/carpetas/archivos en nvim-cmp
Plug 'hrsh7th/cmp-cmdline'  " Soporte para autocompletado en la cmdline de nvim
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'hrsh7th/nvim-cmp' " Motor de autocompletado.

"""Tentativos""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Los siguientes son plugins que me gustaria colocar, pero que todavia
" estoy evaluando si realmente los necesito o evaluando su configuracion
"
"Plug 'godlygeek/tabular' " Ordena/alinea texto
"Plug 'itchyny/lightline.vim' " Reemplazo de vim-airline
"Plug 'sheerun/vim-polyglot' " Resaltado de sintaxis e identacion para un
"monton de lenguajes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()
" This call automatically executes:
"    filetype plugin indent on and syntax enable.
" You can revert the settings after the call.
"    filetype indent off, syntax off, etc.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fin de config de vim-plug y requerimientos de plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menu,menuone,noselect

" Carga del namespace de configuraciones en Lua de plugins
lua require('luasetup')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ajustes Visual
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Mejora en los colores, necesario en algunos colorscheme
if has('termguicolors')
  set termguicolors
endif

" Jellybeans
"let g:jellybeans_use_term_background_color = 0  "solo para jellybeans
"let g:jellybeans_use_term_italics = 1
colorscheme jellybeans

" Gruvbox
" let g:gruvbox_material_background = 'hard' "Options: 'hard', 'medium'(default), 'soft'
" let g:gruvbox_material_better_performance = 1
" let g:gruvbox_material_foreground = 'original' "Options 'material'(default), 'mix', 'original'
" colorscheme gruvbox-material
" let g:airline_theme = 'gruvbox_material'

" Sonokai
" let g:sonokai_style = 'andromeda'  "Options: 'default', 'atlantis', 'andromeda', 'shusia', 'maia', `'espresso'
" let g:sonokai_better_performance = 1
" colorscheme sonokai
" let g:airline_theme = 'sonokai'


"marca el ancho maximo que deberia tener una linea
set colorcolumn=80                                       " Esta linea de aca =>

"soporte de 256 colores en vim
set t_Co=256

"enumerar las lineas
set number

"Resalta la linea donde esta el cursorline"
set cursorline

"Marca para visualizar el quiebre de lineas largas
set showbreak=↪   

"muestra tabulaciones, fin de linea, espacios, etc.
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:⋅,nbsp:.

"mostrar opciones de completado de comandos, al presionar Tab
"mientras se escribe un comando
set wildmode=list:longest,list:full

"resaltado de syntaxys sincronizado
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"NO hacer salto de lineas largas
set wrap "ACTIVADO. las lineas seran mas largas si excede ancho de ventana

"Esconde la visualizacion del modo en el que se esta
"set noshowmode


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ajustes Basicos
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" Codificacion

"Ajuste de codificacion de caracteres para el archivo en el buffer
set fileencoding=utf-8

"Lista de tipos de codificacion de caracteres que vim puede usar
set fileencodings=utf-8


"""" Identacion
" Podria sobre-escribirse o cambiar mas abajo dependiendo del archivo

"Numero de espacios que cuenta un <Tab> en el archivo.
set tabstop=2
"
"Numero de espacios que equivaldrian a un <Tab>
set softtabstop=0

"sangrado automatico al saltar la linea de 4 espacios
set shiftwidth=2

"sangrado con espacios y no con tabulacion <Tab>.
set expandtab


"""" Busqueda

"Busquedas no distinguen mayusculas y minusculas
set ignorecase

"""" Buffers



"""" Utiles

"Vim recuerda la posicion del cursor al reabrir un archivo.
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Comportamiento y mapeos
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapea <leader> a la tecla \  (backslash)
let mapleader = "\\"

"Copiar, Cortar y Pegar con las teclas \y \d y \pP
"Copiado en modo Visual con \y
vmap <Leader>y "+y
"Cortar en modo Visual con \d
vmap <Leader>d "+d
"Pegado en modo Normal con \p o \P
nmap <Leader>p "+p
nmap <Leader>P "+P
"Pegado en modo Visual con \p o \P
vmap <Leader>p "+p
vmap <Leader>P "+P

"""" Atajos utiles, cuando te equivocas escribiendo alguno de estos comandos
"ejemplo :w para guardar, si escribes rapido posiblemente escribas :W
cnoreabbrev W w
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev Q q
cnoreabbrev Qall qall

"Vmap para mantener el Visual Mode despues de presionar shift > y <
vmap < <gv
vmap > >gv
"Util cuando se mueve bloques de texto seleccionado con shift > o <
"en modo visual y no quieres que se salga del modo automaticamente

" Limpia las busquedas resaltadas con \space
nnoremap <silent> <leader><space> :noh<cr>

"Moverse entre Buffers
"buffer anterior \z o \q
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
"buffer siguiente \x o \w
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"Elimina el buffer actual, sin eliminar la ventana
noremap <leader>c :bp<bar>sp<bar>bn<bar>bd<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ajustes por lenguaje
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" HTML
"identacion
" augroup vimrc-html
"   autocmd!
"   autocmd Filetype html setlocal ts=2 sw=2 expandtab
" augroup END

"""" Javascript
"identacion
" augroup vimrc-javascript
"   autocmd!
"   autocmd FileType javascript setl tabstop=2|setl shiftwidth=2|setl expandtab softtabstop=2
"   autocmd FileType javascriptreact setl tabstop=2|setl shiftwidth=2|setl expandtab softtabstop=2
" augroup END

"""" Go
"identacion
augroup vimrc-golang
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
augroup END

"""" Ruby
"Identacion
augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ajustes por Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" NERDTree
" Abre/Cierra NERDTree con F3
nnoremap <silent> <F3> :NERDTreeToggle<CR>

"Inicia  NERDTree cuando Vim es iniciado sin especificar un archivo"
augroup vimrc-nerdtree-autostart
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
augroup END

" Tamano de ventana de NERDTreee
let g:NERDTreeWinSize = 40


""" Neoformat
"Ejecuta Neoformat con \fm
nnoremap <leader>fm :Neoformat<CR>


"""" vim-ruby
"Resalta operadores
let ruby_operators        = 1

"Resalta pseudo operadores ., &., ::, *, **, &, <, << and ->.
let ruby_pseudo_operators = 1

"Resalta Whitespace errors
let ruby_space_errors = 1

"""" vimrc-javascript
"Resaltado de sintaxis para JSDOCs
let g:javascript_plugin_jsdoc = 1

"""" vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1

"""" vim-go
"Highlight struct and interface names.
let g:go_highlight_types = 1

"Highlight struct field names.
let g:go_highlight_fields = 1

"Highlight function and method declarations.
let g:go_highlight_functions = 1

"Highlight the variable names in parameters (including named return parameters) in function declarations.
let g:go_highlight_function_parameters = 1 "" podria generar confusion

"Highlight function and method calls.
let g:go_highlight_function_calls = 1

"Highlight operators such as `:=` , `==`, `-=`, etc.
let g:go_highlight_operators = 1

"Highlight commonly used library types (`io.Reader`, etc.).
let g:go_highlight_extra_types = 1

"Highlight printf-style formatting verbs inside string literals.
let g:go_highlight_format_strings = 1

"Highlight variable names in variable declarations (`x` in ` x :=`).
let g:go_highlight_variable_declarations = 1 "" podria generar confusion

"Highlight variable names in variable assignments (`x` in `x =`).
let g:go_highlight_variable_assignments = 1 "" podria generar confusion


"""" vim-airline
"Muestra los buffers en la parte superior, si solo hay un tab abierto
let g:airline#extensions#tabline#enabled = 1

"Utiliza simbolos airline si se esta usando una fuente powerline
let g:airline_powerline_fonts = 1

"Muestra rama Git, Requiere vim-fugitive
let g:airline#extensions#branch#enabled = 1

"Define lista vacia de simbolos airline si no existe
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"Define simbolos unicode
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

"Define simbolos powerline si soporte de fuente powerline desactivada
if get(g:, 'airline_powerline_fonts', 0)
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
  let g:airline_symbols.maxlinenr= ''
endif
