local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.CollectionService
local u8 = v6.Players
local u9 = v6.ReplicatedStorage
local u10 = v6.TweenService
local u11 = v6.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "ArmorAugmentManagerController"
    end,
    ["__index"] = u12
})
u18.__index = u18
function u18.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p21)
    p21.Name = "ArmorAugmentManagerController"
end
function u18.KnitStart(p22) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.KnitStart(p22)
end
function u18.getCannotPurchaseArmorEnchantReason(_, p23) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u15
        [4] = u13
    --]]
    local v24 = p23:GetAttribute("CannotPurchaseArmorEnchants")
    if v24 == 0 or (v24 ~= v24 or (v24 == "" or not v24)) then
        return nil
    end
    if not u3.Controllers.KitController:isUsingKit(u8.LocalPlayer, u15.BIGMAN) then
        return u3.Controllers.KitController:isUsingKit(u8.LocalPlayer, u15.VOID_KNIGHT) and "Requires Empowered Form (KIT)" or (u3.Controllers.KitController:isUsingKit(u8.LocalPlayer, u15.TINKER) and "Requires Diamond Mech" or (u3.Controllers.KitController:isUsingKit(u8.LocalPlayer, u15.WARRIOR) and "Requires Warrior Armor" or "Requires Diamond Armor"))
    end
    local v25 = u13.MIN_HP_ELDERTREE_REQUIREMENT
    return "Requires " .. tostring(v25) .. " Health"
end
function u18.playVoidifyEffect(_, p26) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u17
        [3] = u9
        [4] = u11
        [5] = u5
        [6] = u7
        [7] = u10
    --]]
    local v27 = p26.Character
    if v27 ~= nil then
        v27 = v27.PrimaryPart
    end
    if not v27 then
        return nil
    end
    u2:playSound(u17.VOIDIFY_ARMOR, {
        ["position"] = p26.Character.PrimaryPart.Position
    })
    local u28 = u9.Assets.Effects.VoidifyEffect:Clone()
    u28.Parent = u11
    u28:PivotTo(p26.Character.PrimaryPart.CFrame)
    u5("WeldConstraint", {
        ["Part0"] = u28,
        ["Part1"] = p26.Character.PrimaryPart,
        ["Parent"] = p26.Character
    })
    for v29, v30 in u28:GetDescendants() do
        local _ = v29 - 1
        if v30.Name ~= "Pulse" and v30.Name ~= "Pulse2" then
            u7:AddTag(v30, "FirstPersonHidden")
        end
    end
    local v31 = 0
    local u32 = {}
    for v33, v34 in u28:GetDescendants() do
        local _ = v33 - 1
        if v34:IsA("Beam") == true then
            v31 = v31 + 1
            u32[v31] = v34
        end
    end
    local function v38(p35) --[[ Line: 104 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        local v36
        if p35.CurveSize0 > 0 then
            v36 = p35.CurveSize0 - 2
        else
            v36 = p35.CurveSize0 + 2
        end
        local v37
        if p35.CurveSize1 > 0 then
            v37 = p35.CurveSize1 - 2
        else
            v37 = p35.CurveSize1 + 2
        end
        u10:Create(p35, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
            ["CurveSize0"] = v36,
            ["CurveSize1"] = v37
        }):Play()
    end
    for v39, v40 in u32 do
        v38(v40, v39 - 1, u32)
    end
    task.delay(0.5, function() --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u28
        --]]
        for v41, v42 in u32 do
            local _ = v41 - 1
            v42:Destroy()
        end
        u28.BuildupParticles:Destroy()
        u28.Specs.Enabled = false
        u28.SpecsInner.Enabled = false
        u28.ExplosionParticles.Pulse:Emit(1)
        u28.ExplosionParticles.Pulse2:Emit(1)
        u28.ExplosionParticles.Sparks.Enabled = true
    end)
    task.delay(1.5, function() --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        u28.ExplosionParticles.Sparks.Enabled = false
    end)
    task.delay(3.5, function() --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        u28:Destroy()
    end)
end
function u18.refreshArmorModels(_, p43) --[[ Line: 137 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u15
        [4] = u14
        [5] = u4
        [6] = u16
    --]]
    if u3.Controllers.KitController:isUsingKit(u8.LocalPlayer, u15.BIGMAN) then
        return nil
    end
    if u3.Controllers.KitController:isUsingKit(u8.LocalPlayer, u15.VOID_KNIGHT) then
        return nil
    end
    if u3.Controllers.KitController:isUsingKit(u8.LocalPlayer, u15.TINKER) then
        return nil
    end
    local u44 = u14:getEntity(p43)
    if not u44 then
        return nil
    end
    local v45 = false
    local v46 = 0
    while true do
        if v45 then
            v46 = v46 + 1
        else
            v45 = true
        end
        if v46 >= #u4.values(u16) then
            return
        end
        local v47 = u44:getInstance():WaitForChild("ArmorInvItem_" .. tostring(v46))
        if u3.Controllers.KitController:isUsingKit(u8.LocalPlayer, u15.WARRIOR) then
            local v48 = v47.Value
            if v48 ~= nil then
                v48 = v48.Name
            end
            local v49 = string.find(v48, "diamond")
            if v49 ~= 0 and (v49 == v49 and v49) then
                return nil
            end
        end
        (function(p50, p51) --[[ Line: 175 ]]
            --[[
            Upvalues:
                [1] = u44
            --]]
            if p51 then
                local v52 = u44:getPlayer()
                if v52 ~= nil then
                    v52 = v52:GetAttribute("ArmorTrimType")
                end
                local v53 = u44:getPlayer()
                if v53 ~= nil then
                    v53 = v53:GetAttribute("ArmorTrimColor")
                end
                local v54 = u44:getPlayer()
                if v54 ~= nil then
                    v54 = v54:GetAttribute("ArmorTrimEffectRank")
                end
                u44:equipArmorItem(p51, p50, v52 and (v53 ~= nil and v54 ~= nil) and {
                    ["type"] = v52,
                    ["color"] = v53,
                    ["effectRank"] = v54
                } or nil)
            else
                u44:unequipArmorSlot(p50)
            end
        end)(v46, v47.Value)
    end
end
u3.CreateController(u18.new())
return {
    ["AUGMENT_UPGRADE_EFFECT_DURATION"] = 0.5
}