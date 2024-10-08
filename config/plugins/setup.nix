# Manual setup for some plugins
{ pkgs, ... }:
{
  extraConfigLua = ''
    require("telescope").load_extension("yank_history")
    require("telescope").load_extension("ht")
    vim.diagnostic.config({ virtual_lines = false })

    require 'typst-preview'.setup {
      dependencies_bin = {
        ['typst-preview'] = "${pkgs.tinymist}/bin/tinymist",
        ['websocat'] = "${pkgs.websocat}/bin/websocat"
      }
    }

    require("lsp-progress").setup({
      client_format = function(client_name, spinner, series_messages)
        if #series_messages == 0 then
          return nil
        end
        return {
          name = client_name,
          body = spinner .. " " .. table.concat(series_messages, ", "),
        }
      end,
      format = function(client_messages)
        --- @param name string
        --- @param msg string?
        --- @return string
        local function stringify(name, msg)
          return msg and string.format("%s %s", name, msg) or name
        end

        local sign = "󰆧" -- nf-fa-gear \uf013
        local lsp_clients = vim.lsp.get_active_clients()
        local messages_map = {}
        for _, climsg in ipairs(client_messages) do
          messages_map[climsg.name] = climsg.body
        end

        if #lsp_clients > 0 then
          table.sort(lsp_clients, function(a, b)
            return a.name < b.name
          end)
          local builder = {}
          for _, cli in ipairs(lsp_clients) do
            if
              type(cli) == "table"
              and type(cli.name) == "string"
              and string.len(cli.name) > 0
            then
              if messages_map[cli.name] then
                table.insert(builder, stringify(cli.name, messages_map[cli.name]))
              else
                table.insert(builder, stringify(cli.name))
              end
            end
          end
          if #builder > 0 then
            return sign .. " " .. table.concat(builder, ", ")
          end
        end
        return ""
      end,
    })

    vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
    vim.api.nvim_create_autocmd("User", {
      group = "lualine_augroup",
      pattern = "LspProgressStatusUpdated",
      callback = require("lualine").refresh,
    })

    -- Array of file names indicating root directory. Modify to your liking.
    local root_names = { '.git', 'Makefile', '.svn', '.hg' }

    -- Cache to use for speed up (at cost of possibly outdated results)
    local root_cache = {}

    local set_root = function()
      -- Get directory path to start search from
      local path = vim.api.nvim_buf_get_name(0)
      if path == "" then return end
      path = vim.fs.dirname(path)

      -- Try cache and resort to searching upward for root directory
      local root = root_cache[path]
      if root == nil then
        local root_file = vim.fs.find(root_names, { path = path, upward = true })[1]
        if root_file == nil then return end
        root = vim.fs.dirname(root_file)
        root_cache[path] = root
      end

      -- Set current directory
      vim.fn.chdir(root)

      -- Run direnv
      vim.cmd "DirenvExport"
      vim.cmd "LspRestart"
    end

    local root_augroup = vim.api.nvim_create_augroup('MyAutoRoot', {})
    vim.api.nvim_create_autocmd('BufEnter', { group = root_augroup, callback = set_root })
  '';
}
