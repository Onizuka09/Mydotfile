let mapleader=" "
filetype plugin indent off
:set nospell
:set clipboard+=unnamedplus
:set relativenumber
:set bg=dark
:set expandtab
:set number
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set smarttab 
:set softtabstop=2
:set mouse=a	
:set showmatch " Shows matching brackets
:set ruler " Always shows location in file (line#)
" :set guicursor=n-v-c-i:block
:set guicursor=i:ver25-iCursor

function! TabIndent()
    let col = col('.')
    if col == 1
        set tabstop=4
        set shiftwidth=4
        set expandtab
    else
        set tabstop=4
        set shiftwidth=4
        set noexpandtab
    endif
endfunction

call plug#begin()
"auto-pairs complets opening (,[, ",{ ..   

Plug 'jiangmiao/auto-pairs'

Plug 'kamykn/popup-menu.nvim'
"plugin for gn build systems ( generates NINJA files )
Plug 'https://github.com/kalcutter/vim-gn'
" 
"Plug 'neovim/nvim-lspconfig' " Language Server Protocol Config
Plug 'dense-analysis/ale'
Plug 'ayu-theme/ayu-vim' " ayu color schem 
Plug 'kamykn/spelunker.vim' " for spell checking 
Plug 'voldikss/vim-floaterm' " floating terminal 
Plug 'vim-scripts/c.vim'    "pluging for C   
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax and code analysis
Plug 'p00f/nvim-ts-rainbow'
Plug 'dhruvasagar/vim-table-mode'  " table mode using CTRL-D 
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
" C and cpp text formatting 
Plug 'cjuniet/clang-format.vim'
Plug 'mhartington/formatter.nvim'
Plug 'vimwiki/vimwiki'
" plugins for vim makrdows
Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npx --yes yarn install'}
" a new coc , conquer of completion 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" plugin for fzf 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" gurvbox theme installation 
Plug 'morhetz/gruvbox'
" ccls plugin to install 
Plug 'm-pilia/vim-ccls'
" highlighting 
Plug 'jackguo380/vim-lsp-cxx-highlight'
" plugin for neovim 
Plug 'normen/vim-pio'
" for make 
Plug 'tpope/vim-dispatch'
" vim tmux nav 
Plug'christoomey/vim-tmux-navigator'
call plug#end()					

" consfis for vim auto-apirs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
" set up template for cpp 
function! PromptForTemplate()
    let choice = input("Use template for new C++ file? (y/n): ")
    return (tolower(choice) == 'y')
endfunction

autocmd BufNewFile *.cpp if PromptForTemplate() | 0r ~/.config/nvim/templates/skeleton.cpp | endif


"Float term setu 
nnoremap <C-t> :FloatermToggle<CR>
" augroup FloatermMapping
     autocmd!
     autocmd FileType floaterm nnoremap <buffer> <Esc> <C-\><C-n>:FloatermToggle<CR>
     autocmd FileType floaterm inoremap <buffer> <Esc> <C-\><C-n>:FloatermToggle<CR>
 augroup end
tnoremap <Esc> <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_wintype='split'
let g:floaterm_height=0.3
 " nnoremap <leader><t> :FloatermNew
" setup tree-sitter 
" Plugin: nvim-treesitter/nvim-treesitter {{{
if has_key(plugs, 'nvim-treesitter')
	lua << EOF
		-- Treesitter configuration
		require('nvim-treesitter.configs').setup {
			-- If TS highlights are not enabled at all, or disabled via `disable` prop,
			-- highlighting will fallback to default Vim syntax highlighting
			highlight = {
				enable = true, -- false will disable the whole extension
				extended_mode = true,
			use_languagetree = true,
			disable = {}, -- list of language that will be disabled
				-- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
				-- Required for spellcheck, some LaTex highlights and
				-- code block highlights that do not have ts grammar
				additional_vim_regex_highlighting = {'org'},
			},
			rainbow = {
				enable = true,
				extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
				max_file_lines = nil, -- Do not enable for files with more than n lines, int
				colors = {}, -- table of hex strings
				termcolors = {} -- table of colour name strings
			},
			ensure_installed = {'org', 'c'},
		}
EOF
endif

" ------------- 
"  set up template for c 
"
"
"  ------------
"keyboard setings for terminal mode 
:tnoremap <Esc> <C-\><C-n>

"Setup Gruvbox 

"colorscheme gruvbox
"let g:gruvbox_contrast_dark = 'hard'
" set background=dark
" ayu theme
set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

"----- keybindings for formatting ---- 
nnoremap <silent> <leader>f :Format<CR>
nnoremap <silent> <leader>F :FormatWrite<CR>

" setup for Nterdfont Tagbar 
"nnoremap <C-f> :NERDTreeFocus<CR>
set encoding=UTF-8
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" keybindings for vim 
" map C-p wit fzf to search for files in vim 
nnoremap <C-P> :Files<CR> 
" to open the file you can hit enter to oepn it or 
" C-t to open in other tab 
" C-v to open in vertical split 
" C-x  to opeb in horizontal split 

" map CTRL-E to end-of-line (insert mode)
nnoremap <C-x> :<esc>$i<right>
" map CTRL-A to beginning-of-line (insert mode)
nnoremap <C-a> :<esc>0i
" map CTRLto normal mode 
"nnoremap <A-w> :i<CR>
"nnoremap <C-s> :w<CR>
nnoremap <C-q> :q<CR>
"-------------------
:set completeopt-=preview " For No Previews
"________________________
" configuration for vimwiki
set nocompatible "vimwiki"
filetype plugin on
syntax on
"___________________
" settings for vim table 
" | to create a new line 
" || to create a seperate(-----+-----) line 
nnoremap <C-d> :TableModeToggle<CR>
let g:table_mode_corner_corner='|'
let g:table_mode_header_fillchar='-'
"--------------------
"COCmode enbaling

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Navigate coc susggestion with Left and right arrow 
"inoremap <expr> <Down> coc#pum#visible() ? "<C-n>" :"<Down>"
"inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_preferences = {
      \ 'jumpCommand': 'tabe',
      \ }

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)<CR>
nmap <leader>f  <Plug>(coc-format-selected)<CR>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"-----------------------
"NerdTree Setup 
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
"-------------------------------
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
"let let g:ficus_python = 'python3'

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"				
let g:python3_host_prog = '/usr/bin/python3'
     
