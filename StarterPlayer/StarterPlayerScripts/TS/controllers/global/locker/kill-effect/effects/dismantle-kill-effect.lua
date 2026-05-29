local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.TweenService
local u8 = v5.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "DismantleKillEffect"
    end,
    ["__index"] = u12
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16, p17) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p16, p17)
    u12.setPlayDefaultKillEffect(p16, false)
end
function u13.onKill(p18, _, p19, u20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u12
        [4] = u3
        [5] = u6
        [6] = u7
        [7] = u10
        [8] = u9
        [9] = u2
        [10] = u11
    --]]
    local u21 = u4.new()
    task.delay(3, function() --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21:DoCleaning()
    end)
    p19.Archivable = true
    local u22 = p19:Clone()
    u22.Name = "KillEffectCloneLegs"
    u22.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    u22.HumanoidRootPart.Anchored = true
    u22:PivotTo(u20)
    u22.Parent = u8
    u21:GiveTask(u22)
    local u23 = p19:Clone()
    u23.Name = "KillEffectCloneUpper"
    u23.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    u23.HumanoidRootPart.Anchored = true
    u23:PivotTo(u20)
    u23.Parent = u8
    u21:GiveTask(u23)
    u12.hideCharacter(p18, p19)
    local v24 = u22:GetDescendants()
    local v25 = u23:GetDescendants()
    local function v29(p26) --[[ Line: 57 ]]
        for v27, v28 in p26 do
            local _ = v27 - 1
            if v28:IsA("BillboardGui") and v28.Name == "Nametag" then
                v28:Destroy()
            end
        end
    end
    v29(v24)
    v29(v25)
    local function v40(p30, u31, u32) --[[ Line: 71 ]]
        local function v37(p33) --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u31
            --]]
            if p33:IsA("BasePart") or p33:IsA("MeshPart") then
                local v34 = p33.Position.Y
                local v35
                if p33.Name == "LowerTorso" then
                    v35 = u32
                elseif p33.Name == "HumanoidRootPart" then
                    v35 = false
                elseif u32 then
                    v35 = v34 < u31
                else
                    v35 = u31 <= v34
                end
                if v35 then
                    p33.Transparency = 1
                    return
                end
            else
                local v36 = p33:IsA("Texture")
                if v36 then
                    v36 = string.find(p33.Name, "entity-highlight-texture")
                end
                if v36 ~= 0 and (v36 == v36 and v36) then
                    p33:Destroy()
                    return
                end
                if p33:IsA("Highlight") then
                    p33:Destroy()
                    return
                end
                if p33:IsA("Decal") and (p33.Name == "face" and not u32) then
                    p33:Destroy()
                end
            end
        end
        for v38, v39 in p30 do
            v37(v39, v38 - 1, p30)
        end
    end
    local v41 = u22.PrimaryPart
    local v42 = u23.PrimaryPart
    if not (v41 and v42) then
        u3.Debug("Missing legs or upper primary part", v41, v42)
        u21:DoCleaning()
        return u21
    end
    local v43 = v41.Position.Y - v41.Size.Y / 2
    local v44 = v42.Position.Y - v42.Size.Y / 2
    v40(v24, v43, false)
    v40(v25, v44, true)
    task.spawn(function() --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u23
            [3] = u6
            [4] = u8
            [5] = u20
            [6] = u21
            [7] = u7
            [8] = u10
            [9] = u9
            [10] = u2
            [11] = u11
        --]]
        local v45 = u22.Humanoid.Animator
        local v46 = u23.Humanoid.Animator
        local u47 = 0
        local v48 = false
        local v49 = { Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1) }
        while true do
            if v48 then
                u47 = u47 + 1
            else
                v48 = true
            end
            if u47 >= 3 then
                local u50 = u10:playAnimation(v45, u9.DISMANTLE_KILL_EFFECT_LOWER)
                local u51 = u10:playAnimation(v46, u9.DISMANTLE_KILL_EFFECT_UPPER)
                u2:playSound(u11.KILL_EFFECT_SLASH, {
                    ["position"] = u20.Position
                })
                local v52 = u50
                if v52 ~= nil then
                    v52:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 159 ]]
                        --[[
                        Upvalues:
                            [1] = u50
                        --]]
                        u50:AdjustSpeed(0)
                    end)
                end
                if u51 ~= nil then
                    u51:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 165 ]]
                        --[[
                        Upvalues:
                            [1] = u51
                        --]]
                        u51:AdjustSpeed(0)
                    end)
                end
                u21:GiveTask(function() --[[ Line: 169 ]]
                    --[[
                    Upvalues:
                        [1] = u50
                    --]]
                    local v53 = u50
                    if v53 ~= nil then
                        v53:Destroy()
                    end
                end)
                u21:GiveTask(function() --[[ Line: 175 ]]
                    --[[
                    Upvalues:
                        [1] = u51
                    --]]
                    local v54 = u51
                    if v54 ~= nil then
                        v54:Destroy()
                    end
                end)
                return
            end
            local u55 = u6.Assets.Effects.SlashEffect:Clone()
            u55.CanCollide = false
            u55.Anchored = true
            u55.Parent = u8
            u55.Size = u55.Size * 3
            u55.Name = "SlashEffect_" .. tostring(u47)
            local u56 = v49[u47 + 1] * 3
            u55:PivotTo(u20 + u56)
            u21:GiveTask(u55)
            task.spawn(function() --[[ Line: 143 ]]
                --[[
                Upvalues:
                    [1] = u47
                    [2] = u7
                    [3] = u55
                    [4] = u20
                    [5] = u56
                --]]
                task.wait(u47 * 0.15)
                u7:Create(u55, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    ["CFrame"] = u20 - u56
                }):Play()
            end)
        end
    end)
    return u21
end
return u13