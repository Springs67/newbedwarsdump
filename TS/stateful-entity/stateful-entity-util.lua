local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.CollectionService
local u6 = v4.Debris
local u7 = v4.Players
local u8 = v4.RunService
local u9 = v4.TweenService
local u10 = v4.Workspace
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "attribute", "attribute-util").WatchAttribute
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "StatefulEntityUtil"
    end
})
u14.__index = u14
function u14.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(_) --[[ Line: 27 ]] end
function u14.generateUUID(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v18 = u14
    v18.uuid = v18.uuid + 1
    local v19 = p17.uuid
    return tostring(v19)
end
function u14.createEntityHitbox(_, p20, p21, p22, p23) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if p21 == nil then
        p21 = false
    end
    if p22 == nil then
        p22 = Enum.PartType.Block
    end
    local v24 = u3("Part", {
        ["Name"] = p23 == nil and "EntityHitbox" or p23,
        ["Size"] = p20,
        ["Shape"] = p22,
        ["Transparency"] = p21 and 0.5 or 1,
        ["Color"] = Color3.fromRGB(0, 0, 255),
        ["Material"] = Enum.Material.Plastic,
        ["CastShadow"] = false,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanTouch"] = false
    })
    local v25 = u3("Model", {
        ["Name"] = p23 == nil and "EntityHitbox" or p23,
        ["PrimaryPart"] = v24,
        ["Children"] = { v24, u3("Humanoid", {}) }
    })
    v25:SetAttribute("NoNametag", true)
    return v25
end
function u14.createAttackHitboxAndComputeHits(_, p26, p27, p28, p29, p30) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
        [3] = u6
        [4] = u7
        [5] = u13
    --]]
    if p28 == nil then
        p28 = false
    end
    if p29 == nil then
        p29 = Enum.PartType.Block
    end
    local v31 = p30 == nil and 1 or p30
    local v32
    if p28 then
        local v33 = {
            ["Name"] = "EntityAttackHitbox",
            ["Anchored"] = true,
            ["CanCollide"] = false
        }
        local v34 = p26.Y / 2
        v33.CFrame = p27 + Vector3.new(0, v34, 0)
        v33.Size = p26
        v33.Shape = p29
        v33.Transparency = 0.5
        v33.Color = Color3.fromRGB(255, 0, 0)
        v33.Material = Enum.Material.Plastic
        v33.CastShadow = false
        v33.CanQuery = false
        v33.Parent = u10
        v32 = u3("Part", v33)
    else
        v32 = nil
    end
    local v35 = OverlapParams.new()
    local v36
    if p28 then
        local v37 = 0
        v36 = {}
        for v38, v39 in u10:GetPartsInPart(v32, v35) do
            local _ = v38 - 1
            local v40 = v39:IsA("BasePart")
            if v40 then
                v40 = v39:GetAttribute("IsPlayer")
            end
            if v40 == true then
                v37 = v37 + 1
                v36[v37] = v39
            end
        end
    else
        local v41 = 0
        v36 = {}
        for v42, v43 in u10:GetPartBoundsInBox(p27, p26, v35) do
            local _ = v42 - 1
            local v44 = v43:IsA("BasePart")
            if v44 then
                v44 = v43:GetAttribute("IsPlayer")
            end
            if v44 == true then
                v41 = v41 + 1
                v36[v41] = v43
            end
        end
    end
    if p28 then
        u6:AddItem(v32, v31)
    end
    local v45 = table.create(#v36)
    for v46, v47 in v36 do
        local _ = v46 - 1
        v45[v46] = string.split(v47.Name, "-")[2]
    end
    local v48 = 0
    local v49 = {}
    for v50, v51 in v45 do
        local _ = v50 - 1
        local v52 = u7:FindFirstChild(v51)
        if v52 ~= nil then
            v48 = v48 + 1
            v49[v48] = v52
        end
    end
    local v53 = 0
    local v54 = {}
    for v55, v56 in v49 do
        local _ = v55 - 1
        local v57 = u13:getEntity(v56)
        if v57 ~= nil then
            v53 = v53 + 1
            v54[v53] = v57
        end
    end
    return v54
end
function u14.getBlocksInRegion(_, p58, p59, p60, p61) --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
        [3] = u6
    --]]
    local v62 = p60 == nil and true or p60
    if p61 == nil then
        p61 = false
    end
    local v63 = {
        ["Name"] = "BlockRegionBox",
        ["Anchored"] = true,
        ["CanCollide"] = false
    }
    local v64 = p59.Y / 2
    v63.CFrame = p58 + Vector3.new(0, v64, 0)
    v63.Size = p59
    v63.Transparency = p61 and 0.5 or 1
    v63.Color = Color3.fromRGB(255, 255, 0)
    v63.Material = Enum.Material.Plastic
    v63.CastShadow = false
    v63.CanQuery = false
    v63.Parent = u10
    local v65 = u3("Part", v63)
    local v66 = 0
    local v67 = {}
    for v68, v69 in u10:GetPartsInPart(v65, (OverlapParams.new())) do
        local _ = v68 - 1
        local v70 = v69:IsA("BasePart")
        if v70 then
            if v69:GetAttribute("BlockUUID") == nil then
                v70 = false
            else
                v70 = (v62 and 0 or -1) < v69:GetAttribute("PlacedByUserId")
            end
        end
        if v70 == true then
            v66 = v66 + 1
            v67[v66] = v69
        end
    end
    u6:AddItem(v65, 1)
    return v67
