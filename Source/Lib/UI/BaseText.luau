local BaseGui = require("./BaseGui")

export type BaseTextParams = BaseGui.BaseGuiParams & {
	Text: string,
}

local function BaseText<T>(gui: T & GuiObject & (TextLabel | TextButton | TextBox), params: BaseTextParams): ()
	BaseGui(gui, params)

	gui.FontFace = Font.fromEnum(Enum.Font.BuilderSans)
	gui.RichText = true
	gui.TextScaled = true

	gui.Text = params.Text
end

return BaseText