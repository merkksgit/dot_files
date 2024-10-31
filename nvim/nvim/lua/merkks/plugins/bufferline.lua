return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "padded",
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_buffer_icons = false,
    },
    highlights = {
      fill = {
        bg = "#1b1e2c",
      },
      buffer_selected = {
        bold = false,
      },
    },
  },
}
