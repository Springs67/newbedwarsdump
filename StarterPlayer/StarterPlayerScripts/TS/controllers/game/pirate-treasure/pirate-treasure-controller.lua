local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.TweenService
local u14 = v10.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "PirateTreasureController"
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
    --]]
    u15.constructor(p26)
    p26.Name = "PirateTreasureController"
    p26.activeTreasureChests = {}
end
function u23.KnitStart(u27) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u19
    --]]
    u15.KnitStart(u27)
    u19.Client:Get("SpawnTreasureChest"):Connect(function(p28) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:onChestSpawn(p28)
    end)
    u19.Client:Get("TreasureChestOpened"):Connect(function(u29) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        local u30 = u27.activeTreasureChests[u29.secret]
        local v31
        if u30 == nil then
            v31 = u30
        else
            v31 = u30.PrimaryPart
        end
        if v31 then
            local v32 = v31:FindFirstChildWhichIsA("ProximityPrompt")
            if v32 ~= nil then
                v32:Destroy()
            end
        end
        task.delay(0.3, function() --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u27
                [3] = u29
            --]]
            if u30 then
                u27:playOpenedChestAnimations(u30, u29.rarity)
            end
        end)
        u27.activeTreasureChests[u29.secret] = nil
    end)
end
function u23.onChestSpawn(u33, u34) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u14
        [3] = u9
        [4] = u4
        [5] = u21
        [6] = u22
        [7] = u11
        [8] = u7
        [9] = u3
        [10] = u8
        [11] = u17
        [12] = u16
        [13] = u13
        [14] = u18
    --]]
    local u35 = u12.Assets.Effects.PirateTreasure:Clone()
    local v36 = u35.PrimaryPart
    if not v36 then
        return nil
    end
    u33.activeTreasureChests[u34.secret] = u35
    u35.Parent = u14
    u9(u35, 1.25)
    u35:PivotTo(u34.cframe + Vector3.new(0, -1.3, 0))
    u35:SetAttribute("Secret", u34.secret)
    u4:playSound(u21.TREASURE_CHEST_SPAWN, {
        ["position"] = u34.cframe.Position
    })
    local v37 = u12.Assets.Effects.MagicMirrorExplosion:Clone()
    v37.Parent = u35
    v37:PivotTo(u35:GetPivot())
    u22:playEffects({ v37 }, nil, {
        ["destroyAfterSec"] = 2
    })
    local v38 = u34.ownerUserId
    if tonumber(v38) == u11.LocalPlayer.UserId then
        local u39 = u7.Controllers.ProximityPromptController:createProximityPrompt({
            ["ActionText"] = "Open",
            ["ObjectText"] = "Treasure Chest",
            ["HoldDuration"] = 1,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 5,
            ["Parent"] = v36,
            ["ClickablePrompt"] = u3.isMobileControls()
        })
        local u40 = u8.new()
        u39.PromptButtonHoldBegan:Connect(function(p41) --[[ Line: 117 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u4
                [3] = u21
                [4] = u34
                [5] = u17
                [6] = u16
                [7] = u7
                [8] = u40
                [9] = u35
                [10] = u13
            --]]
            if p41 ~= u11.LocalPlayer then
                return nil
            end
            if not p41.Character then
                return nil
            end
            local u42 = u4:playSound(u21.TREASURE_CHEST_UNLOCKING, {
                ["looped"] = true,
                ["volumeMultiplier"] = 1.75,
                ["position"] = u34.cframe.Position
            })
            local u43 = u17:playAnimation(p41, u16.OPEN_CRATE, {
                ["looped"] = true
            })
            local u44 = u7.Controllers.ViewmodelController:playAnimation(u16.OPEN_CRATE, {
                ["looped"] = true
            })
            u40:GiveTask(function() --[[ Line: 137 ]]
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
            local v50 = u35.PrimaryPart
            if v50 then
                local u51 = u13:Create(v50, TweenInfo.new(0.025, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, true), {
                    ["CFrame"] = v50:GetPivot() * CFrame.Angles(0, 0, -0.017453292519943295)
                })
                local u52 = u13:Create(v50, TweenInfo.new(0.025, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, true), {
                    ["CFrame"] = v50:GetPivot() * CFrame.Angles(0, 0, 0.017453292519943295)
                })
                local u53 = true
                u40:GiveTask(function() --[[ Line: 182 ]]
                    --[[
                    Upvalues:
                        [1] = u53
                    --]]
                    u53 = false
                end)
                u51:Play()
                u51.Completed:Connect(function() --[[ Line: 186 ]]
                    --[[
                    Upvalues:
                        [1] = u52
                    --]]
                    u52:Play()
                end)
                u52.Completed:Connect(function() --[[ Line: 189 ]]
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
        u39.PromptButtonHoldEnded:Connect(function(p54) --[[ Line: 197 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u40
            --]]
            if p54 ~= u11.LocalPlayer then
                return nil
            end
            u40:DoCleaning()
        end)
        u39.Triggered:Connect(function(p55) --[[ Line: 203 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u17
                [3] = u16
                [4] = u4
                [5] = u21
                [6] = u34
                [7] = u18
                [8] = u33
                [9] = u35
                [10] = u39
            --]]
            if p55 ~= u11.LocalPlayer then
                return nil
            end
            u17:playAnimation(p55, u16.TENNIS_RACKET_HIT)
            u4:playSound(u21.TREASURE_CHEST_UNLOCK, {
                ["volumeMultiplier"] = 1.75,
                ["position"] = u34.cframe.Position
            })
            local v56 = u18:getEntity(p55)
            if v56 ~= nil then
                v56 = v56:isAlive()
            end
            if not v56 then
                return nil
            end
            if u33:requestOpenChest(u35) then
                u39:Destroy()
            end
        end)
    end
end
function u23.requestOpenChest(_, p57) --[[ Line: 228 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v58 = {
        ["secret"] = p57:GetAttribute("Secret")
    }
    return u19.Client:Get("OpenTreasureChest"):CallServer(v58)
end
function u23.playOpenedChestAnimations(_, u59, u60) --[[ Line: 234 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u13
        [3] = u21
        [4] = u4
        [5] = u22
        [6] = u12
    --]]
    local u61 = u20(u60).gradient
    local u62 = u59:WaitForChild("Main", 3)
    if u62 ~= nil then
        u62 = u62:WaitForChild("neon", 3)
    end
    if u62 then
        u13:Create(u62, TweenInfo.new(0.3), {
            ["Color"] = u61.colorTop
        }):Play()
    end
    task.delay(0.3, function() --[[ Line: 246 ]]
        --[[
        Upvalues:
            [1] = u59
            [2] = u13
            [3] = u21
            [4] = u60
            [5] = u4
            [6] = u22
            [7] = u12
            [8] = u61
            [9] = u62
        --]]
        local u63 = u59:WaitForChild("Main", 3)
        if u63 ~= nil then
            u63 = u63:WaitForChild("Hinge", 3)
        end
        local v64 = u63:FindFirstChildWhichIsA("WeldConstraint")
        if v64 ~= nil then
            v64:Destroy()
        end
        u63.Anchored = true
        u13:Create(u63, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            ["CFrame"] = u63.CFrame * CFrame.Angles(0.08726646259971647, 0, 0)
        }):Play()
        local v65 = ({
            u21.LUCKY_BOX_REVEAL_COMMON,
            u21.LUCKY_BOX_REVEAL_RARE,
            u21.LUCKY_BOX_REVEAL_EPIC,
            u21.LUCKY_BOX_REVEAL_LEGENDARY,
            u21.LUCKY_BOX_REVEAL_MYTHIC
        })[u60 + 1]
        if v65 ~= "" and v65 then
            u4:playSound(v65, {
                ["rollOffMinDistance"] = 30,
                ["rollOffMaxDistance"] = 45,
                ["position"] = u59:GetPivot().Position
            })
        end
        local u66 = u22:enableInstanceEffect(u59)
        local v67 = u12.Assets.Effects.PulseEffect:Clone()
        v67.Parent = u59
        v67:PivotTo(u59:GetPivot())
        v67.Pulse.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, u61.colorBottom), ColorSequenceKeypoint.new(1, u61.colorTop) })
        u22:playEffects({ v67 }, nil, {
            ["destroyAfterSec"] = 1
        })
        task.delay(1.4, function() --[[ Line: 285 ]]
            --[[
            Upvalues:
                [1] = u62
                [2] = u13
                [3] = u63
                [4] = u4
                [5] = u21
                [6] = u59
                [7] = u66
            --]]
            local v68 = u62
            if v68 ~= nil then
                v68:Destroy()
            end
            u13:Create(u63, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                ["CFrame"] = u63.CFrame * CFrame.Angles(1.7951958020513104, 0, 0)
            }):Play()
            u4:playSound(u21.PIRATE_SHOVEL_DIG_TREASURE_FOUND, {
                ["position"] = u59:GetPivot().Position
            })
            local u69 = u4:playSound(u21.LUCKY_BOX_SHIMMER, {
                ["rollOffMaxDistance"] = 45,
                ["volumeMultiplier"] = 1.75,
                ["fadeOutTime"] = 4.2,
                ["looped"] = true,
                ["position"] = u59:GetPivot().Position
            })
            u66:GiveTask(function() --[[ Line: 309 ]]
                --[[
                Upvalues:
                    [1] = u69
                --]]
                local v70 = u69
                if v70 ~= nil then
                    v70:Stop()
                end
                local v71 = u69
                if v71 ~= nil then
                    v71:Destroy()
                end
            end)
            task.delay(4, function() --[[ Line: 320 ]]
                --[[
                Upvalues:
                    [1] = u66
                --]]
                u66:DoCleaning()
            end)
            task.delay(5, function() --[[ Line: 324 ]]
                --[[
                Upvalues:
                    [1] = u59
                    [2] = u13
                --]]
                local v72 = TweenInfo.new(0.3)
                for v73, v74 in u59:GetDescendants() do
                    local _ = v73 - 1
                    if v74:IsA("BasePart") then
                        u13:Create(v74, v72, {
                            ["Transparency"] = 1
                        }):Play()
                    end
                end
                task.delay(v72.Time, function() --[[ Line: 337 ]]
                    --[[
                    Upvalues:
                        [1] = u59
                    --]]
                    u59:Destroy()
                end)
            end)
        end)
    end)
end
function u23.preloadAssets(_) --[[ Line: 344 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u16
        [3] = u21
    --]]
    u6.Controllers.PreloadController:runPreload({
        ["animations"] = { u16.TENNIS_RACKET_HIT, u16.OPEN_CRATE },
        ["sounds"] = {
            u21.LUCKY_BOX_REVEAL_COMMON,
            u21.LUCKY_BOX_REVEAL_RARE,
            u21.LUCKY_BOX_REVEAL_EPIC,
            u21.LUCKY_BOX_REVEAL_LEGENDARY,
            u21.LUCKY_BOX_REVEAL_MYTHIC,
            u21.PIRATE_SHOVEL_DIG_TREASURE_FOUND,
            u21.LUCKY_BOX_SHIMMER,
            u21.TREASURE_CHEST_SPAWN,
            u21.TREASURE_CHEST_UNLOCKING,
            u21.TREASURE_CHEST_UNLOCK
        }
    })
end
u6.CreateController(u23.new())
return nil