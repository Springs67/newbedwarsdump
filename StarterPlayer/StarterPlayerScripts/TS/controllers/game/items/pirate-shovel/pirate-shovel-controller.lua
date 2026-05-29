local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.ReplicatedStorage
local u7 = v4.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v11.PIRATE_SHOVEL_IRON
local u16 = v11.PIRATE_SHOVEL_DIAMOND
local u17 = v11.PIRATE_SHOVEL_EMERALD
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "PirateShovelController"
    end,
    ["__index"] = u8
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p21)
    p21.Name = "PirateShovelController"
end
function u18.KnitStart(u22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
        [3] = u10
        [4] = u9
        [5] = u15
        [6] = u2
        [7] = u14
        [8] = u16
        [9] = u6
        [10] = u7
    --]]
    u8.KnitStart(u22)
    u13.Client:Get("PirateDigTreasure"):Connect(function(u23) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u9
            [3] = u15
            [4] = u2
            [5] = u14
            [6] = u22
            [7] = u16
            [8] = u6
            [9] = u7
        --]]
        local u24 = u23.player.Character
        if u24 ~= nil then
            u24 = u24:GetPrimaryPartCFrame().Position
        end
        if u24 then
            u10:playAnimation(u23.player, u9.SHOVEL_DIG)
            if u23.diceNumber < u15 then
                u2:playSound(u14.PIRATE_SHOVEL_DIG, {
                    ["rollOffMaxDistance"] = 45,
                    ["volumeMultiplier"] = 0.5,
                    ["position"] = u24
                })
            else
                local v25 = u2:playSound(u14.PIRATE_SHOVEL_DIG_TREASURE_HIT, {
                    ["rollOffMaxDistance"] = 45,
                    ["volumeMultiplier"] = 0.5,
                    ["position"] = u24
                })
                if u23.diceNumber < u15 then
                    return nil
                end
                u22:playEffect(u24, u23.player, u23.diceNumber)
                local v26 = v25:getInstance()
                if v26 ~= nil then
                    v26.Ended:Once(function() --[[ Line: 67 ]]
                        --[[
                        Upvalues:
                            [1] = u23
                            [2] = u16
                            [3] = u6
                            [4] = u7
                            [5] = u2
                            [6] = u14
                            [7] = u24
                        --]]
                        if u16 <= u23.diceNumber then
                            local u27 = u6.Assets.Effects.PirateShovelEffect:Clone()
                            u27:PivotTo(CFrame.new(u23.treasurePosition))
                            u27.Parent = u7
                            local v28 = {
                                ["rollOffMaxDistance"] = 45,
                                ["volumeMultiplier"] = 0.5,
                                ["position"] = u24
                            }
                            u2:playSound(u14.PIRATE_SHOVEL_DIG_TREASURE_FOUND, v28)
                            task.delay(1, function() --[[ Line: 77 ]]
                                --[[
                                Upvalues:
                                    [1] = u27
                                --]]
                                u27:Destroy()
                            end)
                        end
                    end)
                end
            end
        else
            return nil
        end
    end)
end
function u18.playEffect(_, p29, u30, p31) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u12
        [3] = u16
        [4] = u17
        [5] = u3
        [6] = u5
    --]]
    local v32 = {}
    if u15 < p31 then
        local v33 = {
            ["amount"] = 2,
            ["itemType"] = u12.IRON
        }
        table.insert(v32, v33)
    end
    if u16 < p31 then
        local v34 = {
            ["amount"] = 1,
            ["itemType"] = u12.DIAMOND
        }
        table.insert(v32, v34)
    end
    if u17 < p31 then
        local v35 = {
            ["amount"] = 1,
            ["itemType"] = u12.EMERALD
        }
        table.insert(v32, v35)
    end
    local u36
    if u30 == nil then
        u36 = u30
    else
        u36 = u30.Character
    end
    u3.Controllers.ReceiveItemEffectController:playEffectForItems(v32, p29, function() --[[ Line: 117 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u36
        --]]
        local v37 = u30.Character
        if v37 ~= u36 then
            return nil
        end
        if v37 ~= nil then
            v37 = v37.PrimaryPart
            if v37 ~= nil then
                v37 = v37.CFrame
            end
        end
        return v37
    end, u30 == u5.LocalPlayer and "PlayLocally" or "PlayGlobally")
end
u3.CreateController(u18.new())
return nil