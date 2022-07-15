local present, formatter = pcall(require, "formatter")

if not present then
    return
end

local util = require "formatter.util"

formatter.setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    lua = {
      function()
        if util.get_current_buffer_file_name() == "special.lua" then   
          return nil
        end

        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end
    },
  },

    --Use the special "*" filetype for defining formatter configurations on
    --any filetype
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
}
