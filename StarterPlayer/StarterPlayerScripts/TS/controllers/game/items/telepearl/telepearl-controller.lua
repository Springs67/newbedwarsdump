local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "TelepearlController"
    end,
    ["__index"] = u6
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
    --]]
    u6.constructor(p12)
    p12.maid = u4.new()
    p12.Name = "TelepearlController"
end
function u9.isRelevantItem(_, p13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return p13.itemType == u8.TELEPEARL
end
function u9.onEnable(p14, _, _) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u7
    --]]
    local v15 = u5.LocalPlayer:GetAttribute("UseKitAbility")
    if v15 ~= 0 and (v15 == v15 and (v15 ~= "" and v15)) then
        return nil
    end
    p14:setupDestroyableYield(function() --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u7
        --]]
        return u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u7.TELEPEARL, nil):expect()
    end)
end
function u9.onDisable(p16) --[[ Line: 41 ]]
    p16.maid:DoCleaning()
end
function u9.KnitStart(p17) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.KnitStart(p17)
end
v3.CreateController(u9.new())
return nil