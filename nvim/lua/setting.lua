vim.diagnostic.config({
  virtual_text = {prefix = ""},
})

vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
