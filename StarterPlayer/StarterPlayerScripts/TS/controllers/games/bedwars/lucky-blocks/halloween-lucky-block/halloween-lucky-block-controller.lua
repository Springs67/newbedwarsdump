local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v2.WatchCollectionTag
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutElastic
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.ReplicatedStorage
local u12 = v9.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "blocks", "halloween-lucky-block-meta")
local u16 = v15.HLBBounceDuration
local u17 = v15.HLBGrowthStage
local u18 = v15.HLBStage1Duration
local u19 = v15.HLBStage2Duration
local u20 = v15.HLBStage3Duration
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "HalloweenLuckyBlockController"
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
    --]]
    u14.constructor(p27)
    p27.Name = "HalloweenLuckyBlockController"
    p27.halloweenBlockMap = {}
    p27.halloweenBlockMaidMap = {}
end
function u24.KnitStart(u28) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u5
        [3] = u21
        [4] = u8
        [5] = u17
        [6] = u10
        [7] = u4
        [8] = u22
    --]]
    u14.KnitStart(u28)
    u5("GrowingHalloweenLuckyBlock", function(p29) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u28
            [3] = u8
            [4] = u17
        --]]
        if p29.Name ~= u21.GROWING_HALLOWEEN_LUCKY_BLOCK then
            return nil
        end
        local u30 = p29:GetPivot().Position
        if u28:isClientPrediction(p29) then
            return nil
        end
        if u28.halloweenBlockMap[u30] ~= nil then
            return nil
        end
        local v31 = u8.new()
        u28.halloweenBlockMap[u30] = u17.STAGE_1
        u28.halloweenBlockMaidMap[u30] = v31
        u28:beginGrowSequence(p29, u30, v31)
        p29.Destroying:Connect(function() --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u30
            --]]
            u28.halloweenBlockMap[u30] = nil
            local v32 = u28.halloweenBlockMaidMap[u30]
            if v32 ~= nil then
                v32:DoCleaning()
            end
            u28.halloweenBlockMaidMap[u30] = nil
        end)
    end)
    u10:GetInstanceRemovedSignal("HalloweenLuckyBlock"):Connect(function(p33) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u22
        --]]
        local v34 = {
            ["rollOffMaxDistance"] = 70,
            ["rollOffMinDistance"] = 20,
            ["position"] = p33.Position
        }
        u4:playSound(u22.HALLOWEEN_LUCKY_BLOCK_BREAK, v34)
    end)
end
function u24.beginGrowSequence(u35, p36, u37, _) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u22
        [3] = u18
        [4] = u23
        [5] = u17
        [6] = u19
        [7] = u20
    --]]
    local u38 = p36:WaitForChild("stage_1")
    local u39 = p36:WaitForChild("stage_2")
    local u40 = p36:WaitForChild("stage_3")
    local u41 = p36:WaitForChild("GrowEffect")
    if not (u38 and (u39 and (u40 and u41))) then
        return nil
    end
    u4:playSound(u22.HALLOWEEN_LUCKY_BLOCK_PLANT, {
        ["rollOffMaxDistance"] = 70,
        ["rollOffMinDistance"] = 20,
        ["position"] = u37
    })
    local _ = u38.Size
    local _ = u39.Size
    local _ = u40.Size
    task.delay(u18, function() --[[ Line: 112 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u37
            [3] = u23
            [4] = u41
            [5] = u38
            [6] = u39
            [7] = u4
            [8] = u22
            [9] = u17
        --]]
        if u35.halloweenBlockMap[u37] == nil then
            return nil
        end
        u23:playEffects(u41:GetDescendants(), nil, {
            ["sizeMultiplier"] = 0.8
        })
        u38.Transparency = 1
        u39.Transparency = 0
        local v42 = {
            ["position"] = u37
        }
        u4:playSound(u22.HALLOWEEN_LUCKY_BLOCK_GROW_1, v42)
        u35.halloweenBlockMap[u37] = u17.STAGE_2
    end)
    task.delay(u18 + u19, function() --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u37
            [3] = u23
            [4] = u41
            [5] = u39
            [6] = u40
            [7] = u4
            [8] = u22
            [9] = u17
        --]]
        if u35.halloweenBlockMap[u37] == nil then
            return nil
        end
        u23:playEffects(u41:GetDescendants(), nil, {
            ["sizeMultiplier"] = 1.2
        })
        u39.Transparency = 1
        u40.Transparency = 0
        local v43 = {
            ["position"] = u37
        }
        u4:playSound(u22.HALLOWEEN_LUCKY_BLOCK_GROW_2, v43)
        u35.halloweenBlockMap[u37] = u17.STAGE_3
    end)
    task.delay(u18 + u19 + u20, function() --[[ Line: 153 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u37
            [3] = u23
            [4] = u41
            [5] = u4
            [6] = u22
        --]]
        if u35.halloweenBlockMap[u37] == nil then
            return nil
        end
        u23:playEffects(u41:GetDescendants(), nil, {
            ["sizeMultiplier"] = 1.2
        })
        local v44 = {
            ["position"] = u37
        }
        u4:playSound(u22.HALLOWEEN_LUCKY_BLOCK_GROW_3, v44)
        u35:harvestLuckyBlock(CFrame.new(u37))
    end)
