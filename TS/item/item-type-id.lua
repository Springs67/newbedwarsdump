local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v4 = 0
local u5 = {}
for _, v6 in v2.values(v3) do
    u5[v6] = v4
    v4 = v4 + 1
end
return {
    ["getItemTypeId"] = function(p7) --[[ Name: getItemTypeId, Line 17 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        return u5[p7]
    end,
    ["getItemTypeFromId"] = function(p8) --[[ Name: getItemTypeFromId, Line 21 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        for v9, v10 in u5 do
            if v10 == p8 then
                return v9
            end
        end
        error("Invalid item type id: " .. tostring(p8))
    end,
    ["ItemTypeIds"] = u5
}