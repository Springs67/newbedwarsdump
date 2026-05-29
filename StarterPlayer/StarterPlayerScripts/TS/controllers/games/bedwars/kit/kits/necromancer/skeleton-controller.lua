local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v6 = v5.KnitClient
local u7 = v5.KnitClient
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "SkeletonController"
    end,
    ["__index"] = u11
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p23)
    p23.Name = "SkeletonController"
end
function u20.KnitStart(u24) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u17
        [3] = u16
        [4] = u3
        [5] = u18
        [6] = u4
        [7] = u12
        [8] = u15
        [9] = u10
        [10] = u19
        [11] = u7
        [12] = u14
    --]]
    u11.KnitStart(u24)
    u17.Client:WaitFor("EntityDeathEvent"):andThen(function(p25) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u3
            [3] = u18
        --]]
        p25:Connect(function(p26) --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u3
                [3] = u18
            --]]
            if p26.entityInstance:GetAttribute("MonsterType") ~= u16.SKELETON then
                return nil
            end
            u3:playSound(u18.SKELETON_DEATH, {
                ["position"] = p26.cframe.Position
            })
        end)
    end)
    u4("Monster", function(u27) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u24
            [3] = u12
            [4] = u15
            [5] = u10
            [6] = u19
            [7] = u7
            [8] = u18
            [9] = u14
        --]]
        if u27:GetAttribute("MonsterType") == u16.SKELETON then
            task.spawn(function() --[[ Line: 56 ]]
                --[[
                Upvalues:
                    [1] = u24
                    [2] = u27
                    [3] = u12
                    [4] = u15
                    [5] = u10
                    [6] = u19
                    [7] = u7
                    [8] = u18
                --]]
                u24:setUpTeamColor(u27)
                local v28 = u27:GetAttribute("ArmorType")
                local v29 = u27:GetAttribute("WeaponType")
                if not u12.new(u27) then
                    return nil
                end
                u27:WaitForChild("Humanoid")
                u15.createItemInstance(v28).Parent = u27
                u10:WaitForChild("Assets"):WaitForChild("Armor"):WaitForChild(v28):WaitForChild(v28):Clone().Parent = u27
                u15.createItemInstance(v29).Parent = u27
                u19:weldCharacterAccessories(u27)
                u7.Controllers.FootstepsController:hookCharacter(nil, u27, {
                    ["walk"] = {
                        u18.SKELETON_FOOTSTEP_1,
                        u18.SKELETON_FOOTSTEP_2,
                        u18.SKELETON_FOOTSTEP_3,
                        u18.SKELETON_FOOTSTEP_4
                    },
                    ["run"] = {
                        u18.SKELETON_FOOTSTEP_1,
                        u18.SKELETON_FOOTSTEP_2,
                        u18.SKELETON_FOOTSTEP_3,
                        u18.SKELETON_FOOTSTEP_4
                    }
                })
            end)
        elseif u27:GetAttribute("MonsterType") == u16.SKELETON_ARCHER then
            task.spawn(function() --[[ Line: 78 ]]
                --[[
                Upvalues:
                    [1] = u24
                    [2] = u27
                    [3] = u12
                    [4] = u14
                    [5] = u15
                    [6] = u19
                --]]
                task.wait(1)
                u24:setUpTeamColor(u27)
                if not u12.new(u27) then
                    return nil
                end
                u27:WaitForChild("Humanoid")
                local v30 = u27:GetAttribute("BowType") or u14.WOOD_BOW
                u15.createItemInstance(v30).Parent = u27
                u19:weldCharacterAccessories(u27)
            end)
        end
    end)
end
function u20.setUpTeamColor(_, p31) --[[ Line: 94 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u9
    --]]
    local v32 = u13:getEntity(u9.LocalPlayer)
    local v33 = p31:GetAttribute("Team")
    if v32 ~= nil then
        v32 = v32:getInstance():GetAttribute("Team")
    end
    local v34 = v33 == v32
    local v35
    if v34 then
        v35 = Color3.fromRGB(74, 255, 186)
    else
        v35 = Color3.fromRGB(192, 53, 49)
    end
    local v36
    if v34 then
        v36 = Color3.fromRGB(163, 250, 164)
    else
        v36 = Color3.fromRGB(210, 99, 102)
    end
    local v37 = p31:WaitForChild("3DClothing", 3)
    if v37 ~= nil then
        v37 = v37:WaitForChild("Head", 3)
        if v37 ~= nil then
            v37 = v37:WaitForChild("Neon", 3)
        end
    end
    v37.Color = v35
    for _, v38 in v37:GetDescendants() do
        if v38:IsA("ParticleEmitter") then
            v38.Enabled = true
            v38.Color = ColorSequence.new(v35, v36)
        end
    end
    for _, v39 in p31:WaitForChild("TeamIndicator", 3):GetDescendants() do
        if v39:IsA("ParticleEmitter") then
            v39.Enabled = true
            v39.Color = ColorSequence.new(v35, v36)
        end
    end
end
v6.CreateController(u20.new())
return nil