vim.filetype.add({
	extension = {},
	filename = {},
	pattern = {
		["*.shader"] = "glsl",
		["*.vert"] = "glsl",
		["*.frag"] = "glsl",
		["*.geom"] = "glsl",
	},
})
