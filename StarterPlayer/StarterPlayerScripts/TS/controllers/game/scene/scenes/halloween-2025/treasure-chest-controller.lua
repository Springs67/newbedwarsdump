local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.ReplicatedStorage
local u14 = v11.TweenService
local u15 = v11.Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "game-knit-controller").GameKnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "TreasureChestController"
    end,
    ["__index"] = u16
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
        [1] = u16
        [2] = u20
    --]]
    u16.constructor(p27, { u20.HALLOWEEN_2025_EVENT_PVE })
    p27.Name = "TreasureChestController"
    p27.activeTreasureChests = {}
end
function u24.KnitStart(p28) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.KnitStart(p28)
end
function u24.onGameInit(u29) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.Client:Get("SpawnHalloweenTreasureChest"):Connect(function(p30) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29:onChestSpawn(p30)
    end)
    u21.Client:Get("HalloweenTreasureChestOpened"):Connect(function(p31) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        local v32 = u29.activeTreasureChests[p31.secret]
        local v33
        if v32 == nil then
            v33 = v32
        else
            v33 = v32.PrimaryPart
        end
        if v33 then
            local v34 = v33:FindFirstChildWhichIsA("ProximityPrompt")
            if v34 ~= nil then
                v34:Destroy()
            end
        end
        if v32 then
            u29:playOpenedChestAnimations(v32)
        end
        u29.activeTreasureChests[p31.secret] = nil
    end)
end
function u24.onChestSpawn(u35, u36) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u15
        [3] = u10
        [4] = u5
        [5] = u22
        [6] = u8
        [7] = u4
        [8] = u9
        [9] = u12
        [10] = u18
        [11] = u17
        [12] = u14
        [13] = u19
    --]]
    local u37 = u13.Assets.Effects.PirateTreasure:Clone()
    local v38 = u37.PrimaryPart
    if not v38 then
        return nil
    end
    u35.activeTreasureChests[u36.secret] = u37
    u37.Parent = u15
    u10(u37, 1.25)
    u37:PivotTo(u36.cframe + Vector3.new(0, -1.3, 0))
    u37:SetAttribute("Secret", u36.secret)
    u5:playSound(u22.TREASURE_CHEST_SPAWN, {
        ["position"] = u36.cframe.Position
    })
    local u39 = u8.Controllers.ProximityPromptController:createProximityPrompt({
        ["ActionText"] = "Open",
        ["ObjectText"] = "Treasure Chest",
        ["HoldDuration"] = 1,
        ["RequiresLineOfSight"] = false,
        ["MaxActivationDistance"] = 5,
        ["Parent"] = v38,
        ["ClickablePrompt"] = u4.isMobileControls()
    })
    local u40 = u9.new()
    u39.PromptButtonHoldBegan:Connect(function(p41) --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u5
            [3] = u22
            [4] = u36
            [5] = u18
            [6] = u17
            [7] = u8
            [8] = u40
            [9] = u37
            [10] = u14
        --]]
        if p41 ~= u12.LocalPlayer then
            return nil
        end
        if not p41.Character then
            return nil
        end
        local u42 = u5:playSound(u22.TREASURE_CHEST_UNLOCKING, {
            ["looped"] = true,
            ["volumeMultiplier"] = 1.75,
            ["position"] = u36.cframe.Position
        })
        local u43 = u18:playAnimation(p41, u17.OPEN_CRATE, {
            ["looped"] = true
        })
        local u44 = u8.Controllers.ViewmodelController:playAnimation(u17.OPEN_CRATE, {
            ["looped"] = true
        })
        u40:GiveTask(function() --[[ Line: 128 ]]
            --[[
            Upvalues:
                [1] = u43
                [2] = u44
                [3] = u42
            --]]
            local v45 = u43
            if v45 ~= nil then
                v45:Stop()
            end
            local v46 = u43
            if v46 ~= nil then
                v46:Destroy()
            end
            local v47 = u44
            if v47 ~= nil then
                v47:Stop()
            end
            local v48 = u44
            if v48 ~= nil then
                v48:Destroy()
            end
            local v49 = u42
            if v49 ~= nil then
                v49:Destroy()
            end
        end)
        local v50 = u37.PrimaryPart
        if v50 then
            local u51 = u14:Create(v50, TweenInfo.new(0.025, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, true), {
                ["CFrame"] = v50:GetPivot() * CFrame.Angles(0, 0, -0.017453292519943295)
            })
            local u52 = u14:Create(v50, TweenInfo.new(0.025, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, true), {
                ["CFrame"] = v50:GetPivot() * CFrame.Angles(0, 0, 0.017453292519943295)
            })
            local u53 = true
            u40:GiveTask(function() --[[ Line: 173 ]]
                --[[
                Upvalues:
                    [1] = u53
                --]]
                u53 = false
            end)
            u51:Play()
            u51.Completed:Connect(function() --[[ Line: 177 ]]
                --[[
                Upvalues:
                    [1] = u52
                --]]
                u52:Play()
            end)
            u52.Completed:Connect(function() --[[ Line: 180 ]]
                --[[
                Upvalues:
                    [1] = u53
                    [2] = u51
                --]]
                if not u53 then
                    return nil
                end
                u51:Play()
            end)
        end
    end)
    u39.PromptButtonHoldEnded:Connect(function(p54) --[[ Line: 188 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u40
        --]]
        if p54 ~= u12.LocalPlayer then
            return nil
        end
        u40:DoCleaning()
    end)
    u39.Triggered:Connect(function(p55) --[[ Line: 194 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u18
            [3] = u17
            [4] = u5
            [5] = u22
            [6] = u36
            [7] = u19
            [8] = u35
            [9] = u37
            [10] = u39
        --]]
        if p55 ~= u12.LocalPlayer then
            return nil
        end
        u18:playAnimation(p55, u17.TENNIS_RACKET_HIT)
        u5:playSound(u22.TREASURE_CHEST_UNLOCK, {
            ["volumeMultiplier"] = 1.75,
            ["position"] = u36.cframe.Position
        })
        local v56 = u19:getEntity(p55)
        if v56 ~= nil then
            v56 = v56:isAlive()
        end
        if not v56 then
            return nil
        end
        if u35:requestOpenChest(u37) then
            u39:Destroy()
        end
    end)
