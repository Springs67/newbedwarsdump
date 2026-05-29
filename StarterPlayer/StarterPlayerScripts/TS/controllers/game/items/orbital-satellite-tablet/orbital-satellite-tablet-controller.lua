local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "OrbitalSatelliteTabletController"
    end,
    ["__index"] = u5
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
    --]]
    u5.constructor(p10)
    p10.Name = "OrbitalSatelliteTabletController"
    p10.tabletMaid = u3.new()
    p10.inTablet = false
end
function u7.KnitStart(p11) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u6
    --]]
    u5.KnitStart(p11)
    u4.ItemConsumed:connect(function(p12) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        if p12.itemType ~= u6.ORBITAL_SATELLITE_TABLET then
            return nil
        end
    end)
end
function u7.isRelevantItem(_, p13) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    return p13.itemType == u6.ORBITAL_SATELLITE_TABLET
end
function u7.onEnable(_, _, _) --[[ Line: 40 ]] end
function u7.onDisable(p14) --[[ Line: 42 ]]
    p14.tabletMaid:DoCleaning()
end
v2.CreateController(u7.new())
return nil