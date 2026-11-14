local _, addon = ...
local E = addon.E

-- Lua
local _G = getfenv(0)

-- Mine
E.CHANGELOG = [[
- Integrated the addon into Edit Mode. Most anchor settings are now available via Edit Mode and tied to its layouts. I preserved most of the settings, but given my past experiences with retail I chose to reset positions of the anchors.
- Added layout data manager. Available at Options > AddOns > LS: Toasts > Layouts.
- Added layout data support to the importer/exporter.
]]