":set clipboard=unnamedplus

"-----------------------------
":let g:languagetool_jar='/home/moktar/.config/nvim/LanguageTool-5.2/languagetool-commandline.jar'
" :LanguageToolCheck 
"----------------------------- 
"vim wiki configuration 

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]
let g:vimwiki_global_ext = 0

"--------------
"autocmd BufEnter *.md colorscheme deus
"set t_Co=256
"set termguicolors

"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"set background=dark    " Setting dark mode
"colorscheme deus
"let g:deus_termcolors=256
":color deus
"----------------------- 
"multiple files and tabs in vim 
"hidden buffers when i open vim * only the first file will appear and the
"others will be hidden
"
" iamcco/markdown-preview.nvim
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css=fnameescape($HOME).'/.local/lib/github-markdown-css/github-markdown.css'

"----------------- ccls conf " ------ 

" primeagen configs must have 
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
" sets up whehere to to use Files or Git files command in FZF
function! GFilesFallback()
  let output = system('git rev-parse --show-toplevel') " Is there a faster way?
  let prefix = get(g:, 'fzf_command_prefix', '')
  if v:shell_error == 0
    exec "normal :" . prefix . "GFiles\<CR>"
  else
    exec "normal :" . prefix . "Files\<CR>"
  endif
  return 0
endfunction

nnoremap <C-p> :call GFilesFallback()<CR>
nnoremap <C-k> :cnext<CR>
nnoremap <C-j> :cprev<CR>
nnoremap <C-E> :copen<CR>


" spell checker 

let g:enable_spelunker_vim = 1

" Enable spelunker.vim on readonly files or buffer. (default: 0)
" 1: enable
" 0: disable
let g:enable_spelunker_vim_on_readonly = 0

" Check spelling for words longer than set characters. (default: 4)
let g:spelunker_target_min_char_len = 4

" Max amount of word suggestions. (default: 15)
let g:spelunker_max_suggest_words = 15

" Max amount of highlighted words in buffer. (default: 100)
let g:spelunker_max_hi_words_each_buf = 100

" Spellcheck type: (default: 1)
" 1: File is checked for spelling mistakes when opening and saving. This
" may take a bit of time on large files.
" 2: Spellcheck displayed words in buffer. Fast and dynamic. The waiting time
" depends on the setting of CursorHold `set updatetime=1000`.
let g:spelunker_check_type = 1

