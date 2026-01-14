return {
	settings = {
		yaml = {
			customTags = { "!vault" },
			schemas = {
				["https://json.schemastore.org/composer.json"] = "composer.json",
				["https://json.schemastore.org/docker-compose.json"] = "docker-compose*.yml",
			},
			validate = true,
			format = {
				enable = true,
			},
		},
	},
	filetypes = { "yaml" },
}
