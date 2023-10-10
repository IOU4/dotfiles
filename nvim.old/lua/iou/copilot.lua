local M = {}

M.config = function()
	vim.defer_fn(function()
		local found, copilot = pcall(require, "copilot")
		if not found then
			vim.notify("can't load copilot")
			return
		end

		copilot.setup({
			offset_encoding = "utf-8",
			suggestions = {
				enabled = true,
			},
			panel = {
				enabled = false,
			},
		})
	end, 100)
end

M.cmp_config = function()
	local found_cmp, copilot_cmp = pcall(require, "copilot_cmp")
	if not found_cmp then
		vim.notify("can't load copilot_cmp")
		return
	end
	copilot_cmp.setup()
end
return M
