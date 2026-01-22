std = "none"
max_line_length = false
max_comment_line_length = 120
self = false

exclude_files = {
	".luacheckrc",
	"ls_Toasts_Classic/embeds/",
}

ignore = {
	"111/LS.*", -- Setting an undefined global variable starting with LS
	"111/SLASH_.*", -- Setting an undefined global variable starting with SLASH_
	"112/LS.*", -- Mutating an undefined global variable starting with LS
	"112/ls_Toasts", -- Mutating an undefined global variable ls_Toasts
	"113/LS.*", -- Accessing an undefined global variable starting with LS
	"113/ls_Toasts", -- Accessing an undefined global variable ls_Toasts
	"122", -- Setting a read-only field of a global variable
	"211/_G", -- Unused local variable _G
	"211/C",  -- Unused local variable C
	"211/D",  -- Unused local variable D
	"211/E",  -- Unused local variable E
	"211/L",  -- Unused local variable L
	"211/P",  -- Unused local variable P
	"432", -- Shadowing an upvalue argument
}

globals = {
	-- Lua
	"getfenv",
	"print",

	-- FrameXML
	"SlashCmdList",
}

read_globals = {
	"ActionStatus_DisplayMessage",
	"AlertFrame",
	"C_AddOns",
	"C_Container",
	"C_CurrencyInfo",
	"C_Item",
	"C_Timer",
	"ColorMixin",
	"Constants",
	"CreateFrame",
	"DressUpItemLink",
	"EventRegistry",
	"FormatLargeNumber",
	"GameTooltip",
	"GameTooltip_ShowCompareItem",
	"GetCurrencyListInfo",
	"GetCurrencyListSize",
	"GetCVarBool",
	"GetLocale",
	"GetMoney",
	"GetMoneyString",
	"HideUIPanel",
	"InCombatLockdown",
	"IsControlKeyDown",
	"IsLoggedIn",
	"IsModifiedClick",
	"IsShiftKeyDown",
	"ITEM_QUALITY_COLORS",
	"LibStub",
	"Mixin",
	"NUM_BAG_SLOTS",
	"OpenBag",
	"PlaySound",
	"PlaySoundFile",
	"ScrollingFontMixin",
	"ScrollUtil",
	"Settings",
	"SettingsPanel",
	"ShoppingTooltip1",
	"ShoppingTooltip2",
	"SquareButton_SetIcon",
	"UIParent",
	"UnitFactionGroup",
	"UnitGUID",
}
