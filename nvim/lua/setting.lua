vim.diagnostic.config({
  virtual_text = {prefix = ""},
  update_in_insert = true,
})

vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
