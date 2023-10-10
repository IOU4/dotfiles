local bufferline = require("bufferline")
bufferline.setup({
  options = {
    style_preset = bufferline.style_preset.minimal,
    show_buffer_icons =  false, -- disable filetype icons for buffers
    show_buffer_close_icons =  false,
    show_close_icon =  false,
    show_tab_indicators =  false,
    indicator = {
      style = 'none',
    }
  }
})
