local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.ReplicatedStorage
local u10 = v7.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "SnowConeStatusEffectController"
    end,
    ["__index"] = u12
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
        [1] = u12
    --]]
    u12.constructor(p22)
    p22.Name = "SnowConeStatusEffectController"
end
function u19.KnitStart(p23) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u11
        [3] = u17
        [4] = u16
        [5] = u13
        [6] = u6
        [7] = u10
        [8] = u9
        [9] = u5
        [10] = u8
        [11] = u2
        [12] = u18
        [13] = u14
        [14] = u3
        [15] = u15
    --]]
    u12.KnitStart(p23)
    u11.ProjectileLaunched:connect(function(p24) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u16
            [3] = u13
            [4] = u6
            [5] = u10
            [6] = u9
        --]]
        if not p24.shooter then
            return nil
        end
        if u17:getStacks(p24.shooter, u16.SNOW_CONE) < u13.SNOW_CONE_ARROW_COST then
            return nil
        end
        local v25 = p24.projectile:FindFirstChild("Handle")
        local v26
        if v25 == nil then
            v26 = v25
        else
            v26 = v25:FindFirstChild("Trail")
        end
        if v26 ~= nil then
            v26:Destroy()
        end
        local u27 = u6("Trail", {
            ["FaceCamera"] = true,
            ["LightInfluence"] = 0,
            ["Lifetime"] = 0.35,
            ["Brightness"] = 5,
            ["Attachment0"] = u6("Attachment", {
                ["Position"] = Vector3.new(0, 0, 0),
                ["Parent"] = v25
            }),
            ["Attachment1"] = u6("Attachment", {
                ["Position"] = Vector3.new(0, 0.2, 0),
                ["Parent"] = v25
            }),
            ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(108, 168, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(108, 168, 255)) }),
            ["WidthScale"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 0) }),
            ["Transparency"] = NumberSequence.new(0.5),
            ["Parent"] = u10
        })
        local u28 = u9.Assets.Effects.Snowflake:Clone()
        u28.Parent = v25
        u28.Enabled = true
        u28.Rate = 10
        if v25 ~= nil then
            v25.Destroying:Connect(function() --[[ Line: 83 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u27
                --]]
                u28.Enabled = false
                task.delay(3, function() --[[ Line: 85 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                        [2] = u28
                    --]]
                    u27:Destroy()
                    u28:Destroy()
                end)
            end)
        end
    end)
    u11.DamageBlock:setPriority(u5.MONITOR):connect(function(u29) --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u17
            [3] = u16
            [4] = u13
            [5] = u9
            [6] = u10
            [7] = u2
            [8] = u18
        --]]
        if u29:isCancelled() then
            return nil
        end
        local v30 = u8.LocalPlayer.Character
        if not v30 then
            return nil
        end
        if u17:getStacks(v30, u16.SNOW_CONE) >= u13.SNOW_CONE_BLOCK_COST then
            task.spawn(function() --[[ Line: 101 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u10
                    [3] = u2
                    [4] = u29
                    [5] = u18
                --]]
                local v31 = u9.Assets.Effects.SnowBlast:Clone()
                v31.Parent = u10
                v31.Position = u2:getWorldPosition(u29.blockPosition)
                u18:playEffects({ v31 }, nil, {
                    ["destroyAfterSec"] = 2,
                    ["particleMultiplier"] = 0.5,
                    ["sizeMultiplier"] = 0.7
                })
            end)
        end
    end)
    u11.LocalProjectileImpact:connect(function(p32) --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u17
            [3] = u16
            [4] = u9
            [5] = u10
            [6] = u18
        --]]
        if p32.projectile.Name ~= "arrow" then
            return nil
        end
        local v33 = u8:GetPlayerByUserId((p32.projectile:GetAttribute("ProjectileShooter")))
        if not v33 then
            return nil
        end
        local v34 = u17:getActive(v33.Character, u16.SNOW_CONE)
        if v34 ~= nil then
            v34 = v34.stacks
        end
        if v34 == nil then
            v34 = false
        end
        if v34 ~= 0 and (v34 == v34 and v34) then
            p32.projectile:SetAttribute("IgnoreDefaultImpactEffect", true)
            local u35 = u9.Assets.Effects.SnowBlast:Clone()
            u35.Position = p32.hitPosition
            u35.Parent = u10
            task.spawn(function() --[[ Line: 136 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u35
                --]]
                u18:playEffects(u35:GetChildren(), nil, {
                    ["sizeMultiplier"] = 0.5,
                    ["destroyAfterSec"] = 1.5
                })
            end)
        end
    end)
    u11.ItemConsumed:connect(function(p36) --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u9
            [3] = u3
            [4] = u15
            [5] = u18
        --]]
        local v37 = { u14.SNOW_CONE, u14.LUCKY_SNOW_CONE }
        local v38 = p36.itemType
        if table.find(v37, v38) == nil then
            return nil
        end
        local u39 = u9.Assets.Effects.SnowBlast:Clone()
        local u40 = p36.entity:getInstance().PrimaryPart
        if u40 ~= nil then
            u40 = u40.Position
        end
        if not u40 then
            return nil
        end
        u39.Position = u40
        u39.Parent = p36.entity:getInstance().PrimaryPart
        task.spawn(function() --[[ Line: 161 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u15
                [3] = u40
                [4] = u18
                [5] = u39
            --]]
            local v41 = {
                ["position"] = u40
            }
            u3:playSound(u15.SNOW_CONE_MACHINE_MAKING_FINISH, v41)
            u18:playEffects(u39:GetChildren(), nil, {
                ["destroyAfterSec"] = 1.5
            })
            task.delay(1.5, function() --[[ Line: 168 ]]
                --[[
                Upvalues:
                    [1] = u39
                --]]
                u39:Destroy()
            end)
        end)
    end)
end
v4.CreateController(u19.new())
return nil