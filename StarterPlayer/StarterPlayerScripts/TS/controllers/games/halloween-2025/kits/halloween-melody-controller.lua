local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.GameQueryUtil
local u6 = v3.SoundManager
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Debris
local u12 = v10.Players
local u13 = v10.ReplicatedStorage
local u14 = v10.RunService
local u15 = v10.TweenService
local u16 = v10.Workspace
local u17 = u1.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kits").HalloweenKit
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local _ = { u18.SUPER_MELODY_AURA, u18.SUPER_MELODY_ULT, u18.SUPER_MELODY_HEAL }
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 34 ]]
        return "HalloweenMelodyController"
    end,
    ["__index"] = u17
})
u28.__index = u28
function u28.new(...) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u22
        [3] = u8
    --]]
    u17.constructor(p31, { u22.HALLOWEEN_2025_EVENT_PVE })
    p31.Name = "HalloweenMelodyController"
    p31.maid = u8.new()
    p31.inited = false
end
function u28.KnitStart(p32) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.KnitStart(p32)
end
function u28.onGameInit(u33) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u25
        [3] = u27
        [4] = u12
        [5] = u6
        [6] = u18
        [7] = u23
    --]]
    u26.Client:Get("SpecialWeaponHit"):Connect(function(p34) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u33
            [3] = u27
            [4] = u12
            [5] = u6
        --]]
        if p34.item == u25.SUPER_GUITAR and p34.target then
            u33:attackEffect(p34.attacker, p34.target)
            local v35 = u27.GUITAR_HEAL_1_ROCKSTAR
            local v36 = p34.attacker == u12.LocalPlayer
            local v37 = u6
            local v38 = {}
            local v39
            if v36 then
                v39 = nil
            else
                v39 = p34.attacker.Character
                if v39 ~= nil then
                    v39 = v39.PrimaryPart
                    if v39 ~= nil then
                        v39 = v39.Position
                    end
                end
            end
            v38.position = v39
            v38.volumeMultiplier = v36 and 1 or 1.4
            v37:playSound(v35, v38)
        end
    end)
    u26.Client:Get("SuperMelodyAbility"):Connect(function(p40) --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u33
        --]]
        if p40.abilityType == u18.SUPER_MELODY_ULT then
            local v41 = u33
            local v42 = p40.user
            local v43 = p40.targets
            local v44 = p40.duration
            v41:ultEffect(v42, v43, v44 == nil and 3 or v44)
            return
        elseif p40.abilityType == u18.SUPER_MELODY_HEAL then
            u33:healEffect(p40.user, p40.targets)
        elseif p40.abilityType == u18.SUPER_MELODY_AURA then
            u33:auraEffect(p40.user)
        end
    end)
    u26.Client:Get("HalloweenSetKit"):Connect(function(p45) --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u23
        --]]
        if not u33.inited then
            if p45.kit == u23.MELODY then
                u33:mountAbilities()
            end
            u33.inited = true
        end
    end)
