local _, addon = ...
local E, P, C, D, L = addon.E, addon.P, addon.C, addon.D, addon.L

-- Lua
local _G = getfenv(0)
local next = _G.next

-- Mine
function P:Modernize(data, name, key)
	if not data.version then return end

	if key == "profile" then
		-- ->20506.02
		if data.version < 2050601 then
			local temp = {
				types = {},
				anchors = {},
			}

			if data.types then
				for k, v in next, data.types do
					temp.types[k] = v.anchor

					v.anchor = nil
				end
			end

			if data.anchors then
				for k, v in next, data.anchors do
					v.point = nil

					temp.anchors[k] = addon:CopyTable(v)
					temp.anchors[k].id = k
				end

				if not temp.anchors[1] then
					temp.anchors[1] = {
						id = 1,
					}
				end

				data.anchors = nil
			end

			if not data.layouts then
				data.layouts = {
					Classic = {},
					Modern = {},
				}
			end

			for _, layout in next, data.layouts do
				addon:CopyTable(temp, layout)
			end

			data.version = 2050601
		end
	end
end
