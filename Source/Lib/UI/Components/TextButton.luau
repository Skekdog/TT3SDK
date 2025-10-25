local BaseText = require("../BaseText")

local function TextButton(params: BaseText.BaseTextParams): TextButton
	local button = Instance.new("TextButton")
	BaseText(button, params)
	return button
end

return TextButton