end
function u28.attackEffect(_, p46, p47) --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u25
        [3] = u12
        [4] = u20
        [5] = u19
        [6] = u16
        [7] = u5
        [8] = u13
        [9] = u8
        [10] = u1
        [11] = u14
        [12] = u15
        [13] = u11
    --]]
    local v48 = not p47
    if not v48 then
        local v49
        if p47 == nil then
            v49 = p47
        else
            v49 = p47.PrimaryPart
        end
        v48 = not v49
    end
    if v48 then
        return nil
    end
    local u50 = p47.PrimaryPart
    if u50 ~= nil then
        u50 = u50:FindFirstChild("RootRigAttachment")
    end
    if u50 == nil then
        u50 = u9("Attachment", {
            ["Parent"] = p47.PrimaryPart
        })
    end
    local u51 = p46.Character
    if u51 ~= nil then
        u51 = u51:FindFirstChild(u25.SUPER_GUITAR)
        if u51 ~= nil then
            u51 = u51:FindFirstChild("Handle")
            if u51 ~= nil then
                u51 = u51:FindFirstChild("HealBeamAttachment")
            end
        end
    end
    if u50 and u51 then
        if p46 == u12.LocalPlayer then
            u20:playAnimation(u12.LocalPlayer, u19.GUITAR_HEAL)
        end
        local v52 = {
            ["Size"] = Vector3.new(1, 1, 1)
        }
        local v53 = p46.Character
        if v53 ~= nil then
            v53 = v53.PrimaryPart
            if v53 ~= nil then
                v53 = v53.CFrame
            end
        end
        v52.CFrame = v53
        v52.Transparency = 1
        v52.Anchored = true
        v52.CanCollide = false
        v52.Parent = u16.CurrentCamera
        local u54 = u9("Part", v52)
        u5:setQueryIgnored(u54, true)
        local u55 = u13:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("GuitarHeal"):Clone()
        u55.Parent = u54
        local u56 = u8.new()
        u56:GiveTask(function() --[[ Line: 170 ]]
            --[[
            Upvalues:
                [1] = u55
                [2] = u1
                [3] = u54
            --]]
            u55.Enabled = false
            u1.Promise.delay(3):andThen(function() --[[ Line: 173 ]]
                --[[
                Upvalues:
                    [1] = u54
                --]]
                u54:Destroy()
            end)
        end)
        local u57 = tick()
        u56:GiveTask(u14.RenderStepped:Connect(function(_) --[[ Line: 180 ]]
            --[[
            Upvalues:
                [1] = u57
                [2] = u51
                [3] = u50
                [4] = u54
                [5] = u56
            --]]
            local v58 = (tick() - u57) / 0.8
            local v59 = math.min(1, v58)
            u54.CFrame = u51.WorldCFrame:Lerp(u50.WorldCFrame, v59)
            if v59 == 1 then
                u56:DoCleaning()
            end
        end))
        local u60 = u9("Beam", {
            ["TextureSpeed"] = 10,
            ["Width0"] = 0,
            ["Width1"] = 0,
            ["FaceCamera"] = true,
            ["Attachment0"] = u51,
            ["Attachment1"] = u50,
            ["Color"] = u55.Color,
            ["Parent"] = u16.CurrentCamera
        })
        u15:Create(u60, TweenInfo.new(0.2), {
            ["Width0"] = 0.35,
            ["Width1"] = 0.35
        }):Play()
        u1.Promise.defer(function() --[[ Line: 203 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u60
                [3] = u11
            --]]
            wait(0.2)
            u15:Create(u60, TweenInfo.new(0.4), {
                ["Width0"] = 0,
                ["Width1"] = 0
            }):Play()
            u11:AddItem(u60, 1)
        end)
    end
end
function u28.healEffect(p61, p62, p63) --[[ Line: 213 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u27
        [3] = u4
        [4] = u20
        [5] = u19
    --]]
    local v64 = p62.Character
    if v64 ~= nil then
        v64 = v64.PrimaryPart
        if v64 ~= nil then
            v64 = v64.Position
        end
    end
    if not v64 then
        return nil
    end
    u6:playSound(u27.GUITAR_HEAL_1, {
        ["volumeMultiplier"] = 1.4,
        ["position"] = v64
    })
    for _, v65 in p63 do
        p61:attackEffect(p62, v65)
    end
    u4:playAnimation(p62, u20:getAssetId(u19.GUITAR_HEAL))
end
function u28.auraEffect(p66, p67, p68) --[[ Line: 234 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u27
        [3] = u20
        [4] = u19
        [5] = u15
        [6] = u12
    --]]
    local v69 = p68 == nil and 5 or p68
    local v70 = p67.Character
    if v70 ~= nil then
        v70 = v70.PrimaryPart
        if v70 ~= nil then
            v70 = v70.Position
        end
    end
    if not v70 then
        return nil
    end
    local u71 = u6:playModifiableSound(u27.GUITAR_LOOP, {
        ["volumeMultiplier"] = 2,
        ["position"] = v70,
        ["parent"] = p67.Character.PrimaryPart
    })
    local u72 = u20:playAnimation(p67, u19.GUITAR_PLAY)
    if u71 then
        u71.TimePosition = 0
        u71.Looped = true
        u15:Create(u71, TweenInfo.new(2), {
            ["Volume"] = 1
        }):Play()
        task.delay(v69, function() --[[ Line: 261 ]]
            --[[
            Upvalues:
                [1] = u71
            --]]
            u71:Stop()
            u71:Destroy()
        end)
    end
    task.delay(v69, function() --[[ Line: 266 ]]
        --[[
        Upvalues:
            [1] = u72
        --]]
        local v73 = u72
        if v73 ~= nil then
            v73:Stop()
        end
        local v74 = u72
        if v74 ~= nil then
            v74:Destroy()
        end
    end)
    p66:mountAuraEffect(p67, v69, false)
    if p67 == u12.LocalPlayer then
        p66:setOnCommonCD(v69)
    end
