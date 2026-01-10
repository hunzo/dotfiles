return {
	filetypes = { "yaml.asible", "yml" },
	settings = {
		ansible = {
			ansible = {
				path = "ansible",
			},
			ansibleLint = {
				enabled = true,
				path = "ansible-lint",
			},
			executionEnvironment = {
				enabled = false,
			},
		},
	},
}
