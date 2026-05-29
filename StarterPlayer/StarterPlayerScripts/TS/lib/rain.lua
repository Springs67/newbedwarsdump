local v1 = Color3.new(1, 1, 1)
local v2 = NumberSequence.new(10)
local v3 = NumberRange.new(0.8)
local v4 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 5.33, 2.75), NumberSequenceKeypoint.new(1, 5.33, 2.75) })
local v5 = NumberRange.new(0.8)
local v6 = NumberRange.new(0, 360)
local v7 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.4, 3), NumberSequenceKeypoint.new(1, 0) })
local v8 = NumberRange.new(0.1, 0.15)
local v9 = NumberRange.new(0, 360)
local v10 = Vector2.new(10, 10)
local u11 = {
    ["None"] = 0,
    ["Whitelist"] = 1,
    ["Blacklist"] = 2,
    ["Function"] = 3
}
local u12 = game:GetService("Players")
local u13 = game:GetService("TweenService")
local u14 = game:GetService("RunService")
local u15 = Instance.new("NumberValue")
u15.Value = 1
local u16 = u11.None
local u17 = Vector3.new
local u18 = NumberSequenceKeypoint.new(0, 1, 0)
local u19 = NumberSequenceKeypoint.new(1, 1, 0)
local u20 = {}
local u21 = 0
local u22 = 0
local u23 = Vector3.new(0, -1, 0)
local u24 = nil
local u25 = nil
local u26 = nil
local u27 = {}
local u28 = 1
local u29 = 1
local u30 = 0
local u31 = true
for _, v32 in pairs({
    Vector3.new(0.14142136, 0, 0.14142136),
    Vector3.new(-0.14142136, 0, 0.14142136),
    Vector3.new(-0.14142136, 0, -0.14142136),
    Vector3.new(0.14142136, 0, -0.14142136),
    Vector3.new(0.4, 0, 0),
    Vector3.new(0.28284273, 0, 0.28284273),
    Vector3.new(0.000000000000000024492937, 0, 0.4),
    Vector3.new(-0.28284273, 0, 0.28284273),
    Vector3.new(-0.4, 0, 0.000000000000000048985874),
    Vector3.new(-0.28284273, 0, -0.28284273),
    Vector3.new(-0.000000000000000073478805, 0, -0.4),
    Vector3.new(0.28284273, 0, -0.28284273),
    Vector3.new(0.6, 0, 0),
    Vector3.new(0.4854102, 0, 0.35267115),
    Vector3.new(0.1854102, 0, 0.57063395),
    Vector3.new(-0.1854102, 0, 0.57063395),
    Vector3.new(-0.4854102, 0, 0.35267115),
    Vector3.new(-0.6, 0, 0.00000000000000007347881),
    Vector3.new(-0.4854102, 0, -0.35267115),
    Vector3.new(-0.1854102, 0, -0.57063395),
    Vector3.new(0.1854102, 0, -0.57063395),
    Vector3.new(0.4854102, 0, -0.35267115),
    Vector3.new(0.77274066, 0, 0.20705524),
    Vector3.new(0.56568545, 0, 0.56568545),
    Vector3.new(0.20705524, 0, 0.77274066),
    Vector3.new(-0.20705524, 0, 0.77274066),
    Vector3.new(-0.56568545, 0, 0.56568545),
    Vector3.new(-0.77274066, 0, 0.20705524),
    Vector3.new(-0.77274066, 0, -0.20705524),
    Vector3.new(-0.56568545, 0, -0.56568545),
    Vector3.new(-0.20705524, 0, -0.77274066),
    Vector3.new(0.20705524, 0, -0.77274066),
    Vector3.new(0.56568545, 0, -0.56568545),
    Vector3.new(0.77274066, 0, -0.20705524)
}) do
    local v33 = v32 * 35
    table.insert(u20, v33)
