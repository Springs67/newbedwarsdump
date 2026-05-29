local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v3 = v2.ConstantManager
local u4 = v2.GameQueryUtil
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.CollectionService
local u8 = v6.Players
local u9 = v6.ReplicatedStorage
local u10 = v6.RunService
local u11 = v6.Workspace
local u12 = u1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local v16 = {}
local u17 = setmetatable({}, {
    ["__index"] = v16
})
u17.TEAMMATES = 0
v16[0] = "TEAMMATES"
u17.ENEMY = 1
v16[1] = "ENEMY"
u17.ALL = 2
v16[2] = "ALL"
u17.ENTITY = 3
v16[3] = "ENTITY"
local u18 = v3.registerConstants(script, {
    ["RayDistance"] = 60,
    ["Origin"] = 30
})
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 39 ]]
        return "TargetSelector"
    end
})
u19.__index = u19
function u19.new(...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(_) --[[ Line: 48 ]] end
function u19.enableTargetSelector(u22, u23, u24) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u11
        [4] = u14
        [5] = u8
        [6] = u18
        [7] = u1
        [8] = u13
        [9] = u12
    --]]
    u22.maid:DoCleaning()
    u22.targetBillboard = u9.Assets.Misc.TargetSelectorBillboard:Clone()
    u22.maid:GiveTask(u22.targetBillboard)
    u22.maid:GiveTask(u10.Heartbeat:Connect(function() --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u22
            [3] = u14
            [4] = u8
            [5] = u24
            [6] = u18
            [7] = u23
            [8] = u1
            [9] = u13
            [10] = u9
            [11] = u12
        --]]
        local v25 = u11.CurrentCamera
        if v25 ~= nil then
            v25 = v25.CFrame
        end
        if not v25 then
            u22:removeTarget()
            return nil
        end
        if not u14:getLocalPlayerEntity() then
            u22:removeTarget()
            return nil
        end
        local v26 = u8.LocalPlayer.Character
        if v26 ~= nil then
            v26 = v26.PrimaryPart
            if v26 ~= nil then
                v26 = v26.Position
            end
        end
        if not v26 then
            return nil
        end
        local v27 = u24
        if v27 ~= nil then
            v27 = v27.overrideOriginDistance
        end
        if v27 == nil then
            v27 = u18.Origin
        end
        local v28 = -1 * v27
        local v29 = v25 * Vector3.new(0, 0, v28)
        local v30 = u22:getTargets(u23, (v29 - v26).Magnitude, v29)
        local v31 = Ray.new(v25.Position, v25.LookVector).Unit
        local v32 = (1 / 0)
        local v33 = nil
        for _, v34 in v30 do
            if u1.instanceof(v34, u13) then
                local v35 = v34:getPlayer()
                if v35 ~= nil then
                    v35 = v35:HasTag("PlayerHidden")
                end
                if not v35 then
                    goto l19
                end
            else
                ::l19::
                local v36 = v34:getInstance().PrimaryPart
                if v36 then
                    local v37 = v36.Position
                    local v38 = v31:ClosestPoint(v37)
                    local v39 = (v37 - v38).Magnitude
                    if u18.RayDistance >= v39 then
                        local v40 = u24
                        if v40 ~= nil then
                            v40 = v40.distance
                        end
                        if v40 ~= 0 and (v40 == v40 and v40) then
                            v40 = (v26 - v37).Magnitude > u24.distance
                        end
                        if v40 == 0 or (v40 ~= v40 or not v40) then
                            local v41 = u24
                            if v41 ~= nil then
                                v41 = v41.requireSight
                            end
                            if v41 then
                                local v42 = u22:canSee(v34)
                                if v42.success then
                                    goto l38
                                end
                                print("Can see result", v42.message)
                            else
                                ::l38::
                                local v43 = u24
                                if v43 ~= nil then
                                    v43 = v43.callback
                                end
                                if v43 then
                                    v43 = not u24.callback(v34)
                                end
                                if not v43 then
                                    local v44 = u24
                                    if v44 ~= nil then
                                        v44 = v44.positionDistanceOnly
                                    end
                                    if v44 then
                                        local v45 = (v37 - v26).Magnitude
                                        if v45 < v32 then
                                            v33 = v34
                                            v32 = v45
                                        end
                                    else
                                        local v46 = v39 + (v31.Origin - v38).Magnitude / 3
                                        if v46 < v32 then
                                            v33 = v34
                                            v32 = v46
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        local v47
        if u22.target == v33 then
            v47 = false
        else
            v47 = true
            u22:removeTarget()
            if v33 and v33:getInstance().PrimaryPart then
                local v48 = Color3.fromRGB(255, 0, 0)
                local v49 = u14:getLocalPlayerEntity()
                if not v49 then
                    return nil
                end
                if not v33:canAttack(v49) then
                    v48 = Color3.fromRGB(0, 255, 13)
                end
                if not u22.targetBillboard then
                    u22.targetBillboard = u9.Assets.Misc.TargetSelectorBillboard:Clone()
                end
                u22.targetBillboard.Parent = v33:getInstance()
                u22.targetBillboard.Enabled = true
                if not u22.customBillboard then
                    u22.targetBillboard.ImageLabel.ImageColor3 = v48
                end
            end
        end
        u22.target = v33
        if v47 then
            u12.NewSelectorTarget:fire(v33)
        end
    end))