end
function u14.setEntityIgnoreQuery(_, p71) --[[ Line: 235 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    for v72, v73 in p71:GetDescendants() do
        local _ = v72 - 1
        if v73:IsA("BasePart") then
            u2:setQueryIgnored(v73, true)
        end
    end
end
function u14.setClientEntityNotCollidable(_, p74) --[[ Line: 246 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if not u8:IsClient() then
        return nil
    end
    for v75, v76 in p74:GetDescendants() do
        local _ = v75 - 1
        if v76:IsA("BasePart") then
            v76.CanCollide = false
        end
    end
end
function u14.showStatefulEntity(_, p77) --[[ Line: 260 ]]
    if p77:IsA("Model") then
        local v78 = p77:GetDescendants()
        local function v82(p79) --[[ Line: 264 ]]
            local v80 = p79:GetAttribute("TransparencyOverride")
            local v81 = v80 == nil and 0 or v80
            if p79:IsA("BasePart") and (p79.Name ~= "RootPart" and p79.Name ~= "Head") then
                p79.Transparency = v81
            end
            if p79:IsA("PointLight") then
                p79.Enabled = true
            end
        end
        for v83, v84 in v78 do
            v82(v84, v83 - 1, v78)
        end
    else
        local v85 = p77:GetAttribute("TransparencyOverride")
        p77.Transparency = v85 == nil and 0 or v85
    end
end
function u14.hideStatefulEntity(_, p86) --[[ Line: 289 ]]
    if p86:IsA("Model") then
        for v87, v88 in p86:GetDescendants() do
            local _ = v87 - 1
            if v88:IsA("BasePart") and v88.Name ~= "RootPart" then
                v88.Transparency = 1
            end
            if v88:IsA("PointLight") then
                v88.Enabled = false
            end
        end
    else
        p86.Transparency = 1
    end
end
function u14.registerEntity(_, p89, p90, p91, p92) --[[ Line: 308 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u13
    --]]
    u5:AddTag(p89, "entity")
    if p90 == nil then
        return nil
    end
    local v93 = u13:getEntity(p89)
    if not v93 then
        return nil
    end
    v93:setBaseMaxHealth(p90)
    v93:setHealth(p90)
    if p91 then
        u5:AddTag(p89, p91)
    end
    if p92 ~= "" and p92 then
        p89:SetAttribute("EntityUUID", p92)
    end
    p89:SetAttribute("IsStatefulEntity", true)
end
function u14.getGameEntityCFrame(_, p94) --[[ Line: 331 ]]
    if p94:IsA("Model") then
        return p94:GetPivot()
    else
        return p94.CFrame
    end
end
function u14.getEntityFloorCFrame(_, p95) --[[ Line: 337 ]]
    local v96, v97
    if p95:IsA("Model") then
        if not p95.PrimaryPart then
            p95:GetPropertyChangedSignal("PrimaryPart"):Wait()
        end
        v96, v97 = p95:GetBoundingBox()
    else
        v96 = p95.CFrame
        v97 = p95.Size
    end
    return v96 - v97 * Vector3.new(0, 0.5, 0)
end
function u14.normalizeSpawnBoundingBox(_, p98, p99) --[[ Line: 355 ]]
    local v100 = p99.Position
    local v101 = p98.PrimaryPart.Size.Y / 2
    local v102 = Vector3.new(0, v101, 0)
    return CFrame.new(v100 + v102)
end
function u14.serverMoveTo(_, u103, u104, u105, u106, u107, u108, u109) --[[ Line: 360 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u8
        [3] = u14
        [4] = u9
    --]]
    return u1.Promise.new(function(u110, u111) --[[ Line: 361 ]]
        --[[
        Upvalues:
            [1] = u109
            [2] = u8
            [3] = u14
            [4] = u103
            [5] = u104
            [6] = u105
            [7] = u106
            [8] = u107
            [9] = u108
            [10] = u9
        --]]
        if u109 == nil then
            u109 = true
        end
        if not u8:IsServer() then
            u111()
            return nil
        end
        task.spawn(function() --[[ Line: 370 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u103
                [3] = u104
                [4] = u111
                [5] = u109
                [6] = u105
                [7] = u106
                [8] = u107
                [9] = u108
                [10] = u9
                [11] = u110
            --]]
            local u112 = u14:getGameEntityCFrame(u103)
            local u113
            if u103:IsA("Model") then
                u113 = u103.PrimaryPart
            else
                u113 = u103
            end
            local v114 = u104
            if typeof(v114) == "Vector3" then
                if not (u103 and u103.Parent) then
                    u111()
                    return nil
                end
                local v115 = u104.X
                local v116
                if u109 then
                    v116 = u112.Position.Y
                else
                    v116 = u104.Y
                end
                local v117 = u104.Z
                local v118 = Vector3.new(v115, v116, v117)
                local v119 = u9:Create(u113, u14:getMoveToTweenInfo(u103, v118, u105, u106, u107, u108), {
                    ["Position"] = v118
                })
                v119.Completed:Connect(function() --[[ Line: 387 ]]
                    --[[
                    Upvalues:
                        [1] = u110
                    --]]
                    u110()
                end)
                v119:Play()
            else
                if not (u103 and u103.Parent) then
                    u111()
                    return nil
                end
                local u120 = u104
                local v121 = u120[1]
                local v122 = v121.X
                local v123
                if u109 then
                    v123 = u112.Position.Y
                else
                    v123 = v121.Y
                end
                local v124 = v121.Z
                local v125 = Vector3.new(v122, v123, v124)
                local v126 = u9:Create(u113, u14:getMoveToTweenInfo(u103, v125, u105, u106, u107, u108), {
                    ["Position"] = v125
                })
                v126.Completed:Connect(function() --[[ Line: 406 ]]
                    --[[
                    Upvalues:
                        [1] = u103
                        [2] = u110
                        [3] = u120
                        [4] = u109
                        [5] = u112
                        [6] = u14
                        [7] = u105
                        [8] = u106
                        [9] = u107
                        [10] = u108
                        [11] = u9
                        [12] = u113
                    --]]
                    if not (u103 and u103.Parent) then
                        u110()
                        return nil
                    end
                    if #u120 == 1 then
                        u110()
                        return nil
                    end
                    local v127 = u120
                    local function v135(p128, p129) --[[ Line: 419 ]]
                        --[[
                        Upvalues:
                            [1] = u109
                            [2] = u112
                            [3] = u14
                            [4] = u103
                            [5] = u105
                            [6] = u106
                            [7] = u107
                            [8] = u108
                            [9] = u9
                            [10] = u113
                        --]]
                        if p129 == 0 then
                            return nil
                        end
                        local v130 = p128.X
                        local v131
                        if u109 then
                            v131 = u112.Position.Y
                        else
                            v131 = p128.Y
                        end
                        local v132 = p128.Z
                        local v133 = {
                            ["Position"] = Vector3.new(v130, v131, v132)
                        }
                        local v134 = u9:Create(u113, u14:getMoveToTweenInfo(u103, p128, u105, u106, u107, u108), v133)
                        v134:Play()
                        v134.Completed:Wait()
                    end
                    for v136, v137 in v127 do
                        v135(v137, v136 - 1, v127)
                    end
                    u110()
                end)
                v126:Play()
            end
        end)
    end)
end
function u14.clientMoveTo(_, u138, u139, u140, u141, u142, u143, u144) --[[ Line: 445 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u1
        [3] = u8
        [4] = u9
    --]]
    local u145 = u14:getGameEntityCFrame(u138)
    local u146
    if u138:IsA("Model") then
        u146 = u138.PrimaryPart
    else
        u146 = u138
    end
    return u1.Promise.new(function(u147, u148) --[[ Line: 448 ]]
        --[[
        Upvalues:
            [1] = u144
            [2] = u8
            [3] = u138
            [4] = u139
            [5] = u145
            [6] = u141
            [7] = u14
            [8] = u140
            [9] = u142
            [10] = u143
            [11] = u9
            [12] = u146
        --]]
        if u144 == nil then
            u144 = true
        end
        if not u8:IsClient() then
            u148()
            return nil
        end
        task.spawn(function() --[[ Line: 457 ]]
            --[[
            Upvalues:
                [1] = u138
                [2] = u148
                [3] = u139
                [4] = u144
                [5] = u145
                [6] = u141
                [7] = u14
                [8] = u140
                [9] = u142
                [10] = u143
                [11] = u147
                [12] = u9
                [13] = u146
            --]]
            if not (u138 and u138.Parent) then
                u148()
                return nil
            end
            local v149 = CFrame.new
            local v150 = u139.X
            local v151
            if u144 then
                v151 = u145.Position.Y
            else
                v151 = u139.Y
            end
            local v152 = u139.Z
            local v153 = v149((Vector3.new(v150, v151, v152)))
            local v154 = { CFrame.lookAt(u145.Position, v153.Position):ToEulerAnglesYXZ() }
            local u155 = v153 * CFrame.Angles(0, v154[2], 0)
            local v156 = u141
            local v157 = u145:Lerp(u155, v156 == nil and 0.25 or v156)
            local v158 = u155 - u155.Position
            local v159 = CFrame.new(v157.Position) * v158
            local v160 = u14:getMoveToTweenInfo(u138, v159.Position, u140, 0, u142, u143)
            if v160.Time == 0 then
                u147()
                return nil
            end
            local v161 = u9:Create(u146, v160, {
                ["CFrame"] = v159
            })
            v161.Completed:Connect(function() --[[ Line: 497 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u138
                    [3] = u155
                    [4] = u140
                    [5] = u142
                    [6] = u143
                    [7] = u9
                    [8] = u146
                    [9] = u147
                --]]
                local v162 = {
                    ["CFrame"] = u155
                }
                local v163 = u9:Create(u146, u14:getMoveToTweenInfo(u138, u155.Position, u140, 0, u142, u143), v162)
                v163:Play()
                v163.Completed:Wait()
                u147()
            end)
            v161:Play()
        end)
    end)
end
function u14.rotateTo(_, u164, u165, u166, u167, u168) --[[ Line: 511 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u14
        [3] = u9
        [4] = u11
    --]]
    return u1.Promise.new(function(u169, _) --[[ Line: 512 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u164
            [3] = u165
            [4] = u166
            [5] = u167
            [6] = u168
            [7] = u9
            [8] = u11
        --]]
        local v170 = u14:getGameEntityCFrame(u164)
        local v171 = u165.X
        local v172 = v170.Position.Y
        local v173 = u165.Z
        local v174 = Vector3.new(v171, v172, v173)
        local v175 = { CFrame.lookAt(v170.Position, v174):ToEulerAnglesYXZ() }
        local v176 = CFrame.new(v170.Position) * CFrame.Angles(0, v175[2], 0)
        if u166 == 0 or (u166 ~= u166 or not u166) then
            u164:PivotTo(v176)
            u169()
        else
            local v177
            if u164:IsA("Model") then
                v177 = u164.PrimaryPart
            else
                v177 = u164
            end
            local u178 = u9:Create(v177, TweenInfo.new(u166, u167 or Enum.EasingStyle.Sine, u168 or Enum.EasingDirection.InOut), {
                ["CFrame"] = v176
            })
            u178:Play()
            local u180 = u11(u164, "Dead", function(p179) --[[ Line: 532 ]]
                --[[
                Upvalues:
                    [1] = u178
                    [2] = u169
                --]]
                if p179 ~= 0 and (p179 == p179 and (p179 ~= "" and p179)) then
                    u178:Cancel()
                    u169()
                end
            end)
            u178.Completed:Connect(function() --[[ Line: 539 ]]
                --[[
                Upvalues:
                    [1] = u180
                    [2] = u169
                --]]
                u180:Destroy()
                u169()
            end)
        end
    end)
end
function u14.getMoveToTweenInfo(_, p181, p182, p183, p184, p185, p186) --[[ Line: 546 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v187 = u14:getMoveToDuration(p181, p182, p183, p184)
    return TweenInfo.new(v187, p185 or Enum.EasingStyle.Sine, p186 or Enum.PoseEasingDirection.InOut)
end
function u14.getMoveToDuration(_, p188, p189, p190, p191) --[[ Line: 550 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    if not (p188 and p188.Parent) then
        return 0
    end
    local v192 = (u14:getGameEntityCFrame(p188).Position - p189).Magnitude / p190
    return math.abs(v192) * (1 - (p191 == nil and 0 or p191))
end
function u14.getNearbyPlayerEntities(_, p193, p194) --[[ Line: 564 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
        [3] = u1
        [4] = u12
    --]]
    if typeof(p193) ~= "Vector3" then
        p193 = u14:getGameEntityCFrame(p193).Position
    end
    local v195 = 0
    local v196 = {}
    for v197, v198 in u13:getEntitiesNearPosition(p193, p194) do
        local _ = v197 - 1
        local v199 = u13:getEntity(v198)
        if not (v199 and u1.instanceof(v199, u12)) then
            v199 = nil
        end
        if v199 ~= nil then
            v195 = v195 + 1
            v196[v195] = v199
        end
    end
    return v196
end
function u14.localPlayerDistanceFromEntity(_, p200) --[[ Line: 587 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u14
    --]]
    if u8:IsClient() then
        local v201 = u7.LocalPlayer.Character
        if v201 then
            return (v201:GetPivot().Position - u14:getGameEntityCFrame(p200).Position).Magnitude
        else
            return nil
        end
    else
        return nil
    end
end
function u14.getGameEntity(p202, p203) --[[ Line: 599 ]]
    return p202.uuidToClientEntity[p203]
end
u14.uuidToClientEntity = {}
u14.uuid = 0
return {
    ["StatefulEntityUtil"] = u14
}