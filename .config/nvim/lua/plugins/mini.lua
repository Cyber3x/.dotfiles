return {
	{ "echasnovski/mini.comment", version = false, opts = {} },
	{
		"nvim-mini/mini.indentscope",
		version = false,
		opts = function()
			local indentscope = require("mini.indentscope")
			return {
				draw = {
					animation = indentscope.gen_animation.none(),
				},
			}
		end,
	},
}
