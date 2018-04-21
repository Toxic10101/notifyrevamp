//////////////////////////////////////////////////////////////////////////////////////////////////////



-- This was made by Toxic [ http://steamcommunity.com/id/ThatToxicCunt/ ]
-- If you change any core file don't expect support.

-- Please don't try to claim ownership of this



//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////



////////// DON'T EDIT BELOW PLEASE, CONTACT ME ON STEAM IF THERE'S ISSUES!!! /////////////////////



//////////////////////////////////////////////////////////////////////////////////////////////////////

/*---------------------------------------------------------
	Local file stuff.
---------------------------------------------------------*/
-- Make sure this file is clientside.
if !CLIENT then return end

-- These are all the fonts we use, change this in the config.
surface.CreateFont("NRWantedHUD_Font", {font = NotifyRevamp.Config.Font, size = 25 })
surface.CreateFont("NRWarrantHUD_Font", {font = NotifyRevamp.Config.Font, size = 25 })
surface.CreateFont("NRArrestHUD_Font", {font = NotifyRevamp.Config.Font, size = 30 })

/*---------------------------------------------------------
	Core Stuff.
---------------------------------------------------------*/
// Wanted.
net.Receive("NotifyRevamp_SendWantedToClient", function()  -- Receive the net meNRage on all clients.

	criminal = net.ReadEntity() -- Read who was wanted.
	actor = net.ReadEntity() -- Read who wanted them.

	local frame = vgui.Create("DFrame")
	frame:SetSize(ScrW()*0.4, ScrH()*0.1)
	frame:SetPos(ScrW()*0.3, ScrH()*0.10)
	frame:SetTitle("")
	frame:ShowCloseButton(false)
	frame:SetDraggable(false)
	frame.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, h, NotifyRevamp.Config.BgColor)
		draw.RoundedBox(0, 0, 0, w, 40, NotifyRevamp.Config.TopBarColor)
		draw.SimpleText(NotifyRevamp.Config.AddonTag .. " Wanted!", "NRWantedHUD_Font", self:GetWide()/2,0, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP ) 
			
		if IsValid(criminal) and IsValid(actor) then
			draw.SimpleText(criminal:Nick() .. " was made wanted by " .. actor:Nick(), "NRWantedHUD_Font", self:GetWide()/2, 50, Color(255,255,255), TEXT_ALIGN_CENTER ) 
		elseif IsValid(criminal) then
			draw.SimpleText(criminal:Nick() .. " was made wanted.", "NRWantedHUD_Font", self:GetWide()/2, 50, Color(255,255,255), TEXT_ALIGN_CENTER ) 
		end

	end

	timer.Simple(NotifyRevamp.Config.DisplayTime, function()
		if IsValid(frame) then
			frame:Close()
		end
	end)

end)

// Unwanted.
net.Receive("NotifyRevamp_SendUnWantedToClient", function()  -- Receive the net meNRage on all clients.

	excriminal = net.ReadEntity() -- Read who was unwanted.

	local frame = vgui.Create("DFrame")
	frame:SetSize(ScrW()*0.4, ScrH()*0.1)
	frame:SetPos(ScrW()*0.3, ScrH()*0.10)
	frame:SetTitle("")
	frame:ShowCloseButton(false)
	frame:SetDraggable(false)
	frame.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, h, NotifyRevamp.Config.BgColor)
		draw.RoundedBox(0, 0, 0, w, 40, NotifyRevamp.Config.TopBarColor)
		draw.SimpleText(NotifyRevamp.Config.AddonTag .. " Unwanted!", "NRWantedHUD_Font", self:GetWide()/2,0, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP ) 
			
		if IsValid(excriminal) then
			draw.SimpleText(excriminal:Nick() .. " is no longer wanted!", "NRWantedHUD_Font", self:GetWide()/2, 50, Color(255,255,255), TEXT_ALIGN_CENTER ) 
		end
	end

	timer.Simple(NotifyRevamp.Config.DisplayTime, function()
		if IsValid(frame) then
			frame:Close()
		end
	end)

end)

// Warrant.
net.Receive("NotifyRevamp_SendWarrantToClient", function()  -- Receive the net meNRage on all clients.

	criminal = net.ReadEntity() -- Read who was warranted.
	actor = net.ReadEntity() -- Read who warranted them.

	local frame = vgui.Create("DFrame")
	frame:SetSize(ScrW()*0.4, ScrH()*0.1)
	frame:SetPos(ScrW()*0.3, ScrH()*0.10)
	frame:SetTitle("")
	frame:ShowCloseButton(false)
	frame:SetDraggable(false)
	frame.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, h, NotifyRevamp.Config.BgColor)
		draw.RoundedBox(0, 0, 0, w, 40, NotifyRevamp.Config.TopBarColor)
		draw.SimpleText(NotifyRevamp.Config.AddonTag .. " Warrant!", "NRWarrantHUD_Font", self:GetWide()/2,0, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP ) 
			
		if IsValid(criminal) and IsValid(actor) then
			draw.SimpleText(criminal:Nick() .. " had a warrant set by " .. actor:Nick(), "NRWarrantHUD_Font", self:GetWide()/2, 50, Color(255,255,255), TEXT_ALIGN_CENTER ) 
		elseif IsValid(criminal) then
			draw.SimpleText(criminal:Nick() .. " had a warrant on them.", "NRWarrantHUD_Font", self:GetWide()/2, 50, Color(255,255,255), TEXT_ALIGN_CENTER ) 
		end

	end

	timer.Simple(NotifyRevamp.Config.DisplayTime, function()
		if IsValid(frame) then
			frame:Close()
		end
	end)

