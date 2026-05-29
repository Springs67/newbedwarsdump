local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.ReplicatedStorage
local u10 = v7.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "PillowController"
    end,
    ["__index"] = u12
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u14
    --]]
    u12.constructor(p19)
    p19.Name = "PillowController"
    p19.pillowRemote = u14.Client:Get("PillowSwing")
    p19.playEffectsRemoteEvent = u14.Client:Get("PillowEffects")
end
function u16.KnitStart(u20) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u11
        [3] = u13
        [4] = u6
        [5] = u8
        [6] = u4
        [7] = u3
        [8] = u15
        [9] = u9
        [10] = u10
    --]]
    u12.KnitStart(u20)
    u11.SwordSwing:connect(function(p21) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u20
        --]]
        if p21:isCancelled() or p21.swordType ~= u13.PILLOW then
            return nil
        end
        local v22 = u20.pillowRemote
        local v23 = p21.chargedAttack
        if v23 ~= nil then
            v23 = v23.chargeRatio
        end
        v22:CallServerAsync(v23 == nil and 0 or v23)
    end)
    u20.playEffectsRemoteEvent:Connect(function(u24) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u8
            [3] = u4
            [4] = u3
            [5] = u15
            [6] = u9
            [7] = u10
        --]]
        local u25 = u6.new()
        local u26 = false
        local v27 = u24.playerIds
        local function v34(p28) --[[ Line: 58 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u26
                [3] = u4
                [4] = u3
                [5] = u15
                [6] = u9
                [7] = u10
                [8] = u24
                [9] = u25
            --]]
            local v29 = u8:GetPlayerByUserId(p28)
            if v29 ~= nil then
                v29 = v29.Character
            end
            if v29 ~= nil then
                v29 = v29.PrimaryPart
                if v29 ~= nil then
                    v29 = v29.Position
                end
            end
            if v29 then
                if not u26 then
                    u4:playSound(u3.fromList(u15.PILLOW_HIT_1, u15.PILLOW_HIT_2, u15.PILLOW_HIT_3), {
                        ["rollOffMaxDistance"] = 220,
                        ["volumeMultiplier"] = 1.8,
                        ["position"] = v29
                    })
                    u26 = true
                end
                local u30 = u9.Assets.Effects.WhiteFeatherEffect:Clone()
                u30.Position = v29
                u30.Parent = u10
                task.delay(0.3, function() --[[ Line: 84 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                        [2] = u24
                    --]]
                    local v31 = u30
                    if v31 ~= nil then
                        for v32, v33 in v31:GetChildren() do
                            local _ = v32 - 1
                            if v33:IsA("ParticleEmitter") then
                                v33:Emit(u24.charged and 30 or 5)
                            end
                        end
                    end
                end)
                u25:GiveTask(u30)
            end
        end
        for v35, v36 in v27 do
            v34(v36, v35 - 1, v27)
        end
        task.delay(3, function() --[[ Line: 104 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            return u25:DoCleaning()
        end)
    end)
end
v5.CreateController(u16.new())
return nil