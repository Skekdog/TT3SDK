local GetPlugin = require("../Lib/GetPlugin")
local Frame = require("../Lib/UI/Components/Frame")
local TextButton = require("../Lib/UI/Components/TextButton")
local TextLabel = require("../Lib/UI/Components/TextLabel")
local LoadTemplate = require("./Core/LoadTemplate")

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

	Padding = {
		Top = 5,
	}
})

do
	local listLayout = Instance.new("UIListLayout")
	listLayout.SortOrder = Enum.SortOrder.LayoutOrder
	listLayout.Padding = UDim.new(0, 5)
	listLayout.Parent = frame
end

TextLabel({
	NoStroke = true,
	Text = "<b>Traitor Town 3 SDK</b>",
	FontSize = 32,
	AutomaticSize = Enum.AutomaticSize.Y,
	TextTruncate = Enum.TextTruncate.AtEnd,
	Parent = frame,
})

local actionsFrame = Frame({
	NoStroke = true,
	Transparency = 1,

	Padding = {
		Left = 5,
		Right = 5,
		Top = 5,
		Bottom = 5,
	},

	Parent = frame,
})

do
	local listLayout = Instance.new("UIListLayout")
	listLayout.SortOrder = Enum.SortOrder.LayoutOrder
	listLayout.Padding = UDim.new(0, 5)
	listLayout.Parent = actionsFrame
end

local loadTemplateButton = TextButton({
	Text = "Load Template",
	FontSize = 24,
	AutomaticSize = Enum.AutomaticSize.Y,
	Parent = actionsFrame,
})

loadTemplateButton.Activated:Connect(LoadTemplate)

local loadReferenceButton = TextButton({
	Text = "Load Reference",
	FontSize = 24,
	AutomaticSize = Enum.AutomaticSize.Y,
	Parent = actionsFrame,
})

function module.ToggleWidget(enabled: boolean?): ()
	widget.Enabled = if typeof(enabled) == "boolean" then enabled else not widget.Enabled
end

module.Widget = widget

return module