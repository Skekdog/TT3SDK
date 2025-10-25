local BaseGui = require("./BaseGui")

export type TextSizeConstraints = {
	Min: number?,
	Max: number?,
}

export type BaseTextParams = BaseGui.BaseGuiParams & {
	Text: string,

	FontSize: number?,
	TextWrapped: boolean?,
	TextTruncate: Enum.TextTruncate?,

	TextSizeConstraints: TextSizeConstraints?,
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

	if params.TextSizeConstraints then
		local constraints = Instance.new("UITextSizeConstraint")
		constraints.MinTextSize = params.TextSizeConstraints.Min or 0
		constraints.MaxTextSize = params.TextSizeConstraints.Max or math.huge
		constraints.Parent = gui
	end

	gui.Text = params.Text
end

return BaseText