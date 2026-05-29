local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.GameQueryUtil
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.RunService
local u11 = v8.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u14 = {
    Vector3.new(1, 0, 0),
    Vector3.new(-1, 0, 0),
    Vector3.new(0, 0, 1),
    Vector3.new(0, 0, -1)
}
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "BridgeAssistController"
    end,
    ["__index"] = u12
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
        [1] = u12
    --]]
    u12.constructor(p18)
    p18.Name = "BridgeAssistController"
end
function u15.KnitStart(u19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u4
        [3] = u13
        [4] = u10
    --]]
    u12.KnitStart(u19)
    if not u4.isMobileControls() and u13.isProduction() then
        return nil
    end
    u10.Heartbeat:Connect(function() --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        debug.profilebegin("bridge-assist")
        u19:stepBridgeAssist()
        debug.profileend()
    end)
    u10:BindToRenderStep("bridge-assist", Enum.RenderPriority.Character.Value + 1, function() --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        local v20 = u19:getHumanoid()
        if not v20 then
            return nil
        end
        u19.attemptedMoveDirection = v20.MoveDirection
        if u19.targetMoveDirection then
            v20:Move(u19.targetMoveDirection)
            u19.targetMoveDirection = nil
        end
    end)
end
function u15.stepBridgeAssist(p21) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u14
        [3] = u5
    --]]
    local v22 = u9.LocalPlayer.Character
    if not (v22 and v22.PrimaryPart) then
        return nil
    end
    if not p21:getHumanoid() then
        return nil
    end
    local v23 = p21.attemptedMoveDirection
    if not v23 or v23.Magnitude == 0 then
        return nil
    end
    for _, v24 in u14 do
        local v25 = v24:Dot(v23)
        local v26 = math.acos(v25)
        if math.abs(v26) < 0.5759586531581288 then
            local v27 = RaycastParams.new()
            v27.FilterType = Enum.RaycastFilterType.Blacklist
            v27.FilterDescendantsInstances = { v22 }
            if not u5:raycast(v22.PrimaryPart.Position, Vector3.new(0, -18, 0), v27) then
                local v28 = false
                local v29 = p21:getFloorBlock()
                if #v29 ~= 0 then
                    for _, v30 in v29 do
                        local v31 = ((v22.PrimaryPart.Position - v30.Position) * Vector3.new(1, 0, 1)).Unit
                        local v32 = v31.X
                        local v33 = math.sign(v32)
                        local v34 = v31.Z
                        local v35 = math.sign(v34)
                        local v36 = Vector3.new(v33, 0, v35)
                        local v37 = v23.X
                        local v38 = math.abs(v37)
                        local v39 = v23.Z
                        local v40 = v23:Dot(v36 * (math.abs(v39) < v38 and Vector3.new(0, 0, 1) or Vector3.new(1, 0, 0)))
                        local v41 = math.acos(v40)
                        if math.deg(v41) > 90 then
                            v28 = true
                        end
                    end
                    if not v28 then
                        p21.targetMoveDirection = v24
                    end
                    return nil
                end
            end
        end
    end
end
function u15.getFloorBlock(_) --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
        [3] = u11
        [4] = u5
        [5] = u2
    --]]
    local v42 = u9.LocalPlayer.Character
    local v43 = v42:FindFirstChild("Humanoid")
    local v44 = v42.PrimaryPart
    local v45 = u7
    local v46 = {
        ["Name"] = "BridgeAssistHelper",
        ["Transparency"] = 1,
        ["CanCollide"] = false,
        ["Anchored"] = true
    }
    local v47 = v44.Size.X
    local v48 = v44.Size.Z
    v46.Size = Vector3.new(v47, 1, v48)
    v46.Parent = u11
    local v49 = v45("Part", v46)
    local v50 = v44.CFrame
    local v51 = v43.HipHeight + v44.Size.Y / 2
    v49.CFrame = v50 - Vector3.new(0, v51, 0)
    local v52 = OverlapParams.new()
    v52.FilterDescendantsInstances = { v42 }
    v52.FilterType = Enum.RaycastFilterType.Blacklist
    local v53 = 0
    local v54 = {}
    for v55, v56 in u11:GetPartsInPart(v49, v52) do
        local _ = v55 - 1
        local v57
        if u5:isQueryIgnored(v56) then
            v57 = nil
        else
            v57 = u2:getBlockInstanceFromChild(v56)
        end
        if v57 ~= nil then
            v53 = v53 + 1
            v54[v53] = v57
        end
    end
    v49:Destroy()
    return v54
end
function u15.getHumanoid(_) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v58 = u9.LocalPlayer.Character
    local v59
    if v58 == nil then
        v59 = v58
    else
        v59 = v58.PrimaryPart
    end
    if v59 then
        return v58:FindFirstChild("Humanoid")
    else
        return nil
    end
end
v6.CreateController(u15.new())
return nil