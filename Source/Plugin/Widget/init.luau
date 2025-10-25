local GetPlugin = require("../Lib/GetPlugin")
local Frame = require("../Lib/UI/Components/Frame")

local Widget = {}

local widget = GetPlugin:CreateDockWidgetPluginGui("TT3SDK", DockWidgetPluginGuiInfo.new(
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
	NoStroke = true,

	Padding = {
		Top = 5,
	}
})

function Widget.ToggleWidget(enabled: boolean?): ()
	widget.Enabled = if typeof(enabled) == "boolean" then enabled else not widget.Enabled
end

Widget.Widget = widget

for _, page in script.Pages:GetChildren() do
	(require :: any)(page)(frame)
end

return Widget