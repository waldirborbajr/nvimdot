-- main editor configs
local api = vim.api
local opt = vim.opt
local g = vim.g

local function set_options()
  local options = {
    autoindent = true,
    autoread = true,
    clipboard = "unnamed,unnamedplus",
    cursorline = true,
    foldenable = false,
    hidden = true,
    ignorecase = true,
    mouse = "a",
    number = true,
    relativenumber = true,
    scrolloff = 5,
    shell = "/bin/bash",
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    tabstop = 2,
    softtabstop = 2,
    encoding = "UTF-8",
    shiftwidth = 2,
    expandtab = true,
    termguicolors = true,
    wildignore = "*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite",
  }
  for key, val in pairs(options) do
    opt[key] = val
  end

  vim.cmd(
    [[
  augroup LineNumbers
    autocmd!
    autocmd InsertEnter  * set relativenumber
    autocmd FocusGained * set relativenumber
    autocmd BufEnter * set relativenumber
    autocmd InsertLeave * set norelativenumber
    autocmd BufLeave * set norelativenumber
    autocmd FocusLost * set norelativenumber
  augroup END
  ]]
  )

  vim.cmd(
    [[
    augroup MarkDownExts
      autocmd!
      autocmd BufNewFile,BufRead *.md setlocal ft=markdown " .md ->markdown
      autocmd BufNewFile,BufRead *.adoc setlocal ft=asciidoc " .adoc ->asciidoc
    augroup END
    ]]
  )

  vim.cmd(
    [[
    augroup Spell
        autocmd FileType rst,md,adoc setlocal spell spelllang=en_ca
        autocmd BufRead COMMIT_EDITMSG setlocal spell spelllang=en_ca
    augroup END
    ]]

  )
  -- TODO is there a Lua API for those?
  vim.cmd(
    [[
    cnoreabbrev W w
    cnoreabbrev W! w!
    cnoreabbrev Q q
    cnoreabbrev Q! q!
    cnoreabbrev Qa qa
    cnoreabbrev Qa! qa!
    cnoreabbrev Wq wq
    cnoreabbrev Wa wa
    cnoreabbrev WQ wq
    cnoreabbrev Wqa wqa
    ]]
  )

  vim.o.background = "dark" -- or "light" for light mode
  vim.cmd([[colorscheme gruvbox]])
end

set_options()
