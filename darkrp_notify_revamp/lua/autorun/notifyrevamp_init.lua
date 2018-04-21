/*---------------------------------------------------------
	Local file stuff.
---------------------------------------------------------*/
-- This is all the stuff that makes the addon load.
NotifyRevamp = {} -- Base Table.
NotifyRevamp.Config = {} -- Config Table.
--NotifyRevamp.Language = {} -- Language Table [ COMING SOON ].

print("[NotifyRevamp] Loading the addon.")
if SERVER then
	print( "[NotifyRevamp] SERVERSIDE LOADING...")
	--
	include("sh_notifyrevamp_config.lua")
	AddCSLuaFile("sh_notifyrevamp_config.lua")
	--
	/*
	local langfiles = file.Find( "notifyrevamp/language/*", "LUA" )
	for k,v in pairs(langfiles) do
		AddCSLuaFile("notifyrevamp/language/" .. v)
		include("notifyrevamp/language/" .. v)
	end
	print("[NotifyRevamp] LANGUAGE SUPPORT LOADED.")
	*/
	--
	local corefiles = file.Find( "notifyrevamp/core/*", "LUA" )
	for k,v in pairs(corefiles) do
		AddCSLuaFile("notifyrevamp/core/" .. v)
		include("notifyrevamp/core/" .. v)
	end
	print("[NotifyRevamp] CORE FILES LOADED.")
	--
	print( "[NotifyRevamp] SERVERSIDE LOADED.")
	--
end

if CLIENT then
	print( "[NotifyRevamp] CLIENTSIDE LOADING...")
	--
	include("sh_notifyrevamp_config.lua")
	--
	/*
	local langfiles = file.Find( "notifyrevamp/language/*", "LUA" )
	for k,v in pairs(langfiles) do
		include("notifyrevamp/language/" .. v)
	end
	print("[NotifyRevamp] LANGUAGE SUPPORT LOADED.")
	*/
	--
	local corefiles = file.Find( "notifyrevamp/core/*", "LUA" )
	for k,v in pairs(corefiles) do
		include("notifyrevamp/core/" .. v)
	end
	print("[NotifyRevamp] CORE FILES LOADED.")
	--
	print( "[NotifyRevamp] CLIENTSIDE LOADED.")
end
print("[NotifyRevamp] Successfully loaded the addon.")