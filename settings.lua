data:extend{
	{
		type = "bool-setting",
		name = "enable-ed",
		setting_type = "runtime-per-user",
		order = "a",
		default_value = true
	},
	{
		type = "double-setting",
		name = "distribution-delay",
		setting_type = "runtime-per-user",
		order = "aa",
		default_value = 0.9,
		minimum_value = 0.01
	},
}