end)

// Unwarrant.
net.Receive("NotifyRevamp_SendUnWarrantToClient", function()  -- Receive the net meNRage on all clients.

	excriminal = net.ReadEntity() -- Read who was unwarranted.
	actor = net.ReadEntity() -- Read who unwarranted them.

	local frame = vgui.Create("DFrame")
	frame:SetSize(ScrW()*0.4, ScrH()*0.1)
	frame:SetPos(ScrW()*0.3, ScrH()*0.10)
	frame:SetTitle("")
	frame:ShowCloseButton(false)
	frame:SetDraggable(false)
	frame.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, h, NotifyRevamp.Config.BgColor)
		draw.RoundedBox(0, 0, 0, w, 40, NotifyRevamp.Config.TopBarColor)
		draw.SimpleText(NotifyRevamp.Config.AddonTag .. " Unwarrant!", "NRWarrantHUD_Font", self:GetWide()/2,0, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP ) 
			
		if IsValid(excriminal) and IsValid(actor) then
			draw.SimpleText(excriminal:Nick() .. " was unwarranted by " .. actor:Nick(), "NRWarrantHUD_Font", self:GetWide()/2, 50, Color(255,255,255), TEXT_ALIGN_CENTER ) 
		elseif IsValid(criminal) then
			draw.SimpleText(excriminal:Nick() .. " was unwarranted.", "NRWarrantHUD_Font", self:GetWide()/2, 50, Color(255,255,255), TEXT_ALIGN_CENTER ) 
		end		

	end

	timer.Simple(NotifyRevamp.Config.DisplayTime, function()
		if IsValid(frame) then
			frame:Close()
		end
	end)

end)

// Arrest.
net.Receive("NotifyRevamp_SendArrestToClient", function()  -- Receive the net meNRage on all clients.

	arrested = net.ReadEntity() -- Read who was arrested.
	arrestor = net.ReadEntity() -- Read who arrested them.

	local frame = vgui.Create("DFrame")
	frame:SetSize(ScrW()*0.4, ScrH()*0.1)
	frame:SetPos(ScrW()*0.3, ScrH()*0.10)
	frame:SetTitle("")
	frame:ShowCloseButton(false)
	frame:SetDraggable(false)
	frame.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, h, NotifyRevamp.Config.BgColor)
		draw.RoundedBox(0, 0, 0, w, 40, NotifyRevamp.Config.TopBarColor)
		draw.SimpleText(NotifyRevamp.Config.AddonTag .. " Arrest!", "NRArrestHUD_Font", self:GetWide()/2,0, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP ) 
			
		if IsValid(arrested) and IsValid(arrestor) then
			draw.SimpleText(arrested:Nick() .. " was arrested by " .. arrestor:Nick(), "NRArrestHUD_Font", self:GetWide()/2, 50, Color(255,255,255), TEXT_ALIGN_CENTER ) 
		elseif IsValid(arrested) then
			draw.SimpleText(arrested:Nick() .. " was arrested.", "NRArrestHUD_Font", self:GetWide()/2, 50, Color(255,255,255), TEXT_ALIGN_CENTER ) 
		end

	end

	timer.Simple(NotifyRevamp.Config.DisplayTime, function()
		if IsValid(frame) then
			frame:Close()
		end
	end)

end)

// UnArrest.
net.Receive("NotifyRevamp_SendUnArrestToClient", function()  -- Receive the net meNRage on all clients.

	criminal = net.ReadEntity() -- Read who was unarrested.
	unarrestor = net.ReadEntity() -- Read who unarrested them.

	local frame = vgui.Create("DFrame")
	frame:SetSize(ScrW()*0.4, ScrH()*0.1)
	frame:SetPos(ScrW()*0.3, ScrH()*0.10)
	frame:SetTitle("")
	frame:ShowCloseButton(false)
	frame:SetDraggable(false)
	frame.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, h, NotifyRevamp.Config.BgColor)
		draw.RoundedBox(0, 0, 0, w, 40, NotifyRevamp.Config.TopBarColor)
		draw.SimpleText(NotifyRevamp.Config.AddonTag .. " Unarrest!", "NRArrestHUD_Font", self:GetWide()/2,0, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
		if IsValid(unarrestor) then
			draw.SimpleText(criminal:Nick() .. " was unarrested by " .. unarrestor:Nick(), "NRArrestHUD_Font", self:GetWide()/2, 50, Color(255,255,255), TEXT_ALIGN_CENTER )
		else
			draw.SimpleText(criminal:Nick() .. " was unarrested.", "NRArrestHUD_Font", self:GetWide()/2, 50, Color(255,255,255), TEXT_ALIGN_CENTER )
		end
	end

	timer.Simple(NotifyRevamp.Config.DisplayTime, function()
		if IsValid(frame) then
			frame:Close()
		end
	end)

end)