local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.TweenService
local u7 = v4.Workspace
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes")
local u9 = v8.NpcAnimationAttr
local u10 = v8.NpcAutoPlaceAttr
local u11 = v8.NpcCollectionServiceTag
local u12 = v8.NpcLookAtPlayerAttr
local u13 = v8.NpcLookMinDistanceAttr
local u14 = v8.NpcNameAttr
local u15 = v8.NpcScale
local u16 = v8.NpcSecondaryAnimationAttr
local u17 = v8.NpcVerticalOffset
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "attribute-config")
local u19 = TweenInfo.new(0.085, Enum.EasingStyle.Linear)
local function u35(p20, p21) --[[ Line: 23 ]]
    local v22 = p21 - p20.Position
    local v23 = v22.Z / v22.X
    local v24 = -(math.atan(v23) + (v22.X > 0 and 3.141592653589793 or 0)) + 1.5707963267948966
    local v25 = p20.Position
    local v26 = (v24 - select(2, (p20 - v25):ToEulerAnglesYXZ()) + 1.5707963267948966) % 6.283185307179586 - 1.5707963267948966
    if math.abs(v26) > 1.7278759594743864 then
        return 0, 3.141592653589793
    end
    local v27 = math.clamp(v26, -1.288052987971815, 1.288052987971815) + 3.141592653589793
    local v28 = v22.X
    local v29 = math.pow(v28, 2)
    local v30 = v22.Z
    local v31 = v29 + math.pow(v30, 2)
    local v32 = math.sqrt(v31)
    local v33 = v22.Y / v32
    local v34 = math.atan(v33) - (p20 - p20.Position):ToEulerAnglesYXZ()
    return math.clamp(v34, -0.3141592653589793, 0.3141592653589793), v27
end
local u36 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 51 ]]
        return "NpcVisualsComponent"
    end
})
u36.__index = u36
function u36.new(...) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u36
    --]]
    local v37 = u36
    local v38 = setmetatable({}, v37)
    return v38:constructor(...) or v38
end
function u36.constructor(u39, p40) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u18
        [3] = u14
        [4] = u10
        [5] = u9
        [6] = u16
        [7] = u12
        [8] = u13
        [9] = u15
        [10] = u11
        [11] = u17
        [12] = u7
        [13] = u1
        [14] = u5
    --]]
    u39.npcModel = p40
    u39.maid = u2.new()
    u39.lastUpdate = 0
    local v41 = p40.Parent
    local v42 = {
        u14,
        u10,
        u9,
        u16,
        u12,
        u13,
        u15,
        u11,
        u17
    }
    u39.config = u18.new(v41, v42)
    if not u7:FindFirstChild("NpcContainer") then
        local v43 = Instance.new("Folder")
        v43.Name = "NpcContainer"
        v43.Parent = u7
    end
    u39.humanoid = p40:WaitForChild("Humanoid")
    u39.npcRoot = p40.PrimaryPart
    local v44 = p40:FindFirstChild("Head")
    if v44 ~= nil then
        v44 = v44:FindFirstChild("Neck")
    end
    u39.npcNeck = v44
    local v45 = u39.npcNeck
    if v45 ~= nil then
        v45 = v45.C0
    end
    u39.originalNeckC0 = v45
    local v46 = u39.config.Values.NpcAnimation
    if v46 ~= "" and v46 then
        u1.Promise.defer(function() --[[ Line: 90 ]]
            --[[
            Upvalues:
                [1] = u39
            --]]
            u39:applyAnimation()
        end)
    end
    u39:getLocalCharacterRoot()
    u5.LocalPlayer.CharacterAdded:Connect(function() --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u39
        --]]
        return u39:getLocalCharacterRoot()
    end)
end
u36.getLocalCharacterRoot = u1.async(function(p47) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v48 = u5.LocalPlayer.Character
    if not v48 then
        return nil
    end
    local v49 = v48:WaitForChild("HumanoidRootPart")
    if not v49 then
        return nil
    end
    p47.localCharacterRoot = v49
end)
function u36.applyAnimation(u50) --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u1
    --]]
    local v51 = u50.humanoid:FindFirstChild("Animator")
    if not u50.humanoid:IsDescendantOf(u7) then
        return nil
    end
    local v52 = v51 or u3("Animator", {
        ["Parent"] = u50.humanoid
    })
    local v53 = u3("Animation", {
        ["AnimationId"] = u50.config.Values.NpcAnimation
    })
    local u54 = v52:LoadAnimation(v53)
    local v55 = u50.config.Values.NpcSecondaryAnimation
    if v55 ~= "" and v55 then
        local v56 = u3("Animation", {
            ["AnimationId"] = u50.config.Values.NpcSecondaryAnimation
        })
        local v57 = v52:LoadAnimation(v56)
        v57.Looped = true
        v57:Play()
        u50.maid:GiveTask(v56)
    end
    u1.Promise.defer(function() --[[ Line: 137 ]]
        --[[
        Upvalues:
            [1] = u50
            [2] = u54
        --]]
        while u50.humanoid.Parent ~= nil do
            u54:Play()
            u54.Stopped:Wait()
            task.wait(3)
        end
    end)
    u50.maid:GiveTask(v53)
end
function u36.HeartbeatUpdate(p58) --[[ Line: 146 ]]
    --[[
    Upvalues:
        [1] = u35
        [2] = u6
        [3] = u19
    --]]
    if os.clock() - p58.lastUpdate < 0.1 then
        return nil
    end
    p58.lastUpdate = os.clock()
    if not (p58.npcNeck and p58.originalNeckC0) then
        return nil
    end
    if p58.config.Values.NpcLookAtPlayer ~= true then
        return nil
    end
    if not p58.localCharacterRoot then
        return nil
    end
    local v59 = p58.npcRoot
    local v60 = (p58.localCharacterRoot.Position - v59.Position).Magnitude
    local v61 = p58.config.Values.NpcLookMinimumDistance
    local v62 = (v61 == 0 or (v61 ~= v61 or not v61)) and 16 or v61
    local v63 = CFrame.new()
    if v60 <= v62 then
        local v64 = p58.localCharacterRoot.Position
        local v65, v66 = u35(v59.CFrame, v64)
        v63 = CFrame.new(0, 0, 0) * CFrame.Angles(v65, -3.141592653589793 + v66, 0)
    end
    local v67 = { p58.npcNeck.C0:ToEulerAnglesXYZ() }
    if #v67 == 0 then
        error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.")
    end
    local v68 = v67[1]
    for v69 = 2, #v67 do
        local v70 = v67[v69]
        local _ = v69 - 1
        v68 = v68 + v70
    end
    local v71 = { v63:ToEulerAnglesXYZ() }
    if #v71 == 0 then
        error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.")
    end
    local v72 = v71[1]
    for v73 = 2, #v71 do
        local v74 = v71[v73]
        local _ = v73 - 1
        v72 = v72 + v74
    end
    local v75 = v68 - v72
    if math.abs(v75) < 1e-6 then
        return nil
    end
    u6:Create(p58.npcNeck, u19, {
        ["C0"] = p58.originalNeckC0 * v63
    }):Play()
end
function u36.Destroy(p76) --[[ Line: 221 ]]
    p76.maid:DoCleaning()
end
u36.Tag = "NpcModel"
return u36