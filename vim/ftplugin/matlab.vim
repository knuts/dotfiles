if has("win32")
  :py from win32com.client import Dispatch
  :py import vim
  :py h=Dispatch('matlab.application')
  :py path=vim.eval('expand("%:p:h")')
  :py h.Execute("temppath='"+ path+"'")
  :py h.Execute("addpath(temppath)")
  :py h.Execute("clear temppath")
  map <buffer> <leader>r :w<CR>:py h.Execute("rehash path")<CR>:py print h.Execute(vim.eval('expand("%:t:r")'))<CR>
endif
