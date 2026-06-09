

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Utils.Stats.PetUtil);
local v3 = require(l_ReplicatedStorage_0.Shared.Constants);
local v4 = require(l_ReplicatedStorage_0.Shared.Data.Pets);
return function(v5, v6, v7) --[[ Line: 11 ]] --[[ Name: SortPetsList ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    local v8 = {};
    for _, v10 in v5 do
        v8[v10] = v2:GetPower(v6[v10]);
    end;
    table.sort(v5, function(v11, v12) --[[ Line: 21 ]]
        -- upvalues: v6 (copy), v4 (ref), v3 (ref), v8 (copy), v7 (copy)
        local v13 = v6[v11];
        local v14 = v6[v12];
        local v15 = v4[v13.Name];
        local v16 = v4[v14.Name];
		local function GetPriority(pet, data)
			if pet.Dev or data.Dev then
				return 7
			elseif pet.Void or data.Void then
				return 6
			elseif pet.Eternal or data.Eternal then
				return 5
			elseif pet.Infinity or data.Infinity then
				return 4
			elseif pet.Ultimatum or data.Ultimatum then
				return 3
			elseif pet.Ancient or data.Ancient then
				return 2
			elseif data.Rarity == "Secret" then
				return 1
			end
			
			return 0
		end

		local p1 = GetPriority(v13, v15)
		local p2 = GetPriority(v14, v16)

		if p1 ~= p2 then
			return p1 > p2

		elseif v13.Locked ~= v14.Locked then
            return v13.Locked == true;
        else
            local v17 = v3.RarityOrder[v15.Rarity];
            local v18 = v3.RarityOrder[v16.Rarity];
            local v19 = v8[v11];
            local v20 = v8[v12];
            if v7 == "Rarity" then
                if v17 ~= v18 then
                    return v18 < v17;
                elseif v19 ~= v20 then
                    return v20 < v19;
                end;
            elseif v19 ~= v20 then
                return v20 < v19;
            elseif v17 ~= v18 then
                return v18 < v17;
            end;
            if v13.Name ~= v14.Name then
                return v13.Name < v14.Name;
            elseif v13.XP ~= v14.XP then
                return v13.XP > v14.XP;
            else
                return v11 < v12;
            end;
        end;
    end);
end;