end
function u19.getBillboard(p50) --[[ Line: 200 ]]
    return p50.targetBillboard
end
function u19.setCustomBillboard(p51, p52) --[[ Line: 203 ]]
    local v53 = p51.targetBillboard
    if v53 ~= nil then
        v53:Destroy()
    end
    p51.targetBillboard = p52
    p51.customBillboard = true
end
function u19.removeCustomBillboard(p54) --[[ Line: 211 ]]
    local v55 = p54.targetBillboard
    if v55 ~= nil then
        v55:Destroy()
    end
    p54.customBillboard = false
end
function u19.setTargetIcon(p56, p57) --[[ Line: 218 ]]
    if p56.targetBillboard then
        p56.targetBillboard.ImageLabel.Image = p57
    end
end
function u19.disableTargetSelector(p58) --[[ Line: 223 ]]
    p58:removeTarget()
    p58.maid:DoCleaning()
end
function u19.getTargets(_, p59, p60, p61) --[[ Line: 227 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u14
        [3] = u15
        [4] = u1
        [5] = u13
        [6] = u17
    --]]
    local v62 = {}
    local v63 = u8.LocalPlayer.Character
    if v63 ~= nil then
        v63 = v63.PrimaryPart
        if v63 ~= nil then
            v63 = v63.Position
        end
    end
    local v64 = u14:getLocalPlayerEntity()
    if not v63 then
        return v62
    end
    for _, v65 in u15.getEntitiesWithinRadius(p61, p60) do
        if not u1.instanceof(v65, u13) or v65:getPlayer() ~= u8.LocalPlayer then
            local v66 = v65:getInstance().PrimaryPart
            if v66 ~= nil then
                v66 = v66.Position
            end
            if v66 then
                local v67
                if p60 == 0 or (p60 ~= p60 or not p60) then
                    v67 = p60
                elseif p61 then
                    v67 = p60 < (p61 - v66).Magnitude
                else
                    v67 = p61
                end
                if v67 == 0 or (v67 ~= v67 or not v67) then
                    if p59 == u17.ALL then
                        table.insert(v62, v65)
                    elseif p59 == u17.TEAMMATES and (u1.instanceof(v65, u13) and u8.LocalPlayer.Team == v65:getPlayer().Team) then
                        table.insert(v62, v65)
                    elseif p59 == u17.ENEMY and (u1.instanceof(v65, u13) and u8.LocalPlayer.Team ~= v65:getPlayer().Team) then
                        table.insert(v62, v65)
                    else
                        local v68 = p59 == u17.ENTITY
                        if v68 then
                            if v64 == nil then
                                v68 = v64
                            else
                                v68 = v64:canAttack(v65)
                            end
                        end
                        if v68 then
                            table.insert(v62, v65)
                        end
                    end
                end
            end
        end
    end
    return v62
end
function u19.getTargetEntity(p69) --[[ Line: 287 ]]
    return p69.target
