local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.MathExtras
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u6 = v5.InOutExpo
local u7 = v5.Linear
local u8 = v5.OutExpo
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.ReplicatedStorage
local u12 = v10.TweenService
local u13 = v10.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "SnowglobeKillEffect"
    end,
    ["__index"] = u16
})
u17.__index = u17
function u17.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20, p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p20, p21)
    u16.setPlayDefaultKillEffect(p20, false)
end
function u17.onKill(p22, _, p23, u24) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u13
        [3] = u16
        [4] = u11
        [5] = u14
        [6] = u7
        [7] = u3
        [8] = u12
        [9] = u6
        [10] = u4
        [11] = u15
        [12] = u8
    --]]
    local u25 = u9.new()
    local u26 = p23:Clone()
    u26.Parent = u13
    if u26.PrimaryPart then
        u26.PrimaryPart.Anchored = true
    end
    for v27, v28 in u26:GetDescendants() do
        local _ = v27 - 1
        if v28:IsA("Part") then
            v28.CanCollide = false
            v28.CanQuery = false
            v28.CanTouch = false
        end
    end
    u16.hideCharacter(p22, p23)
    local u29 = u11.Assets.Misc.SnowglobeKillEffect:Clone()
    u29:PivotTo(u24)
    u29.Parent = u13
    u25:GiveTask(u29)
    local v30 = 0
    local u31 = v30
    local v32 = 0
    local u33 = {}
    for v34, v35 in u29.Root:GetDescendants() do
        local _ = v34 - 1
        local v36
        if v35:IsA("BasePart") then
            v30 = u31 + v35.Size.Magnitude
            v35.Transparency = 1
            u31 = v30
            v36 = true
        else
            v36 = false
        end
        if v36 == true then
            v32 = v32 + 1
            u33[v32] = v35
        end
    end
    local v37 = {}
    for _, v38 in u33 do
        local v39 = false
        for _, v40 in v37 do
            local v41 = nil
            for v42, v43 in v40 do
                local _ = v42 - 1
                local v44 = v43.Name
                local v45 = string.split(v44, "_")[1]
                local v46 = tonumber(v45)
                if v46 == nil then
                    error("Invalid name: " .. v44)
                end
                local v47 = v38.Name
                local v48 = string.split(v47, "_")[1]
                local v49 = tonumber(v48)
                if v49 == nil then
                    error("Invalid name: " .. v47)
                end
                if v46 == v49 == true then
                    v41 = v43
                    break
                end
            end
            if v41 then
                table.insert(v40, v38)
                v39 = true
            end
        end
        if not v39 then
            table.insert(v37, { v38 })
        end
    end
    table.sort(v37, function(p50, p51) --[[ Line: 117 ]]
        local v52 = p50[1].Name
        local v53 = string.split(v52, "_")[1]
        local v54 = tonumber(v53)
        if v54 == nil then
            error("Invalid name: " .. v52)
        end
        local v55 = p51[1].Name
        local v56 = string.split(v55, "_")[1]
        local v57 = tonumber(v56)
        if v57 == nil then
            error("Invalid name: " .. v55)
        end
        return v54 < v57
    end)
    local u58 = v37
    local u59 = u26:GetScale()
    local u60 = u26:GetPivot()
    local u62 = u14(1, u7, function(p61) --[[ Line: 124 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u3
            [3] = u59
            [4] = u60
        --]]
        u26:ScaleTo(u3:lerp(u59, 0.1, p61))
        u26:PivotTo(u60:Lerp(u60 - Vector3.new(0, 0.4, 0), p61))
    end)
    u25:GiveTask((task.spawn(function() --[[ Line: 131 ]]
        --[[
        Upvalues:
            [1] = u62
            [2] = u25
            [3] = u58
            [4] = u31
            [5] = u12
            [6] = u26
            [7] = u29
            [8] = u14
            [9] = u6
            [10] = u24
            [11] = u11
            [12] = u4
            [13] = u15
            [14] = u8
            [15] = u33
        --]]
        u62:Wait()
        u25:GiveTask(task.spawn(function() --[[ Line: 133 ]]
            --[[
            Upvalues:
                [1] = u58
                [2] = u31
                [3] = u12
                [4] = u25
            --]]
            for _, v63 in u58 do
                local v64 = 0
                for v65 = 1, #v63 do
                    local v66 = v63[v65]
                    local _ = v65 - 1
                    v64 = v64 + v66.Size.Magnitude
                end
                local v67 = v64 / u31 * 3
                for _, v68 in v63 do
                    local v69 = v68.CFrame
                    v68.CFrame = v69 + Vector3.new(0, 5, 0)
                    local v70 = u12:Create(v68, TweenInfo.new(1), {
                        ["Transparency"] = 0,
                        ["CFrame"] = v69
                    })
                    u25:GiveTask(v70)
                    v70:Play()
                end
                task.wait(v67)
            end
        end))
        task.delay(3.5, function() --[[ Line: 161 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u29
                [3] = u14
                [4] = u6
                [5] = u24
                [6] = u11
                [7] = u4
                [8] = u15
                [9] = u8
                [10] = u12
                [11] = u33
            --]]
            u26.Parent = u29
            local v77 = u14(1, u6, function(p71) --[[ Line: 163 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u24
                --]]
                local v72 = u29
                local v73 = u24
                local v74 = CFrame.Angles
                local v75 = p71 * 2 * 3.141592653589793 * 1.5
                local v76 = math.sin(v75) * 30
                v72:PivotTo(v73 * v74(0, 0, (math.rad(v76))))
            end)
            local u78 = u11.Assets.Effects.Snowflake:Clone()
            u78.Parent = u29.Root["32_globe_outer"]
            u78.Enabled = true
            u78.Lifetime = NumberRange.new(1.5, 2.5)
            u78.Speed = NumberRange.new(0.25, 0.75)
            u78.Drag = 0.15
            u78.EmissionDirection = Enum.NormalId.Bottom
            u78.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 0.25, 0.05), NumberSequenceKeypoint.new(1, 0) })
            u78.Rate = 10
            u4:playSound(u15.SANTA_BELLS, {
                ["playbackSpeedMultiplier"] = 1.5,
                ["position"] = u24.Position
            })
            v77:Wait()
            task.wait(1.5)
            task.spawn(function() --[[ Line: 184 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u8
                    [3] = u78
                --]]
                u14(1, u8, function(p79) --[[ Line: 185 ]]
                    --[[
                    Upvalues:
                        [1] = u78
                    --]]
                    u78.Transparency = NumberSequence.new(p79)
                end)
            end)
            for v80, v81 in u33 do
                local _ = v80 - 1
                u12:Create(v81, TweenInfo.new(1), {
                    ["Transparency"] = 1
                }):Play()
            end
            local v82 = u26:GetDescendants()
            local function v84(p83) --[[ Line: 198 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                if p83:IsA("BasePart") then
                    u12:Create(p83, TweenInfo.new(1), {
                        ["Transparency"] = 1
                    }):Play()
                end
            end
            for v85, v86 in v82 do
                v84(v86, v85 - 1, v82)
            end
            task.delay(1, function() --[[ Line: 208 ]]
                --[[
                Upvalues:
                    [1] = u29
                --]]
                return u29:Destroy()
            end)
        end)
    end)))
    u25:GiveTask(function() --[[ Line: 214 ]]
        --[[
        Upvalues:
            [1] = u62
        --]]
        u62:Cancel()
    end)
    return u25
end
return u17