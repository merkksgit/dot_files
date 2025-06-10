return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    local colors = {
      blue = "#7AA2F7",
      green = "#C3E88D",
      violet = "#BB9AF7",
      yellow = "#FF9E64",
      red = "#FF4A4A",
      fg = "#545C7e",
      bg = "#24283B",
      inactive_bg = "#24283B",
      semilightgray = "#545c7e",
    }
    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },
    }
    -- configure lualine with modified theme
    lualine.setup({
      options = {
        -- Hide lualine for nvimtree (file explorer)
        disabled_filetypes = {
          "NvimTree",
          "alpha",
          "undotree",
          "dapui_scopes",
          "dapui_breakpoints",
          "dapui_stacks",
        },
        theme = my_lualine_theme,
        -- hide separators from right side
        component_separators = {
          right = "",
        },
      },
      sections = {
        -- show full filepath on statusbar
        lualine_c = {
          {
            "filename",
            path = 3,
            symbols = {
              modified = " ",
            },
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#565f89" },
          },
          { "encoding" },
          -- { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
