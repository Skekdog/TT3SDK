local BaseGui = require("./BaseGui")

export type BaseTextParams = BaseGui.BaseGuiParams & {
	Text: string,

	FontSize: number?,
	TextWrapped: boolean?,
	TextTruncate: Enum.TextTruncate?,
}

local function BaseText<T>(gui: T & GuiObject & (TextLabel | TextButton | TextBox), params: BaseTextParams): ()
	BaseGui(gui, params)

	gui.FontFace = Font.fromEnum(Enum.Font.BuilderSans)
	gui.RichText = true

	if params.FontSize then
		gui.TextSize = params.FontSize
		if params.TextTruncate ~= nil and params.TextTruncate ~= Enum.TextTruncate.None then
			gui.TextTruncate = params.TextTruncate
		else
			gui.TextWrapped = if params.TextWrapped == nil then true else params.TextWrapped
		end
	else
		gui.TextScaled = true
	end

	gui.Text = params.Text
end

return BaseText