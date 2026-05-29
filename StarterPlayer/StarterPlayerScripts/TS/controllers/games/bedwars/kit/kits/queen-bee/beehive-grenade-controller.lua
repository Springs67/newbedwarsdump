local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Debris
local u7 = v5.ReplicatedStorage
local u8 = v5.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "BeehiveGrenadeController"
    end,
    ["__index"] = u10
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p20)
    p20.Name = "BeehiveGrenadeController"
end
function u17.KnitStart(u21) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u14
        [3] = u13
        [4] = u7
        [5] = u8
        [6] = u12
        [7] = u11
        [8] = u9
        [9] = u4
    --]]
    u10.KnitStart(u21)
    u14.Client:Get("BeehiveGrenadeExplode"):Connect(function(p22) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u13
            [3] = u7
            [4] = u8
            [5] = u12
            [6] = u11
            [7] = u9
            [8] = u4
        --]]
        u21:playBeehiveBlast(p22.position)
        local v23 = false
        local v24 = 0
        while true do
            if v23 then
                v24 = v24 + 1
            else
                v23 = true
            end
            if v24 >= u13.FLORA_SEEKING_BEE_COUNT then
                return
            end
            local u25
            if v24 < #p22.miniExplosions then
                u25 = p22.miniExplosions[v24 + 1]
            else
                u25 = nil
            end
            local u26 = u7.Assets.Effects.Bee:Clone()
            u26.Parent = u8
            for v27, v28 in u26:GetDescendants() do
                local _ = v27 - 1
                if v28:IsA("BasePart") then
                    v28.CanCollide = false
                    v28.CanQuery = false
                    v28.Anchored = true
                end
            end
            local v29 = u26.PrimaryPart
            if v29 ~= nil then
                v29 = v29:FindFirstChild("RocketParticle")
            end
            if v29 then
                v29.Enabled = true
            end
            local v30 = u26:FindFirstChildOfClass("AnimationController")
            if v30 ~= nil then
                local v31 = v30:LoadAnimation(u12:getAnimation(u11.BEE_FLAP))
                v31.Looped = true
                v31:Play()
            end
            u26:PivotTo(CFrame.new(p22.position))
            local u32 = CFrame.new(p22.position)
            local v33 = math.random() * 3.141592653589793 * 2
            local v34 = math.sin(v33) * 5
            local v35 = 6 + math.random() * 2
            local v36 = math.cos(v33) * 5
            local u37 = u32 + Vector3.new(v34, v35, v36)
            local v38
            if u25 == nil then
                v38 = u25
            else
                v38 = u25.explosionTime
            end
            local v39
            if v38 == 0 or (v38 ~= v38 or not v38) then
                v39 = v24 * 0.1 + 0.75
            else
                v39 = u25.explosionTime - u8:GetServerTimeNow()
            end
            local u40 = nil
            u40 = u9(v39, u4, function(p41) --[[ Line: 93 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u40
                    [3] = u32
                    [4] = u37
                    [5] = u26
                --]]
                local v42 = u25
                if v42 ~= nil then
                    v42 = v42.target
                end
                if v42 then
                    v42 = not u25.target.PrimaryPart
                end
                if v42 then
                    u40:Cancel()
                    return nil
                end
                local v43 = 0.5 * p41
                local v44 = p41 - 0.5
                local v45 = (v43 + (math.pow(v44, 3) + 0.125)) / 0.75
                local v46 = u32
                local v47 = math
                local v48 = u25
                if v48 ~= nil then
                    v48 = v48.target
                end
                local v49 = u37
                local v50
                if v48 then
                    v50 = v45 / 0.6
                else
                    v50 = v45
                end
                local v51 = v46:Lerp(v49, (v47.clamp(v50, 0, 1)))
                local v52 = u25
                if v52 ~= nil then
                    v52 = v52.target.PrimaryPart
                end
                local v53
                if v52 then
                    v53 = u25.target.PrimaryPart.CFrame
                else
                    v53 = v51
                end
                local v54 = u26:GetPrimaryPartCFrame().Position
                local v55 = v45 * 1.5 - 0.4
                local v56 = v51:Lerp(v53, (math.clamp(v55, 0, 1))).Position
                local v57 = v56 - v54
                local v58 = v57.Magnitude == 0 and Vector3.new(1, 0, 0) or v57
                u26:PivotTo(CFrame.new(v56, v56 + v58))
            end)
            task.spawn(function() --[[ Line: 130 ]]
                --[[
                Upvalues:
                    [1] = u40
                    [2] = u26
                    [3] = u25
                    [4] = u21
                    [5] = u9
                    [6] = u4
                --]]
                u40:Wait()
                local v59 = u26:GetPrimaryPartCFrame().Position
                local v60 = u25
                if v60 ~= nil then
                    v60 = v60.target
                end
                if v60 then
                    v60 = u25.target.PrimaryPart
                end
                if v60 then
                    u26:Destroy()
                    u21:playBeeExplosion(v59)
                else
                    u9(0.5, u4, function(p61) --[[ Line: 146 ]]
                        --[[
                        Upvalues:
                            [1] = u26
                        --]]
                        for v62, v63 in u26:GetDescendants() do
                            local _ = v62 - 1
                            if v63:IsA("BasePart") then
                                local v64 = v63.Transparency
                                v63.Transparency = math.max(v64, p61)
                            end
                        end
                    end)
                    task.delay(0.55, function() --[[ Line: 157 ]]
                        --[[
                        Upvalues:
                            [1] = u26
                        --]]
                        return u26:Destroy()
                    end)
                end
            end)
        end
    end)
end
function u17.playBeeExplosion(_, p65) --[[ Line: 166 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u15
        [4] = u8
        [5] = u16
    --]]
    local u66 = u7.Assets.Effects.Explosion:Clone()
    u2:playSound(u15.TNT_EXPLODE_1, {
        ["rollOffMaxDistance"] = 200,
        ["volumeMultiplier"] = 0.4,
        ["position"] = p65,
        ["playbackSpeedMultiplier"] = math.random() * 0.1 + 0.95
    })
    u66.Parent = u8
    u16:playEffects({ u66 }, nil, {
        ["sizeMultiplier"] = 0.35
    })
    u66.CFrame = CFrame.new(p65)
    task.delay(2, function() --[[ Line: 179 ]]
        --[[
        Upvalues:
            [1] = u66
        --]]
        u66:Destroy()
    end)
end
function u17.playBeehiveBlast(_, p67) --[[ Line: 183 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u2
        [4] = u15
        [5] = u6
    --]]
    local v68 = u7.Assets.Effects.BeehiveGrenadeExplode:Clone()
    v68.Position = p67
    v68.Parent = u8
    v68.CanQuery = false
    u2:playSound(u15.BEEHIVE_GRENADE_EXPLODE, {
        ["rollOffMaxDistance"] = 180,
        ["rollOffMinDistance"] = 20,
        ["position"] = p67
    })
    for v69, v70 in v68:GetDescendants() do
        local _ = v69 - 1
        if v70:IsA("ParticleEmitter") then
            v70:Emit(30)
        end
    end
    u6:AddItem(v68, 3)
end
v3.CreateController(u17.new())
return nil