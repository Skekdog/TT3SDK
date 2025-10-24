local GetPlugin = require("../Lib/GetPlugin")
local Frame = require("../Lib/UI/Components/Frame")

local plugin = GetPlugin

local module = {}

local widget = plugin:CreateDockWidgetPluginGui("TT3SDK", DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,
	false,
	true,
	600,
	400,
	600,
	400
	)
)

widget.Name = "TT3 SDK"
widget.Title = "TT3 SDK"
widget.ResetOnSpawn = false
widget.Enabled = false

local frame = Frame({
	Parent = widget,
	CornerRadius = false,
	Style = {
		BackgroundColor3 = Enum.StudioStyleGuideColor.ButtonText,
	}
})

function module.ToggleWidget(enabled: boolean?): ()
	widget.Enabled = if typeof(enabled) == "boolean" then enabled else not widget.Enabled
end

module.Widget = widget

return module