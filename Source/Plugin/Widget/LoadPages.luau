
local function LoadPages(frame: Frame): ()
	for _, page in script.Parent.Pages:GetChildren() do
		(require :: any)(page)
	end
end

return LoadPages