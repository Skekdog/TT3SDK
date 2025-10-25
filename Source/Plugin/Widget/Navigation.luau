local Frame = require("../../Lib/UI/Components/Frame")
local TextButton = require("../../Lib/UI/Components/TextButton")
local TextLabel = require("../../Lib/UI/Components/TextLabel")

local Navigation = {}

Navigation.NavBar = Frame({
	Name = "NavBar",
	Parent = false,
	CornerRadius = false,
	NoStroke = true,
	Transparency = 1,
	AutomaticSize = Enum.AutomaticSize.Y,
})

local title = TextLabel({
	NoStroke = true,
	FontSize = 32,
	AutomaticSize = Enum.AutomaticSize.Y,
	TextTruncate = Enum.TextTruncate.AtEnd,
	Text = "NavBar",
	Parent = Navigation.NavBar,
})

local lastPage: Frame?
local backButton = TextButton({
	Text = "Back",
	Parent = Navigation.NavBar,
	Size = UDim2.fromScale(0.1, 1),
	Visible = false,
})

local pageLayout = Instance.new("UIPageLayout")
pageLayout.Circular = true
pageLayout.TweenTime = 0.2
pageLayout.EasingStyle = Enum.EasingStyle.Exponential
pageLayout.EasingDirection = Enum.EasingDirection.In
pageLayout.SortOrder = Enum.SortOrder.LayoutOrder

function Navigation.SetPage(page: Frame): ()
	if not pageLayout.Parent then
		pageLayout.Parent = page.Parent
	end

	title.Text = "<b>" .. page.Name .. "</b>"

	lastPage = pageLayout.CurrentPage :: Frame?
	if page == lastPage then
		return
	end

	pageLayout:JumpTo(page)

	backButton.Visible = lastPage ~= nil
end

backButton.Activated:Connect(function()
	assert(lastPage, "No last page")
	Navigation.SetPage(lastPage)
end)

return Navigation