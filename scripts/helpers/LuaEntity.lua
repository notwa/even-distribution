local util = scripts.util
local config = require("config")
local entity = scripts.helpers
local _ = scripts.helpers.on

-- Helper functions for LuaEntity --

function entity:entityrequests() -- fetch all requests as table
	local requests = {}

    if self.request_slot_count > 0 then
		for i = 1, self.request_slot_count do
			local request = self.get_request_slot(i)
			if request then
				local item, amount = request.name, request.count
				if amount > 0 then
					requests[item] = math.max(requests[item] or 0, amount)
				end
			end
		end
	end

	return requests
end

function entity:entityrequest(item) -- fetch specific item request
	local count = 0

	if self.request_slot_count > 0 then
		for i = 1, self.request_slot_count do
			local request = self.get_request_slot(i)
			if request and request.name == item and request.count > count then
				count = math.max(count, request.count)
			end
		end
	end

	return count
end

-- for turrets
function entity:supportsAmmo(item)
	local attackParameters = self.prototype.attack_parameters
	local ammoType = item.get_ammo_type("turret") or item.get_ammo_type()
	return attackParameters and (_(attackParameters.ammo_categories):contains(ammoType.category))
end