end
table.sort(u20, function(p34, p35) --[[ Line: 269 ]]
    return p34.magnitude < p35.magnitude
end)
local u36 = Instance.new("SoundGroup")
u36.Name = "__RainSoundGroup"
u36.Volume = 0.2
u36.Archivable = false
local u37 = Instance.new("Sound")
u37.Name = "RainSound"
u37.Volume = u21
u37.SoundId = "rbxassetid://1516791621"
u37.Looped = true
u37.SoundGroup = u36
u37.Parent = u36
u37.Archivable = false
local u38 = Instance.new("Part")
u38.Transparency = 1
u38.Anchored = true
u38.CanCollide = false
u38.Locked = false
u38.Archivable = false
u38.TopSurface = Enum.SurfaceType.Smooth
u38.BottomSurface = Enum.SurfaceType.Smooth
u38.Name = "__RainEmitter"
u38.Size = Vector3.new(0.05, 0.05, 0.05)
u38.Archivable = false
local v39 = Instance.new("ParticleEmitter")
v39.Name = "RainStraight"
v39.LightEmission = 0.05
v39.LightInfluence = 0.9
v39.Size = v2
v39.Texture = "rbxassetid://1822883048"
v39.LockedToPart = true
v39.Enabled = false
v39.Lifetime = v3
v39.Rate = 600
v39.Speed = NumberRange.new(60)
v39.EmissionDirection = Enum.NormalId.Bottom
v39.Parent = u38
local v40 = Instance.new("ParticleEmitter")
v40.Name = "RainTopDown"
v40.LightEmission = 0.05
v40.LightInfluence = 0.9
v40.Size = v4
v40.Texture = "rbxassetid://1822856633"
v40.LockedToPart = true
v40.Enabled = false
v40.Rotation = v6
v40.Lifetime = v5
v40.Rate = 600
v40.Speed = NumberRange.new(60)
v40.EmissionDirection = Enum.NormalId.Bottom
v40.Parent = u38
local u41 = {}
local u42 = {}
for _ = 1, 20 do
    local v43 = Instance.new("Attachment")
    v43.Name = "__RainSplashAttachment"
    local v44 = Instance.new("ParticleEmitter")
    v44.LightEmission = 0.05
    v44.LightInfluence = 0.9
    v44.Size = v7
    v44.Texture = "rbxassetid://1822856633"
    v44.Rotation = v9
    v44.Lifetime = v8
    v44.Transparency = NumberSequence.new({
        u18,
        NumberSequenceKeypoint.new(0.25, 0.6, 0),
        NumberSequenceKeypoint.new(0.75, 0.6, 0),
        u19
    })
    v44.Enabled = false
    v44.Rate = 0
    v44.Speed = NumberRange.new(0)
    v44.Name = "RainSplash"
    v44.Parent = v43
    v43.Archivable = false
    table.insert(u42, v43)
    local v45 = Instance.new("Attachment")
    v45.Name = "__RainOccludedAttachment"
    local v46 = u38.RainStraight:Clone()
    v46.Speed = NumberRange.new(70, 100)
    v46.SpreadAngle = v10
    v46.LockedToPart = false
    v46.Enabled = false
    v46.Parent = v45
    local v47 = u38.RainTopDown:Clone()
    v47.Speed = NumberRange.new(70, 100)
    v47.SpreadAngle = v10
    v47.LockedToPart = false
    v47.Enabled = false
    v47.Parent = v45
    v45.Archivable = false
    table.insert(u41, v45)
