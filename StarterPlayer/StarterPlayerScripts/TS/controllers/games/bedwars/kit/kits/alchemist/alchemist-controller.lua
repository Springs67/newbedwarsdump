local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.ReplicatedStorage
local u7 = v4.Workspace
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "collectable-entity", "collectable-entity-controller").CollectableEntityController
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "AlchemistController"
    end,
    ["__index"] = u12
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p16)
    p16.Name = "AlchemistController"
end
function u13.KnitStart(p17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.KnitStart(p17)
end
function u13.validCollectableEntityTypes(_) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return { u8.ALCHEMIST_INGREDIENTS }
end
function u13.pickDisplayModel(p18, p19, _) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v20 = p18:getRandomIngredient()
    return {
        ["repStorageModel"] = u6:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild(v20),
        ["collectionTag"] = p19
    }
end
function u13.onWillRemoveEntity(_, _, _, _, _) --[[ Line: 45 ]]
    return nil
end
function u13.onCreatedEntity(u21, p22, _, u23) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u10
        [4] = u9
        [5] = u3
        [6] = u2
        [7] = u11
    --]]
    u23:PivotTo(CFrame.new(u23:GetPrimaryPartCFrame().Position + Vector3.new(0, -1, 0)))
    local v24 = u21:getEntityMaid(p22)
    if not v24 then
        return nil
    end
    local u25 = 0
    local function v30(p26) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u7
            [3] = u25
            [4] = u21
            [5] = u23
            [6] = u10
            [7] = u9
            [8] = u3
            [9] = u2
            [10] = u11
        --]]
        local v27 = u5.LocalPlayer
        local v28 = v27.Character
        if not (v28 and p26:IsDescendantOf(v28)) then
            return nil
        end
        local v29 = u7:GetServerTimeNow()
        if v29 - u25 < 0.35 then
            return nil
        end
        u25 = v29
        if not u21:canPickupEntity(v27, u23) then
            return nil
        end
        u10:playAnimation(v27, u9.PUNCH)
        u3.Controllers.ViewmodelController:playAnimation(u9.FP_USE_ITEM)
        u2:playSound(u11.PICKUP_ITEM_DROP)
        u21:collectEntity(v27, u23, u23.Name)
    end
    for _, v31 in u23:GetDescendants() do
        if v31:IsA("BasePart") then
            v24:GiveTask(v31.Touched:Connect(v30))
        end
    end
end
function u13.getRandomIngredient(_) --[[ Line: 82 ]]
    local v32 = math.random(0, 2)
    return v32 == 0 and "Flower" or (v32 == 1 and "Mushrooms" or (v32 == 2 and "Thorns" or "None"))
end
u3.CreateController(u13.new())
return nil