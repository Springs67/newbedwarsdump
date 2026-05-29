local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.RunService
local u8 = v5.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u11 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "MeteorKillEffect"
    end,
    ["__index"] = u11
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15, p16) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p15, p16)
    u11.setPlayDefaultKillEffect(p15, false)
end
function u12.onKill(p17, _, p18, u19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u11
        [4] = u6
        [5] = u4
        [6] = u2
        [7] = u9
        [8] = u7
        [9] = u10
    --]]
    local u20 = u3.new()
    p18.Archivable = true
    local u21 = p18:Clone()
    u21.HumanoidRootPart.Anchored = true
    u21.Parent = u8
    local v22 = u21.PrimaryPart
    if v22 ~= nil then
        v22 = v22.CFrame
    end
    if not v22 then
        u21:Destroy()
        return u20
    end
    u11.hideCharacter(p17, p18)
    local v23 = Random.new(math.random())
    local v24 = u19.Position
    local v25 = math.random(-20, 20)
    local v26 = math.random
    local v27 = v24 + Vector3.new(v25, 45, v26(-20, 20))
    local u28 = u6.Assets.Effects.Meteor:Clone()
    local u29 = CFrame.new(v27)
    local u30 = u8:GetServerTimeNow()
    local u31 = u30 + 1
    u28:PivotTo(u29)
    u28.Parent = u8
    local u32 = u4("Part", {
        ["Anchored"] = true,
        ["Name"] = "Meteor",
        ["Size"] = Vector3.new(4, 4, 4),
        ["CanCollide"] = false,
        ["CFrame"] = u29,
        ["Color"] = Color3.fromRGB(0, 0, 0),
        ["Material"] = Enum.Material.Rock,
        ["Parent"] = u28
    })
    local v33 = u2:playSound(u9.METEOR_COSMIC_LOOP, {
        ["looped"] = true,
        ["position"] = u19.Position
    })
    if v33 then
        u2:tweenSoundVolume(v33, 5, 1)
        u20:GiveTask(v33)
    end
    local u34 = v23:NextNumber(0.2, 0.5)
    local u35 = v23:NextNumber(0.2, 0.5)
    local u36 = v23:NextNumber(0.2, 0.5)
    local u37 = 0
    u20:GiveTask(u7.Heartbeat:Connect(function(p38) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u29
            [3] = u19
            [4] = u8
            [5] = u30
            [6] = u31
            [7] = u28
            [8] = u34
            [9] = u35
            [10] = u36
            [11] = u32
            [12] = u20
        --]]
        u37 = u37 + p38
        local v39 = u29:Lerp(u19, (u8:GetServerTimeNow() - u30) / (u31 - u30))
        local v40 = CFrame.new(v39.Position, u19.Position) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966)
        u28:PivotTo(v40)
        u32.CFrame = v40 * CFrame.Angles(u37 * 3.141592653589793 * 2 * u34, u37 * 3.141592653589793 * 2 * u35, u37 * 3.141592653589793 * 2 * u36)
        if u31 <= u8:GetServerTimeNow() then
            u20:DoCleaning()
        end
    end))
    u20:GiveTask(function() --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u21
            [3] = u8
            [4] = u19
            [5] = u6
            [6] = u19
            [7] = u10
            [8] = u2
            [9] = u9
        --]]
        task.spawn(function() --[[ Line: 100 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u21
                [3] = u8
                [4] = u19
                [5] = u6
                [6] = u19
                [7] = u10
                [8] = u2
                [9] = u9
            --]]
            u28:Destroy()
            u21:BreakJoints()
            local v41 = u21:GetDescendants()
            local function v46(p42) --[[ Line: 104 ]]
                if p42:IsA("Part") or p42:IsA("MeshPart") then
                    local v43 = math.random(-45, 45)
                    local v44 = 15 + math.random() * 10
                    local v45 = math.random
                    p42.AssemblyLinearVelocity = Vector3.new(v43, v44, v45(-45, 45))
                end
            end
            for v47, v48 in v41 do
                v46(v48, v47 - 1, v41)
            end
            local v49 = not u8.CurrentCamera and 0 or (u19.Position - u8.CurrentCamera.CFrame.Position).Magnitude
            local v50 = u6.Assets.Effects.MeteorHitEffect:Clone()
            v50.CFrame = u19
            v50.Parent = u8
            u10:playEffects({ v50 }, nil, {
                ["destroyAfterSec"] = 3,
                ["particleMultiplier"] = v49 > 200 and 0.2 or 1
            })
            u2:playSound(u9.TNT_EXPLODE_1, {
                ["rollOffMaxDistance"] = 300,
                ["position"] = u19.Position
            })
            u2:playSound(u9.CARROT_LAUNCHER_IMPACT, {
                ["rollOffMaxDistance"] = 300,
                ["position"] = u19.Position
            })
            task.delay(1, function() --[[ Line: 133 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21:Destroy()
            end)
        end)
    end)
    return u20
end
return u12