local prettier_standard = {
  command = 'prettier_standard',
  args = { '--stdin' },
  rootPatterns = {
    'package.json',
    '.prettierignore'
  }
}

return prettier_standard
