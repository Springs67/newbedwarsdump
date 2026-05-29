local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "screen-shake", "screen-shake-util").ScreenShakeUtil
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "juggernaut-balance-file").JuggernautUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "JuggSpinAbilityController"
    end,
    ["__index"] = u14
})
u24.__index = u24
function u24.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u7
    --]]
    u14.constructor(p27)
    p27.Name = "JuggSpinAbilityController"
    p27.maid = u7.new()
end
function u24.KnitStart(u28) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u10
        [3] = u13
        [4] = u3
        [5] = u23
        [6] = u17
        [7] = u16
        [8] = u12
        [9] = u15
        [10] = u20
        [11] = u21
    --]]
    u22.Client:Get("JuggBarbSpinHit"):Connect(function(p29) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u13
            [3] = u3
            [4] = u23
            [5] = u17
            [6] = u16
        --]]
        local v30 = p29 == u10.LocalPlayer
        if v30 then
            u13.shakeScreenDirection(Vector2.new(0, 1), {
                ["magnitude"] = 0.15,
                ["duration"] = 0.12,
                ["cycles"] = 1
            })
        end
        local v31 = p29.Character
        if v31 ~= nil then
            v31 = v31.PrimaryPart
            if v31 ~= nil then
                v31 = v31.Position
            end
        end
        if v30 or v31 then
            local v32 = u3
            local v33 = u23.JUGGERNAUT_ATTACK_IMPACT_1
            local v34 = {
                ["volumeMultiplier"] = 0.7,
                ["rollOffMaxDistance"] = 240,
                ["rollOffMinDistance"] = 38
            }
            if v30 then
                v31 = nil
            end
            v34.position = v31
            v32:playSound(v33, v34)
        end
        local v35 = u17:getAssetId(u16.JUGGERNAUT_SPIN)
        local v36 = p29.Character
        if v36 ~= nil then
            v36 = v36:FindFirstChild("Humanoid")
            if v36 ~= nil then
                v36 = v36:FindFirstChild("Animator")
            end
        end
        if v36 then
            local u37 = nil
            for v38, v39 in v36:GetPlayingAnimationTracks() do
                local _ = v38 - 1
                local v40 = v39.Animation
                if v40 ~= nil then
                    v40 = v40.AnimationId
                end
                if v40 == v35 == true then
                    u37 = v39
                    break
                end
            end
            if u37 ~= nil then
                u37:AdjustSpeed(0.02)
            end
            task.delay(0.04, function() --[[ Line: 102 ]]
                --[[
                Upvalues:
                    [1] = u37
                --]]
                local v41 = u37
                if v41 ~= nil then
                    v41:AdjustSpeed(1)
                end
            end)
        end
    end)
    u22.Client:Get("NewJuggernaut"):Connect(function(p42) --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u28
        --]]
        if p42.player == u10.LocalPlayer then
            u28:mountAbility()
        else
            local v43 = u10.LocalPlayer:GetAttribute("Juggernaut")
            if v43 == 0 or (v43 ~= v43 or (v43 == "" or not v43)) then
                u28:unmountAbility()
            end
        end
    end)
    u22.Client:Get("EntityDeathEvent"):Connect(function(p44) --[[ Line: 120 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u28
        --]]
        if u10:GetPlayerFromCharacter(p44.entityInstance) == u10.LocalPlayer then
            u28:unmountAbility()
        end
    end)
    u12.CanUseLocalAbility:connect(function(p45) --[[ Line: 126 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u20
            [3] = u10
            [4] = u21
        --]]
        if p45.ability ~= u15.JUGGERNAUT_SPIN then
            return nil
        end
        local v46 = u20.getInventory(u10.LocalPlayer).hand
        if v46 ~= nil then
            v46 = v46.itemType
        end
        if v46 ~= u21.JUGGERNAUT_RAGE_BLADE then
            p45:setCancelled(true)
        end
    end)
    u22.Client:Get("JuggernautSpinEvent"):Connect(function(p47) --[[ Line: 138 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        u28:playAnimation(p47.player)
        u28:playSpinEffect(p47.player)
    end)
end
function u24.mountAbility(p48) --[[ Line: 143 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u15
        [3] = u19
    --]]
    local v49 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v50 = u15.JUGGERNAUT_SPIN
    local v51 = {
        ["abilityType"] = "MiscSecondary",
        ["abilityButton"] = {
            ["icon"] = u19.JUGG_BARB_SPIN
        }
    }
    local u52 = v49:enableAbility(v50, v51):expect()
    p48.maid:GiveTask(function() --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u52
        --]]
        u52.Destroy()
    end)
