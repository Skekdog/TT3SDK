local Frame = require("../../../Lib/UI/Components/Frame")
local TextButton = require("../../../Lib/UI/Components/TextButton")
local LoadTemplate = require("../../Core/LoadTemplate")
local Navigation = require("../Navigation")
local Widget = require("./..")
local References = require("./References")

local mainPage = Frame({
	Name = "Traitor Town 3 SDK",
	LayoutOrder = -1,
	Parent = Widget.Pages,

	CornerRadius = false,
	NoStroke = true,
})

do
	local listLayout = Instance.new("UIListLayout")
	listLayout.SortOrder = Enum.SortOrder.LayoutOrder
	listLayout.Padding = UDim.new(0, 5)
	listLayout.Parent = mainPage
end

local actionsFrame = Frame({
	NoStroke = true,
	Transparency = 1,

	Padding = {
		Left = 5,
		Right = 5,
		Top = 5,
		Bottom = 5,
	},

	Parent = mainPage,
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

loadReferenceButton.Activated:Connect(function()
	Navigation.SetPage(References)
end)

Navigation.SetPage(mainPage)

return mainPage