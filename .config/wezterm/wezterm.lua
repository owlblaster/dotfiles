-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

local function get_font_size()
	local success, output = wezterm.run_child_process({ "system_profiler", "SPDisplaysDataType" })
	if not success then
		return 12 -- Default font size if resolution detection fails
	end

	if output:match("1920 x ") then
		return 12
	elseif output:match("2560 x ") then
		return 14
	elseif output:match("5120 x ") then
		return 16
	else
		wezterm.log_error("Unknown resolution detected, using default font size.")
		return 12 -- Default for unknown resolutions
	end
end

config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
	"Noto Sans",
})
config.font_size = get_font_size()

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10

-- For example, changing the color scheme:
-- config.color_scheme = "Gruvbox Dark (Gogh)"
config.color_scheme = "tokyonight_night"

config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true

-- and finally, return the configuration to wezterm
return config