end
function u19.removeTarget(p70) --[[ Line: 290 ]]
    p70.target = nil
    if p70.targetBillboard then
        p70.targetBillboard.Enabled = false
    end
end
function u19.canSee(_, p71) --[[ Line: 296 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
        [3] = u7
    --]]
    local v72 = u8.LocalPlayer.Character
    if not v72 then
        return {
            ["success"] = false,
            ["message"] = "No local player character"
        }
    end
    if not p71 then
        return {
            ["success"] = false,
            ["message"] = "No entity"
        }
    end
    local v73 = v72:FindFirstChildWhichIsA("Humanoid")
    if v73 ~= nil then
        v73 = v73:FindFirstChild("BodyHeightScale")
    end
    if v73 ~= nil then
        v73 = v73.Value
    end
    local v74 = 5 * (v73 == nil and 1 or v73)
    local v75
    if v72.PrimaryPart then
        local v76 = v72:FindFirstChildWhichIsA("Humanoid")
        local v77 = not v76 and 0 or v76.HipHeight
        local v78 = v72.PrimaryPart.Position
        local v79 = -1 * (v77 + v72.PrimaryPart.Size.Y / 2)
        v75 = v78 + Vector3.new(0, v79, 0)
    else
        v75 = nil
    end
    local v80 = p71:getInstance()
    local v81
    if v80.PrimaryPart then
        local v82 = v80:FindFirstChildWhichIsA("Humanoid")
        local v83 = not v82 and 0 or v82.HipHeight
        local v84 = v80.PrimaryPart.Position
        local v85 = -1 * (v83 + v80.PrimaryPart.Size.Y / 2)
        v81 = v84 + Vector3.new(0, v85, 0)
    else
        v81 = nil
    end
    if not (v75 and v81) then
        return {
            ["success"] = false,
            ["message"] = "No bottom position" .. tostring(v75) .. tostring(v81)
        }
    end
    local v86 = v75 + Vector3.new(0, v74, 0)
    local v87 = v81 + Vector3.new(0, v74, 0)
    local v88 = { v72, p71:getInstance() }
    local v89 = #v88
    local v90 = u7:GetTagged("DontBlockSwordRaycast")
    table.move(v90, 1, #v90, v89 + 1, v88)
    local v91 = RaycastParams.new()
    v91.FilterDescendantsInstances = v88
    v91.FilterType = Enum.RaycastFilterType.Blacklist
    local v92 = u4:raycast(v75, v81 - v75, v91) ~= nil
    if not v92 then
        local v93 = RaycastParams.new()
        v93.FilterDescendantsInstances = v88
        v93.FilterType = Enum.RaycastFilterType.Blacklist
        v92 = u4:raycast(v81, v75 - v81, v93) ~= nil
    end
    local v94 = RaycastParams.new()
    v94.FilterDescendantsInstances = v88
    v94.FilterType = Enum.RaycastFilterType.Blacklist
    local v95 = u4:raycast(v86, v87 - v86, v94) ~= nil
    if not v95 then
        local v96 = RaycastParams.new()
        v96.FilterDescendantsInstances = v88
        v96.FilterType = Enum.RaycastFilterType.Blacklist
        v95 = u4:raycast(v87, v86 - v87, v96) ~= nil
    end
    local v97 = (v75 + v86) / 2
    local v98 = (v81 + v87) / 2
    local v99 = RaycastParams.new()
    v99.FilterDescendantsInstances = v88
    v99.FilterType = Enum.RaycastFilterType.Blacklist
    local v100 = u4:raycast(v97, v98 - v97, v99) ~= nil
    if not v100 then
        local v101 = RaycastParams.new()
        v101.FilterDescendantsInstances = v88
        v101.FilterType = Enum.RaycastFilterType.Blacklist
        v100 = u4:raycast(v98, v97 - v98, v101) ~= nil
    end
    return {
        ["success"] = not (v92 and (v95 and v100)),
        ["message"] = "Line segment check result" .. tostring(v92) .. tostring(v95) .. tostring(v100)
    }
end
u19.maid = v5.new()
return {
    ["TargetType"] = u17,
    ["TargetSelector"] = u19
}