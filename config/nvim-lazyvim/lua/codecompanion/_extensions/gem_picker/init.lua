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
      local gem_names = {}
      for line in handle:lines() do
        local name = line:match("([^/]+)$") or line
        table.insert(gems, { name = name, path = line })
        table.insert(gem_names, name)
      end
      handle:close()
      if #gems == 0 then
        vim.notify("No gems found", vim.log.levels.WARN)
        return
      end

      -- 2. Pick a gem (show only names)
      vim.ui.select(gem_names, { prompt = "Select a Ruby gem" }, function(selected_name)
        if not selected_name then
          return
        end
        local gem_path = nil
        for _, gem in ipairs(gems) do
          if gem.name == selected_name then
            gem_path = gem.path
            break
          end
        end
        if not gem_path then
          vim.notify("Could not find gem path for selected gem", vim.log.levels.ERROR)
          return
        end

        -- 3. Recursively list files in the gem
        local scan = require("plenary.scandir")
        local files = scan.scan_dir(gem_path, { hidden = false, add_dirs = false, depth = 10 })
        if #files == 0 then
          vim.notify("No files found in gem", vim.log.levels.WARN)
          return
        end

        -- Build table of {rel, abs} for each file
        local file_entries = {}
        local rel_files = {}
        for _, abs in ipairs(files) do
          local rel = abs:sub(#gem_path + 2) -- +2 to remove trailing slash
          table.insert(file_entries, { rel = rel, abs = abs })
          table.insert(rel_files, rel)
        end

        -- 4. Pick files (multi-select if your picker supports it, else one by one)
        vim.ui.select(rel_files, { prompt = "Select a file from the gem" }, function(selected_rel)
          if not selected_rel then
            return
          end
          local abs = nil
          for _, entry in ipairs(file_entries) do
            if entry.rel == selected_rel then
              abs = entry.abs
              break
            end
          end
          if not abs then
            vim.notify("Could not find absolute path for selected file", vim.log.levels.ERROR)
            return
          end

          -- 5. Read file content and add to chat as attachment
          local ok, content = pcall(function()
            return Path:new(abs):read()
          end)
          if not ok then
            vim.notify("Could not read file: " .. abs, vim.log.levels.ERROR)
            return
          end
          local ft = vim.filetype.match({ filename = abs }) or "ruby"
          local rel = vim.fn.fnamemodify(abs, ":.")
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
          chat.references:add({ id = id, path = abs, source = "gem_picker" })
          vim.notify("Added gem file to chat: " .. rel)
        end)
      end)
    end,
  }
end

return Extension
