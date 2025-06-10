return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_buffer_icons = false,
    },
    highlights = {
      fill = {
        bg = "#131620",
      },
      buffer_selected = {
        bold = false,
      },
    },
  },
}
