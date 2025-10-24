local BaseGui = require("../BaseGui")

local function Frame(params: BaseGui.BaseGuiParams)
	local frame = Instance.new("Frame")
	frame = BaseGui(frame, params)
	return frame
end

return Frame