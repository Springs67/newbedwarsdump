local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").items
local u5 = {}
for _, v6 in v3.entries(v4) do
    local v7 = v6[1]
    local v8 = v6[2].itemCatalog
    if v8 ~= nil then
        v8 = v8.collection
    end
    if v8 ~= 0 and (v8 == v8 and v8) then
        v2.getOrCreate(u5, v8, {})[v7] = true
    end
end
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "ItemCatalogUtil"
    end
})
u9.__index = u9
function u9.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(_) --[[ Line: 34 ]] end
function u9.getAllCollectionElements(_, p12) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v13 = u5[p12]
    return v13 == nil and {} or v13
end
return {
    ["ItemCatalogUtil"] = u9
}