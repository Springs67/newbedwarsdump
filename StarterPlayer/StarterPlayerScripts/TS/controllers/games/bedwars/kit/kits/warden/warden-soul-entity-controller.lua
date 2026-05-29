local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local v4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u5 = v4.InteractionCategory
local u6 = v4.InteractionPriority
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "collectable-entity", "collectable-entity-controller").CollectableEntityController
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "JailorController"
    end,
    ["__index"] = u8
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
        [1] = u8
    --]]
    u8.constructor(p12)
    p12.Name = "JailorController"
end
function u9.KnitStart(p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.KnitStart(p13)
end
function u9.validCollectableEntityTypes(_) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return { u7.JAILOR_SOUL }
end
function u9.pickDisplayModel(_, p14, p15) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u5
    --]]
    return {
        ["repStorageModel"] = p15 or u3:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("JailorSoul"):Clone(),
        ["collectionTag"] = p14,
        ["proximityPrompt"] = {
            ["interactionObjectText"] = "Soul",
            ["interactionLabel"] = "Imprison",
            ["maxActivationDistance"] = 14,
            ["priority"] = u6.ABILITY,
            ["category"] = u5.ABILITY
        }
    }
end
function u9.onWillRemoveEntity(_, _, _, _, _) --[[ Line: 48 ]] end
function u9.onCreatedEntity(_, _, _, _) --[[ Line: 50 ]] end
v2.CreateController(u9.new())
return nil