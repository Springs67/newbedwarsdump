local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.TweenService
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "HealingBackpckController"
    end,
    ["__index"] = u11
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
    --]]
    u11.constructor(p22)
    p22.Name = "HealingBackpckController"
    p22.abilityMaid = u5.new()
end
function u19.equip(u23) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u12
        [3] = u15
        [4] = u16
    --]]
    local u24 = true
    u23.abilityMaid:GiveTask(function() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24 = false
        return u24
    end)
    task.spawn(function() --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u12
            [3] = u15
            [4] = u16
            [5] = u24
            [6] = u23
        --]]
        local v25 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v26 = u12.HEALING_BACKPACK
        local v27 = {}
        local v28 = {}
        local v29 = u15(u16.HEALING_BACKPACK).image
        v28.icon = v29 == nil and "" or v29
        v27.abilityButton = v28
        v27.abilityType = "MiscPrimary"
        local v30 = v25:enableAbility(v26, v27):expect()
        if u24 then
            u23.abilityMaid:GiveTask(v30)
        else
            v30.Destroy()
        end
    end)
end
function u19.unequip(p31) --[[ Line: 67 ]]
    p31.abilityMaid:DoCleaning()
end
function u19.KnitStart(u32) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
        [3] = u12
        [4] = u8
        [5] = u14
        [6] = u16
        [7] = u17
        [8] = u6
        [9] = u13
        [10] = u9
        [11] = u3
        [12] = u18
    --]]
    u11.KnitStart(u32)
    u10.AbilityUsed:connect(function(p33) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u8
            [3] = u14
            [4] = u16
            [5] = u17
        --]]
        local v34
        if p33.ability == u12.HEALING_BACKPACK then
            v34 = p33.userCharacter == u8.LocalPlayer.Character
        else
            v34 = false
        end
        if v34 then
            local v35 = u14.getInventory(u8.LocalPlayer).backpack
            if v35 ~= nil then
                v35 = v35.itemType
            end
            v34 = v35 == u16.HEALING_BACKPACK
        end
        if v34 then
            u17.Client:Get("HealingBackpackUsed"):SendToServer({
                ["player"] = u8.LocalPlayer
            })
        end
    end)
    u10.BackpackEquipEvent:connect(function(p36) --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u16
            [3] = u32
        --]]
        if p36.player == u8.LocalPlayer then
            if p36.item == u16.HEALING_BACKPACK then
                u32:equip()
                return
            end
            u32:unequip()
        end
    end)
    u17.Client:Get("HealingBackpackEffect"):Connect(function(p37) --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u13
            [3] = u9
        --]]
        local v38 = p37.healer.Character
        local v39 = p37.target.Character
        if not (v38 and v39) then
            return nil
        end
        local v40 = v38:FindFirstChild("UpperTorso"):FindFirstChild("BodyFrontAttachment")
        local v41 = v39:FindFirstChild("UpperTorso"):FindFirstChild("BodyFrontAttachment")
        if v40 and v41 then
            local u42 = u6("Beam", {
                ["TextureSpeed"] = 0.7,
                ["Width0"] = 0,
                ["Width1"] = 0,
                ["FaceCamera"] = true,
                ["Attachment0"] = v40,
                ["Attachment1"] = v41,
                ["Texture"] = u13.WHITE_BEAM_ARROW,
                ["Color"] = ColorSequence.new(Color3.fromRGB(33, 247, 61)),
                ["Parent"] = v40
            })
            u9:Create(u42, TweenInfo.new(2), {
                ["Width0"] = 2.5,
                ["Width1"] = 1
            }):Play()
            task.delay(2, function() --[[ Line: 120 ]]
                --[[
                Upvalues:
                    [1] = u42
                --]]
                u42:Destroy()
            end)
        end
    end)
    u17.Client:Get("HealingBackpackSound"):Connect(function(p43) --[[ Line: 125 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u18
        --]]
        u3:playSound(u18.HEALING_BACKPACK_USED, {
            ["rollOffMaxDistance"] = 45,
            ["volumeMultiplier"] = 0.5,
            ["position"] = p43.position
        })
    end)
end
v4.CreateController(u19.new())
return nil