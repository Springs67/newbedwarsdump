local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.GameQueryUtil
local u5 = v2.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u7 = v6.OutBack
local u8 = v6.OutExpo
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Lighting
local u13 = v11.Players
local u14 = v11.RunService
local u15 = v11.StarterGui
local u16 = v11.Workspace
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "viewport-portal-magic", "viewport-portal-magic").getSurfaceInfo
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local function u27(p21, p22) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u16
        [3] = u12
    --]]
    local v23 = u10("Camera", {
        ["FieldOfView"] = u16.CurrentCamera.FieldOfView,
        ["CFrame"] = u16.CurrentCamera.CFrame
    })
    local v24 = u10("ViewportFrame", {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 1),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(1, 1),
        ["LightColor"] = Color3.fromRGB(214, 74, 172),
        ["LightDirection"] = u12:GetSunDirection(),
        ["CurrentCamera"] = v23
    })
    local v25 = u10("WorldModel", {
        ["Parent"] = v24
    })
    v23.Parent = v24
    p21.Archivable = true
    local v26 = p21:Clone()
    v26.HumanoidRootPart.Anchored = true
    v26:PivotTo(p22)
    v26.Parent = v25
    return {
        ["viewportFrame"] = v24,
        ["clone"] = v26,
        ["worldModel"] = v25,
        ["camera"] = v23
    }
end
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 56 ]]
        return "GlitchKillEffect"
    end,
    ["__index"] = u20
})
u28.__index = u28
function u28.new(...) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31, p32) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    u20.constructor(p31, p32)
    u20.setPlayDefaultKillEffect(p31, false)
