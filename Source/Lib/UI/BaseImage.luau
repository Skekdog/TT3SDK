local BaseGui = require("./BaseGui")

export type BaseImageParams = BaseGui.BaseGuiParams & {
	Image: Content,
	ScaleType: Enum.ScaleType?,
	ImageColor3: Color3?,
	ImageTransparency: number?,
}

local function BaseText<T>(gui: T & (ImageButton | ImageLabel), params: BaseImageParams): ()
	BaseGui(gui, params)

	gui.ImageContent = params.Image
	gui.ImageColor3 = params.ImageColor3 or Color3.new(1, 1, 1)
	gui.ScaleType = params.ScaleType or Enum.ScaleType.Slice
	gui.ImageTransparency = params.ImageTransparency or 0
end

return BaseText