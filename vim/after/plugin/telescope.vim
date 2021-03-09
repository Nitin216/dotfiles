if !has('nvim')
  finish
endif

lua require'nc.telescope'.setup()
