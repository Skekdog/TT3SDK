
local pageLayout = Instance.new("UIPageLayout")
pageLayout.Circular = true
pageLayout.TweenTime = 0.2
pageLayout.EasingStyle = Enum.EasingStyle.Exponential
pageLayout.EasingDirection = Enum.EasingDirection.In

local function ChangePage(to: Frame): ()
	if not pageLayout.Parent then
		pageLayout.Parent = to.Parent
	end
	pageLayout:JumpTo(to)
end

return ChangePage