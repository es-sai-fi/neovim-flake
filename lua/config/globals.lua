local M = {}

---@param mode string|string[] Keyboard mode(s): 'n', 'i', 'v', 'x', or table of modes
---@param lhs string Key(s) to map (left-hand side)
---@param rhs string|function Command or function to execute (right-hand side)
---@param opts? table Additional options for the mapping
---@return nil
function M.map(mode, lhs, rhs, opts)
	opts = opts or {}
	vim.keymap.set(mode, lhs, rhs, opts)
end

---@param name string Name of the autocmd group
---@return integer ID of the created group
function M.augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

for name, func in pairs(M) do
	_G[name] = func
end

return M