end
function u24.harvestLuckyBlock(_, u45) --[[ Line: 168 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u11
        [4] = u12
        [5] = u16
        [6] = u23
        [7] = u4
        [8] = u22
        [9] = u13
        [10] = u7
    --]]
    local v46 = false
    local v47 = 0
    while true do
        if v46 then
            v47 = v47 + 1
        else
            v46 = true
        end
        if v47 >= 6 then
            local v48 = u45 - Vector3.new(0, 3, 0)
            local u49 = u11.Assets.Effects.PumpkinExplosion:Clone()
            u49:ScaleTo(0.75)
            u49:PivotTo(v48)
            u49.Parent = u12
            task.delay(u16 / 2.5, function() --[[ Line: 194 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u49
                    [3] = u4
                    [4] = u22
                    [5] = u45
                --]]
                u23:playEffects(u49:GetDescendants(), nil, {
                    ["sizeMultiplier"] = 1.5
                })
                u4:playSound(u22.HALLOWEEN_LUCKY_BLOCK_EXPLODE, {
                    ["position"] = u45.Position
                })
            end)
            task.delay(u16 / 3, function() --[[ Line: 202 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u22
                    [3] = u45
                --]]
                u4:playSound(u22.HALLOWEEN_LUCKY_BLOCK_BOUNCE, {
                    ["position"] = u45.Position
                })
            end)
            u13(u16, u7, function(p50) --[[ Line: 207 ]]
                --[[
                Upvalues:
                    [1] = u49
                --]]
                u49:ScaleTo(p50)
            end, 0.75, 1):Play()
            u13(u16, u7, function(p51) --[[ Line: 210 ]]
                --[[
                Upvalues:
                    [1] = u49
                --]]
                u49:PivotTo(p51)
            end, v48, u45):Play():Wait()
            u49:Destroy()
            return
        end
        local v52 = u6.Controllers.BlockDebrisController
        local v53 = u45.Position
        local v54 = u3.fromList
        local v55 = { Color3.fromRGB(89, 54, 41), Color3.fromRGB(54, 29, 20) }
        local v56 = v54(unpack(v55))
        local v57 = {}
        local v58 = 0.3 + math.random() * 0.2
        local v59 = 0.3 + math.random() * 0.2
        v57.size = Vector3.new(0.3, v58, v59)
        v52:createDebris(v53, v56, Vector3.new(0, 0, 0), v57)
    end
end
function u24.isClientPrediction(_, p60) --[[ Line: 215 ]]
    return p60:GetAttribute("ClientPlaced")
end
u6.CreateController(u24.new())
return nil