local status, _ = pcall(vim.cmd, "colorscheme monokai-pro")
if not status then
	print("colorscheme not found!")
	return
end
