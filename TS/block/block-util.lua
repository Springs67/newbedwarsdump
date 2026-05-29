local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitServer
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.RunService
local u9 = v6.Workspace
local u10 = nil
local u29 = u1.async(function(p11, p12, p13, p14) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u2
    --]]
    local v15 = u10(nil, p12)
    while true do
        while true do
            repeat
                local v16 = v15[math.random(#v15 - 1) + 1]
                local v17 = u2:getHandlerRegistry():getHandler(v16.Name)
            until v17
            local v18 = v17:getContainedPositions(v16)
            local v19
            if #v18 > 1 then
                v19 = v18[math.random(#v18 - 1) + 1]
            else
                v19 = v18[1]
            end
            repeat
                v19 = v19 + Vector3.new(0, 1, 0)
            until u2:getStore():getBlockAt(v19) == nil
            if p11 then
                break
            end
            ::l10::
            local v20 = u2:getStore():getBlockAt(v19 + Vector3.new(0, -1, 0))
            if v20 then
                local v21
                if p13 then
                    v21 = v20:GetAttribute("PlacedByUserId")
                else
                    v21 = p13
                end
                if v21 == 0 or (v21 ~= v21 or not v21) then
                    local v22
                    if p12 then
                        local v23 = v20.Name
                        local v24 = table.find(p12, v23) ~= nil
                        v22 = not v24
                    else
                        v22 = p12
                    end
                    if not v22 then
                        local v25 = u2:getWorldPosition(v19)
                        if p14 == nil or p14(v25) ~= false then
                            return v25
                        end
                    end
                end
            end
        end
        local v26 = u2:getHandlerRegistry():getHandler(p11)
        if v26 ~= nil then
            v26 = v26:getPlacementPositions(v19, 0)
        end
        local v27 = true
        for _, v28 in v26 == nil and {} or v26 do
            if u2:getStore():getBlockAt(v28) then
                v27 = false
            end
        end
        if v27 then
            goto l10
        end
    end
end)
u10 = function(u30, u31) --[[ Name: getAllMapBlocks, Line 95 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v32 = u5.Services.MapService:getWorldsFolder()
    if not v32 then
        return {}
    end
    local v33 = v32:GetChildren()
    local function v58(u34, p35) --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u31
        --]]
        local v36 = u30
        if v36 then
            local v37 = u30
            local v38 = p35.Name
            local v39 = table.find(v37, v38) ~= nil
            v36 = not v39
        end
        if v36 then
            return u34
        end
        local function _(p40) --[[ Line: 111 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u34
            --]]
            local v41 = u31 ~= nil
            if v41 then
                local v42 = u31
                local v43 = p40.Name
                local v44 = table.find(v42, v43) ~= nil
                v41 = not v44
            end
            if v41 then
                return nil
            end
            local v45 = u34
            table.insert(v45, p40)
        end
        for v46, v47 in p35.Blocks:GetChildren() do
            local _ = v46 - 1
            local v48 = u31 ~= nil
            if v48 then
                local v49 = u31
                local v50 = v47.Name
                local v51 = table.find(v49, v50) ~= nil
                v48 = not v51
            end
            if not v48 then
                table.insert(u34, v47)
            end
        end
        for v52, v53 in p35.BreakableBlocks:GetChildren() do
            local _ = v52 - 1
            local v54 = u31 ~= nil
            if v54 then
                local v55 = u31
                local v56 = v53.Name
                local v57 = table.find(v55, v56) ~= nil
                v54 = not v57
            end
            if not v54 then
                table.insert(u34, v53)
            end
        end
        return u34
    end
    local v59 = {}
    for v60 = 1, #v33 do
        v59 = v58(v59, v33[v60], v60 - 1, v33)
    end
    return v59
end
local v78 = u1.async(function(p61, p62, p63, p64, p65, p66) --[[ Line: 162 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u2
        [3] = u8
    --]]
    local v67 = p63 == nil and 3 or p63
    local v68 = nil
    local v69 = 0
    while v68 == nil do
        if v67 <= v69 then
            if p66 then
                return u29()
            end
            error("Could not find a block nearby")
        end
        v69 = v69 + 1
        debug.profilebegin("getNearbyAboveRandomBlock")
        local v70
        if p64 == nil then
            v70 = p64
        else
            v70 = p64.X
        end
        local v71
        if v70 == 0 or (v70 ~= v70 or not v70) then
            v71 = math.random(-p62, p62)
        else
            v71 = math.random(-p64.X, p64.X)
        end
        local v72
        if p64 == nil then
            v72 = p64
        else
            v72 = p64.Y
        end
        local v73
        if v72 == 0 or (v72 ~= v72 or not v72) then
            v73 = math.random(-p62, p62)
        else
            v73 = math.random(-p64.Y, p64.Y)
        end
        local v74
        if p64 == nil then
            v74 = p64
        else
            v74 = p64.Z
        end
        local v75
        if v74 == 0 or (v74 ~= v74 or not v74) then
            v75 = math.random(-p62, p62)
        else
            v75 = math.random(-p64.Z, p64.Z)
        end
        local v76 = p61 + Vector3.new(v71, v73, v75)
        if u2:getStore():getBlockAt(v76) then
            local v77 = v76 + Vector3.new(0, 1, 0)
            if u2:getStore():getBlockAt(v77) ~= nil then
                v77 = v68
            end
            if p65 == 0 or (p65 ~= p65 or (not p65 or (p61 - v76).Magnitude > p65)) then
                v68 = v77
            else
                v68 = nil
            end
        end
        if v68 ~= nil then
            debug.profileend()
            return u2:getWorldPosition(v68)
        end
        debug.profileend()
        u8.Heartbeat:Wait()
    end
    if p66 then
        return u29()
    end
    error("Could not find a block nearby")
end)
local u79 = nil
local function v83(p80) --[[ Line: 240 ]]
    --[[
    Upvalues:
        [1] = u79
    --]]
    local v81 = p80 == nil and 1000 or p80
    local v82 = u79() / v81 * 0.1
    return math.max(0.1, v82)
end
local u84 = nil
local u85 = 0
local u86 = -1
u79 = function(p87) --[[ Name: getSurfaceBlockCountCached, Line 255 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u84
        [3] = u86
        [4] = u85
    --]]
    local v88 = u2:getStore()
    local v89 = v88:getAllBlockPositions()
    local v90 = #v89
    local v91 = os.clock()
    if u84 ~= nil and (v90 == u86 and (p87 ~= nil and v91 - u85 <= p87)) then
        return u84
    end
    local v92 = 0
    for _, v93 in v89 do
        if v88:getBlockAt(v93 + Vector3.new(0, 1, 0)) == nil then
            v92 = v92 + 1
        end
    end
    u84 = v92
    u85 = v91
    u86 = v90
    return v92
end
local function u114(p94, p95, p96, p97) --[[ Line: 539 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v98 = p95 == nil and 100 or p95
    local v99 = p97 == nil and true or p97
    local v100 = {}
    if p96 == nil then
        local v101 = false
        local v102 = 1
        while true do
            if true then
                if v101 then
                    v102 = v102 + 1
                else
                    v101 = true
                end
            end
            if v102 >= v98 then
                break
            end
            local v103 = p94 - Vector3.new(0, v102, 0)
            if u2:getStore():getBlockAt(v103) == nil then
                if v99 then
                    return v100
                end
            else
                table.insert(v100, {
                    ["blockPosition"] = v103
                })
            end
        end
    else
        local v104 = false
        local v105 = 1
        while true do
            if v104 then
                v105 = v105 + 1
            else
                v104 = true
            end
            if v105 >= v98 then
                break
            end
            local v106 = -p96
            local v107 = false
            local v108 = false
            while true do
                if true then
                    if v107 then
                        v106 = v106 + 1
                    else
                        v107 = true
                    end
                end
                if v106 > p96 then
                    break
                end
                local v109 = -p96
                local v110 = false
                while true do
                    if true then
                        if v110 then
                            v109 = v109 + 1
                        else
                            v110 = true
                        end
                    end
                    if v109 > p96 then
                        break
                    end
                    local v111 = Vector3.new(v106, 0, v109)
                    local v112 = Vector3.new(0, v105, 0)
                    local v113 = p94 + v111 - v112
                    if u2:getStore():getBlockAt(v113) ~= nil then
                        table.insert(v100, {
                            ["blockPosition"] = v113
                        })
                        v108 = true
                    end
                end
            end
            if not v108 and v99 then
                break
            end
        end
    end
    return v100
end
return {
    ["getAboveRandomBlock"] = u29,
    ["getAllMapBlocks"] = u10,
    ["getNearbyAboveRandomBlock"] = v78,
    ["isSurfaceBlock"] = function(p115) --[[ Name: isSurfaceBlock, Line 224 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v116 = p115 - Vector3.new(0, 1, 0)
        local v117 = u2:getStore():getBlockAt(p115)
        local v118 = u2:getStore():getBlockAt(v116)
        local v119
        if v117 == nil then
            v119 = v118 ~= nil
        else
            v119 = false
        end
        return v119
    end,
    ["getKitSurfaceMapBlockMultiplier"] = v83,
    ["getSurfaceBlockCountCached"] = u79,
    ["clearSurfaceBlockCountCache"] = function() --[[ Name: clearSurfaceBlockCountCache, Line 276 ]]
        --[[
        Upvalues:
            [1] = u84
            [2] = u85
            [3] = u86
        --]]
        u84 = nil
        u85 = 0
        u86 = -1
    end,
    ["findSurfacePosition"] = function(u120, p121, p122, p123, p124) --[[ Name: findSurfacePosition, Line 294 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v125 = p121 == nil and 10 or p121
        local u126 = p124 == nil and 1 or p124
        local function v142(p127) --[[ Line: 301 ]]
            --[[
            Upvalues:
                [1] = u126
                [2] = u120
                [3] = u2
            --]]
            local v128 = -u126
            local v129 = false
            while true do
                if v129 then
                    v128 = v128 + 1
                else
                    v129 = true
                end
                if v128 > u126 then
                    return nil
                end
                local v130 = -u126
                local v131 = false
                while true do
                    if true then
                        if v131 then
                            v130 = v130 + 1
                        else
                            v131 = true
                        end
                    end
                    if v130 > u126 then
                        break
                    end
                    local v132 = p127 * 3
                    local v133 = u120 + Vector3.new(v128, v132, v130)
                    local v134 = u2:getBlockPosition(v133)
                    local v135 = u2:getWorldPosition(v134).Y - 1.5
                    local v136 = v134 - Vector3.new(0, 1, 0)
                    local v137 = u2:getStore():getBlockAt(v134)
                    local v138 = u2:getStore():getBlockAt(v136)
                    local v139
                    if v137 == nil then
                        v139 = v138 ~= nil
                    else
                        v139 = false
                    end
                    if v139 then
                        local v140 = v133.X
                        local v141 = v133.Z
                        return Vector3.new(v140, v135, v141)
                    end
                end
            end
        end
        local v143 = v142(0)
        if v143 then
            return v143
        end
        local v144 = false
        local v145 = 1
        while true do
            if v144 then
                v145 = v145 + 1
            else
                v144 = true
            end
            if v145 > v125 then
                return nil
            end
            local v146
            if p123 == nil then
                v146 = v125
            else
                v146 = p123
            end
            local v147 = v145 <= v146 and v142(-v145)
            if v147 then
                return v147
            end
            local v148
            if p122 == nil then
                v148 = v125
            else
                v148 = p122
            end
            if v145 <= v148 then
                local v149 = v142(v145)
                if v149 then
                    return v149
                end
            end
        end
    end,
    ["getClosestBlockReferenceBelowWorldPosition"] = function(p150, p151) --[[ Name: getClosestBlockReferenceBelowWorldPosition, Line 384 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v152 = u2:getBlockPosition(p150)
        local v153 = false
        local v154 = 0
        while true do
            if v153 then
                v154 = v154 + 1
            else
                v153 = true
            end
            if v154 >= p151 then
                return nil
            end
            local v155 = v152.X
            local v156 = v152.Y - v154
            local v157 = v152.Z
            local v158 = Vector3.new(v155, v156, v157)
            if u2:getStore():getBlockAt(v158) ~= nil then
                return {
                    ["blockPosition"] = v158
                }
            end
        end
    end,
    ["getClosestBlockAboveWorldPosition"] = function(p159, p160) --[[ Name: getClosestBlockAboveWorldPosition, Line 409 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v161 = u2:getBlockPosition(p159)
        local v162 = false
        local v163 = 0
        while true do
            if v162 then
                v163 = v163 + 1
            else
                v162 = true
            end
            if v163 >= p160 then
                return nil
            end
            local v164 = v161.X
            local v165 = v161.Y + v163
            local v166 = v161.Z
            local v167 = Vector3.new(v164, v165, v166)
            local v168 = u2:getStore():getBlockAt(v167)
            if v168 ~= nil then
                return v168
            end
        end
    end,
    ["getClosestBlockSurfacePointBelowWorldPosition"] = function(p169, p170) --[[ Name: getClosestBlockSurfacePointBelowWorldPosition, Line 432 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v171 = u2:getBlockPosition(p169)
        local v172 = false
        local v173 = 0
        while true do
            if v172 then
                v173 = v173 + 1
            else
                v172 = true
            end
            if v173 >= p170 then
                return nil
            end
            local v174 = v171.X
            local v175 = v171.Y - v173 + 1
            local v176 = v171.Z
            local v177 = Vector3.new(v174, v175, v176)
            local v178 = u2:getStore():getBlockAt(v177)
            if v178 ~= nil then
                local v179 = u2
                local v180 = v171.X
                local v181 = v171.Y - v173 + 1
                local v182 = v171.Z
                local v183 = v179:getWorldPosition((Vector3.new(v180, v181, v182))).Y + v178.Size.Y / 2
                local v184 = p169.X
                local v185 = p169.Z
                return Vector3.new(v184, v183, v185)
            end
        end
    end,
    ["getBlockInstanceFromBlockRef"] = function(p186) --[[ Name: getBlockInstanceFromBlockRef, Line 458 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        return u2:getStore():getBlockAt(p186.blockPosition)
    end,
    ["getBlockReferenceFromBlockInstance"] = function(p187) --[[ Name: getBlockReferenceFromBlockInstance, Line 461 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        return {
            ["blockPosition"] = u2:getBlockPosition(p187.Position)
        }
    end,
    ["getDistanceFromWorldPositionToClosestBed"] = function(p188) --[[ Name: getDistanceFromWorldPositionToClosestBed, Line 466 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u5
            [3] = u4
        --]]
        local v189
        if u8:IsServer() then
            v189 = u5.Services.BedwarsService:getBeds()
        else
            v189 = u4.Controllers.BedwarsController:getAllBeds()
        end
        if #v189 == 0 then
            return nil
        end
        local v190 = (p188 - v189[1].Position).Magnitude
        if #v189 == 1 then
            return v190
        end
        local v191 = false
        local v192 = 1
        while true do
            if v191 then
                v192 = v192 + 1
            else
                v191 = true
            end
            if v192 >= #v189 then
                return v190
            end
            local v193 = (p188 - v189[v192 + 1].Position).Magnitude
            if v193 >= v190 then
                v193 = v190
            end
            v190 = v193
        end
    end,
    ["snapBlockRotation"] = function(p194) --[[ Name: snapBlockRotation, Line 508 ]]
        local v195 = p194 % 360
        if v195 < 0 then
            v195 = v195 + 360
        end
        local v196 = {
            0,
            90,
            180,
            270,
            360
        }
        local v197 = v196[1]
        local v198 = v195 - v197
        local v199 = math.abs(v198)
        local v200 = false
        local v201 = 1
        while true do
            if v200 then
                v201 = v201 + 1
            else
                v200 = true
            end
            if v201 >= #v196 then
                return v197
            end
            local v202 = v195 - v196[v201 + 1]
            local v203 = math.abs(v202)
            if v203 < v199 then
                v197 = v196[v201 + 1]
            else
                v203 = v199
            end
            v199 = v203
        end
    end,
    ["getAllBlockReferencesBelowBlockPosition"] = u114,
    ["destroyAllBlocksBelowBlockPosition"] = function(p204, p205, p206) --[[ Name: destroyAllBlocksBelowBlockPosition, Line 640 ]]
        --[[
        Upvalues:
            [1] = u114
            [2] = u2
        --]]
        u2:bulkDestroyBlock((u114(p204, p205 == nil and 100 or p205, p206)))
    end,
    ["getTopBlock"] = function(p207, p208) --[[ Name: getTopBlock, Line 647 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v209 = p208 == nil and 5 or p208
        local v210 = false
        local v211 = 0
        while true do
            if v210 then
                v211 = v211 + 1
            else
                v210 = true
            end
            if v211 > v209 then
                return nil
            end
            if u2:getStore():getBlockAt(p207) == nil then
                return p207
            end
            local _ = p207 + Vector3.new(0, 1, 0)
        end
    end,
    ["getBlockSpaceRegionContainingBlockPositions"] = function(p212) --[[ Name: getBlockSpaceRegionContainingBlockPositions, Line 674 ]]
        local v213 = (1 / 0)
        local v214 = (1 / 0)
        local v215 = (1 / 0)
        local v216 = (-1 / 0)
        local v217 = (-1 / 0)
        local v218 = (-1 / 0)
        for _, v219 in p212 do
            local v220 = v219.X
            v213 = math.min(v213, v220)
            local v221 = v219.Y
            v214 = math.min(v214, v221)
            local v222 = v219.Z
            v215 = math.min(v215, v222)
            local v223 = v219.X
            v216 = math.max(v216, v223)
            local v224 = v219.Y
            v217 = math.max(v217, v224)
            local v225 = v219.Z
            v218 = math.max(v218, v225)
        end
        local v226 = (v213 + v216) / 2
        local v227 = (v214 + v217) / 2
        local v228 = (v215 + v218) / 2
        local v229 = Vector3.new(v226, v227, v228)
        local v230 = v216 - v213
        local v231 = v217 - v214
        local v232 = v218 - v215
        return {
            ["minX"] = v213,
            ["minY"] = v214,
            ["minZ"] = v215,
            ["maxX"] = v216,
            ["maxY"] = v217,
            ["maxZ"] = v218,
            ["center"] = v229,
            ["size"] = Vector3.new(v230, v231, v232)
        }
    end,
    ["getNearbyAboveBlockByXZ"] = u1.async(function(p233, p234, p235, p236, p237) --[[ Line: 751 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u2
            [3] = u1
            [4] = u29
        --]]
        local v238 = p235 == nil and 3 or p235
        local v239 = false
        local v240 = 0
        while true do
            if v239 then
                v240 = v240 + 1
            else
                v239 = true
            end
            if v240 >= v238 then
                if p236 then
                    return u2:getBlockPosition(u1.await(u29()))
                end
                return
            end
            local v241 = math.random(-p234, p234)
            local v242 = math.random(-p234, p234)
            local v243
            if p237 == 0 or (p237 ~= p237 or not p237) then
                v243 = p237
            else
                v243 = v241 < p237
            end
            if v243 ~= 0 and (v243 == v243 and v243) then
                if v241 < 0 then
                    v241 = -p237
                else
                    v241 = p237
                end
            end
            local v244
            if p237 == 0 or (p237 ~= p237 or not p237) then
                v244 = p237
            else
                v244 = v242 < p237
            end
            if v244 ~= 0 and (v244 == v244 and v244) then
                if v242 < 0 then
                    v242 = -p237
                else
                    v242 = p237
                end
            end
            local v245 = p233 + Vector3.new(v241, 0, v242)
            local v246 = RaycastParams.new()
            v246.CollisionGroup = "Blocks"
            v246.FilterType = Enum.RaycastFilterType.Exclude
            local v247 = 0
            local v248 = {}
            for v249, v250 in u7:GetPlayers() do
                local _ = v249 - 1
                local v251 = v250.Character
                if v251 ~= nil then
                    v247 = v247 + 1
                    v248[v247] = v251
                end
            end
            v246.FilterDescendantsInstances = v248
            local v252 = u2:serverRaycast(u2:getWorldPosition(v245), Vector3.new(0, 210, 0), v246) or u2:serverRaycast(u2:getWorldPosition(v245), Vector3.new(0, -210, 0), v246)
            if v252 then
                local v253 = u2:getBlockPosition(v252.Position)
                local v254 = 0
                while true do
                    local v255 = v253 - Vector3.new(0, 1, 0)
                    local v256 = u2:getStore():getBlockAt(v253)
                    local v257 = u2:getStore():getBlockAt(v255)
                    local v258
                    if v256 == nil then
                        v258 = v257 ~= nil
                    else
                        v258 = false
                    end
                    if v258 or v254 >= 50 then
                        return v253
                    end
                    v253 = v253 + Vector3.new(0, 1, 0)
                    v254 = v254 + 1
                end
            end
        end
    end),
    ["checkIfBlockIsInRaycast"] = function(p259, p260) --[[ Name: checkIfBlockIsInRaycast, Line 835 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        local v261 = RaycastParams.new()
        v261.CollisionGroup = "Blocks"
        v261.FilterDescendantsInstances = { u9.Map }
        v261.FilterType = Enum.RaycastFilterType.Include
        return u9:Raycast(p259, p260 - p259, v261) and true or false
    end,
    ["isBlockInstanceAnImportantBlock"] = function(p262, p263, p264) --[[ Name: isBlockInstanceAnImportantBlock, Line 847 ]]
        local v265 = {
            "enchant-table",
            "bed",
            "squad-launcher",
            "chest",
            "altar-block",
            "broken-altar-block",
            "HealingFountain",
            "forge-block",
            "broken-enchant-table",
            "SnakeShrine"
        }
        if p263 ~= nil then
            table.clear(v265)
            local v266 = false
            local v267 = 0
            while true do
                if v266 then
                    v267 = v267 + 1
                else
                    v266 = true
                end
                if v267 >= #p263 then
                    break
                end
                local v268 = p263[v267 + 1]
                table.insert(v265, v268)
            end
        end
        if p264 ~= nil then
            local v269 = false
            local v270 = 0
            while true do
                if v269 then
                    v270 = v270 + 1
                else
                    v269 = true
                end
                if v270 >= #p264 then
                    break
                end
                local v271 = p264[v270 + 1]
                table.insert(v265, v271)
            end
        end
        local v272 = false
        local v273 = 0
        while true do
            if v272 then
                v273 = v273 + 1
            else
                v272 = true
            end
            if v273 >= #v265 then
                return false
            end
            if p262:HasTag(v265[v273 + 1]) then
                return true
            end
        end
    end,
    ["isPositionInWorld"] = function(p274) --[[ Name: isPositionInWorld, Line 905 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u5
            [3] = u2
        --]]
        if u8:IsClient() then
            return true
        end
        local v275 = u5.Services.MapService:getWorldDocFromPosition(p274)
        if not v275 then
            return false
        end
        local v276 = u2:getWorldPosition(v275:getMapMinCornerBlockSpace()) - Vector3.new(30, 0, 30)
        local v277 = u2:getWorldPosition(v275:getMapMaxCornerBlockSpace()) + Vector3.new(30, 0, 30)
        return p274.X >= v276.X - 50 and (p274.Z >= v276.Z - 50 and (p274.X <= v277.X + 50 and p274.Z <= v277.Z + 50))
    end,
    ["getBlockUUIDFromBlockPosition"] = function(p278) --[[ Name: getBlockUUIDFromBlockPosition, Line 924 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v279 = u2:getStore():getBlockAt(p278)
        if v279 then
            return v279:GetAttribute("BlockUUID")
        else
            return nil
        end
    end,
    ["getClosestBlockToWorldPosition"] = function(p280, p281) --[[ Name: getClosestBlockToWorldPosition, Line 932 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v282 = p281 == nil and 500 or p281
        local v283 = u2:getStore()
        local v284 = u2:getBlockPosition(p280)
        local v285 = false
        local v286 = 0
        while true do
            if v285 then
                v286 = v286 + 1
            else
                v285 = true
            end
            if v286 > v282 then
                return nil
            end
            local v287 = -v286
            local v288 = false
            while true do
                if true then
                    if v288 then
                        v287 = v287 + 1
                    else
                        v288 = true
                    end
                end
                if v287 > v286 then
                    break
                end
                local v289 = -v286
                local v290 = false
                while true do
                    if true then
                        if v290 then
                            v289 = v289 + 1
                        else
                            v290 = true
                        end
                    end
                    if v289 > v286 then
                        break
                    end
                    local v291 = -v286
                    local v292 = false
                    while true do
                        if true then
                            if v292 then
                                v291 = v291 + 1
                            else
                                v292 = true
                            end
                        end
                        if v291 > v286 then
                            break
                        end
                        if math.abs(v287) == v286 or (math.abs(v289) == v286 or math.abs(v291) == v286) then
                            local v293 = v283:getBlockAt(v284 + Vector3.new(v287, v289, v291))
                            if v293 then
                                return v293
                            end
                        end
                    end
                end
            end
        end
    end,
    ["getBlocksInRegionAsync"] = function(u294, u295, p296) --[[ Name: getBlocksInRegionAsync, Line 1004 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u2
        --]]
        local u297 = p296 == nil and 50 or p296
        return u1.Promise.new(function(u298) --[[ Line: 1008 ]]
            --[[
            Upvalues:
                [1] = u295
                [2] = u294
                [3] = u2
                [4] = u297
            --]]
            task.spawn(function() --[[ Line: 1009 ]]
                --[[
                Upvalues:
                    [1] = u295
                    [2] = u294
                    [3] = u2
                    [4] = u297
                    [5] = u298
                --]]
                local v299 = u295 - u294
                local v300 = v299.X
                local v301 = math.abs(v300) + 1
                local v302 = v299.Y
                local v303 = math.abs(v302) + 1
                local v304 = v299.Z
                local v305 = math.abs(v304) + 1
                local v306 = v299.Unit.X >= 0 and 1 or -1
                local v307 = v299.Unit.Y >= 0 and 1 or -1
                local v308 = v299.Unit.Z >= 0 and 1 or -1
                local v309 = false
                local v310 = 0
                local v311 = {}
                local v312 = 0
                while true do
                    if v309 then
                        v310 = v310 + 1
                    else
                        v309 = true
                    end
                    if v310 >= v301 then
                        u298(v311)
                        return
                    end
                    local v313 = false
                    local v314 = 0
                    while true do
                        if true then
                            if v313 then
                                v314 = v314 + 1
                            else
                                v313 = true
                            end
                        end
                        if v314 >= v305 then
                            break
                        end
                        local v315 = false
                        local v316 = 0
                        while true do
                            if true then
                                if v315 then
                                    v316 = v316 + 1
                                else
                                    v315 = true
                                end
                            end
                            if v316 >= v303 then
                                break
                            end
                            local v317 = u2
                            local v318
                            if u294.X * v306 < 0 then
                                v318 = u294.X - v310
                            else
                                v318 = u294.X + v310
                            end
                            local v319
                            if u294.Y * v307 < 0 then
                                v319 = u294.Y - v316
                            else
                                v319 = u294.Y + v316
                            end
                            local v320
                            if u294.Z * v308 < 0 then
                                v320 = u294.Z - v314
                            else
                                v320 = u294.Z + v314
                            end
                            local v321 = v317:snapPosition((Vector3.new(v318, v319, v320)))
                            local v322 = u2:getStore():getBlockAt(v321)
                            if v322 then
                                local v323 = {
                                    ["blockType"] = v322.Name,
                                    ["blockPos"] = v321
                                }
                                table.insert(v311, v323)
                                v312 = v312 + 1
                                if v312 % u297 == 0 then
                                    task.wait()
                                end
                            end
                        end
                    end
                end
            end)
        end)
    end,
    ["calculateBlockBounds"] = function(p324) --[[ Name: calculateBlockBounds, Line 1082 ]]
        local v325 = (-1 / 0)
        local v326 = (1 / 0)
        local v327 = (1 / 0)
        local v328 = (1 / 0)
        local v329 = (-1 / 0)
        local v330 = (-1 / 0)
        for _, v331 in p324 do
            local v332 = v331.blockPos or v331.position
            if v332 then
                local v333 = v332.X
                v326 = math.min(v326, v333)
                local v334 = v332.Y
                v327 = math.min(v327, v334)
                local v335 = v332.Z
                v328 = math.min(v328, v335)
                local v336 = v332.X
                v329 = math.max(v329, v336)
                local v337 = v332.Y
                v330 = math.max(v330, v337)
                local v338 = v332.Z
                v325 = math.max(v325, v338)
            end
        end
        return {
            ["min"] = Vector3.new(v326, v327, v328),
            ["max"] = Vector3.new(v329, v330, v325)
        }
    end
}