local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u3 = v2.CollectionService
local u4 = v2.Players
local u5 = v2.Workspace
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u65 = {
    ["getNearbyPlayers"] = function(u7, u8, u9, p10) --[[ Name: getNearbyPlayers, Line 16 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        local u11 = p10 == nil and true or p10
        local u12 = {}
        local v13 = u4:GetPlayers()
        local function v19(p14) --[[ Line: 22 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u11
                [3] = u7
                [4] = u8
                [5] = u12
            --]]
            local v15 = u9 or {}
            local v16 = table.find(v15, p14) ~= nil
            if u11 and v16 then
                return nil
            end
            if not (u11 or v16) then
                return nil
            end
            local v17 = p14.Character
            if v17 ~= nil then
                v17 = v17.PrimaryPart
            end
            if v17 and (p14.Character.PrimaryPart.Position - u7).Magnitude <= u8 then
                local v18 = u12
                table.insert(v18, p14)
            end
        end
        for v20, v21 in v13 do
            v19(v21, v20 - 1, v13)
        end
        return u12
    end,
    ["getEntitiesWithinBox"] = function(p22, p23) --[[ Name: getEntitiesWithinBox, Line 50 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u6
        --]]
        local v24 = OverlapParams.new()
        v24.FilterType = Enum.RaycastFilterType.Whitelist
        v24.FilterDescendantsInstances = u3:GetTagged("entity")
        local v25 = {}
        local v26 = 0
        local v27 = {}
        for v28, v29 in u5:GetPartBoundsInBox(p22, p23, v24) do
            local _ = v28 - 1
            local v30 = u6:getEntity(v29)
            if v30 and v25[v30:getInstance()] == nil then
                v25[v30:getInstance()] = true
                if not v30:isAlive() then
                    v30 = nil
                end
            else
                v30 = nil
            end
            if v30 ~= nil then
                v26 = v26 + 1
                v27[v26] = v30
            end
        end
        return v27
    end,
    ["visualizeBoxRegion"] = function(p31, p32, p33, p34) --[[ Name: visualizeBoxRegion, Line 85 ]]
        if p34 == nil then
            p34 = Color3.new(1, 0, 0)
        end
        local u35 = Instance.new("Part")
        u35.Size = p32
        u35.CFrame = p31
        u35.Anchored = true
        u35.CanCollide = false
        u35.Transparency = 0.75
        u35.Color = p34
        u35.Parent = game.Workspace
        task.delay(p33, function() --[[ Line: 97 ]]
            --[[
            Upvalues:
                [1] = u35
            --]]
            return u35:Destroy()
        end)
    end,
    ["getEntitiesWithinRadius"] = function(p36, p37) --[[ Name: getEntitiesWithinRadius, Line 102 ]]
        --[[
        Upvalues:
            [1] = u65
        --]]
        local v38 = u65.getEntitiesWithinBox
        local v39 = CFrame.new(p36)
        local v40 = p37 * 2
        local v41 = p37 * 2
        local v42 = p37 * 2
        local v43 = 0
        local v44 = {}
        for v45, v46 in v38(v39, (Vector3.new(v40, v41, v42))) do
            local _ = v45 - 1
            local v47 = v46:getInstance().PrimaryPart
            if v47 then
                v47 = (v47.Position - p36).Magnitude <= p37
            end
            if (v47 and true or false) == true then
                v43 = v43 + 1
                v44[v43] = v46
            end
        end
        return v44
    end,
    ["getEntitiesWithinCylinder"] = function(p48, p49, p50) --[[ Name: getEntitiesWithinCylinder, Line 130 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        local v51 = p48.X
        local v52 = p48.Z
        local v53 = Vector3.new(v51, 0, v52)
        local v54 = p48.Y + p50
        local v55 = 0
        local v56 = {}
        for v57, v58 in u6:getAliveEntityInstances() do
            local _ = v57 - 1
            local v59
            if v58 then
                local v60 = v58.PrimaryPart
                if v60 then
                    local v61 = v60.Position
                    local v62 = v61.X
                    local v63 = v61.Z
                    local v64 = (Vector3.new(v62, 0, v63) - v53).Magnitude
                    if v64 == 0 or v64 == nil or p49 < v64 then
                        v59 = false
                    else
                        v59 = v61.Y >= p48.Y - 0.1 and v54 >= v61.Y
                    end
                else
                    v59 = false
                end
            else
                v59 = false
            end
            if v59 == true then
                v55 = v55 + 1
                v56[v55] = v58
            end
        end
        return v56
    end
}
local function u75(p66, p67, p68, p69, p70) --[[ Line: 170 ]]
    local v71 = p66.Character
    if v71 ~= nil then
        v71 = v71.PrimaryPart
    end
    if not v71 then
        return false
    end
    local v72 = p66.Character.PrimaryPart.Position
    if p70 == nil then
        p70 = p66.Character.PrimaryPart.CFrame.LookVector
    end
    local v73 = p70:Dot((p67 - v72).Unit)
    if (p67 - v72).Magnitude <= p68 then
        local v74 = math.rad(p69)
        if math.cos(v74) < v73 then
            return true
        end
    end
    return (p67 - v72).Magnitude <= 3
end
u65.isPositionInFrontOfPlayer = u75
local function u98(p76, p77, p78) --[[ Line: 192 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u75
    --]]
    local v79 = p76.Character
    if v79 ~= nil then
        v79 = v79.PrimaryPart
    end
    if not v79 then
        return {}
    end
    local v80 = p76.Character
    if v80 ~= nil then
        v80 = v80.PrimaryPart
        if v80 ~= nil then
            v80 = v80.Position
        end
    end
    if p78 == nil then
        p78 = p76.Character
        if p78 ~= nil then
            p78 = p78.PrimaryPart.CFrame.LookVector.Unit
        end
    end
    local v81 = v80 - p78 * 2
    local v82 = 0
    local v83 = {}
    for v84, v85 in u6:getAliveEntityInstances() do
        local _ = v84 - 1
        local v86 = v85.PrimaryPart
        if v86 ~= nil then
            v82 = v82 + 1
            v83[v82] = v86
        end
    end
    local v87 = OverlapParams.new()
    v87.FilterType = Enum.RaycastFilterType.Whitelist
    v87.FilterDescendantsInstances = v83
    local v88 = u5
    local v89 = CFrame.new(v81)
    local v90 = p77 * 2
    local v91 = p77 * 2
    local v92 = p77 * 2
    local v93 = 0
    local v94 = {}
    for v95, v96 in v88:GetPartBoundsInBox(v89, Vector3.new(v90, v91, v92), v87) do
        local _ = v95 - 1
        local v97
        if v96:IsA("BasePart") then
            v97 = u75(p76, v96.Position, p77, 60, p78) and true or false
        else
            v97 = false
        end
        if v97 == true then
            v93 = v93 + 1
            v94[v93] = v96
        end
    end
    return v94
end
u65.getInstancesInFrontOfPlayer = u98
function u65.getEntitiesInFrontOfPlayer(p99, p100, p101) --[[ Line: 260 ]]
    --[[
    Upvalues:
        [1] = u98
        [2] = u6
    --]]
    local v102 = 0
    local v103 = {}
    for v104, v105 in u98(p99, p100, p101) do
        local _ = v104 - 1
        local v106 = u6:getEntity(v105)
        if not v106 or v106:getInstance().PrimaryPart ~= v105 then
            v106 = nil
        end
        if v106 ~= nil then
            v102 = v102 + 1
            v103[v102] = v106
        end
    end
    return v103
end
local u107 = nil
function u65.getEntitiesInFrontOfPosition(p108, p109, p110) --[[ Line: 283 ]]
    --[[
    Upvalues:
        [1] = u107
        [2] = u6
    --]]
    local v111 = 0
    local v112 = {}
    for v113, v114 in u107(p108, p109, p110) do
        local _ = v113 - 1
        local v115 = u6:getEntity(v114)
        if not v115 or v115:getInstance().PrimaryPart ~= v114 then
            v115 = nil
        end
        if v115 ~= nil then
            v111 = v111 + 1
            v112[v111] = v115
        end
    end
    return v112
end
local u116 = nil
u107 = function(p117, p118, p119) --[[ Name: getInstancesInFrontOfPosition, Line 306 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u116
    --]]
    local v120 = 0
    local v121 = {}
    for v122, v123 in u6:getAliveEntityInstances() do
        local _ = v122 - 1
        local v124 = v123.PrimaryPart
        if v124 ~= nil then
            v120 = v120 + 1
            v121[v120] = v124
        end
    end
    local v125 = OverlapParams.new()
    v125.FilterType = Enum.RaycastFilterType.Whitelist
    v125.FilterDescendantsInstances = v121
    local v126 = u5
    local v127 = CFrame.new(p117)
    local v128 = p118 * 2
    local v129 = p118 * 2
    local v130 = p118 * 2
    local v131 = 0
    local v132 = {}
    for v133, v134 in v126:GetPartBoundsInBox(v127, Vector3.new(v128, v129, v130), v125) do
        local _ = v133 - 1
        local v135
        if v134:IsA("BasePart") then
            v135 = u116(p117, v134.Position, p118, 60, p119) and true or false
        else
            v135 = false
        end
        if v135 == true then
            v131 = v131 + 1
            v132[v131] = v134
        end
    end
    return v132
end
u65.getInstancesInFrontOfPosition = u107
u116 = function(p136, p137, p138, p139, p140) --[[ Name: isPositionInFrontOfPosition, Line 349 ]]
    local v141 = p140:Dot((p137 - p136).Unit)
    local v142 = (p137 - p136).Magnitude <= p138
    if v142 then
        local v143 = math.rad(p139)
        v142 = math.cos(v143) < v141
    end
    return v142 and true or (p137 - p136).Magnitude <= 3
end
u65.isPositionInFrontOfPosition = u116
local u144 = Random.new()
function u65.randomUnitVector(p145, p146) --[[ Line: 372 ]]
    --[[
    Upvalues:
        [1] = u144
    --]]
    local v147 = CFrame.lookAt(Vector3.new(), p145)
    local v148 = CFrame.Angles(0, 0, u144:NextNumber(0, 6.283185307179586))
    local v149 = CFrame.Angles
    local v150 = u144:NextNumber(math.cos(p146), 1)
    local v151 = v149(math.acos(v150), 0, 0)
    return (v147 * v148 * v151).LookVector
end
function u65.getTerrainPositionBelow(p152, p153) --[[ Line: 379 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v154 = p153 == nil and 1000 or p153
    local v155 = RaycastParams.new()
    v155.FilterDescendantsInstances = { u5.Terrain }
    v155.FilterType = Enum.RaycastFilterType.Whitelist
    local v156 = u5
    local v157 = -v154
    local v158 = v156:Raycast(p152, Vector3.new(0, v157, 0), v155)
    if v158 then
        return v158.Position
    else
        return nil
    end
end
local function u163(p159, p160, p161) --[[ Line: 393 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v162 = RaycastParams.new()
    v162.FilterDescendantsInstances = { u5.Map }
    v162.FilterType = Enum.RaycastFilterType.Include
    return u5:Raycast(p159, p160 * p161, v162)
end
u65.raycastWithOnlyWorldCollision = u163
local function u170(p164, p165) --[[ Line: 404 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v166 = p165 == nil and (1 / 0) or p165
    local v167 = RaycastParams.new()
    v167.CollisionGroup = "Blocks"
    v167.FilterDescendantsInstances = { u5.Map }
    v167.FilterType = Enum.RaycastFilterType.Include
    local v168 = u5
    local v169 = -v166
    return v168:Raycast(p164, Vector3.new(0, v169, 0), v167)
end
u65.raycastDownToClosestFloor = u170
function u65.getFarthestSafePositionOnLine(p171, p172, p173, p174, p175, p176) --[[ Line: 419 ]]
    --[[
    Upvalues:
        [1] = u163
        [2] = u170
    --]]
    local v177 = p173 == nil and 12 or p173
    local v178 = p174 == nil and 1 or p174
    local v179 = p175 == nil and true or p175
    local v180 = p176 == nil and 2 or p176
    local v181 = (p172 - p171).Unit
    local v182 = (p172 - p171).Magnitude
    if v179 then
        local v183 = u163(p171, v181, v182)
        if v183 then
            local v184 = v183.Distance - v180
            v182 = math.max(0, v184)
            local _ = p171 + v181 * v182
        end
    end
    local v185 = false
    while true do
        if v185 then
            v182 = v182 - v178
        else
            v185 = true
        end
        if v182 <= 0 or v182 <= 0 then
            return p171
        end
        local v186 = p171 + v181 * v182
        local v187 = u170(v186, v177)
        if v187 and v187.Distance <= v177 then
            return v186
        end
    end
end
function u65.getNearbyEnemyPlayers(p188, p189, p190) --[[ Line: 479 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v191 = u6:getEntity(p188)
    if not v191 then
        return {}
    end
    local v192 = 0
    local v193 = {}
    for v194, v195 in u6:getAliveEnemyEntityInstances(v191) do
        local _ = v194 - 1
        local v196
        if u6:getPlayerFromEntityInstance(v195) then
            local v197 = v195.PrimaryPart
            if v197 then
                v196 = (p189 - v197.Position).Magnitude < p190
            else
                v196 = false
            end
        else
            v196 = false
        end
        if v196 == true then
            v192 = v192 + 1
            v193[v192] = v195
        end
    end
    local v198 = {}
    for v199, v200 in v193 do
        local _ = v199 - 1
        local v201 = u6:getPlayerFromEntityInstance(v200)
        if v201 then
            table.insert(v198, v201)
        end
    end
    return v198
end
return {
    ["GameWorldUtil"] = u65
}