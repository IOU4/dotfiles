require'lualine'.setup{
  options = {
    theme = 'tokyonight',
    lower = true,
    icons_enabled = true,
    component_separators = {'', ''},
    section_separators = {'', ''},
  },
  sections = {
    lualine_a = {'mode'},
  }
}

