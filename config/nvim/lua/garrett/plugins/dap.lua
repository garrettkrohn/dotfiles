local dap = require("dap")
dap.adapters.php = {
	type = "executable",
	command = "node",
	args = { "/Users/garrettkrohn/code/dap/vscode-php-debug/src/phpDebug.ts" },
}

dap.configurations.php = {
	{
		type = "php",
		request = "launch",
		name = "Listen for Xdebug",
		port = 9000,
	},
}