end
function u28.onKill(p33, _, p34, u35) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u16
        [3] = u10
        [4] = u4
        [5] = u27
        [6] = u3
        [7] = u15
        [8] = u13
        [9] = u20
        [10] = u5
        [11] = u19
        [12] = u14
        [13] = u18
        [14] = u17
        [15] = u7
        [16] = u8
    --]]
    local u36 = u9.new()
    local u37 = u10("Part", {
        ["Size"] = Vector3.new(7, 7, 7),
        ["Rotation"] = Vector3.new(45, 0, 0),
        ["CanCollide"] = false,
        ["Anchored"] = true,
        ["Transparency"] = 1,
        ["Position"] = u35.Position + Vector3.new(0, 0, 0),
        ["Parent"] = u16
    })
    u4:setQueryIgnored(u37, true)
    local u38 = u37.Position
    local u39 = u37.Size
    local u40 = {}
    for _, v41 in Enum.NormalId:GetEnumItems() do
        local v42 = u27(p34, u35)
        local v43 = {}
        local v44 = u10
        local v45 = "SurfaceGui"
        local v46 = {
            ["ResetOnSpawn"] = false,
            ["ClipsDescendants"] = true,
            ["Adornee"] = u37,
            ["Face"] = v41,
            ["SizingMode"] = Enum.SurfaceGuiSizingMode.FixedSize,
            ["CanvasSize"] = Vector2.new(800, 800),
            ["Children"] = { v42.viewportFrame }
        }
        local v47
        if u3.isHoarceKat() then
            v47 = u15
        else
            v47 = u13.LocalPlayer:FindFirstChildOfClass("PlayerGui")
        end
        v46.Parent = v47
        v43.surfaceGui = v44(v45, v46)
        v43.slice = v42
        u40[v41] = v43
    end
    u20.hideCharacter(p33, p34)
    u5:playSound(u19.GLITCH_KILL_EFFECT, {
        ["position"] = u35.Position
    })
    u36:GiveTask(u14.Heartbeat:Connect(function() --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u38
            [3] = u40
            [4] = u18
            [5] = u35
            [6] = u16
        --]]
        local v48 = math.noise(os.clock() * 8) + 0.05
        local v49 = math.noise(0, os.clock() * 18) * 10
        local v50 = math.noise(os.clock() * 18) * 5
        local v51 = math.noise(0, 0, os.clock() * 18) * 5
        local v52 = math.noise(os.clock() * 15) * 0.5
        local v53 = math.noise(0, 0, -os.clock() * 15) * 0.5
        local v54 = math.noise(os.clock() * -15) * 0.5
        local v55 = u37
        local v56 = 25 + v49
        v55.Rotation = Vector3.new(v56, v50, v51)
        u37.Position = u38 + Vector3.new(v52, v53, v54)
        for _, v57 in u40 do
            local v58 = v57.surfaceGui
            local v59 = v57.slice
            local v60 = u18(v58)
            if v60 ~= nil then
                v59.clone:PivotTo(u35 * CFrame.Angles(-math.rad(v49) / 2, -math.rad(v50) / 2, -math.rad(v51) / 2))
                local v61 = v59.viewportFrame
                local v62 = Color3.fromRGB(255, 255, 255)
                local v63 = Color3.fromRGB(170, 85, 255)
                local v64 = 0.9 + v48
                v61.Ambient = v62:Lerp(v63, (math.clamp(v64, 0, 1)))
                local v65 = u16.CurrentCamera.ViewportSize.Y
                local v66 = v60.cf:PointToObjectSpace(u16.CurrentCamera.CFrame.Position)
                local v67 = v66.X / v60.size.X
                local v68 = v66.Y / v60.size.Y
                local v69 = math.abs(v67) * 2 + 1
                local v70 = math.abs(v68) * 2 + 1
                local v71 = v69 * v69 + v70 * v70
                local v72 = math.sqrt(v71)
                local v73 = (u16.CurrentCamera.CFrame.Position - v60.cf.Position):Dot(v60.cf.LookVector)
                local v74 = v60.size.Y / 2
                local v75 = math.atan2(v74, v73) * 2
                local v76 = math.deg(v75)
                local v77 = math.clamp(v76, 1, 120)
                local v78 = v60.size.Y / 2
                local v79 = math.rad(v77) / 2
                local v80 = v73 / (v78 / math.tan(v79))
                local v81 = (v75 <= 2.0943951023931953 and 1 or v80) / v72
                local v82 = CFrame.new(0, 0, 0, v81, 0, 0, 0, v81, 0, 0, 0, 1)
                v59.viewportFrame.Position = UDim2.new(v59.viewportFrame.AnchorPoint.X - v67, 0, v59.viewportFrame.AnchorPoint.Y - v68, 0)
                v59.viewportFrame.Size = UDim2.new(v72, 0, v72, 0)
                v58.CanvasSize = Vector2.new(v65 * (v60.size.X / v60.size.Y), v65)
                v59.camera.FieldOfView = v77
                local v83 = CFrame.new(u16.CurrentCamera.CFrame.Position)
                local v84 = v60.cf
                local v85 = v60.cf.Position
                local v86 = CFrame.Angles(0, 3.141592653589793, 0)
                v59.camera.CFrame = v83 * (v84 - v85) * v86 * v82
            end
        end
    end))
    task.spawn(function() --[[ Line: 160 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u7
            [3] = u37
            [4] = u39
            [5] = u8
        --]]
        task.wait(0.5)
        u17(2, u7, function(p87) --[[ Line: 162 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u39
            --]]
            local v88 = math.noise(os.clock() * 15) * 1.5
            local v89 = u37
            local v90 = (u39.X + v88) * p87
            local v91 = (u39.Y + v88) * p87
            local v92 = u39.Z
            v89.Size = Vector3.new(v90, v91, v92)
        end, 1, 0.3):Wait()
        task.wait(0.2)
        u17(0.2, u8, function(p93) --[[ Line: 167 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u39
            --]]
            local v94 = math.random() * 3
            local v95 = u37
            local v96 = (u39.X + v94) * p93
            local v97 = (u39.Y + v94) * p93
            local v98 = u39.Z
            v95.Size = Vector3.new(v96, v97, v98)
        end, 0.3, 0)
    end)
    u36:GiveTask(function() --[[ Line: 172 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        for _, v99 in u40 do
            v99.surfaceGui:Destroy()
        end
    end)
    u36:GiveTask(u37)
    task.delay(5, function() --[[ Line: 178 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36:DoCleaning()
    end)
    return u36
end
return u28