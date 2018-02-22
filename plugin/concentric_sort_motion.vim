" concentric-sort-motion.vim - Sort based on the concentric CSS standard
"
" More information about Concentric can be found here:
" http://rhodesmill.org/brandon/2011/concentric-css/
"
" Maintainer:   André Ligné <hello at bzf dot se>
" Version:      0.1
" Source:       http://github.com/bzf/vim-concentric-sort-motion

if exists("g:loaded_concentric_sort_motion")
  finish
endif
let g:loaded_concentric_sort_motion = 1

let s:self_path = expand("<sfile>:p:h")
let s:ruby_concentric_sorter_path = s:self_path . '/../lib/concentric_sorter.rb'

function! ConcentricSortLines(lines)
ruby << EOF
require VIM.evaluate('s:ruby_concentric_sorter_path')

lines = VIM.evaluate('a:lines').lines
result = ConcentricSorter.new(lines).sort.join
VIM.command("return #{result.inspect}")
EOF
endfunction

function! SaveCursorPosition()
  silent exe "normal! mm"
endfunction

function! ResetCursorPosition()
  silent exe "normal! `m"
endfunction

function! ConcentricSort(type, ...)
  call SaveCursorPosition()

  " Copy the contents of the motion
  silent exe "normal! '[V']s"
  let motion_contents = @@

  " Calculate the sorted lines
  let result = ConcentricSortLines(motion_contents)

  call ResetCursorPosition()

  " Append the sorted lines in the buffer
  call append(line('.'), split(result, '\n'))

  " We paste on the line below so we need to remove the line we're
  " currently on
  normal! dd

  call ResetCursorPosition()
endfunction

nmap <silent> gk :set opfunc=ConcentricSort<CR>g@
