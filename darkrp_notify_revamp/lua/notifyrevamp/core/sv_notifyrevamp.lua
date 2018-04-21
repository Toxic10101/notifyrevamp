//////////////////////////////////////////////////////////////////////////////////////////////////////



-- This was made by Toxic [ http://steamcommunity.com/id/ThatToxicCunt/ ]
-- If you change any core file don't expect support.

-- Please don't try to claim ownership of this



//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////



////////// DON'T EDIT BELOW PLEASE, CONTACT ME ON STEAM IF THERE'S ISSUES!!! /////////////////////



//////////////////////////////////////////////////////////////////////////////////////////////////////
	
// Networking
util.AddNetworkString("NotifyRevamp_SendWantedToClient") -- Drawing stuff is clientside, so we need to network it.
util.AddNetworkString("NotifyRevamp_SendUnWantedToClient") -- Drawing stuff is clientside, so we need to network it.

util.AddNetworkString("NotifyRevamp_SendWarrantToClient") -- Drawing stuff is clientside, so we need to network it.
util.AddNetworkString("NotifyRevamp_SendUnWarrantToClient") -- Drawing stuff is clientside, so we need to network it.

util.AddNetworkString("NotifyRevamp_SendArrestToClient") -- Drawing stuff is clientside, so we need to network it.
util.AddNetworkString("NotifyRevamp_SendUnArrestToClient") -- Drawing stuff is clientside, so we need to network it.

// Player Wanted
hook.Add("playerWanted", "NM_WantedHUD", function(criminal, actor, reason) -- Hook into when a player gets arrested.

	if IsValid(criminal) and IsValid(actor) then
		ply1 = criminal -- Player 1 hhas been made wanted.
		ply2 = actor -- Player 2 made player 1 wanted.

		net.Start("NotifyRevamp_SendWantedToClient")  -- Start the net meNMage.
			net.WriteEntity(ply1) -- Write the entity.
			net.WriteEntity(ply2) -- Write the entity.
		net.Broadcast() -- Broadcast it to all players on the server.
	end
end)

// Player Unwanted
hook.Add("playerUnWanted", "NM_UnWantedHUD", function(excriminal, actor) -- Hook into when a player gets arrested.

	if IsValid(excriminal) then
		ply1 = excriminal -- Player 1 is no longer wanted.

		net.Start("NotifyRevamp_SendUnWantedToClient")  -- Start the net meNMage.
			net.WriteEntity(ply1) -- Write the entity.
		net.Broadcast() -- Broadcast it to all players on the server.
	end

end)

// Player Warranted
hook.Add("playerWarranted", "NM_WarrantHUD", function(criminal, actor, reason) -- Hook into when a player gets arrested.
	if IsValid(criminal) and IsValid(actor) then
		ply1 = criminal -- Player 1 had a warrant set on them.
		ply2 = actor -- Player 2 set a warrant on player 1.

		net.Start("NotifyRevamp_SendWarrantToClient")  -- Start the net meNMage.
			net.WriteEntity(ply1) -- Write the entity.
			net.WriteEntity(ply2) -- Write the entity.
		net.Broadcast() -- Broadcast it to all players on the server.
	end
end)

// Player UnWarranted
hook.Add("playerUnWarranted", "NM_UnWarrantHUD", function(excriminal, actor) -- Hook into when a player gets arrested.
	if IsValid(excriminal) and IsValid(actor) then
		ply1 = excriminal -- Player 1 no longer has a warrant.
		ply2 = actor -- Player 2 removed the warrant from player 1.

		net.Start("NotifyRevamp_SendUnWarrantToClient")  -- Start the net meNMage.
			net.WriteEntity(ply1) -- Write the entity.
			net.WriteEntity(ply2) -- Write the entity.
		net.Broadcast() -- Broadcast it to all players on the server.
	end
end)

// Player Arrested
hook.Add("playerArrested", "NM_ArrestedHUD", function(arrested, time, arrestor) -- Hook into when a player gets arrested.

	if IsValid(arrested) and IsValid(arrestor) then
		ply1 = arrested -- Player 1 was arrested.
		ply2 = arrestor -- Player 2 arrested player 1.

		net.Start("NotifyRevamp_SendArrestToClient")  -- Start the net meNMage.
			net.WriteEntity(ply1) -- Write the entity.
			net.WriteEntity(ply2) -- Write the entity.
		net.Broadcast() -- Broadcast it to all players on the server.
	end

end)

// Player Unarrested
hook.Add("playerUnArrested", "NM_UnArrestedHUD", function(criminal, unarrestor) -- Hook into when a player gets arrested.

	if IsValid(criminal) and IsValid(unarrestor) then
		ply1 = criminal -- Player 1 was unarrested.
		ply2 = unarrestor -- Player 2 unarrested player 1.

		net.Start("NotifyRevamp_SendUnArrestToClient")  -- Start the net meNMage.
			net.WriteEntity(ply1) -- Write the entity.
			net.WriteEntity(ply2) -- Write the entity.
		net.Broadcast() -- Broadcast it to all players on the server.
	end
end)