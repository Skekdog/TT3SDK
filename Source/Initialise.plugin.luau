local RunService = game:GetService("RunService")

if RunService:IsRunning() then
	return
end

local Toolbar = require("./Plugin/Toolbar")
local LoadPages = require("./Plugin/Widget/LoadPages")

Toolbar.OnClick = function()
	local Widget = require("./Plugin/Widget")
	LoadPages(Widget.Frame)
	Widget.ToggleWidget()
end