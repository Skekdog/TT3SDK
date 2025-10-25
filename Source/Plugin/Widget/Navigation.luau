local Frame = require("../../Lib/UI/Components/Frame")
local ImageButton = require("../../Lib/UI/Components/ImageButton")
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
local backButton = ImageButton({
	Image = Content.fromAssetId(80230791232326),
	Parent = Navigation.NavBar,
	Size = UDim2.fromScale(0.1, 1),
	AspectRatio = {
		Ratio = 1,
	},
	IsContainer = true,
	Visible = false,

	Style = {
		ImageColor3 = Enum.StudioStyleGuideColor.MainText,
	},
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

	if pageLayout.CurrentPage == page then
		return
	end
	lastPage = pageLayout.CurrentPage :: Frame?

	pageLayout:JumpTo(page)

	backButton.Visible = lastPage ~= nil
end

backButton.Activated:Connect(function()
	assert(lastPage, "No last page")
	Navigation.SetPage(lastPage)
end)

return Navigation