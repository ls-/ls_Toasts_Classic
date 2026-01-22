local _, addon = ...
local E, P, C, D, L = addon.E, addon.P, addon.C, addon.D, addon.L

-- Lua
local _G = getfenv(0)

-- Mine
function P:Modernize(data, name, key)
	if not data.version then return end

	if key == "profile" then

	end
end