end
function u24.unmountAbility(p53) --[[ Line: 154 ]]
    p53.maid:DoCleaning()
end
function u24.playAnimation(_, p54) --[[ Line: 157 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u6
        [3] = u16
        [4] = u17
        [5] = u18
    --]]
    local v55 = p54.Character
    if v55 ~= nil then
        v55 = v55:WaitForChild("Humanoid", 3)
        if v55 ~= nil then
            v55 = v55:WaitForChild("Animator", 3)
        end
    end
    if not v55 then
        return nil
    end
    local u56
    if p54 == u10.LocalPlayer then
        u56 = u6.Controllers.ViewmodelController:playAnimation(u16.JUGGERNAUT_SPIN_FP, {
            ["looped"] = true
        })
    else
        u56 = nil
    end
    local u57 = v55:LoadAnimation(u17:getAnimation(u16.JUGGERNAUT_SPIN))
    u57:Play()
    task.delay(u18.SPIN_DURATION, function() --[[ Line: 177 ]]
        --[[
        Upvalues:
            [1] = u57
            [2] = u56
        --]]
        u57:Stop()
        u57:Destroy()
        if u56 then
            u56:Stop()
            u56:Destroy()
        end
    end)
end
function u24.playSpinEffect(_, u58) --[[ Line: 186 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u8
        [3] = u23
        [4] = u22
        [5] = u18
    --]]
    local u59 = u11.Assets.Effects.JuggernautSpin:Clone()
    local v60 = u58.Character
    if v60 ~= nil then
        v60 = v60.PrimaryPart
    end
    if not v60 then
        return nil
    end
    u59.Position = v60.CFrame.Position
    u59.Parent = u58.Character
    local v61 = {
        ["Part0"] = u59
    }
    local v62 = u58.Character
    if v62 ~= nil then
        v62 = v62.PrimaryPart
    end
    v61.Part1 = v62
    v61.Parent = u59
    u8("WeldConstraint", v61)
    local u63 = u8("Sound", {
        ["RollOffMinDistance"] = 20,
        ["RollOffMaxDistance"] = 40,
        ["Volume"] = 0.7,
        ["Playing"] = true,
        ["PlaybackSpeed"] = 1,
        ["SoundId"] = u23.JUGGERNAUT_SPIN,
        ["Parent"] = v60
    })
    local u64 = u8("Sound", {
        ["RollOffMinDistance"] = 20,
        ["RollOffMaxDistance"] = 40,
        ["Volume"] = 0.7,
        ["Playing"] = false,
        ["PlaybackSpeed"] = 1,
        ["Looped"] = true,
        ["SoundId"] = u23.JUGGERNAUT_SPIN_LOOP,
        ["Parent"] = v60
    })
    task.delay(0.75, function() --[[ Line: 229 ]]
        --[[
        Upvalues:
            [1] = u64
        --]]
        u64.Playing = true
        u64:Play()
    end)
    local u65 = u58.Character
    if u65 ~= nil then
        u65 = u65.Destroying:Connect(function() --[[ Line: 235 ]]
            --[[
            Upvalues:
                [1] = u59
                [2] = u64
            --]]
            u59:Destroy()
            u64:Destroy()
        end)
    end
    local u68 = u22.Client:Get("JuggernautSpinEnding"):Connect(function(p66) --[[ Line: 241 ]]
        --[[
        Upvalues:
            [1] = u58
            [2] = u59
            [3] = u65
            [4] = u64
            [5] = u63
        --]]
        if p66.player == u58 then
            u59:Destroy()
            local v67 = u65
            if v67 ~= nil then
                v67:Disconnect()
            end
            u64:Destroy()
            u63:Destroy()
        end
    end)
    task.delay(u18.SPIN_DURATION, function() --[[ Line: 252 ]]
        --[[
        Upvalues:
            [1] = u68
            [2] = u59
            [3] = u65
            [4] = u64
            [5] = u63
        --]]
        u68:Disconnect()
        u59:Destroy()
        local v69 = u65
        if v69 ~= nil then
            v69:Disconnect()
        end
        u64:Destroy()
        u63:Destroy()
    end)
end
v5.CreateController(u24.new())
return nil