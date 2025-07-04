return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- Create or modify the highlight group for floating window borders
    vim.api.nvim_set_hl(0, "LazyGitBorder", { fg = "#1f2335" })
    -- Set the border highlight group for lazygit
    vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
    vim.g.lazygit_floating_window_highlight = "LazyGitBorder"

    -- Add these lines for full screen
    vim.g.lazygit_floating_window_winblend = 0
    vim.g.lazygit_floating_window_scaling_factor = 1.0
    vim.g.lazygit_floating_window_use_plenary = 0
  end,
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
    { "<leader>lc", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit current file" },
    { "<leader>lf", "<cmd>LazyGitFilter<cr>", desc = "LazyGit filter" },
    { "<leader>lb", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGit blame current file" },
  },
}