" Highlight type: (default: 1)
" 1: Highlight all types (SpellBad, SpellCap, SpellRare, SpellLocal).
" 2: Highlight only SpellBad.
" FYI: https://vim-jp.org/vimdoc-en/spell.html#spell-quickstart
let g:spelunker_highlight_type = 1

" Option to disable word checking.
" Disable URI checking. (default: 0)
let g:spelunker_disable_uri_checking = 1

" Disable email-like words checking. (default: 0)
let g:spelunker_disable_email_checking = 1

" Disable account name checking, e.g. @foobar, foobar@. (default: 0)
" NOTE: Spell checking is also disabled for JAVA annotations.
let g:spelunker_disable_account_name_checking = 1

" Disable acronym checking. (default: 0)
let g:spelunker_disable_acronym_checking = 1

" Disable checking words in backtick/backquote. (default: 0)
let g:spelunker_disable_backquoted_checking = 1

" Disable default autogroup. (default: 0)
let g:spelunker_disable_auto_group = 1

" Create own custom autogroup to enable spelunker.vim for specific filetypes.
augroup spelunker
  autocmd!
  " Setting for g:spelunker_check_type = 1:
  autocmd BufWinEnter,BufWritePost *.js,*.jsx,*.json,*.md call spelunker#check()

  " Setting for g:spelunker_check_type = 2:
  autocmd CursorHold *.js,*.jsx,*.json,*.md call spelunker#check_displayed_words()
augroup END

" Override highlight group name of incorrectly spelled words. (default:
" 'SpelunkerSpellBad')
let g:spelunker_spell_bad_group = 'SpelunkerSpellBad'

" Override highlight group name of complex or compound words. (default:
" 'SpelunkerComplexOrCompoundWord')
let g:spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'

" Override highlight setting.
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE


" Enable spelunker.vim on readonly files or buffer. (default: 0)
" 1: enable
" 0: disable
"
"
"// lsp configuratiuon 
" Ignore git commit when linting (highly annoying)
let g:ale_pattern_options = {
    \       'COMMIT_EDITMSG$': {'ale_linters': [], 'ale_fixers': []}
    \   }
let g:ale_linters = {
    \   'yaml': ['yamllint'],
    \   'cpp': ['clangtidy'],
    \   'c': ['clangtidy'],
    \   'asciidoc': ['cspell'],
    \   'markdown': ['cspell']
    \   }
let g:ale_fixers = {
    \   'cpp': ['clang-format'],
    \   'c': ['clang-format']}
 
" Automatic fixing
autocmd FileType c nnoremap <leader>f <Plug>(ale_fix)
 
" General settings
let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_balloons=1
let g:ale_hover_to_floating_preview=1
let g:ale_use_global_executables = 1
let g:ale_sign_column_always = 1
let g:ale_disable_lsp = 1
 
" C++ linting
let g:ale_cpp_clangtidy_options = '-checks=-*,cppcoreguidelines-*'
let g:ale_cpp_clangtidy_checks = ['readability-*,performance-*,bugprone-*,misc-*']
let g:ale_cpp_clangtidy_checks += ['clang-analyzer-cplusplus-doc-comments']
 
" C linting
let g:ale_c_clangtidy_options = '-checks=-*,cppcoreguidelines-*'
let g:ale_c_clangtidy_checks = ['readability-*,performance-*,bugprone-*,misc-*']
let g:ale_c_clangtidy_checks += ['-readability-function-cognitive-complexity']
let g:ale_c_clangtidy_checks += ['-readability-identifier-length']
let g:ale_c_clangtidy_checks += ['-misc-redundant-expression']
let g:ale_c_build_dir_names = ['build', 'release', 'debug']
 
" This function searches for the first clang-tidy config in parent directories and sets it
function! SetClangTidyConfig()
    let l:config_file = findfile('.clang-tidy', expand('%:p:h').';')
    if !empty(l:config_file)
        let g:ale_c_clangtidy_options = '--config=' . l:config_file
        let g:ale_cpp_clangtidy_options = '--config=' . l:config_file
    endif
endfunction
 
" Run this for c and c++ files
autocmd BufRead,BufNewFile *.c,*.cpp,*.h,*.hpp call SetClangTidyConfig()