end
function u24.requestOpenChest(_, p57) --[[ Line: 218 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v58 = {
        ["secret"] = p57:GetAttribute("Secret")
    }
    return u21.Client:Get("OpenHalloweenTreasureChest"):CallServer(v58)
end
function u24.playOpenedChestAnimations(_, u59) --[[ Line: 224 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u14
        [3] = u22
        [4] = u5
        [5] = u23
        [6] = u13
    --]]
    local v60 = {
        ["colorBottom"] = u3.hexColor(11711154),
        ["colorTop"] = u3.hexColor(16777215)
    }
    local u61 = u59:WaitForChild("Main", 3)
    if u61 ~= nil then
        u61 = u61:WaitForChild("neon", 3)
    end
    if u61 then
        u14:Create(u61, TweenInfo.new(0.3), {
            ["Color"] = v60.colorTop
        }):Play()
    end
    local u62 = u59:WaitForChild("Main", 3)
    if u62 ~= nil then
        u62 = u62:WaitForChild("Hinge", 3)
    end
    local v63 = u62:FindFirstChildWhichIsA("WeldConstraint")
    if v63 ~= nil then
        v63:Destroy()
    end
    u62.Anchored = true
    u14:Create(u62, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        ["CFrame"] = u62.CFrame * CFrame.Angles(0.08726646259971647, 0, 0)
    }):Play()
    local _ = {
        u22.LUCKY_BOX_REVEAL_COMMON,
        u22.LUCKY_BOX_REVEAL_RARE,
        u22.LUCKY_BOX_REVEAL_EPIC,
        u22.LUCKY_BOX_REVEAL_LEGENDARY,
        u22.LUCKY_BOX_REVEAL_MYTHIC
    }
    local v64 = u22.LUCKY_BOX_REVEAL_COMMON
    if v64 ~= "" and v64 then
        u5:playSound(v64, {
            ["rollOffMinDistance"] = 30,
            ["rollOffMaxDistance"] = 45,
            ["position"] = u59:GetPivot().Position
        })
    end
    local u65 = u23:enableInstanceEffect(u59)
    local v66 = u13.Assets.Effects.PulseEffect:Clone()
    v66.Parent = u59
    v66:PivotTo(u59:GetPivot())
    v66.Pulse.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v60.colorBottom), ColorSequenceKeypoint.new(1, v60.colorTop) })
    u23:playEffects({ v66 }, nil, {
        ["destroyAfterSec"] = 1
    })
    task.delay(0.5, function() --[[ Line: 277 ]]
        --[[
        Upvalues:
            [1] = u61
            [2] = u14
            [3] = u62
            [4] = u5
            [5] = u22
            [6] = u59
            [7] = u65
        --]]
        local v67 = u61
        if v67 ~= nil then
            v67:Destroy()
        end
        u14:Create(u62, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            ["CFrame"] = u62.CFrame * CFrame.Angles(1.7951958020513104, 0, 0)
        }):Play()
        u5:playSound(u22.PIRATE_SHOVEL_DIG_TREASURE_FOUND, {
            ["position"] = u59:GetPivot().Position
        })
        local u68 = u5:playSound(u22.LUCKY_BOX_SHIMMER, {
            ["rollOffMaxDistance"] = 45,
            ["volumeMultiplier"] = 1.75,
            ["fadeOutTime"] = 4.2,
            ["looped"] = true,
            ["position"] = u59:GetPivot().Position
        })
        u65:GiveTask(function() --[[ Line: 301 ]]
            --[[
            Upvalues:
                [1] = u68
            --]]
            local v69 = u68
            if v69 ~= nil then
                v69:Stop()
            end
            local v70 = u68
            if v70 ~= nil then
                v70:Destroy()
            end
        end)
        task.delay(4, function() --[[ Line: 312 ]]
            --[[
            Upvalues:
                [1] = u65
            --]]
            u65:DoCleaning()
        end)
        task.delay(5, function() --[[ Line: 316 ]]
            --[[
            Upvalues:
                [1] = u59
                [2] = u14
            --]]
            local v71 = TweenInfo.new(0.3)
            for v72, v73 in u59:GetDescendants() do
                local _ = v72 - 1
                if v73:IsA("BasePart") then
                    u14:Create(v73, v71, {
                        ["Transparency"] = 1
                    }):Play()
                end
            end
            task.delay(v71.Time, function() --[[ Line: 329 ]]
                --[[
                Upvalues:
                    [1] = u59
                --]]
                u59:Destroy()
            end)
        end)
    end)
end
function u24.preloadAssets(_) --[[ Line: 335 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u17
        [3] = u22
    --]]
    u7.Controllers.PreloadController:runPreload({
        ["animations"] = { u17.TENNIS_RACKET_HIT, u17.OPEN_CRATE },
        ["sounds"] = {
            u22.LUCKY_BOX_REVEAL_COMMON,
            u22.LUCKY_BOX_REVEAL_RARE,
            u22.LUCKY_BOX_REVEAL_EPIC,
            u22.LUCKY_BOX_REVEAL_LEGENDARY,
            u22.LUCKY_BOX_REVEAL_MYTHIC,
            u22.PIRATE_SHOVEL_DIG_TREASURE_FOUND,
            u22.LUCKY_BOX_SHIMMER,
            u22.TREASURE_CHEST_SPAWN,
            u22.TREASURE_CHEST_UNLOCKING,
            u22.TREASURE_CHEST_UNLOCK
        }
    })
end
function u24.cleanUp(p74) --[[ Line: 341 ]]
    for v75, v76 in p74.activeTreasureChests do
        v76:Destroy()
        p74.activeTreasureChests[v75] = nil
    end
end
u7.CreateController(u24.new())
return nil