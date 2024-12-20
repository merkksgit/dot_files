-- make Explorer tree like
vim.cmd("let g:netrw_liststyle = 3")

-- focus undotree when openend
vim.cmd("let g:undotree_SetFocusWhenToggle = 1")

local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- Scroll of
opt.scrolloff = 8 -- lines of context
opt.sidescrolloff = 8 -- Colums of context

-- disable showmode
opt.showmode = false

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- highlighted yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Highlight selection yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
  end,
})

-- exit terminal mode using the Escape key
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function(args)
    -- List of terminal programs where we want normal Esc behavior
    local excluded_programs = {
      "lazygit",
      "node",
      "htop",
      -- add more programs as needed
    }
    -- Get buffer name
    local bufname = vim.api.nvim_buf_get_name(args.buf)
    -- Check if buffer name contains any of the excluded programs
    for _, program in ipairs(excluded_programs) do
      if bufname:match(program) then
        return
      end
    end
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], {
      desc = "Exit terminal mode",
      buffer = args.buf,
      silent = true,
    })
  end,
})
