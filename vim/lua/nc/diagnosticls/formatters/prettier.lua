local prettier = {
  command = 'prettier',
  args = { '--stdin', '--stdin-filepath', '%filepath' },
  rootPatterns = {
    '.prettierrc'
  }
}

return prettier
