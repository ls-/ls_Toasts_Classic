local _, addon = ...
local C, D, L = addon.C, addon.D, addon.L
addon.Tooltip = {}

--Lua
local _G = getfenv(0)
local pcall = _G.pcall
local s_split = _G.string.split
local t_concat = _G.table.concat
local tonumber = _G.tonumber

-- Mine
-- local tooltip = CreateFrame("GameTooltip", "LSToastsTooltip", UIParent, "GameTooltipTemplate")
-- tooltip:SetScript("OnUpdate", function(self, elapsed)
-- 	self.updateTooltipTimer = (self.updateTooltipTimer or 0.2) - elapsed
-- 	if self.updateTooltipTimer > 0 then return end

-- 	if self.shouldRefreshData then
-- 		-- stolen from p3lim :v
-- 		local info = self:GetPrimaryTooltipInfo()
-- 		if info and info.getterName and info.getterArgs then
-- 			if self[info.getterName:gsub("Get", "Set")](self, unpack(info.getterArgs)) then
-- 				self:Show()
-- 			end
-- 		end

-- 		self.shouldRefreshData = false
-- 	end

-- 	self.updateTooltipTimer = 0.2
-- end)
-- tooltip:Hide()

-- tooltip.supportsItemComparison = true
-- tooltip.shoppingTooltips = {}

-- for i = 1, 2 do
-- 	local tt = CreateFrame("GameTooltip", "LSToastsShoppingTooltip" .. i, UIParent, "ShoppingTooltipTemplate")
-- 	tt:SetClampedToScreen(true)
-- 	tt:SetFrameStrata("TOOLTIP")
-- 	tt:Hide()

-- 	tooltip.shoppingTooltips[i] = tt
-- end

function addon.Tooltip:SetAnchor(frame, p, rP, x, y)
	GameTooltip:Hide()
	GameTooltip:SetOwner(frame, "ANCHOR_NONE")
	GameTooltip:SetPoint(p, frame, rP, x, y)
end

function addon.Tooltip:ShowHyperlink(link)
	GameTooltip:SetHyperlink(link)
	GameTooltip:Show()
end
