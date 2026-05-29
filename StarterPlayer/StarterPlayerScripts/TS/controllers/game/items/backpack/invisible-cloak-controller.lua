local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GameQueryUtil
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u22 = v1.import(script, script.Parent, "ui", "invisible-cloak-energy-component").InvisibleCloakEnergyComponent
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "InvisibleCloakController"
    end,
    ["__index"] = u15
})
u23.__index = u23
function u23.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u7
    --]]
    u15.constructor(p26)
    p26.Name = "InvisibleCloakController"
    p26.playerMaid = {}
    p26.partialInvisibility = {
        ["transparency"] = 0.9
    }
    p26.fullInvisibility = {
        ["transparency"] = 1
    }
    p26.uiMaid = u7.new()
end
function u23.KnitStart(u27) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u14
        [3] = u17
        [4] = u11
        [5] = u18
        [6] = u6
        [7] = u5
        [8] = u19
        [9] = u16
    --]]
    u15.KnitStart(u27)
    u14.BackpackEquipEvent:connect(function(p28) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u27
            [3] = u11
        --]]
        if p28.item == u17.INVISIBLE_CLOAK then
            u27:equip(p28.player)
        else
            u27:unequip(p28.player)
        end
        if p28.player == u11.LocalPlayer then
            if p28.item == u17.INVISIBLE_CLOAK then
                u27:onEquip(p28.backpack)
                return
            end
            u27:cleanUp()
        end
    end)
    u18.Client:Get("InvisibleCloakState"):Connect(function(p29) --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u6
            [3] = u27
            [4] = u5
            [5] = u19
            [6] = u16
        --]]
        local v30 = p29.player.Character
        if not v30 then
            return nil
        end
        if p29.active then
            if p29.player == u11.LocalPlayer then
                u6.Controllers.CharacterTransparencyController:getTransparencyModifier(v30):addModifier(u27.partialInvisibility)
                u5:playSound(u19.INVISIBLE_CLOAK)
            else
                u6.Controllers.CharacterTransparencyController:getTransparencyModifier(v30):removeModifier(u27.partialInvisibility)
                u6.Controllers.CharacterTransparencyController:getTransparencyModifier(v30):addModifier(u27.fullInvisibility)
            end
            local v31 = u16:getEntity(p29.player)
            if v31 ~= nil then
                v31 = v31:getInstance()
            end
            if v31 then
                u27:playSmokePuff(v31)
                return
            end
        else
            u6.Controllers.CharacterTransparencyController:getTransparencyModifier(v30):removeModifier(u27.partialInvisibility)
            u6.Controllers.CharacterTransparencyController:getTransparencyModifier(v30):removeModifier(u27.fullInvisibility)
        end
    end)
end
function u23.onEquip(p32, p33) --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u2
        [3] = u9
        [4] = u22
    --]]
    if not p33 then
        return nil
    end
    if p33.itemType ~= u17.INVISIBLE_CLOAK then
        return nil
    end
    p32.uiMaid = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u9.createElement(u22, {
        ["backpack"] = p33.tool
    }))
end
function u23.cleanUp(p34) --[[ Line: 104 ]]
    p34.uiMaid:DoCleaning()
end
function u23.equip(u35, u36) --[[ Line: 107 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u12
        [3] = u21
    --]]
    task.spawn(function() --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u7
            [3] = u12
            [4] = u21
            [5] = u35
        --]]
        if not u36.Character then
            return nil
        end
        local v37 = u7.new()
        local v38 = u12.Assets.Misc.CloakCape:Clone()
        local v39 = u12.Assets.Misc.CloakHood:Clone()
        v37:GiveTask(v38)
        v37:GiveTask(v39)
        v38.Parent = u36.Character
        v39.Parent = u36.Character
        u21:weldAccessory(u36.Character, v38)
        u21:weldAccessory(u36.Character, v39)
        u35.playerMaid[u36.UserId] = v37
    end)
end
function u23.unequip(p40, p41) --[[ Line: 126 ]]
    local v42 = p40.playerMaid[p41.UserId]
    if v42 ~= nil then
        v42:DoCleaning()
    end
end
function u23.playSmokePuff(_, p43) --[[ Line: 134 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
        [3] = u8
        [4] = u4
        [5] = u20
    --]]
    local v44 = u12.Assets.Effects.CloakSmokePuff:Clone()
    local v45 = {}
    local v46 = p43.PrimaryPart
    if v46 ~= nil then
        v46 = v46.CFrame
    end
    v45.CFrame = v46
    v45.Anchored = true
    v45.CanQuery = false
    v45.CanCollide = false
    v45.Transparency = 1
    v45.Parent = u13
    local u47 = u8("Part", v45)
    u4:setQueryIgnored(u47, true)
    v44.Parent = u47
    v44.Speed = NumberRange.new(5)
    u20:playEffects({ v44 }, p43)
    task.delay(5, function() --[[ Line: 153 ]]
        --[[
        Upvalues:
            [1] = u47
        --]]
        u47:Destroy()
    end)
end
u6.CreateController(u23.new())
return nil