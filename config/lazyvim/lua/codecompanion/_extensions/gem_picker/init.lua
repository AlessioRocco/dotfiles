local Extension = {}

function Extension.setup(opts)
  local config = require("codecompanion.config")
  local Path = require("plenary.path")

  config.strategies.chat.slash_commands["gem_files"] = {
    description = "Add Ruby gem files to context",
    opts = {
      contains_code = true,
      provider = "telescope", -- or "default" if you don't use telescope
    },
    callback = function(chat)
      -- 1. Get gem paths
      local handle = io.popen("bundle list --paths")
      if not handle then
        vim.notify("Could not run 'bundle list --paths'", vim.log.levels.ERROR)
        return
      end
      local gems = {}
      for line in handle:lines() do
        table.insert(gems, line)
      end
      handle:close()
      if #gems == 0 then
        vim.notify("No gems found", vim.log.levels.WARN)
        return
      end

      -- 2. Pick a gem
      vim.ui.select(gems, { prompt = "Select a Ruby gem" }, function(gem_path)
        if not gem_path then
          return
        end

        -- 3. Recursively list files in the gem
        local scan = require("plenary.scandir")
        local files = scan.scan_dir(gem_path, { hidden = false, add_dirs = false, depth = 10 })
        if #files == 0 then
          vim.notify("No files found in gem", vim.log.levels.WARN)
          return
        end

        -- 4. Pick files (multi-select if your picker supports it, else one by one)
        vim.ui.select(files, { prompt = "Select a file from the gem" }, function(file)
          if not file then
            return
          end

          -- 5. Read file content and add to chat as attachment
          local ok, content = pcall(function()
            return Path:new(file):read()
          end)
          if not ok then
            vim.notify("Could not read file: " .. file, vim.log.levels.ERROR)
            return
          end
          local ft = vim.filetype.match({ filename = file }) or "ruby"
          local rel = vim.fn.fnamemodify(file, ":.")
          local id = "<file>" .. rel .. "</file>"
          chat:add_message({
            role = config.constants.USER_ROLE,
            content = string.format(
              '<attachment filepath="%s">Gem file from %s:\n```%s\n%s\n```\n</attachment>',
              rel,
              gem_path,
              ft,
              content
            ),
          }, { reference = id, visible = false })
          chat.references:add({ id = id, path = file, source = "gem_picker" })
          vim.notify("Added gem file to chat: " .. rel)
        end)
      end)
    end,
  }
end

return Extension
