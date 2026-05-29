local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "collectable-entity", "collectable-entity-controller").CollectableEntityController
local v5 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u6 = v5.InteractionCategory
local u7 = v5.InteractionPriority
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "map-environment-types").ForestEnvironmentMushroomType
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "ForestEnvironmentCollectibleEntityController"
    end,
    ["__index"] = u4
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p14)
    p14.Name = "ForestEnvironmentCollectibleEntityController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.KnitStart(p15)
end
function u11.validCollectableEntityTypes(_) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return { u8.FOREST_ENVIRONMENT_PLANT }
end
function u11.pickDisplayModel(_, p16, _) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u6
    --]]
    local v18 = {
        ["repStorageModel"] = u3:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("SingleMushroom"),
        ["collectionTag"] = p16,
        ["proximityPrompt"] = {
            ["interactionLabel"] = "Eat",
            ["interactionObjectText"] = function(p17) --[[ Name: interactionObjectText, Line 42 ]]
                return p17.Name
            end,
            ["priority"] = u7.ABILITY,
            ["category"] = u6.ABILITY
        }
    }
    return v18
end
function u11.onWillRemoveEntity(_, _, _, _, _) --[[ Line: 51 ]]
    return nil
end
function u11.onCreatedEntity(_, _, _, p19) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    p19:PivotTo(CFrame.new(p19:GetPrimaryPartCFrame().Position + Vector3.new(0, -1.5, 0)))
    local v20 = p19:GetAttribute("MushroomType")
    if v20 ~= nil then
        local v21 = p19:FindFirstChild("Pivot")
        if v21 ~= nil then
            v21 = v21:FindFirstChild("MushroomTop")
        end
        if v21 then
            if v20 == u10.Heal then
                v21.Color = Color3.new(1, 0.31, 0.31)
            elseif v20 == u10.Shield then
                v21.Color = Color3.new(0.27, 0.71, 1)
            elseif v20 == u10.Speed then
                v21.Color = Color3.new(0.95, 1, 0.27)
            elseif v20 == u10.Dizzy then
                v21.Color = Color3.new(0.7, 0.16, 0.71)
            end
        end
    end
    return nil
end
function u11.canPickupEntity(_, p22, p23) --[[ Line: 88 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
    --]]
    local v24 = p23:GetAttribute("MushroomType")
    if v24 == nil then
        return true
    end
    if v24 == u10.Heal then
        local v25 = u9:getEntity(p22)
        if v25 and (v25:isDead() or v25:getHealth() >= v25:getMaxHealth()) then
            return false
        end
    end
    return true
end
v2.CreateController(u11.new())
return nil