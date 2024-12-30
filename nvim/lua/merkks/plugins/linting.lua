return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      -- javascript = { "eslint_d", "eslint" },
      -- typescript = { "eslint_d" },
      -- javascriptreact = { "eslint_d" },
      -- typescriptreact = { "eslint_d" },
      python = { "pylint" },
      bash = { "shellcheck" },
    }
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
    vim.keymap.set("n", "<leader>lj", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })

    -- Toggle diagnostic display
    local diagnostics_active = true
    vim.keymap.set("n", "<leader>ll", function()
      diagnostics_active = not diagnostics_active
      vim.diagnostic.enable(diagnostics_active)
    end, { desc = "Toggle diagnostic messages" })
  end,
}
