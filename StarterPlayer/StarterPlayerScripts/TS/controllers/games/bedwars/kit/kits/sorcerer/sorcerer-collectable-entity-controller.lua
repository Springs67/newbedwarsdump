local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local v5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u6 = v5.InteractionCategory
local u7 = v5.InteractionPriority
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "collectable-entity", "collectable-entity-controller").CollectableEntityController
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "SorcererCollectableEntityController"
    end,
    ["__index"] = u9
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p13)
    p13.Name = "SorcererCollectableEntityController"
end
function u10.KnitStart(p14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.KnitStart(p14)
end
function u10.validCollectableEntityTypes(_) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return { u8.ALCHEMY_CRYSTAL }
end
function u10.pickDisplayModel(_, p15, _) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u7
        [4] = u6
    --]]
    local v16 = {
        ["repStorageModel"] = u4:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("AlchemyCrystal"),
        ["collectionTag"] = p15,
        ["proximityPrompt"] = {
            ["holdDuration"] = 1,
            ["maxActivationDistance"] = 8,
            ["interactionLabel"] = "Collect",
            ["interactionObjectText"] = function(_) --[[ Name: interactionObjectText, Line 40 ]]
                return "Alchemy Crystal"
            end,
            ["clickablePrompt"] = u2.isMobileControls(),
            ["priority"] = u7.ABILITY,
            ["category"] = u6.ABILITY
        }
    }
    return v16
end
function u10.onWillRemoveEntity(_, _, _, _, _) --[[ Line: 52 ]]
    return nil
end
function u10.onCreatedEntity(_, _, _, p17) --[[ Line: 55 ]]
    p17:PivotTo(CFrame.new(p17:GetPrimaryPartCFrame().Position + Vector3.new(0, 0, 0)))
    return nil
end
v3.CreateController(u10.new())
return nil