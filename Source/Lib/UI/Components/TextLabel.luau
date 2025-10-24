local BaseText = require("../BaseText")

local function TextLabel(params: BaseText.BaseTextParams): TextLabel
	local label = Instance.new("TextLabel")
	BaseText(label, params)
	return label
end

return TextLabel