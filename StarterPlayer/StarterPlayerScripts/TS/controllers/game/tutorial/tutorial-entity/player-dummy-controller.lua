local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedWarsArmor
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "PlayerDummyController"
    end,
    ["__index"] = u7
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p17)
    p17.Name = "PlayerDummyController"
end
function u14.KnitStart(u18) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u12
        [4] = u5
    --]]
    u7.KnitStart(u18)
    u2("Monster", function(u19) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u5
            [3] = u18
        --]]
        if u19:GetAttribute("MonsterType") ~= u12.PLAYER_DUMMY then
            return nil
        end
        task.spawn(function() --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u19
            --]]
            u5.Controllers.FootstepsController:hookCharacter(nil, u19)
        end)
        u18:setupEquips(u19)
        u18:setupAnimations(u19)
    end)
end
function u14.setupEquips(_, u20) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u10
        [4] = u6
        [5] = u13
        [6] = u11
    --]]
    local v21 = u9:getEntity(u20)
    local v22 = u8.new(u20)
    u20:WaitForChild("Humanoid")
    if not (v21 and v22) then
        return nil
    end
    local v23 = u20:GetAttribute("ArmorType")
    local u24 = u20:GetAttribute("WeaponType")
    local v25 = nil
    for v26, v27 in u10 do
        local _ = v26 - 1
        if table.find(v27, v23) ~= nil == true then
            v25 = v27
            break
        end
    end
    if v25 ~= nil then
        for v28, u29 in v25 do
            local _ = v28 - 1
            task.spawn(function() --[[ Line: 71 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u29
                    [3] = u20
                --]]
                for v30, v31 in u6:WaitForChild("Assets"):WaitForChild("Armor"):WaitForChild(u29):GetChildren() do
                    local _ = v30 - 1
                    if v31:IsA("Accessory") then
                        v31:Clone().Parent = u20
                    end
                end
            end)
        end
    end
    u13:weldCharacterAccessories(u20)
    task.delay(2, function() --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u24
            [3] = u20
            [4] = u13
        --]]
        local v32 = u11.createItemInstance(u24)
        v32.Parent = u20
        for v33, v34 in v32:GetDescendants() do
            local _ = v33 - 1
            if v34:IsA("Attachment") and v34.Name ~= "RightGripAttachment" then
                v34:Destroy()
            end
        end
        u13:weldAccessory(u20, v32)
    end)
end
function u14.setupAnimations(_, _) --[[ Line: 104 ]] end
v4.CreateController(u14.new())
return nil