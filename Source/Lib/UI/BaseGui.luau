local Style = require("./Style")

export type Padding = {
	Left: UDim?,
	Right: UDim?,
	Top: UDim?,
	Bottom: UDim?,
}

export type BaseGuiParams = {
	Name: string?,
	Parent: Instance?,

	Transparency: number?,
	ZIndex: number?,
	Visible: boolean?,

	Position: UDim2?,
	AnchorPoint: Vector2?,
	LayoutOrder: number?,

	ClipsDescendants: boolean?,

	Size: UDim2?,
	AutomaticSize: Enum.AutomaticSize?,

	CornerRadius: UDim | false?,
	NoStroke: boolean?,
	Padding: Padding?,

	Style: Style.Style | false?,

	[any]: never,
}

local function BaseGui<T>(gui: T & GuiObject, params: BaseGuiParams): T
	gui.Name = params.Name or gui.ClassName

	gui.BackgroundTransparency = params.Transparency or 0
	gui.ZIndex = params.ZIndex or 0

	gui.Visible = if typeof(params.Visible) == "boolean" then params.Visible else true

	gui.Position = params.Position or UDim2.new(0, 0, 0, 0)
	gui.AnchorPoint = params.AnchorPoint or Vector2.new(0, 0)
	gui.LayoutOrder = params.LayoutOrder or 0

	gui.ClipsDescendants = if typeof(params.ClipsDescendants) == "boolean" then params.ClipsDescendants else true

	gui.Size = params.Size or UDim2.fromScale(1, 1)
	gui.AutomaticSize = params.AutomaticSize or Enum.AutomaticSize.None

	if params.CornerRadius ~= false then
		local corner = Instance.new("UICorner")
		corner.CornerRadius = params.CornerRadius or UDim.new(0, 8)
		corner.Parent = gui
	end

	if not params.NoStroke then
		local stroke = Instance.new("UIStroke")
		stroke.Thickness = 2
		stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		stroke.Parent = gui

		if params.Style ~= false then
			Style(gui, params.Style)
		end
	end

	if params.Padding then
		local padding = Instance.new("UIPadding")
		padding.PaddingLeft = params.Padding.Left or UDim.new(0, 0)
		padding.PaddingRight = params.Padding.Right or UDim.new(0, 0)
		padding.PaddingTop = params.Padding.Top or UDim.new(0, 0)
		padding.PaddingBottom = params.Padding.Bottom or UDim.new(0, 0)
		padding.Parent = gui
	end

	if params.Style ~= false then
		Style(gui, params.Style)
	end

	gui.Parent = params.Parent

	return gui
end

return BaseGui