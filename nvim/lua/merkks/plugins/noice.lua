return {
  {
    "folke/noice.nvim",
    -- enabled = false,
    event = "VeryLazy",
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        opts = {
          border = {
            style = "single",
            text = {
              top = "",
            },
          },
        },
        format = {
          cmdline = { pattern = "^:", icon = ":", lang = "vim" },
        },
      },
      messages = {
        enabled = true,
        view = "notify",
        view_error = "notify",
        view_warn = "notify",
        view_history = "messages",
        view_search = "virtualtext",
      },
      notify = {
        enabled = true,
        view = "notify",
      },
      -- Macro recording notification
      routes = {
        {
          view = "notify",
          filter = { event = "msg_showmode", find = "recording" },
          opts = { timeout = 0 },
        },
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}
