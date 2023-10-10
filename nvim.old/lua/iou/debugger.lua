local ok, dap = pcall(require, "dap")
if not ok then
	vim.notify("couldn't load dap!")
	return
end

local map = function(lhs, rhs, desc)
	if desc then
		desc = "[DAP] " .. desc
	end

	vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
end

map("<F1>", dap.step_back, "step_back")
map("<F2>", dap.step_into, "step_into")
map("<F3>", dap.step_over, "step_over")
map("<F4>", dap.step_out, "step_out")
map("<F5>", dap.continue, "continue")
map("<leader>dr", dap.repl.open)
map("<leader>db", dap.toggle_breakpoint)
map("<leader>dB", function()
	dap.set_breakpoint(vim.fn.input("[DAP] Condition > "))
end)
