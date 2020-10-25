-- Copied from tj
vim.o.completeopt = "menuone,noinsert,noselect"

vim.cmd[[set shortmess+=c]]

-- completion.nvim
vim.g.completion_confirm_key=""
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
-- TODO: Have to add snippets.nvim
-- vim.g.completion_enable_snippet = "snippets.nvim"

-- Decide on length
vim.g.completion_trigger_length = 2

function CompleteMatchingLine()
  local current_line = vim.api.nvim_get_current_line()
  current_line = vim.trim(current_line)

  if not current_line then
    print("You aren't on a line or something weird")
    return
  end

  local all_lines = vim.api.nvim_buf_get_lines(0, -1, false)

  local matching_lines = {}
  for _, v in ipairs(all_lines) do
    if string.find(v, current_line, 1, true) then
      table.insert(matching_lines, v)
    end
  end

  vim.fn.complete(1, matching_lines)

  return ''
end

vim.cmd[[inoremap <c-x><c-m> <c-r>=v:lua.CompleteMatchingLine()<CR>]]
