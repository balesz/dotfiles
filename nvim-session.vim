let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess=aoO
badd +1 .config/nvim/init.lua
badd +10 .config/nvim/lua/settings.lua
badd +18 .config/nvim/lua/plugins.lua
badd +2 .config/nvim/lua/setup.lua
badd +3 .config/nvim/lua/setup/nightfox.lua
argglobal
%argdel
edit .config/nvim/init.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 4 + 27) / 55)
exe 'vert 1resize ' . ((&columns * 46 + 119) / 238)
exe '2resize ' . ((&lines * 11 + 27) / 55)
exe 'vert 2resize ' . ((&columns * 46 + 119) / 238)
exe '3resize ' . ((&lines * 36 + 27) / 55)
exe 'vert 3resize ' . ((&columns * 46 + 119) / 238)
exe 'vert 4resize ' . ((&columns * 111 + 119) / 238)
exe 'vert 5resize ' . ((&columns * 79 + 119) / 238)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 2) / 4)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 019|
wincmd w
argglobal
if bufexists(fnamemodify(".config/nvim/lua/setup.lua", ":p")) | buffer .config/nvim/lua/setup.lua | else | edit .config/nvim/lua/setup.lua | endif
if &buftype ==# 'terminal'
  silent file .config/nvim/lua/setup.lua
endif
balt .config/nvim/init.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 5) / 11)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 025|
wincmd w
argglobal
if bufexists(fnamemodify(".config/nvim/lua/settings.lua", ":p")) | buffer .config/nvim/lua/settings.lua | else | edit .config/nvim/lua/settings.lua | endif
if &buftype ==# 'terminal'
  silent file .config/nvim/lua/settings.lua
endif
balt .config/nvim/init.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 33 - ((32 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 33
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify(".config/nvim/lua/plugins.lua", ":p")) | buffer .config/nvim/lua/plugins.lua | else | edit .config/nvim/lua/plugins.lua | endif
if &buftype ==# 'terminal'
  silent file .config/nvim/lua/plugins.lua
endif
balt .config/nvim/lua/setup/nightfox.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 18 - ((17 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 18
normal! 051|
wincmd w
argglobal
if bufexists(fnamemodify(".config/nvim/lua/setup/nightfox.lua", ":p")) | buffer .config/nvim/lua/setup/nightfox.lua | else | edit .config/nvim/lua/setup/nightfox.lua | endif
if &buftype ==# 'terminal'
  silent file .config/nvim/lua/setup/nightfox.lua
endif
balt .config/nvim/lua/plugins.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 4 - ((3 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 0
wincmd w
4wincmd w
exe '1resize ' . ((&lines * 4 + 27) / 55)
exe 'vert 1resize ' . ((&columns * 46 + 119) / 238)
exe '2resize ' . ((&lines * 11 + 27) / 55)
exe 'vert 2resize ' . ((&columns * 46 + 119) / 238)
exe '3resize ' . ((&lines * 36 + 27) / 55)
exe 'vert 3resize ' . ((&columns * 46 + 119) / 238)
exe 'vert 4resize ' . ((&columns * 111 + 119) / 238)
exe 'vert 5resize ' . ((&columns * 79 + 119) / 238)
if exists(':tcd') == 2 | tcd ~ | endif
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
