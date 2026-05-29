local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.ReplicatedStorage
local u9 = v6.Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "NazarHalloweenStatusEffectController"
    end,
    ["__index"] = u11
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p18)
    p18.Name = "NazarHalloweenStatusEffectController"
end
function u15.KnitStart(u19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
        [3] = u5
        [4] = u10
        [5] = u4
        [6] = u7
        [7] = u2
        [8] = u13
    --]]
    u11.KnitStart(u19)
    u12.Client:GetNamespace("Halloween2024Remotes"):Get("NazarEntityPunched"):Connect(function(u20) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u10
            [3] = u4
            [4] = u7
            [5] = u2
            [6] = u13
            [7] = u19
        --]]
        if not u20.target.PrimaryPart then
            return nil
        end
        u5.new()
        local v21 = u20.target.PrimaryPart.Position
        local v22 = (u20.destination - v21).Position
        local v23 = v22.X
        local v24 = v22.Z
        local v25 = Vector3.new(v23, 0, v24).Unit
        local v26 = CFrame.lookAt(Vector3.new(0, 0, 0), v25) * CFrame.Angles(0, 3.141592653589793, 0)
        u20.target:GetPivot()
        local u27 = CFrame.new(v21) * v26
        local u28 = CFrame.new(u20.destination.Position) * v26
        u10(u20.knockbackDuration, u4, function(p29) --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u27
                [3] = u28
            --]]
            if not u20.target.PrimaryPart then
                return nil
            end
            u20.target:PivotTo(u27:Lerp(u28, p29))
        end)
        local u30 = u20.target == u7.LocalPlayer.Character
        local v31 = task.delay
        local v32 = u20.knockbackDuration - 0.1
        v31(math.max(0, v32), function() --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u20
                [3] = u2
                [4] = u13
                [5] = u19
            --]]
            if u30 or u20.target.PrimaryPart then
                local v33 = {}
                local v34
                if u30 then
                    v34 = nil
                else
                    v34 = u20.target:GetPrimaryPartCFrame().Position
                end
                v33.position = v34
                u2:playSound(u13.KALIYAH_WALL_HIT, v33)
                local v35 = u2
                local v36 = u13.KALIYAH_EXPLOSION
                local v37 = {
                    ["rollOffMaxDistance"] = 80,
                    ["rollOffMinDistance"] = 30,
                    ["volumeMultiplier"] = 0.5
                }
                for v38, v39 in v33 do
                    v37[v38] = v39
                end
                v35:playSound(v36, v37)
                if u20.target.PrimaryPart then
                    u19:playKnockbackStrikeEffect(u20.target.PrimaryPart.Position)
                end
            end
        end)
    end)
end
function u15.playKnockbackStrikeEffect(_, p40) --[[ Line: 82 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u14
    --]]
    local v41 = u8.Assets.Effects.NazarKnockbackStrike:Clone()
    v41.Parent = u9
    v41.CFrame = CFrame.new(p40)
    u14:playEffects({ v41 }, nil, {
        ["destroyAfterSec"] = 1
    })
end
v3.CreateController(u15.new())
return nil