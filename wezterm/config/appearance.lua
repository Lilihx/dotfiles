local wezterm = require("wezterm")
local gpu_adapters = require("utils.gpu_adapter")
local colors = require("colors.custom")

return {
	animation_fps = 60,
	max_fps = 60,
	front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",
	webgpu_preferred_adapter = gpu_adapters:pick_best(),

	-- color scheme
	colors = colors,

	-- background
	background = {
		{
			source = { File = wezterm.GLOBAL.background },
			horizontal_align = "Center",
		},
		{
			source = { Color = colors.background },
			height = "100%",
			width = "100%",
			opacity = 1,
		},
	},

	-- scrollbar
	enable_scroll_bar = true,

	-- tab bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	tab_max_width = 25,
	show_tab_index_in_tab_bar = false,
	switch_to_last_active_tab_when_closing_tab = true,
	tab_bar_at_bottom = true,

	-- window
	window_padding = {
		left = 5,
		right = 10,
		top = 12,
		bottom = 7,
	},
	window_close_confirmation = "NeverPrompt",
	window_frame = {
		active_titlebar_bg = "#090909",
		-- font = fonts.font,
		-- font_size = fonts.font_size,
	},
	inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.65,
	},

	-- add by myself
	native_macos_fullscreen_mode = true,
	window_decorations = "RESIZE",
	window_background_opacity = 0.8,
	macos_window_background_blur = 30,
	force_reverse_video_cursor = true,
	default_cursor_style = "BlinkingBar",
}
