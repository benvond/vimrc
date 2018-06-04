execute pathogen#infect()
syntax enable 
filetype plugin indent on

"Tabs
set shiftwidth=4
set softtabstop=4

"Autocomplete
inoremap "     ""<Left>
inoremap '     ''<Left>
inoremap (     ()<Left>
inoremap [     []<Left>
inoremap {     {}<Left>
inoremap {<cr> {<cr>}<c-o><s-o>

"Comment out blocks of code
let s:comment_map = { 
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "rust": '\/\/',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \ }
function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " " 
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else 
            if getline('.') =~ "^\\s*" . comment_leader
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                " Comment the line
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
endfunction
nnoremap <leader><Space> :call ToggleComment()<cr>
vnoremap <leader><Space> :call ToggleComment()<cr>

"Solarized Vim Theme
let g:solarized_termcolors= 16 
let g:solarized_termtrans = 1 
let g:solarized_degrade = 0 
let g:solarized_bold = 1 
let g:solarized_underline = 1 
let g:solarized_italic = 1 
let g:solarized_contrast = "normal" 
let g:solarized_visibility= "normal"
colorscheme solarized