end
function u28.mountAbilities(p75) --[[ Line: 281 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u18
        [3] = u24
    --]]
    local u76 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u18.SUPER_MELODY_HEAL, {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = "rbxassetid://7085044606"
        }
    }):expect()
    local v77 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v78 = u18.SUPER_MELODY_AURA
    local v79 = {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = u24.MUSIC_SOLID
        }
    }
    local u80 = v77:enableAbility(v78, v79):expect()
    local u81 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u18.SUPER_MELODY_ULT, {
        ["abilityType"] = "KitTertiary",
        ["abilityButton"] = {
            ["icon"] = "rbxassetid://137863481960527"
        }
    }):expect()
    p75.maid:GiveTask(function() --[[ Line: 300 ]]
        --[[
        Upvalues:
            [1] = u76
            [2] = u80
            [3] = u81
        --]]
        u76.Destroy()
        u80.Destroy()
        u81.Destroy()
    end)
end
function u28.cleanUp(p82) --[[ Line: 306 ]]
    p82.maid:DoCleaning()
end
function u28.ultEffect(p83, p84, p85, p86) --[[ Line: 309 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u27
        [3] = u8
        [4] = u20
        [5] = u19
        [6] = u15
    --]]
    local v87 = p86 == nil and 3 or p86
    local v88 = p84.Character
    if v88 ~= nil then
        v88 = v88.PrimaryPart
        if v88 ~= nil then
            v88 = v88.Position
        end
    end
    if not v88 then
        return nil
    end
    local u89 = u6:playModifiableSound(u27.GUITAR_LOOP_ROCKSTAR, {
        ["volumeMultiplier"] = 2,
        ["position"] = v88,
        ["parent"] = p84.Character.PrimaryPart
    })
    u8.new()
    local u90 = u20:playAnimation(p84, u19.GUITAR_PLAY)
    if u89 then
        u89.TimePosition = 0
        u89.Looped = true
        u15:Create(u89, TweenInfo.new(2), {
            ["Volume"] = 1
        }):Play()
        task.delay(v87, function() --[[ Line: 337 ]]
            --[[
            Upvalues:
                [1] = u89
            --]]
            u89:Stop()
            u89:Destroy()
        end)
    end
    task.delay(v87, function() --[[ Line: 342 ]]
        --[[
        Upvalues:
            [1] = u90
        --]]
        local v91 = u90
        if v91 ~= nil then
            v91:Stop()
        end
        local v92 = u90
        if v92 ~= nil then
            v92:Destroy()
        end
    end)
    for v93, v94 in p85 do
        local _ = v93 - 1
        local u95 = u20:playAnimation(v94, u19.DISCO_DANCE)
        task.delay(v87, function() --[[ Line: 355 ]]
            --[[
            Upvalues:
                [1] = u95
            --]]
            local v96 = u95
            if v96 ~= nil then
                v96:Stop()
            end
            local v97 = u95
            if v97 ~= nil then
                v97:Destroy()
            end
        end)
    end
    p83:setOnCommonCD(v87)
    p83:mountAuraEffect(p84, v87, true)
end
function u28.setOnCommonCD(_, p98) --[[ Line: 372 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u21
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(u21.SUPER_MELODY_AURA) < p98 then
        u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u21.SUPER_MELODY_AURA, p98)
    end
    if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(u21.SUPER_MELODY_ULT) < p98 then
        u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u21.SUPER_MELODY_ULT, p98)
    end
    if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(u21.SUPER_MELODY_HEAL) < p98 then
        u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u21.SUPER_MELODY_HEAL, p98)
    end
end
function u28.mountAuraEffect(_, u99, p100, p101) --[[ Line: 383 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u8
        [3] = u16
        [4] = u14
    --]]
    local u102 = p100 == nil and 5 or p100
    local u103 = u99.Character
    if u103 ~= nil then
        u103 = u103.PrimaryPart
        if u103 ~= nil then
            u103 = u103.CFrame
        end
    end
    if not u103 then
        return nil
    end
    local u104
    if p101 then
        u104 = u13.Assets.Effects.AttackMusicAura:Clone()
    else
        u104 = u13.Assets.Effects.HealMusicAura:Clone()
    end
    local u105 = u8.new()
    u104.Parent = u16
    u104:PivotTo(u103 + Vector3.new(0, 2, 0))
    u105:GiveTask(u104)
    local u106 = 0
    u105:GiveTask(u14.Heartbeat:Connect(function(p107) --[[ Line: 418 ]]
        --[[
        Upvalues:
            [1] = u99
            [2] = u103
            [3] = u104
            [4] = u106
            [5] = u102
            [6] = u105
        --]]
        local v108 = u99.Character
        if v108 ~= nil then
            v108 = v108.PrimaryPart
            if v108 ~= nil then
                v108 = v108.CFrame
            end
        end
        u103 = v108
        if not u103 or (not u104 or u102 < u106) then
            u105:DoCleaning()
            return nil
        end
        u106 = u106 + p107
        u104.Position = u103.Position - Vector3.new(0, 1, 0)
    end))
end
v7.CreateController(u28.new())
return nil