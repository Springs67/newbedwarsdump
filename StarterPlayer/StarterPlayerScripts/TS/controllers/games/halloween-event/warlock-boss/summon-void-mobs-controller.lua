local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.Workspace
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "SummonVoidMobsController"
    end,
    ["__index"] = u7
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p14)
    p14.Name = "SummonVoidMobsController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u2
        [4] = u9
        [5] = u5
        [6] = u6
        [7] = u10
    --]]
    u7.KnitStart(p15)
    u8.Client:GetNamespace("WarlockBoss"):Get("WarlockSummonVoidMobs"):Connect(function(p16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u9
            [3] = u5
            [4] = u6
            [5] = u10
        --]]
        local v17 = p16.fromPosition
        local v18 = p16.summons
        u2:playSound(u9.HALLOWEEN_BOSS_CAST, {
            ["rollOffMaxDistance"] = 200,
            ["rollOffMinDistance"] = 10,
            ["position"] = v17,
            ["playbackSpeedMultiplier"] = math.random() * 0.1 + 0.95
        })
        local function v29(u19) --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u6
                [3] = u2
                [4] = u9
                [5] = u10
            --]]
            local u20 = u5.Assets.Effects.Warlock.VoidSummonPortal:Clone()
            for v21, v22 in u20:GetDescendants() do
                local _ = v21 - 1
                if v22:IsA("BasePart") then
                    v22.CanCollide = false
                    v22.CanQuery = false
                end
            end
            local v23 = u19.position
            u20:PivotTo(CFrame.new(v23 + Vector3.new(0, 5, 0)) * CFrame.Angles(0, 0, 1.5707963267948966))
            u20.Parent = u6
            u2:playSound(u9.CURSE_SUMMON_MOB_PORTAL_SPAWN, {
                ["rollOffMaxDistance"] = 150,
                ["position"] = u20:GetPivot().Position
            })
            local u24 = u2:playSound(u9.CURSE_SUMMON_MOB_PORTAL_LOOP, {
                ["rollOffMaxDistance"] = 100,
                ["looped"] = true,
                ["position"] = u20:GetPivot().Position
            })
            local v25 = u19.summonAtTime - u6:GetServerTimeNow()
            task.delay(v25, function() --[[ Line: 72 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u19
                    [3] = u6
                    [4] = u10
                    [5] = u2
                    [6] = u9
                    [7] = u20
                --]]
                local v26 = u5.Assets.Effects.WormholeTeleport:Clone()
                local v27 = u19.position
                v26.CFrame = CFrame.new(v27 + Vector3.new(0, 5, 0))
                v26.Parent = u6
                u10:playEffects({ v26 }, nil, {
                    ["destroyAfterSec"] = 1
                })
                u2:playSound(u9.VOID_PORTAL_TELEPORT, {
                    ["rollOffMaxDistance"] = 100,
                    ["position"] = u20:GetPivot().Position
                })
                u2:playSound(u9.CURSE_SUMMON_MOB_PORTAL_CLOSE, {
                    ["rollOffMaxDistance"] = 100,
                    ["position"] = u20:GetPivot().Position
                })
            end)
            task.delay(v25 + 0.25, function() --[[ Line: 91 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u24
                --]]
                u20:Destroy()
                local v28 = u24
                if v28 ~= nil then
                    v28:Destroy()
                end
            end)
        end
        for v30, v31 in v18 do
            v29(v31, v30 - 1, v18)
        end
    end)
end
v3.CreateController(u11.new())
return nil