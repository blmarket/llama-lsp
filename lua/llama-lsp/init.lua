local api = vim.api
local lsp = vim.lsp

local M = { setup_done = false }

function M.setup()
  if M.setup_done then
    return
  end

  local client_id = lsp.start_client({
    name = "llama-lsp",
    cmd = { "llama-lsp" },
    root_dir = lsp.util.root_pattern(".git"),
  })

  if client_id == nil then
    vim.notify("Failed to start llama-lsp", vim.log.levels.ERROR)
    return
  end

  local augroup = "llama-lsp"
  api.nvim_create_augroup(augroup, { clear = true })

  api.nvim_create_autocmd("VimLeavePre", {
    group = augroup,
    callback = function()
      lsp.stop_client(client_id)
    end,
  })

  M.setup_done = true
end

return M
