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
	Visible = false,
})

local pageLayout = Instance.new("UIPageLayout")
pageLayout.Circular = true
pageLayout.TweenTime = 0.2
pageLayout.EasingStyle = Enum.EasingStyle.Exponential
pageLayout.EasingDirection = Enum.EasingDirection.In

function Navigation.SetPage(page: Frame): ()
	title.Text = "<b>" .. page.Name .. "</b>"
	backButton.Visible = lastPage ~= nil

	lastPage = page

	if not pageLayout.Parent then
		pageLayout.Parent = page.Parent
	end
	pageLayout:JumpTo(page)
end

backButton.Activated:Connect(function()
	assert(lastPage, "No last page")
	Navigation.SetPage(lastPage)
end)

return Navigation