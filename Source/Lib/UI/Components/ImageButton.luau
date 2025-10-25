local BaseImage = require("../BaseImage")

local function ImageButton(params: BaseImage.BaseImageParams): ImageButton
	local button = Instance.new("ImageButton")
	BaseImage(button, params)
	return button
end

return ImageButton