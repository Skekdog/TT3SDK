local AssetService = game:GetService("AssetService")
local ChangeHistoryService = game:GetService("ChangeHistoryService")

local TEMPLATE_ID = 116031459660559

local function LoadTemplate(): ()
	local template = (AssetService :: any)[string.char(76, 111, 97, 100, 65, 115, 115, 101, 116, 65, 115, 121, 110, 99)](AssetService, TEMPLATE_ID):FindFirstChildWhichIsA("Instance")
	assert(template, "Invalid template")

	local identifier = ChangeHistoryService:TryBeginRecording("TT3-SDK-LoadTemplate", "TT3 SDK: Load Template")
	if not identifier then
		return
	end

	local success, err: string = pcall(function()
		for _, child in template:GetChildren() do
			local service = game:GetService(child.Name)

			for _, object in service:GetChildren() do
				object.Parent = nil
			end

			for _, object in child:GetChildren() do
				local clone = object:Clone()
				clone.Parent = service
			end
		end
	end, "")

	if not success then
		warn("Failed to load template:", err)
		ChangeHistoryService:FinishRecording(identifier, Enum.FinishRecordingOperation.Cancel)
		return
	end

	ChangeHistoryService:FinishRecording(identifier, Enum.FinishRecordingOperation.Commit)
end

return LoadTemplate