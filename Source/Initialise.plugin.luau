local RunService = game:GetService("RunService")

if RunService:IsRunning() then
	return
end

local Toolbar = require("./Plugin/Toolbar")

Toolbar.OnClick = function()
	local Widget = require("./Plugin/Widget")
	require("./Plugin/Widget/Pages/MainPage")
	Widget.ToggleWidget()
end