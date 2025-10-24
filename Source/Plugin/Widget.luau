local GetPlugin = require("../Lib/GetPlugin")

local plugin = GetPlugin

local module = {}

local widget = plugin:CreateDockWidgetPluginGui("ClassConvert", DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,
	false,
	true,
	600,
	400,
	600,
	400
	)
)

widget.Name = "Class Convert"
widget.Title = "Class Convert"
widget.ResetOnSpawn = false
widget.Enabled = false



function module.ToggleWidget(enabled: boolean?): ()
	widget.Enabled = if typeof(enabled) == "boolean" then enabled else not widget.Enabled
end

module.Widget = widget

return module