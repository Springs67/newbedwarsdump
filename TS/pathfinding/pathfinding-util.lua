local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u3 = v2.PathfindingService
local u4 = v2.RunService
local u5 = v2.TweenService
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "PathfindingUtil"
    end
})
u7.__index = u7
function u7.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(_) --[[ Line: 28 ]] end
function u7.moveTo(u10, u11, u12, u13, u14) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u5
        [4] = u4
    --]]
    local v15 = u3
    local v16
    if u14 == nil then
        v16 = u14
    else
        v16 = u14.agentParameters
    end
    local u17 = v15:CreatePath(v16 or {})
    local u18 = u11:IsA("Model")
    if u18 then
        u18 = u11:FindFirstChild("Humanoid")
    end
    if u18 then
        local v19 = u11.PrimaryPart
        if v19 then
            local v20 = u11:GetAttribute("TerrianMonster")
            if v20 == 0 or (v20 ~= v20 or (v20 == "" or not v20)) then
                v19.CanCollide = false
            end
            if not v19.Anchored then
                v19:SetNetworkOwner(nil)
            end
        end
        if u13 ~= 0 and (u13 == u13 and u13) then
            u18.WalkSpeed = u13
        end
    else
        u11.CanCollide = false
    end
    local u21 = false
    local u22 = false
    local u23 = false
    local u24 = nil
    u24 = {
        ["cancel"] = function() --[[ Name: cancel, Line 73 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u22
                [3] = u23
                [4] = u24
            --]]
            if u21 or (u22 or u23) then
                return nil
            end
            u21 = true
            u24.onCanceled:Fire()
        end,
        ["onCanceled"] = u6.new(),
        ["onCompleted"] = u6.new(),
        ["onBlocked"] = u6.new()
    }
    task.spawn(function() --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u10
            [3] = u17
            [4] = u11
            [5] = u23
            [6] = u24
            [7] = u21
            [8] = u22
            [9] = u18
            [10] = u13
            [11] = u5
            [12] = u14
            [13] = u4
        --]]
        local u25 = 0
        local v26 = u12
        local u27
        if typeof(v26) == "Vector3" then
            u27 = u12
        else
            u27 = u12.Position
        end
        local v28 = u10
        local v29 = u17
        local v30 = u11
        local v31
        if v30:IsA("BasePart") then
            v31 = v30.Position
        else
            v31 = v30:GetPivot().Position
        end
        local u32 = v28:computePathBetweenPoints(v29, v31, u27)
        if #u32 == 0 and not u23 then
            u23 = true
            u24.onBlocked:Fire()
        end
        local u33 = nil
        local function u40() --[[ Line: 114 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u22
                [3] = u23
                [4] = u12
                [5] = u27
                [6] = u33
                [7] = u32
                [8] = u10
                [9] = u17
                [10] = u11
                [11] = u24
                [12] = u25
            --]]
            if u21 or (u22 or u23) then
                return nil
            end
            local v34 = u12
            local v35
            if typeof(v34) == "Vector3" then
                v35 = u12
            else
                v35 = u12.Position
            end
            u27 = v35
            u33 = true
            local v36 = u10
            local v37 = u17
            local v38 = u11
            local v39
            if v38:IsA("BasePart") then
                v39 = v38.Position
            else
                v39 = v38:GetPivot().Position
            end
            u32 = v36:computePathBetweenPoints(v37, v39, u27)
            u33 = false
            if #u32 == 0 and not u23 then
                u23 = true
                u24.onBlocked:Fire()
            end
            u25 = 0
        end
        u33 = false
        local v41 = u33
        while true do
            if u21 or (u22 or (u23 or u25 >= #u32 and not v41)) then
                return
            end
            local v42 = u32[u25 + 1]
            local u43 = u32[u25 + 1 + 1]
            local v44 = v42.Position
            local v45 = u11
            local v46
            if v45:IsA("BasePart") then
                v46 = v45.Position
            else
                v46 = v45:GetPivot().Position
            end
            local v47 = (v44 - v46).Magnitude
            v67 = nil
            if not u18 then
                break
            end
            local _ = v47 / u18.WalkSpeed
            u18:MoveTo(v42.Position)
            if v41 then
                task.wait()
            else
                v75 = u25 + 1
                u25 = v75
                ::l37::
                local v48 = u14
                if v48 ~= nil then
                    v48 = v48.continuous
                end
                if v48 ~= nil then
                    local v49 = u12
                    local v50, v51
                    if typeof(v49) == "Vector3" then
                        v50 = u12
                        v51 = v50
                    else
                        v50 = u12.Position
                        v51 = v50
                    end
                    if u14.continuous.completeThreshold ~= nil then
                        local v52 = u11
                        local v53
                        if v52:IsA("BasePart") then
                            v53 = v52.Position
                        else
                            v53 = v52:GetPivot().Position
                        end
                        if (v51 - v53).Magnitude < u14.continuous.completeThreshold then
                            u22 = true
                            if v67 ~= nil then
                                v67:Cancel()
                            end
                            v75 = #u32
                            u24.onCompleted:Fire()
                            u25 = v75
                        end
                    end
                end
                local v54 = u14
                if v54 ~= nil then
                    v54 = v54.continuous
                end
                local v55 = v54 ~= nil
                if v55 then
                    v55 = u25 >= 8
                end
                if v55 then
                    task.spawn(function() --[[ Line: 251 ]]
                        --[[
                        Upvalues:
                            [1] = u40
                        --]]
                        return u40()
                    end)
                end
                if #u32 - 1 <= u25 then
                    local v56 = u14
                    if v56 ~= nil then
                        v56 = v56.continuous
                    end
                    if v56 == nil then
                        u22 = true
                        if v67 ~= nil then
                            v67:Cancel()
                        end
                        u24.onCompleted:Fire()
                    else
                        task.spawn(function() --[[ Line: 261 ]]
                            --[[
                            Upvalues:
                                [1] = u40
                            --]]
                            u40()
                        end)
                    end
                end
            end
        end
        local v57 = u13
        local v58 = v47 / (v57 == nil and 16 or v57)
        local v59 = u5
        local v60 = u11
        local v61 = u14
        if v61 ~= nil then
            v61 = v61.easingStyle
        end
        if v61 == nil then
            v61 = Enum.EasingStyle.Linear
        end
        local v62 = u14
        if v62 ~= nil then
            v62 = v62.easingDirection
        end
        if v62 == nil then
            v62 = Enum.EasingDirection.In
        end
        local v63 = TweenInfo.new(v58, v61, v62)
        local v64 = {}
        local v65 = v42.Position
        local v66 = u11.Size.Y / 2
        v64.Position = v65 + Vector3.new(0, v66, 0)
        local v67 = v59:Create(v60, v63, v64)
        local v68 = nil
        local v69 = u14
        if v69 ~= nil then
            v69 = v69.lookAt
        end
        if v69 then
            local u70 = 0
            v68 = u4.Heartbeat:Connect(function(p71) --[[ Line: 185 ]]
                --[[
                Upvalues:
                    [1] = u70
                    [2] = u43
                    [3] = u11
                    [4] = u5
                --]]
                u70 = u70 + p71
                if u43 and u70 > 0.1 then
                    local v72 = u11
                    local v73 = ({ CFrame.lookAt(v72.Position, u43.Position):ToOrientation() })[2]
                    local v74 = math.deg(v73)
                    u5:Create(v72, TweenInfo.new(0.09000000000000001, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                        ["Orientation"] = Vector3.new(0, v74, 0)
                    }):Play()
                    u70 = 0
                end
            end)
        end
        v67:Play()
        task.wait(v58 * 0.8)
        if v68 ~= nil then
            v68:Disconnect()
        end
        local v75 = u25 + 1
        u25 = v75
        goto l37
    end)
    return u24
end
function u7.computePathBetweenInstances(p76, p77, p78, p79) --[[ Line: 277 ]]
    return p76:computePathBetweenPoints(p77, p78.Position, p79.Position)
end
function u7.computePathBetweenPoints(_, p80, p81, p82) --[[ Line: 280 ]]
    p80:ComputeAsync(p81, p82)
    return p80:GetWaypoints()
end
return {
    ["PathfindingUtil"] = u7
}