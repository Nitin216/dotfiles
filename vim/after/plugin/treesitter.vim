if !has('nvim')
  finish
endif

lua require'nc.treesitter'.setup()
