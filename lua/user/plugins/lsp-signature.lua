local cfg = {
  doc_lines = 0,
  floating_window = false,
  floating_window_above_cur_line = true,
  hint_enable = false,
  handler_opts = {
    border = "none"
  },
  toggle_key = "<C-s>",
}

require("lsp_signature").setup(cfg)

-- check ./lualine.lua to see to functions that show signature in the bar
