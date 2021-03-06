-- modules
require("plugins")
require("editor")
require("mappings")

-- helpers
PrettyPrint = function(tbl)
  for key, value in pairs(tbl) do
    print(key, value)
  end
end

ReloadModule = function(name)
  require("plenary.reload").reload_module(name)
  vim.cmd("PackerCompile")
end
