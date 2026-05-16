local addonName, addon = ...

-- Lua
local _G = getfenv(0)
local error = _G.error
local geterrorhandler = _G.geterrorhandler
local next = _G.next
local pairs = _G.pairs
local s_format = _G.string.format
local s_match = _G.string.match
local s_split = _G.string.split
local setmetatable = _G.setmetatable
local t_concat = _G.table.concat
local tonumber = _G.tonumber
local type = _G.type
local xpcall = _G.xpcall

-- Mine
local E, P, C, D, L = {}, {}, {}, {}, {}
addon.E, addon.P, addon.C, addon.D, addon.L = E, P, C, D, L

_G[addonName] = {
	[1] = E,
	[2] = C,
	[3] = L,
}

do
	local oneTimeEvents = {ADDON_LOADED = false, PLAYER_LOGIN = false}
	local registeredEvents = {}

	local dispatcher = CreateFrame("Frame")
	dispatcher:SetScript("OnEvent", function(_, event, ...)
		for func in next, registeredEvents[event] do
			func(...)
		end

		if oneTimeEvents[event] == false then
			oneTimeEvents[event] = true
		end
	end)

	function E:RegisterEvent(event, func, unit1, unit2)
		if oneTimeEvents[event] then
			error(s_format("Failed to register for '%s' event, already fired!", event), 3)
		end

		if not func or type(func) ~= "function" then
			error(s_format("Failed to register for '%s' event, no handler!", event), 3)
		end

		if not registeredEvents[event] then
			registeredEvents[event] = {}

			if unit1 then
				P:Call(dispatcher.RegisterUnitEvent, dispatcher, event, unit1, unit2)
			else
				P:Call(dispatcher.RegisterEvent, dispatcher, event)
			end
		end

		registeredEvents[event][func] = true
	end

	function E:UnregisterEvent(event, func)
		local funcs = registeredEvents[event]

		if funcs and funcs[func] then
			funcs[func] = nil

			if not next(funcs) then
				registeredEvents[event] = nil

				P:Call(dispatcher.UnregisterEvent, dispatcher, event)
			end
		end
	end
end

function P:UpdateTable(src, dest)
	if type(dest) ~= "table" then
		dest = {}
	end

	for k, v in next, src do
		if type(v) == "table" then
			dest[k] = self:UpdateTable(v, dest[k])
		else
			if dest[k] == nil then
				dest[k] = v
			end
		end
	end

	return dest
end

function addon:CopyTable(src, dest, ignore)
	if type(dest) ~= "table" then
		dest = {}
	end

	for k, v in next, src do
		if not ignore or not ignore[k] then
			if type(v) == "table" then
				dest[k] = self:CopyTable(v, dest[k])
			else
				dest[k] = v
			end
		end
	end

	return dest
end

-- a copy of removeDefaults from AceDB-3.0
function addon:DiffTable(dest, src, blocker)
	setmetatable(dest, nil)

	for k, v in pairs(src) do
		if k == "*" or k == "**" then
			if type(v) == "table" then
				for key, value in pairs(dest) do
					if type(value) == "table" then
						if src[key] == nil and (not blocker or blocker[key] == nil) then
							addon:DiffTable(value, v)

							if next(value) == nil then
								dest[key] = nil
							end
						elseif k == "**" then
							addon:DiffTable(value, v, src[key])
						end
					end
				end
			elseif k == "*" then
				for key, value in pairs(dest) do
					if src[key] == nil and v == value then
						dest[key] = nil
					end
				end
			end
		elseif type(v) == "table" and type(dest[k]) == "table" then
			addon:DiffTable(dest[k], v, blocker and blocker[k])

			if next(dest[k]) == nil then
				dest[k] = nil
			end
		else
			if dest[k] == src[k] and (not blocker or blocker[k] == nil) then
				dest[k] = nil
			end
		end
	end
end

do
	local function errorHandler(err)
		return geterrorhandler()(err)
	end

	function P:Call(func, ...)
		return xpcall(func, errorHandler, ...)
	end
end

-- Libs
P.CallbackHandler = LibStub("CallbackHandler-1.0"):New(E)

-------------
-- HELPERS --
-------------

function E:SanitizeLink(link)
	if not link or link == "[]" or link == "" then
		return
	end

	local temp, name = s_match(link, "|H(.+)|h%[(.+)%]|h")
	link = temp or link

	local linkTable = {s_split(":", link)}

	if linkTable[1] ~= "item" then
		return link, link, linkTable[1], tonumber(linkTable[2]), name
	end

	-- remove modifier types and values due to inconsistencies
	local numBonusIDs = tonumber(linkTable[14])
	if numBonusIDs then
		local numModifiers = tonumber(linkTable[15 + numBonusIDs])
		if numModifiers then
			for i = 16 + numBonusIDs, 16 + numBonusIDs + numModifiers * 2 - 1 do
				linkTable[i] = ""
			end
		end
	end

	return t_concat(linkTable, ":"), link, linkTable[1], tonumber(linkTable[2]), name
end

function E:GetScreenQuadrant(frame)
	local x, y = frame:GetCenter()

	if not (x and y) then
		return "UNKNOWN"
	end

	local screenWidth = UIParent:GetRight()
	local screenHeight = UIParent:GetTop()
	local screenLeft = screenWidth / 3
	local screenRight = screenWidth * 2 / 3

	if y >= screenHeight * 2 / 3 then
		if x <= screenLeft then
			return "TOPLEFT"
		elseif x >= screenRight then
			return "TOPRIGHT"
		else
			return "TOP"
		end
	elseif y <= screenHeight / 3 then
		if x <= screenLeft then
			return "BOTTOMLEFT"
		elseif x >= screenRight then
			return "BOTTOMRIGHT"
		else
			return "BOTTOM"
		end
	else
		if x <= screenLeft then
			return "LEFT"
		elseif x >= screenRight then
			return "RIGHT"
		else
			return "CENTER"
		end
	end
end

do
	local itemCache = {}

	function E:GetItemLevel(itemLink)
		local _, _, _, _, _, _, _, _, itemEquipLoc = C_Item.GetItemInfo(itemLink)
		if not itemEquipLoc or itemEquipLoc == "INVTYPE_NON_EQUIP_IGNORE" then
			return 0
		end

		if itemCache[itemLink] then
			return itemCache[itemLink]
		end

		local ilvl = C_Item.GetDetailedItemLevelInfo(itemLink)

		itemCache[itemLink] = ilvl

		return ilvl or 0
	end
end

do
	function E:SearchBagsForItemID(itemID)
		for i = 0, NUM_BAG_SLOTS do
			for j = 1, C_Container.GetContainerNumSlots(i) do
				if C_Container.GetContainerItemID(i, j) == itemID then
					return i, j
				end
			end
		end

		return -1, -1
	end
end

-------------
-- COLOURS --
-------------

do
	local color_proto = {}

	function color_proto:GetHex()
		return self.hex
	end

	-- override ColorMixin:GetRGBA
	function color_proto:GetRGBA(a)
		return self.r, self.g, self.b, a or self.a
	end

	function addon:CreateColor(r, g, b, a)
		if r > 1 or g > 1 or b > 1 then
			r, g, b = r / 255, g / 255, b / 255
		end

		local color = Mixin({}, ColorMixin, color_proto)
		color:SetRGBA(r, g, b, a)

		-- do not override SetRGBA, so calculate hex separately
		color.hex = color:GenerateHexColor()

		return color
	end
end
