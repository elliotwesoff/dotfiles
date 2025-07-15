local M = {}

function M.apply_user_commands()

  vim.api.nvim_create_user_command('ConfirmClose', function()
    local bufname = vim.api.nvim_buf_get_name(0)
    local prompt = 'Close buffer?'
    if vim.bo.modified then
      prompt = 'Buffer is modified. Close without saving?'
    elseif bufname ~= '' then
      prompt = 'Close "' .. vim.fn.fnamemodify(bufname, ':t') .. '"?'
    end

    local choice = vim.fn.confirm(prompt, "&Yes\n&No", 2)
    if choice <= 1 then
      vim.cmd('quit')
    end
  end, {})

end

return M