end
local u48 = { u38 }
local u64 = {
    [u11.None] = function(p49, p50) --[[ Line: 393 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u12
            [3] = u48
        --]]
        local v51 = workspace
        if p50 then
            v54 = {}
            local v52 = u38
            local v53 = u12.LocalPlayer
            if v53 then
                v53 = u12.LocalPlayer.Character
            end
            __set_list(v54, 1, {v52, v53})
            if v54 then
                ::l5::
                return v51:FindPartOnRayWithIgnoreList(p49, v54)
            end
        end
        local v54 = u48
        goto l5
    end,
    [u11.Blacklist] = function(p55) --[[ Line: 396 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        return workspace:FindPartOnRayWithIgnoreList(p55, u25)
    end,
    [u11.Whitelist] = function(p56) --[[ Line: 399 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        return workspace:FindPartOnRayWithWhitelist(p56, u25)
    end,
    [u11.Function] = function(p57) --[[ Line: 402 ]]
        --[[
        Upvalues:
            [1] = u48
            [2] = u26
        --]]
        local v58 = p57.Origin + p57.Direction
        while p57.Direction.magnitude > 0.001 do
            local v59, v60, v61, v62 = workspace:FindPartOnRayWithIgnoreList(p57, u48)
            if not v59 or u26(v59) then
                return v59, v60, v61, v62
            end
            local v63 = v60 + p57.Direction.Unit * 0.001
            p57 = Ray.new(v63, v58 - v63)
        end
    end
}
local u65 = u64[u16]
local function u115() --[[ Line: 417 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u14
        [3] = u65
        [4] = u23
        [5] = u24
        [6] = u21
        [7] = u31
        [8] = u13
        [9] = u37
        [10] = u38
        [11] = u17
        [12] = u18
        [13] = u28
        [14] = u19
        [15] = u29
        [16] = u41
        [17] = u20
        [18] = u30
        [19] = u42
        [20] = u22
    --]]
    local u66 = Random.new()
    local u67 = true
    local u68 = 6
    local v69 = u27
    local v70 = u14.RenderStepped
    local function v78() --[[ Line: 425 ]]
        --[[
        Upvalues:
            [1] = u65
            [2] = u23
            [3] = u24
            [4] = u21
            [5] = u31
            [6] = u13
            [7] = u37
            [8] = u68
            [9] = u38
            [10] = u17
            [11] = u67
        --]]
        local v71, _ = u65(Ray.new(workspace.CurrentCamera.CFrame.p, -u23 * 1000), true)
        if u24 and workspace.CurrentCamera.CFrame.p.y > u24 or v71 then
            u38.RainStraight.Enabled = false
            u38.RainTopDown.Enabled = false
            u67 = true
        else
            if u21 < 1 and not u31 then
                u21 = 1
                u13:Create(u37, TweenInfo.new(0.5), {
                    ["Volume"] = 1
                }):Play()
            end
            u68 = 6
            local v72 = workspace.CurrentCamera.CFrame.lookVector:Dot(u23)
            local v73 = math.abs(v72)
            local v74 = workspace.CurrentCamera.CFrame.p
            local v75 = workspace.CurrentCamera.CFrame.lookVector:Cross(-u23)
            local v76 = v75.magnitude > 0.001 and v75.unit or -u23
            local v77 = u23:Cross(v76).unit
            u38.Size = u17(40, 40, (1 - v73) * 60 + 40)
            u38.CFrame = CFrame.new(v74.x, v74.y, v74.z, v76.x, -u23.x, v77.x, v76.y, -u23.y, v77.y, v76.z, -u23.z, v77.z) + (1 - v73) * workspace.CurrentCamera.CFrame.lookVector * u38.Size.Z / 3 - v73 * u23 * 20
            u38.RainStraight.Enabled = true
            u38.RainTopDown.Enabled = true
            u67 = false
        end
    end
    table.insert(v69, v70:connect(v78))
    local v79 = u14:IsRunning() and u14.Stepped or u14.RenderStepped
    local v80 = u27
    local function v114() --[[ Line: 484 ]]
        --[[
        Upvalues:
            [1] = u68
            [2] = u23
            [3] = u18
            [4] = u28
            [5] = u19
            [6] = u29
            [7] = u67
            [8] = u41
            [9] = u31
            [10] = u24
            [11] = u20
            [12] = u65
            [13] = u21
            [14] = u13
            [15] = u37
            [16] = u38
            [17] = u30
            [18] = u42
            [19] = u66
            [20] = u17
            [21] = u22
        --]]
        u68 = u68 + 1
        if u68 >= 6 then
            local v81 = workspace.CurrentCamera.CFrame.lookVector:Dot(u23)
            local v82 = math.abs(v81)
            local v83 = NumberSequence.new({
                u18,
                NumberSequenceKeypoint.new(0.25, (1 - v82) * u28 + v82, 0),
                NumberSequenceKeypoint.new(0.75, (1 - v82) * u28 + v82, 0),
                u19
            })
            local v84 = NumberSequence.new({
                u18,
                NumberSequenceKeypoint.new(0.25, v82 * u29 + (1 - v82), 0),
                NumberSequenceKeypoint.new(0.75, v82 * u29 + (1 - v82), 0),
                u19
            })
            local v85 = workspace.Camera.CFrame:inverse() * (workspace.Camera.CFrame.p - u23)
            local v86 = NumberRange.new
            local v87 = -v85.x
            local v88 = v85.y
            local v89 = math.atan2(v87, v88)
            local v90 = v86((math.deg(v89)))
            if u67 then
                for _, v91 in pairs(u41) do
                    v91.RainStraight.Transparency = v83
                    v91.RainStraight.Rotation = v90
                    v91.RainTopDown.Transparency = v84
                end
                if not u31 then
                    local v92
                    if u24 and workspace.CurrentCamera.CFrame.p.y > u24 then
                        v92 = 0
                    else
                        local v93 = -u23 * 1000
                        local v94 = 35
                        for v95 = 1, #u20 do
                            if not u65(Ray.new(workspace.CurrentCamera.CFrame * u20[v95], v93), true) then
                                v94 = u20[v95].magnitude
                                break
                            end
                        end
                        v92 = 1 - v94 / 35
                    end
                    local v96 = v92 - u21
                    if math.abs(v96) > 0.01 then
                        u21 = v92
                        local v97 = {
                            ["Volume"] = u21
                        }
                        u13:Create(u37, TweenInfo.new(1), v97):Play()
                    end
                end
            else
                u38.RainStraight.Transparency = v83
                u38.RainStraight.Rotation = v90
                u38.RainTopDown.Transparency = v84
            end
            u68 = 0
        end
        local v98 = workspace.CurrentCamera.CFrame.p
        local v99 = workspace.CurrentCamera.CFrame.lookVector:Cross(-u23)
        local v100 = v99.magnitude > 0.001 and v99.unit or -u23
        local v101 = u23:Cross(v100).unit
        local v102 = CFrame.new(v98.x, v98.y, v98.z, v100.x, -u23.x, v101.x, v100.y, -u23.y, v101.y, v100.z, -u23.z, v101.z)
        local v103 = u23 * 550
        for v104 = 1, u30 do
            local v105 = u42[v104]
            local v106 = u41[v104]
            local v107 = u66:NextNumber(-100, 100)
            local v108 = u66:NextNumber(-100, 100)
            local v109, v110, v111 = u65(Ray.new(v102 * u17(v107, 500, v108), v103))
            if v109 then
                v105.Position = v110 + v111 * 0.5
                v105.RainSplash:Emit(1)
                if u67 then
                    local v112 = v110 - u23 * 50
                    if u24 and (u24 < v112.Y and u23.Y < 0) then
                        v112 = v112 + u23 * (u24 - v112.Y) / u23.Y
                    end
                    v106.CFrame = v102 - v102.p + v112
                    v106.RainStraight:Emit(u22)
                    v106.RainTopDown:Emit(u22)
                end
            elseif u67 then
                local v113 = v102 * u17(v107, u66:NextNumber(20, 100), v108)
                if u24 and (u24 < v113.Y and u23.Y < 0) then
                    v113 = v113 + u23 * (u24 - v113.Y) / u23.Y
                end
                v106.CFrame = v102 - v102.p + v113
                v106.RainStraight:Emit(u22)
                v106.RainTopDown:Emit(u22)
            end
        end
    end
    table.insert(v80, v79:connect(v114))
end
local function u117() --[[ Line: 629 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    if #u27 > 0 then
        for _, v116 in pairs(u27) do
            v116:disconnect()
        end
        u27 = {}
    end
end
local function u121(p118) --[[ Line: 639 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u13
        [3] = u37
    --]]
    u21 = 0
    local u119 = u13:Create(u37, p118, {
        ["Volume"] = 0
    })
    u119.Completed:connect(function(p120) --[[ Line: 644 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u119
        --]]
        if p120 == Enum.PlaybackState.Completed then
            u37:Stop()
        end
        u119:Destroy()
    end)
    u119:Play()
end
local function v126(p122) --[[ Line: 681 ]]
    --[[
    Upvalues:
        [1] = u38
        [2] = u42
        [3] = u41
    --]]
    local v123 = ColorSequence.new(p122)
    u38.RainStraight.Color = v123
    u38.RainTopDown.Color = v123
    for _, v124 in pairs(u42) do
        v124.RainSplash.Color = v123
    end
    for _, v125 in pairs(u41) do
        v125.RainStraight.Color = v123
        v125.RainTopDown.Color = v123
    end
end
local u127 = Instance.new("Color3Value")
if v1 then
    u127.Value = v1
end
u127.Changed:connect(v126)
v126(u127.Value)
local function v133(p128) --[[ Line: 698 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u28
        [3] = u29
        [4] = u18
        [5] = u19
        [6] = u42
    --]]
    local v129 = (1 - p128) * (1 - u15.Value)
    local v130 = 1 - v129
    u28 = 0.7 * v129 + v130
    u29 = 0.85 * v129 + v130
    local v131 = NumberSequence.new({
        u18,
        NumberSequenceKeypoint.new(0.25, v129 * 0.6 + v130, 0),
        NumberSequenceKeypoint.new(0.75, v129 * 0.6 + v130, 0),
        u19
    })
    for _, v132 in pairs(u42) do
        v132.RainSplash.Transparency = v131
    end
end
local u134 = Instance.new("NumberValue")
u134.Value = 0
u134.Changed:connect(v133)
v133(u134.Value)
u15.Changed:connect(v133)
local u135 = Instance.new("NumberValue")
u135.Value = 1
u135.Changed:connect(function(p136) --[[ Line: 721 ]]
    --[[
    Upvalues:
        [1] = u38
    --]]
    u38.RainStraight.Speed = NumberRange.new(p136 * 60)
    u38.RainTopDown.Speed = NumberRange.new(p136 * 60)
end)
local v137 = u135.Value
u38.RainStraight.Speed = NumberRange.new(v137 * 60)
u38.RainTopDown.Speed = NumberRange.new(v137 * 60)
local u138 = Instance.new("NumberValue")
u138.Value = 1
u138.Changed:connect(function(p139) --[[ Line: 728 ]]
    --[[
    Upvalues:
        [1] = u38
        [2] = u22
        [3] = u30
    --]]
    u38.RainStraight.Rate = 600 * p139
    u38.RainTopDown.Rate = 600 * p139
    local v140 = 2 * p139
    u22 = math.ceil(v140)
    u30 = 20 * p139
end)
local v141 = u138.Value
u38.RainStraight.Rate = 600 * v141
u38.RainTopDown.Rate = 600 * v141
local v142 = 2 * v141
local _ = math.ceil(v142)
local _ = 20 * v141
local function v146(p143) --[[ Line: 738 ]]
    --[[
    Upvalues:
        [1] = u38
        [2] = u41
        [3] = u42
    --]]
    u38.RainStraight.LightEmission = p143
    u38.RainTopDown.LightEmission = p143
    for _, v144 in pairs(u41) do
        v144.RainStraight.LightEmission = p143
        v144.RainTopDown.LightEmission = p143
    end
    for _, v145 in pairs(u42) do
        v145.RainSplash.LightEmission = p143
    end
end
local u147 = Instance.new("NumberValue")
u147.Value = 0.05
u147.Changed:connect(v146)
v146(u147.Value)
local function v151(p148) --[[ Line: 753 ]]
    --[[
    Upvalues:
        [1] = u38
        [2] = u41
        [3] = u42
    --]]
    u38.RainStraight.LightInfluence = p148
    u38.RainTopDown.LightInfluence = p148
    for _, v149 in pairs(u41) do
        v149.RainStraight.LightInfluence = p148
        v149.RainTopDown.LightInfluence = p148
    end
    for _, v150 in pairs(u42) do
        v150.RainSplash.LightInfluence = p148
    end
end
local u152 = Instance.new("NumberValue")
u152.Value = 0.9
u152.Changed:connect(v151)
v151(u152.Value)
local u153 = Instance.new("Vector3Value")
u153.Value = Vector3.new(0, -1, 0)
u153.Changed:connect(function(p154) --[[ Line: 767 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    if p154.magnitude > 0.001 then
        u23 = p154.unit
    end
end)
local v155 = u153.Value
if v155.magnitude > 0.001 then
    local _ = v155.unit
end
local v163 = {
    ["CollisionMode"] = u11,
    ["Enable"] = function(_, p156) --[[ Name: Enable, Line 780 ]]
        --[[
        Upvalues:
            [1] = u117
            [2] = u38
            [3] = u42
            [4] = u41
            [5] = u14
            [6] = u36
            [7] = u115
            [8] = u13
            [9] = u15
            [10] = u37
            [11] = u31
        --]]
        if p156 ~= nil and typeof(p156) ~= "TweenInfo" then
            error("bad argument #1 to \'Enable\' (TweenInfo expected, got " .. typeof(p156) .. ")", 2)
        end
        u117()
        u38.RainStraight.Enabled = true
        u38.RainTopDown.Enabled = true
        u38.Parent = workspace.CurrentCamera
        for v157 = 1, 20 do
            u42[v157].Parent = workspace.Terrain
            u41[v157].Parent = workspace.Terrain
        end
        if u14:IsRunning() then
            u36.Parent = game:GetService("SoundService")
        end
        u115()
        if p156 then
            u13:Create(u15, p156, {
                ["Value"] = 0
            }):Play()
        else
            u15.Value = 0
        end
        if not u37.Playing then
            u37:Play()
            u37.TimePosition = math.random() * u37.TimeLength
        end
        u31 = false
    end,
    ["Disable"] = function(_, p158) --[[ Name: Disable, Line 818 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u15
            [3] = u117
            [4] = u38
            [5] = u31
            [6] = u121
        --]]
        if p158 ~= nil and typeof(p158) ~= "TweenInfo" then
            error("bad argument #1 to \'Disable\' (TweenInfo expected, got " .. typeof(p158) .. ")", 2)
        end
        if p158 then
            local u159 = u13:Create(u15, p158, {
                ["Value"] = 1
            })
            u159.Completed:connect(function(p160) --[[ Line: 826 ]]
                --[[
                Upvalues:
                    [1] = u117
                    [2] = u38
                    [3] = u31
                    [4] = u121
                    [5] = u159
                --]]
                if p160 == Enum.PlaybackState.Completed then
                    u117()
                    u38.RainStraight.Enabled = false
                    u38.RainTopDown.Enabled = false
                    u38.Size = Vector3.new(0.05, 0.05, 0.05)
                    if not u31 then
                        u121(TweenInfo.new(1))
                    end
                end
                u159:Destroy()
            end)
            u159:Play()
            u121(p158)
        else
            u15.Value = 1
            u117()
            u38.RainStraight.Enabled = false
            u38.RainTopDown.Enabled = false
            u38.Size = Vector3.new(0.05, 0.05, 0.05)
            if not u31 then
                u121(TweenInfo.new(1))
            end
        end
        u31 = true
    end,
    ["SetColor"] = function(_, p161, p162) --[[ Name: SetColor, Line 845 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u127
        --]]
        if typeof(p161) == "Color3" then
            if p162 ~= nil and typeof(p162) ~= "TweenInfo" then
                error("bad argument #2 to \'SetColor\' (TweenInfo expected, got " .. typeof(p162) .. ")", 2)
            end
        else
            error("bad argument #1 to \'SetColor\' (Color3 expected, got " .. typeof(p161) .. ")", 2)
        end
        if p162 then
            u13:Create(u127, p162, {
                ["Value"] = p161
            }):Play()
        else
            u127.Value = p161
        end
    end
}
local u164 = "SetTransparency"
function v163.SetTransparency(_, p165, p166) --[[ Line: 863 ]]
    --[[
    Upvalues:
        [1] = u164
        [2] = u13
        [3] = u134
    --]]
    if typeof(p165) == "number" then
        if p166 ~= nil and typeof(p166) ~= "TweenInfo" then
            error("bad argument #2 to \'" .. u164 .. "\' (TweenInfo expected, got " .. typeof(p166) .. ")", 2)
        end
    else
        error("bad argument #1 to \'" .. u164 .. "\' (number expected, got " .. typeof(p165) .. ")", 2)
    end
    local v167 = math.clamp(p165, 0, 1)
    if p166 then
        u13:Create(u134, p166, {
            ["Value"] = v167
        }):Play()
    else
        u134.Value = v167
    end
end
local u168 = "SetSpeedRatio"
function v163.SetSpeedRatio(_, p169, p170) --[[ Line: 863 ]]
    --[[
    Upvalues:
        [1] = u168
        [2] = u13
        [3] = u135
    --]]
    if typeof(p169) == "number" then
        if p170 ~= nil and typeof(p170) ~= "TweenInfo" then
            error("bad argument #2 to \'" .. u168 .. "\' (TweenInfo expected, got " .. typeof(p170) .. ")", 2)
        end
    else
        error("bad argument #1 to \'" .. u168 .. "\' (number expected, got " .. typeof(p169) .. ")", 2)
    end
    local v171 = math.clamp(p169, 0, 1)
    if p170 then
        u13:Create(u135, p170, {
            ["Value"] = v171
        }):Play()
    else
        u135.Value = v171
    end
end
local u172 = "SetIntensityRatio"
function v163.SetIntensityRatio(_, p173, p174) --[[ Line: 863 ]]
    --[[
    Upvalues:
        [1] = u172
        [2] = u13
        [3] = u138
    --]]
    if typeof(p173) == "number" then
        if p174 ~= nil and typeof(p174) ~= "TweenInfo" then
            error("bad argument #2 to \'" .. u172 .. "\' (TweenInfo expected, got " .. typeof(p174) .. ")", 2)
        end
    else
        error("bad argument #1 to \'" .. u172 .. "\' (number expected, got " .. typeof(p173) .. ")", 2)
    end
    local v175 = math.clamp(p173, 0, 1)
    if p174 then
        u13:Create(u138, p174, {
            ["Value"] = v175
        }):Play()
    else
        u138.Value = v175
    end
end
local u176 = "SetLightEmission"
function v163.SetLightEmission(_, p177, p178) --[[ Line: 863 ]]
    --[[
    Upvalues:
        [1] = u176
        [2] = u13
        [3] = u147
    --]]
    if typeof(p177) == "number" then
        if p178 ~= nil and typeof(p178) ~= "TweenInfo" then
            error("bad argument #2 to \'" .. u176 .. "\' (TweenInfo expected, got " .. typeof(p178) .. ")", 2)
        end
    else
        error("bad argument #1 to \'" .. u176 .. "\' (number expected, got " .. typeof(p177) .. ")", 2)
    end
    local v179 = math.clamp(p177, 0, 1)
    if p178 then
        u13:Create(u147, p178, {
            ["Value"] = v179
        }):Play()
    else
        u147.Value = v179
    end
end
local u180 = "SetLightInfluence"
function v163.SetLightInfluence(_, p181, p182) --[[ Line: 863 ]]
    --[[
    Upvalues:
        [1] = u180
        [2] = u13
        [3] = u152
    --]]
    if typeof(p181) == "number" then
        if p182 ~= nil and typeof(p182) ~= "TweenInfo" then
            error("bad argument #2 to \'" .. u180 .. "\' (TweenInfo expected, got " .. typeof(p182) .. ")", 2)
        end
    else
        error("bad argument #1 to \'" .. u180 .. "\' (number expected, got " .. typeof(p181) .. ")", 2)
    end
    local v183 = math.clamp(p181, 0, 1)
    if p182 then
        u13:Create(u152, p182, {
            ["Value"] = v183
        }):Play()
    else
        u152.Value = v183
    end
end
function v163.SetVolume(_, p184, p185) --[[ Line: 888 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u36
    --]]
    if typeof(p184) == "number" then
        if p185 ~= nil and typeof(p185) ~= "TweenInfo" then
            error("bad argument #2 to \'SetVolume\' (TweenInfo expected, got " .. typeof(p185) .. ")", 2)
        end
    else
        error("bad argument #1 to \'SetVolume\' (number expected, got " .. typeof(p184) .. ")", 2)
    end
    if p185 then
        u13:Create(u36, p185, {
            ["Volume"] = p184
        }):Play()
    else
        u36.Volume = p184
    end
end
function v163.SetDirection(_, p186, p187) --[[ Line: 904 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u153
    --]]
    if typeof(p186) == "Vector3" then
        if p187 ~= nil and typeof(p187) ~= "TweenInfo" then
            error("bad argument #2 to \'SetDirection\' (TweenInfo expected, got " .. typeof(p187) .. ")", 2)
        end
    else
        error("bad argument #1 to \'SetDirection\' (Vector3 expected, got " .. typeof(p186) .. ")", 2)
    end
    if p186.unit.magnitude <= 0 then
        warn("Attempt to set rain direction to a zero-length vector, falling back on default direction = (" .. tostring(Vector3.new(0, -1, 0)) .. ")")
        p186 = Vector3.new(0, -1, 0)
    end
    if p187 then
        u13:Create(u153, p187, {
            ["Value"] = p186
        }):Play()
    else
        u153.Value = p186
    end
end
function v163.SetCeiling(_, p188) --[[ Line: 925 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    if p188 ~= nil and typeof(p188) ~= "number" then
        error("bad argument #1 to \'SetCeiling\' (number expected, got " .. typeof(p188) .. ")", 2)
    end
    u24 = p188
end
function v163.SetStraightTexture(_, p189) --[[ Line: 935 ]]
    --[[
    Upvalues:
        [1] = u38
        [2] = u41
    --]]
    if typeof(p189) ~= "string" then
        error("bad argument #1 to \'SetStraightTexture\' (string expected, got " .. typeof(p189) .. ")", 2)
    end
    u38.RainStraight.Texture = p189
    for _, v190 in pairs(u41) do
        v190.RainStraight.Texture = p189
    end
end
function v163.SetTopDownTexture(_, p191) --[[ Line: 949 ]]
    --[[
    Upvalues:
        [1] = u38
        [2] = u41
    --]]
    if typeof(p191) ~= "string" then
        error("bad argument #1 to \'SetStraightTexture\' (string expected, got " .. typeof(p191) .. ")", 2)
    end
    u38.RainTopDown.Texture = p191
    for _, v192 in pairs(u41) do
        v192.RainTopDown.Texture = p191
    end
end
function v163.SetSplashTexture(_, p193) --[[ Line: 963 ]]
    --[[
    Upvalues:
        [1] = u42
    --]]
    if typeof(p193) ~= "string" then
        error("bad argument #1 to \'SetStraightTexture\' (string expected, got " .. typeof(p193) .. ")", 2)
    end
    for _, v194 in pairs(u42) do
        v194.RainSplash.Texture = p193
    end
end
function v163.SetSize(_, p195) --[[ Line: 975 ]]
    --[[
    Upvalues:
        [1] = u38
        [2] = u41
    --]]
    u38.RainStraight.Size = NumberSequence.new(p195)
    for _, v196 in pairs(u41) do
        v196.RainStraight.Size = NumberSequence.new(p195)
    end
end
function v163.SetSoundId(_, p197) --[[ Line: 983 ]]
    --[[
    Upvalues:
        [1] = u37
    --]]
    if typeof(p197) ~= "string" then
        error("bad argument #1 to \'SetSoundId\' (string expected, got " .. typeof(p197) .. ")", 2)
    end
    u37.SoundId = p197
end
function v163.SetCollisionMode(_, p198, p199) --[[ Line: 993 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u25
        [3] = u26
        [4] = u38
        [5] = u16
        [6] = u65
        [7] = u64
    --]]
    if p198 == u11.None then
        u25 = nil
        u26 = nil
    elseif p198 == u11.Blacklist then
        if typeof(p199) == "Instance" then
            u25 = { p199, u38 }
        elseif typeof(p199) == "table" then
            for v200 = 1, #p199 do
                local v201 = p199[v200]
                if typeof(v201) ~= "Instance" then
                    local v202 = error
                    local v203 = p199[v200]
                    v202("bad argument #2 to \'SetCollisionMode\' (blacklist contained a " .. typeof(v203) .. " on index " .. tostring(v200) .. " which is not an Instance)", 2)
                end
            end
            u25 = { u38 }
            for v204 = 1, #p199 do
                local v205 = u25
                local v206 = p199[v204]
                table.insert(v205, v206)
            end
        else
            error("bad argument #2 to \'SetCollisionMode (Instance or array of Instance expected, got " .. typeof(p199) .. ")\'", 2)
        end
        u26 = nil
    elseif p198 == u11.Whitelist then
        if typeof(p199) == "Instance" then
            u25 = { p199 }
        elseif typeof(p199) == "table" then
            for v207 = 1, #p199 do
                local v208 = p199[v207]
                if typeof(v208) ~= "Instance" then
                    local v209 = error
                    local v210 = p199[v207]
                    v209("bad argument #2 to \'SetCollisionMode\' (whitelist contained a " .. typeof(v210) .. " on index " .. tostring(v207) .. " which is not an Instance)", 2)
                end
            end
            u25 = {}
            for v211 = 1, #p199 do
                local v212 = u25
                local v213 = p199[v211]
                table.insert(v212, v213)
            end
        else
            error("bad argument #2 to \'SetCollisionMode (Instance or array of Instance expected, got " .. typeof(p199) .. ")\'", 2)
        end
        u26 = nil
    elseif p198 == u11.Function then
        if typeof(p199) ~= "function" then
            error("bad argument #2 to \'SetCollisionMode\' (function expected, got " .. typeof(p199) .. ")", 2)
        end
        u25 = nil
        u26 = p199
    else
        error("bad argument #1 to \'SetCollisionMode (Rain.CollisionMode expected, got " .. typeof(p199) .. ")\'", 2)
    end
    u16 = p198
    u65 = u64[p198]
end
return v163