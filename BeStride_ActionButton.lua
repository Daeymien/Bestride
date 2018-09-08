BeStride_ActionButtonMount = {}
BeStride_ActionButtonGroundMount = {}
BeStride_ActionButtonPassengerMount = {}
BeStride_ActionButtonRepairMount = {}

-- Set the button
function BeStride:SetButton(text,button)
	if not BeStride_Logic:CheckCombat() then
		if text and button == "FORCEGROUND" then
			BeStrideButtonGround:SetAttribute("macrotext","/use " .. text)
		elseif text and button = "FORCEPASSENGER" then
			BeStrideButtonPassenger:SetAttribute("macrotext","/use " .. text)
		elseif text and button = "FORCEREPAIR" then
			BeStrideButtonRepair:SetAttribute("macrotext","/use " .. text)
		elseif text then
			BeStrideButton:SetAttribute("macrotext","/use " .. text)
		else
			BestrideButtonMount:SetAttribute("macrotext", nil)
		end
	end
end

function BeStride:SetButtonOld
	if not BestrideState.playerCombat then
		if mount and button == 2 then
			BestrideButtonGround:SetAttribute("macrotext", "/use "..Bestride:Mounting(false, GetRealZoneText()))
		elseif mount and BestrideState.usePassengerMount then
			BestrideButtonPassenger:SetAttribute("macrotext", "/use "..mount)
		elseif mount and BestrideState.forceRepairMount then
			BestrideButtonRepair:SetAttribute("macrotext", "/use "..mount)
		elseif mount then
			BestrideButtonMount:SetAttribute("macrotext", "/use "..mount)
			--YayMountsButton:SetAttribute("macrotext", "/use "..mount)
		else
			BestrideButtonMount:SetAttribute("macrotext", nil)
			--YayMountsButton:SetAttribute("macrotext", nil)
		end
	end
end

-- Creates Action Buttons
function BeStride:CreateActionButton(name)
	local name = "BeStride_AB" .. name

    local br = CreateFrame("Button", name, UIParent, "SecureActionButtonTemplate")
	
    Mixin(b, BeStride_ActionButtonMount)
end

-- +-------+ --
-- Any Mount --
-- +-------+ --

-- Action Button Wrapper
function BeStride_ActionButtonMount:PreClick()
	if BeStride:CheckCombat() then
		return
	end
	
	BeStride_Logic:MountButton()
end

-- Action Button Cleanup
function BeStride_ActionButtonMount:PostClick()

end


-- +----------+ --
-- Ground Mount --
-- +----------+ --

-- Action Button Wrapper
function BeStride_ActionButtonGroundMount:PreClick()
	if BeStride:CheckCombat() then
		return
	end
	
	BeStride_Logic:GroundMountButton()
end

-- Action Button Cleanup
function BeStride_ActionButtonGroundMount:PostClick()

end


-- +-------------+ --
-- Passenger Mount --
-- +-------------+ --

-- Action Button Wrapper
function BeStride_ActionButtonPassengerMount:PreClick()
	if BeStride:CheckCombat() then
		return
	end
	
	BeStride_Logic:PassengerMountButton()
end

-- Action Button Cleanup
function BeStride_ActionButtonPassengerMount:PostClick()

end


-- +----------+ --
-- Repair Mount --
-- +----------+ --

-- Action Button Wrapper
function BeStride_ActionButtonRepairMount:PreClick()
	if BeStride:CheckCombat() then
		return
	end
	
	BeStride_Logic:RepairMountButton()
end

-- Action Button Cleanup
function BeStride_ActionButtonRepairMount:PostClick()

end