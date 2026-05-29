local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u5 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "battle-royale", "battle-royale-util").BattleRoyaleUtil
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "BattleRoyaleChestController"
    end,
    ["__index"] = u5
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
    --]]
    u5.constructor(p11, { u6.BATTLE_ROYALE })
    p11.Name = "BattleRoyaleChestController"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.KnitStart(p12)
end
function u8.onGameInit(_) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
        [3] = u4
    --]]
    u2("chest", function(u13) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
        --]]
        local v14 = u13:WaitForChild("Model")
        local v15 = u13:FindFirstChild("ChestFolderValue")
        local u16
        if v15 then
            u16 = v15.Value
        else
            u16 = nil
        end
        if not u16 then
            return nil
        end
        local v17 = u16:GetAttribute("RarityTier")
        if not v17 then
            return nil
        end
        local v18 = u7.RarityEffectColors[v17]
        if not v18 then
            return nil
        end
        local u19 = u4.Assets.Effects.RareLootEffect:Clone()
        u19.Parent = u13
        u19.CFrame = v14:GetPivot()
        u19.Attachment.ParticleEmitter.Color = ColorSequence.new(v18)
        u19.Attachment.Sparks.Color = ColorSequence.new(v18)
        local u20 = nil
        u20 = u13:GetAttributeChangedSignal("ChestOpened"):Connect(function() --[[ Line: 55 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u20
                [3] = u13
                [4] = u19
            --]]
            if not u16 then
                u20:Disconnect()
                return nil
            end
            if u13:GetAttribute("ChestOpened") == true then
                u19:Destroy()
            end
        end)
    end)
end
v3.CreateController(u8.new())
return nil