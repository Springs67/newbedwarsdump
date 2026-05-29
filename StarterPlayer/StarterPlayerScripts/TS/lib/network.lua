local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
local u3 = nil
local u4 = nil
local u5 = nil
local u6 = nil
local u7 = nil
local u8 = nil
local u9 = nil
local u10 = nil
local u11 = nil
local _ = {
    CFrame.Angles(0, 0, 0),
    CFrame.Angles(1.5707963267948966, 0, 0),
    CFrame.Angles(0, 3.141592653589793, 3.141592653589793),
    CFrame.Angles(-1.5707963267948966, 0, 0),
    CFrame.Angles(0, 3.141592653589793, 1.5707963267948966),
    CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966),
    CFrame.Angles(0, 0, 1.5707963267948966),
    CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966),
    CFrame.Angles(-1.5707963267948966, -1.5707963267948966, 0),
    CFrame.Angles(0, -1.5707963267948966, 0),
    CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0),
    CFrame.Angles(0, 1.5707963267948966, 3.141592653589793),
    CFrame.Angles(0, -1.5707963267948966, 3.141592653589793),
    CFrame.Angles(0, 3.141592653589793, 0),
    CFrame.Angles(-1.5707963267948966, -3.141592653589793, 0),
    CFrame.Angles(0, 0, 3.141592653589793),
    CFrame.Angles(1.5707963267948966, 3.141592653589793, 0),
    CFrame.Angles(0, 0, -1.5707963267948966),
    CFrame.Angles(0, -1.5707963267948966, -1.5707963267948966),
    CFrame.Angles(0, -3.141592653589793, -1.5707963267948966),
    CFrame.Angles(0, 1.5707963267948966, -1.5707963267948966),
    CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0),
    CFrame.Angles(0, 1.5707963267948966, 0),
    CFrame.Angles(-1.5707963267948966, 1.5707963267948966, 0)
}
local function u14(p12) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u3
        [4] = u7
    --]]
    if u5 < u4 + p12 then
        while u5 < u4 + p12 do
            u5 = u5 * 2
        end
        local v13 = buffer.create(u5)
        buffer.copy(v13, 0, u3, 0, u4)
        u3 = v13
    end
    u7 = u4
    u4 = u4 + p12
    return u7
end
u3 = buffer.create(64)
u4 = 0
u5 = 64
u6 = {}
local v15 = {}
if not v2:IsRunning() then
    local function v16() --[[ Line: 108 ]] end
    local v17 = table.freeze
    local v18 = {
        ["SendEvents"] = v16,
        ["EntityDamageEventZap"] = table.freeze({
            ["On"] = v16
        }),
        ["PickupItemEventZap"] = table.freeze({
            ["On"] = v16
        }),
        ["ProjectileLaunchZap"] = table.freeze({
            ["On"] = v16
        }),
        ["ProjectileImpactZap"] = table.freeze({
            ["On"] = v16
        }),
        ["UpdateMapDataZap"] = table.freeze({
            ["On"] = v16
        }),
        ["PlaceBlockEventZap"] = table.freeze({
            ["On"] = v16
        }),
        ["BreakBlockEventZap"] = table.freeze({
            ["On"] = v16
        }),
        ["EntityHealEventZap"] = table.freeze({
            ["On"] = v16
        }),
        ["AddMatchEventCountdownZap"] = table.freeze({
            ["On"] = v16
        }),
        ["KitsUpdateEventZap"] = table.freeze({
            ["On"] = v16
        }),
        ["FetchMapDataFuncZap"] = table.freeze({
            ["Call"] = v16
        })
    }
    return v17(v18)
end
if v2:IsServer() then
    error("Cannot use the client module on the server!")
end
local u19 = v1:WaitForChild("ZAP"):WaitForChild("ZAP_RELIABLE")
local v20 = u19:IsA("RemoteEvent")
assert(v20, "Expected ZAP_RELIABLE to be a RemoteEvent")
local function v22() --[[ Line: 155 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u19
        [4] = u6
        [5] = u5
    --]]
    if u4 ~= 0 then
        local v21 = buffer.create(u4)
        buffer.copy(v21, 0, u3, 0, u4)
        u19:FireServer(v21, u6)
        u3 = buffer.create(64)
        u4 = 0
        u5 = 64
        table.clear(u6)
    end
end
v2.Heartbeat:Connect(v22)
local u23 = table.create(11)
local u24 = table.create(11)
local u25 = 0
u23[0] = {}
u24[0] = {}
u23[1] = {}
u24[1] = {}
u23[2] = {}
u24[2] = {}
u23[3] = {}
u24[3] = {}
u23[4] = {}
u24[4] = {}
u23[5] = {}
u24[5] = {}
u23[6] = {}
u24[6] = {}
u23[7] = {}
u24[7] = {}
u23[8] = {}
u24[8] = {}
u23[9] = {}
u24[9] = {}
u24[10] = table.create(255)
u19.OnClientEvent:Connect(function(p26, p27) --[[ Line: 195 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
        [3] = u9
        [4] = u11
        [5] = u23
        [6] = u24
    --]]
    u8 = p26
    u10 = p27
    u9 = 0
    u11 = 0
    local v28 = buffer.len(p26)
    while u9 < v28 do
        local v29 = u9
        u9 = u9 + 1
        local v30 = buffer.readu8(p26, v29)
        if v30 == 0 then
            u11 = u11 + 1
            local v31 = u10[u11]
            local v32 = v31 ~= nil
            assert(v32)
            assert(v31:IsA("Model"))
            local v33 = u8
            local v34 = u9
            u9 = u9 + 8
            local v35 = buffer.readf64(v33, v34)
            local v36 = u8
            local v37 = u9
            u9 = u9 + 1
            local v38 = buffer.readu8(v36, v37)
            local v39 = u8
            local v40 = u9
            u9 = u9 + 1
            local v41
            if buffer.readu8(v39, v40) == 1 then
                local v42 = u8
                local v43 = u9
                u9 = u9 + 4
                local v44 = buffer.readf32(v42, v43)
                local v45 = u8
                local v46 = u9
                u9 = u9 + 4
                local v47 = buffer.readf32(v45, v46)
                local v48 = u8
                local v49 = u9
                u9 = u9 + 4
                local v50 = buffer.readf32(v48, v49)
                v41 = vector.create(v44, v47, v50)
            else
                v41 = nil
            end
            local v51 = u8
            local v52 = u9
            u9 = u9 + 1
            local v53
            if buffer.readu8(v51, v52) == 1 then
                u11 = u11 + 1
                v53 = u10[u11]
                local v54 = v53 == nil and true or v53:IsA("Model")
                assert(v54)
            else
                v53 = nil
            end
            local v55 = u8
            local v56 = u9
            u9 = u9 + 1
            local v57
            if buffer.readu8(v55, v56) == 1 then
                v57 = {}
                local v58 = u8
                local v59 = u9
                u9 = u9 + 1
                if buffer.readu8(v58, v59) == 1 then
                    local v60 = u8
                    local v61 = u9
                    u9 = u9 + 8
                    v57.horizontal = buffer.readf64(v60, v61)
                else
                    v57.horizontal = nil
                end
                local v62 = u8
                local v63 = u9
                u9 = u9 + 1
                if buffer.readu8(v62, v63) == 1 then
                    local v64 = u8
                    local v65 = u9
                    u9 = u9 + 8
                    v57.vertical = buffer.readf64(v64, v65)
                else
                    v57.vertical = nil
                end
                local v66 = u8
                local v67 = u9
                u9 = u9 + 1
                if buffer.readu8(v66, v67) == 1 then
                    local v68 = u8
                    local v69 = u9
                    u9 = u9 + 1
                    v57.disabled = buffer.readu8(v68, v69) == 1
                else
                    v57.disabled = nil
                end
            else
                v57 = nil
            end
            local v70 = u8
            local v71 = u9
            u9 = u9 + 1
            local v72
            if buffer.readu8(v70, v71) == 1 then
                local v73 = u8
                local v74 = u9
                u9 = u9 + 2
                v72 = buffer.readu16(v73, v74)
            else
                v72 = nil
            end
            local v75 = u8
            local v76 = u9
            u9 = u9 + 1
            local v77
            if buffer.readu8(v75, v76) == 1 then
                v77 = {}
                local v78 = u8
                local v79 = u9
                u9 = u9 + 1
                if buffer.readu8(v78, v79) == 1 then
                    local v80 = u8
                    local v81 = u9
                    u9 = u9 + 2
                    local v82 = buffer.readu16(v80, v81)
                    local v83 = buffer.readstring
                    local v84 = u8
                    local v85 = u9
                    u9 = u9 + v82
                    v77.itemUsed = v83(v84, v85, v82)
                else
                    v77.itemUsed = nil
                end
                local v86 = u8
                local v87 = u9
                u9 = u9 + 1
                if buffer.readu8(v86, v87) == 1 then
                    local v88 = u8
                    local v89 = u9
                    u9 = u9 + 4
                    v77.swingTimeRatio = buffer.readf32(v88, v89)
                else
                    v77.swingTimeRatio = nil
                end
                local v90 = u8
                local v91 = u9
                u9 = u9 + 1
                if buffer.readu8(v90, v91) == 1 then
                    v77.projectileData = {}
                    local v92 = v77.projectileData
                    local v93 = u8
                    local v94 = u9
                    u9 = u9 + 2
                    v92.projectileType = buffer.readu16(v93, v94)
                    u11 = u11 + 1
                    v77.projectileData.projectileModel = u10[u11]
                    local v95 = v77.projectileData.projectileModel ~= nil
                    assert(v95)
                    local v96 = v77.projectileData.projectileModel
                    assert(v96:IsA("Model"))
                else
                    v77.projectileData = nil
                end
                local v97 = u8
                local v98 = u9
                u9 = u9 + 1
                if buffer.readu8(v97, v98) == 1 then
                    local v99 = u8
                    local v100 = u9
                    u9 = u9 + 1
                    v77.guidedProjectile = buffer.readu8(v99, v100)
                else
                    v77.guidedProjectile = nil
                end
                local v101 = u8
                local v102 = u9
                u9 = u9 + 1
                if buffer.readu8(v101, v102) == 1 then
                    local v103 = u8
                    local v104 = u9
                    u9 = u9 + 1
                    v77.paintBlast = buffer.readu8(v103, v104) == 1
                else
                    v77.paintBlast = nil
                end
                local v105 = u8
                local v106 = u9
                u9 = u9 + 1
                if buffer.readu8(v105, v106) == 1 then
                    local v107 = u8
                    local v108 = u9
                    u9 = u9 + 1
                    v77.pyroBrittleAttack = buffer.readu8(v107, v108) == 1
                else
                    v77.pyroBrittleAttack = nil
                end
                local v109 = u8
                local v110 = u9
                u9 = u9 + 1
                if buffer.readu8(v109, v110) == 1 then
                    local v111 = u8
                    local v112 = u9
                    u9 = u9 + 4
                    v77.chargeRatio = buffer.readf32(v111, v112)
                else
                    v77.chargeRatio = nil
                end
                local v113 = u8
                local v114 = u9
                u9 = u9 + 1
                if buffer.readu8(v113, v114) == 1 then
                    local v115 = u8
                    local v116 = u9
                    u9 = u9 + 1
                    v77.isVoidAttack = buffer.readu8(v115, v116) == 1
                else
                    v77.isVoidAttack = nil
                end
                local v117 = u8
                local v118 = u9
                u9 = u9 + 1
                if buffer.readu8(v117, v118) == 1 then
                    local v119 = u8
                    local v120 = u9
                    u9 = u9 + 1
                    v77.isDoubleHit = buffer.readu8(v119, v120) == 1
                else
                    v77.isDoubleHit = nil
                end
                local v121 = u8
                local v122 = u9
                u9 = u9 + 1
                if buffer.readu8(v121, v122) == 1 then
                    local v123 = u8
                    local v124 = u9
                    u9 = u9 + 1
                    v77.halloweenEventFog = buffer.readu8(v123, v124) == 1
                else
                    v77.halloweenEventFog = nil
                end
                local v125 = u8
                local v126 = u9
                u9 = u9 + 1
                if buffer.readu8(v125, v126) == 1 then
                    local v127 = u8
                    local v128 = u9
                    u9 = u9 + 1
                    v77.halloweenLaser = buffer.readu8(v127, v128) == 1
                else
                    v77.halloweenLaser = nil
                end
                local v129 = u8
                local v130 = u9
                u9 = u9 + 1
                if buffer.readu8(v129, v130) == 1 then
                    local v131 = u8
                    local v132 = u9
                    u9 = u9 + 1
                    v77.seahorseAttack = buffer.readu8(v131, v132) == 1
                else
                    v77.seahorseAttack = nil
                end
                local v133 = u8
                local v134 = u9
                u9 = u9 + 1
                if buffer.readu8(v133, v134) == 1 then
                    local v135 = u8
                    local v136 = u9
                    u9 = u9 + 1
                    v77.headshot = buffer.readu8(v135, v136) == 1
                else
                    v77.headshot = nil
                end
                local v137 = u8
                local v138 = u9
                u9 = u9 + 1
                if buffer.readu8(v137, v138) == 1 then
                    local v139 = u8
                    local v140 = u9
                    u9 = u9 + 1
                    v77.damageOverTime = buffer.readu8(v139, v140) == 1
                else
                    v77.damageOverTime = nil
                end
                local v141 = u8
                local v142 = u9
                u9 = u9 + 1
                if buffer.readu8(v141, v142) == 1 then
                    local v143 = u8
                    local v144 = u9
                    u9 = u9 + 1
                    v77.ignorePurgatoryDisable = buffer.readu8(v143, v144) == 1
                else
                    v77.ignorePurgatoryDisable = nil
                end
                local v145 = u8
                local v146 = u9
                u9 = u9 + 1
                if buffer.readu8(v145, v146) == 1 then
                    local v147 = u8
                    local v148 = u9
                    u9 = u9 + 1
                    v77.spiderKill = buffer.readu8(v147, v148) == 1
                else
                    v77.spiderKill = nil
                end
            else
                v77 = nil
            end
            local v149 = u8
            local v150 = u9
            u9 = u9 + 1
            local v151
            if buffer.readu8(v149, v150) == 1 then
                local v152 = u8
                local v153 = u9
                u9 = u9 + 1
                v151 = buffer.readu8(v152, v153) == 1
            else
                v151 = nil
            end
            local v154 = u8
            local v155 = u9
            u9 = u9 + 1
            local v156
            if buffer.readu8(v154, v155) == 1 then
                local v157 = u8
                local v158 = u9
                u9 = u9 + 2
                v156 = buffer.readu16(v157, v158)
            else
                v156 = nil
            end
            local v159 = u8
            local v160 = u9
            u9 = u9 + 1
            local v161
            if buffer.readu8(v159, v160) == 1 then
                v161 = {}
                local v162 = u8
                local v163 = u9
                u9 = u9 + 2
                for v164 = 1, buffer.readu16(v162, v163) do
                    local v165 = u8
                    local v166 = u9
                    u9 = u9 + 2
                    v161[v164] = buffer.readu16(v165, v166)
                end
            else
                v161 = nil
            end
            local v167 = u8
            local v168 = u9
            u9 = u9 + 1
            local v169
            if buffer.readu8(v167, v168) == 1 then
                local v170 = u8
                local v171 = u9
                u9 = u9 + 1
                v169 = buffer.readu8(v170, v171) == 1
            else
                v169 = nil
            end
            local v172 = u8
            local v173 = u9
            u9 = u9 + 1
            local v174
            if buffer.readu8(v172, v173) == 1 then
                local v175 = u8
                local v176 = u9
                u9 = u9 + 1
                v174 = buffer.readu8(v175, v176) == 1
            else
                v174 = nil
            end
            local v177 = u8
            local v178 = u9
            u9 = u9 + 1
            local v179
            if buffer.readu8(v177, v178) == 1 then
                local v180 = u8
                local v181 = u9
                u9 = u9 + 1
                v179 = buffer.readu8(v180, v181)
            else
                v179 = nil
            end
            if u23[0][1] then
                for _, v182 in u23[0] do
                    task.spawn(v182, v31, v35, v38, v41, v53, v57, v72, v77, v151, v156, v161, v169, v174, v179)
                end
            else
                local v183 = u24[0]
                table.insert(v183, {
                    v31,
                    v35,
                    v38,
                    v41,
                    v53,
                    v57,
                    v72,
                    v77,
                    v151,
                    v156,
                    v161,
                    v169,
                    v174,
                    v179
                })
                if #u24[0] > 64 then
                    warn((("[ZAP] %* events in queue for EntityDamageEventZap. Did you forget to attach a listener?"):format(#u24[0])))
                end
            end
        elseif v30 == 1 then
            local v184 = u8
            local v185 = u9
            u9 = u9 + 2
            local v186 = buffer.readu16(v184, v185)
            local v187 = u8
            local v188 = u9
            u9 = u9 + 4
            local v189 = buffer.readf32(v187, v188)
            local v190 = u8
            local v191 = u9
            u9 = u9 + 4
            local v192 = buffer.readf32(v190, v191)
            local v193 = u8
            local v194 = u9
            u9 = u9 + 4
            local v195 = buffer.readf32(v193, v194)
            local v196 = vector.create(v189, v192, v195)
            if u23[1][1] then
                for _, v197 in u23[1] do
                    task.spawn(v197, v186, v196)
                end
            else
                local v198 = u24[1]
                table.insert(v198, { v186, v196 })
                if #u24[1] > 64 then
                    warn((("[ZAP] %* events in queue for PickupItemEventZap. Did you forget to attach a listener?"):format(#u24[1])))
                end
            end
        elseif v30 == 2 then
            local v199 = u8
            local v200 = u9
            u9 = u9 + 1
            local v201
            if buffer.readu8(v199, v200) == 1 then
                u11 = u11 + 1
                v201 = u10[u11]
            else
                v201 = nil
            end
            local v202 = u8
            local v203 = u9
            u9 = u9 + 4
            local v204 = buffer.readf32(v202, v203)
            local v205 = u8
            local v206 = u9
            u9 = u9 + 4
            local v207 = buffer.readf32(v205, v206)
            local v208 = u8
            local v209 = u9
            u9 = u9 + 4
            local v210 = buffer.readf32(v208, v209)
            local v211 = vector.create(v204, v207, v210)
            u11 = u11 + 1
            local v212 = u10[u11]
            local v213 = v212 ~= nil
            assert(v213)
            assert(v212:IsA("Model"))
            local v214 = buffer.readstring
            local v215 = u8
            local v216 = u9
            u9 = u9 + 8
            local v217 = v214(v215, v216, 8)
            local v218 = u8
            local v219 = u9
            u9 = u9 + 1
            local v220
            if buffer.readu8(v218, v219) == 1 then
                u11 = u11 + 1
                v220 = u10[u11]
                local v221 = v220 == nil and true or v220:IsA("Accessory")
                assert(v221)
            else
                v220 = nil
            end
            local v222 = u8
            local v223 = u9
            u9 = u9 + 1
            local v224
            if buffer.readu8(v222, v223) == 1 then
                u11 = u11 + 1
                v224 = u10[u11]
                local v225 = v224 == nil and true or v224:IsA("BasePart")
                assert(v225)
            else
                v224 = nil
            end
            local v226 = u8
            local v227 = u9
            u9 = u9 + 1
            local v228
            if buffer.readu8(v226, v227) == 1 then
                u11 = u11 + 1
                v228 = u10[u11]
                local v229 = v228 == nil and true or v228:IsA("Model")
                assert(v229)
            else
                v228 = nil
            end
            local v230 = u8
            local v231 = u9
            u9 = u9 + 1
            local v232
            if buffer.readu8(v230, v231) == 1 then
                v232 = {}
                local v233 = u8
                local v234 = u9
                u9 = u9 + 1
                if buffer.readu8(v233, v234) == 1 then
                    local v235 = u8
                    local v236 = u9
                    u9 = u9 + 4
                    v232.drawDurationSec = buffer.readf32(v235, v236)
                else
                    v232.drawDurationSec = nil
                end
                local v237 = u8
                local v238 = u9
                u9 = u9 + 1
                if buffer.readu8(v237, v238) == 1 then
                    local v239 = buffer.readstring
                    local v240 = u8
                    local v241 = u9
                    u9 = u9 + 8
                    v232.shotId = v239(v240, v241, 8)
                else
                    v232.shotId = nil
                end
            else
                v232 = nil
            end
            local v242 = u8
            local v243 = u9
            u9 = u9 + 1
            local v244
            if buffer.readu8(v242, v243) == 1 then
                local v245 = u8
                local v246 = u9
                u9 = u9 + 1
                v244 = buffer.readu8(v245, v246) == 1
            else
                v244 = nil
            end
            local v247 = u8
            local v248 = u9
            u9 = u9 + 1
            local v249
            if buffer.readu8(v247, v248) == 1 then
                local v250 = u8
                local v251 = u9
                u9 = u9 + 1
                v249 = buffer.readu8(v250, v251) == 1
            else
                v249 = nil
            end
            local v252 = u8
            local v253 = u9
            u9 = u9 + 1
            local v254
            if buffer.readu8(v252, v253) == 1 then
                v254 = {}
                local v255 = u8
                local v256 = u9
                u9 = u9 + 1
                if buffer.readu8(v255, v256) == 1 then
                    local v257 = u8
                    local v258 = u9
                    u9 = u9 + 1
                    v254.detectHitTerrain = buffer.readu8(v257, v258) == 1
                else
                    v254.detectHitTerrain = nil
                end
            else
                v254 = nil
            end
            if u23[2][1] then
                for _, v259 in u23[2] do
                    task.spawn(v259, v201, v211, v212, v217, v220, v224, v228, v232, v244, v249, v254)
                end
            else
                local v260 = u24[2]
                table.insert(v260, {
                    v201,
                    v211,
                    v212,
                    v217,
                    v220,
                    v224,
                    v228,
                    v232,
                    v244,
                    v249,
                    v254
                })
                if #u24[2] > 64 then
                    warn((("[ZAP] %* events in queue for ProjectileLaunchZap. Did you forget to attach a listener?"):format(#u24[2])))
                end
            end
        elseif v30 == 3 then
            local v261 = u8
            local v262 = u9
            u9 = u9 + 4
            local v263 = buffer.readf32(v261, v262)
            local v264 = u8
            local v265 = u9
            u9 = u9 + 4
            local v266 = buffer.readf32(v264, v265)
            local v267 = u8
            local v268 = u9
            u9 = u9 + 4
            local v269 = buffer.readf32(v267, v268)
            local v270 = vector.create(v263, v266, v269)
            local v271 = u8
            local v272 = u9
            u9 = u9 + 1
            local v273 = buffer.readu8(v271, v272)
            u11 = u11 + 1
            local v274 = u10[u11]
            local v275 = v274 ~= nil
            assert(v275)
            assert(v274:IsA("Model"))
            local v276 = u8
            local v277 = u9
            u9 = u9 + 1
            local v278
            if buffer.readu8(v276, v277) == 1 then
                u11 = u11 + 1
                v278 = u10[u11]
                local v279 = v278 == nil and true or v278:IsA("Accessory")
                assert(v279)
            else
                v278 = nil
            end
            local v280 = u8
            local v281 = u9
            u9 = u9 + 1
            local v282
            if buffer.readu8(v280, v281) == 1 then
                u11 = u11 + 1
                v282 = u10[u11]
                local v283 = v282 == nil and true or v282:IsA("BasePart")
                assert(v283)
            else
                v282 = nil
            end
            local v284 = u8
            local v285 = u9
            u9 = u9 + 1
            local v286
            if buffer.readu8(v284, v285) == 1 then
                u11 = u11 + 1
                v286 = u10[u11]
                local v287 = v286 == nil and true or v286:IsA("Player")
                assert(v287)
            else
                v286 = nil
            end
            local v288 = u8
            local v289 = u9
            u9 = u9 + 1
            local v290
            if buffer.readu8(v288, v289) == 1 then
                u11 = u11 + 1
                v290 = u10[u11]
                local v291 = v290 == nil and true or v290:IsA("Model")
                assert(v291)
            else
                v290 = nil
            end
            local v292 = u8
            local v293 = u9
            u9 = u9 + 1
            local v294
            if buffer.readu8(v292, v293) == 1 then
                local v295 = u8
                local v296 = u9
                u9 = u9 + 1
                v294 = buffer.readu8(v295, v296) == 1
            else
                v294 = nil
            end
            if u23[3][1] then
                for _, v297 in u23[3] do
                    task.spawn(v297, v270, v273, v274, v278, v282, v286, v290, v294)
                end
            else
                local v298 = u24[3]
                table.insert(v298, {
                    v270,
                    v273,
                    v274,
                    v278,
                    v282,
                    v286,
                    v290,
                    v294
                })
                if #u24[3] > 64 then
                    warn((("[ZAP] %* events in queue for ProjectileImpactZap. Did you forget to attach a listener?"):format(#u24[3])))
                end
            end
        elseif v30 == 4 then
            local v299 = {}
            local v300 = u8
            local v301 = u9
            u9 = u9 + 2
            for v302 = 1, buffer.readu16(v300, v301) do
                local v303 = {}
                local v304 = u8
                local v305 = u9
                u9 = u9 + 2
                local v306 = buffer.readu16(v304, v305)
                local v307 = u8
                local v308 = u9
                u9 = u9 + 2
                local v309 = buffer.readu16(v307, v308)
                local v310 = u8
                local v311 = u9
                u9 = u9 + 2
                local v312 = buffer.readu16(v310, v311)
                v303.center = vector.create(v306, v309, v312)
                local v313 = u8
                local v314 = u9
                u9 = u9 + 1
                local v315 = buffer.readu8(v313, v314)
                local v316 = u8
                local v317 = u9
                u9 = u9 + 1
                local v318 = buffer.readu8(v316, v317)
                v303.radius = vector.create(v315, v318, 0)
                local v319 = u8
                local v320 = u9
                u9 = u9 + 1
                v303.box = buffer.readu8(v319, v320) == 1
                local v321 = u8
                local v322 = u9
                u9 = u9 + 1
                if buffer.readu8(v321, v322) == 1 then
                    local v323 = u8
                    local v324 = u9
                    u9 = u9 + 2
                    local v325 = buffer.readu16(v323, v324)
                    local v326 = buffer.readstring
                    local v327 = u8
                    local v328 = u9
                    u9 = u9 + v325
                    v303.whiteListTeamId = v326(v327, v328, v325)
                else
                    v303.whiteListTeamId = nil
                end
                v299[v302] = v303
            end
            local v329 = u8
            local v330 = u9
            u9 = u9 + 1
            local v331 = buffer.readu8(v329, v330) == 1
            if u23[4][1] then
                for _, v332 in u23[4] do
                    task.spawn(v332, v299, v331)
                end
            else
                local v333 = u24[4]
                table.insert(v333, { v299, v331 })
                if #u24[4] > 64 then
                    warn((("[ZAP] %* events in queue for UpdateMapDataZap. Did you forget to attach a listener?"):format(#u24[4])))
                end
            end
        elseif v30 == 5 then
            local v334 = u8
            local v335 = u9
            u9 = u9 + 2
            local v336 = buffer.readu16(v334, v335)
            local v337 = u8
            local v338 = u9
            u9 = u9 + 2
            local v339 = buffer.readu16(v337, v338)
            local v340 = u8
            local v341 = u9
            u9 = u9 + 2
            local v342 = buffer.readu16(v340, v341)
            local v343 = vector.create(v336, v339, v342)
            local v344 = u8
            local v345 = u9
            u9 = u9 + 2
            local v346 = buffer.readu16(v344, v345)
            local v347 = buffer.readstring
            local v348 = u8
            local v349 = u9
            u9 = u9 + v346
            local v350 = v347(v348, v349, v346)
            if u23[5][1] then
                for _, v351 in u23[5] do
                    task.spawn(v351, v343, v350)
                end
            else
                local v352 = u24[5]
                table.insert(v352, { v343, v350 })
                if #u24[5] > 64 then
                    warn((("[ZAP] %* events in queue for PlaceBlockEventZap. Did you forget to attach a listener?"):format(#u24[5])))
                end
            end
        elseif v30 == 6 then
            local v353 = u8
            local v354 = u9
            u9 = u9 + 2
            local v355 = buffer.readu16(v353, v354)
            local v356 = u8
            local v357 = u9
            u9 = u9 + 2
            local v358 = buffer.readu16(v356, v357)
            local v359 = u8
            local v360 = u9
            u9 = u9 + 2
            local v361 = buffer.readu16(v359, v360)
            local v362 = vector.create(v355, v358, v361)
            local v363 = u8
            local v364 = u9
            u9 = u9 + 2
            local v365 = buffer.readu16(v363, v364)
            local v366 = buffer.readstring
            local v367 = u8
            local v368 = u9
            u9 = u9 + v365
            local v369 = v366(v367, v368, v365)
            local v370 = u8
            local v371 = u9
            u9 = u9 + 4
            local v372 = buffer.readf32(v370, v371)
            local v373 = u8
            local v374 = u9
            u9 = u9 + 4
            local v375 = buffer.readf32(v373, v374)
            local v376 = u8
            local v377 = u9
            u9 = u9 + 4
            local v378 = buffer.readf32(v376, v377)
            local v379 = vector.create(v372, v375, v378)
            local v380 = u8
            local v381 = u9
            u9 = u9 + 1
            local v382
            if buffer.readu8(v380, v381) == 1 then
                local v383 = u8
                local v384 = u9
                u9 = u9 + 1
                local v385 = buffer.readu8(v383, v384)
                local v386 = u8
                local v387 = u9
                u9 = u9 + 1
                local v388 = buffer.readu8(v386, v387)
                local v389 = u8
                local v390 = u9
                u9 = u9 + 1
                local v391 = buffer.readu8(v389, v390)
                v382 = vector.create(v385, v388, v391)
            else
                v382 = nil
            end
            local v392 = u8
            local v393 = u9
            u9 = u9 + 1
            local v394
            if buffer.readu8(v392, v393) == 1 then
                u11 = u11 + 1
                v394 = u10[u11]
                local v395 = v394 == nil and true or v394:IsA("Player")
                assert(v395)
            else
                v394 = nil
            end
            if u23[6][1] then
                for _, v396 in u23[6] do
                    task.spawn(v396, v362, v369, v379, v382, v394)
                end
            else
                local v397 = u24[6]
                table.insert(v397, {
                    v362,
                    v369,
                    v379,
                    v382,
                    v394
                })
                if #u24[6] > 64 then
                    warn((("[ZAP] %* events in queue for BreakBlockEventZap. Did you forget to attach a listener?"):format(#u24[6])))
                end
            end
        elseif v30 == 7 then
            u11 = u11 + 1
            local v398 = u10[u11]
            local v399 = v398 ~= nil
            assert(v399)
            assert(v398:IsA("Model"))
            local v400 = u8
            local v401 = u9
            u9 = u9 + 8
            local v402 = buffer.readf64(v400, v401)
            local v403 = u8
            local v404 = u9
            u9 = u9 + 1
            local v405
            if buffer.readu8(v403, v404) == 1 then
                local v406 = u8
                local v407 = u9
                u9 = u9 + 2
                local v408 = buffer.readu16(v406, v407)
                local v409 = buffer.readstring
                local v410 = u8
                local v411 = u9
                u9 = u9 + v408
                v405 = v409(v410, v411, v408)
            else
                v405 = nil
            end
            local v412 = u8
            local v413 = u9
            u9 = u9 + 1
            local v414
            if buffer.readu8(v412, v413) == 1 then
                local v415 = u8
                local v416 = u9
                u9 = u9 + 1
                v414 = buffer.readu8(v415, v416) == 1
            else
                v414 = nil
            end
            if u23[7][1] then
                for _, v417 in u23[7] do
                    task.spawn(v417, v398, v402, v405, v414)
                end
            else
                local v418 = u24[7]
                table.insert(v418, {
                    v398,
                    v402,
                    v405,
                    v414
                })
                if #u24[7] > 64 then
                    warn((("[ZAP] %* events in queue for EntityHealEventZap. Did you forget to attach a listener?"):format(#u24[7])))
                end
            end
        elseif v30 == 8 then
            local v419 = u8
            local v420 = u9
            u9 = u9 + 2
            local v421 = buffer.readu16(v419, v420)
            local v422 = buffer.readstring
            local v423 = u8
            local v424 = u9
            u9 = u9 + v421
            local v425 = v422(v423, v424, v421)
            local v426 = u8
            local v427 = u9
            u9 = u9 + 2
            local v428 = buffer.readu16(v426, v427)
            local v429 = buffer.readstring
            local v430 = u8
            local v431 = u9
            u9 = u9 + v428
            local v432 = v429(v430, v431, v428)
            local v433 = u8
            local v434 = u9
            u9 = u9 + 2
            local v435 = buffer.readu16(v433, v434)
            local v436 = buffer.readstring
            local v437 = u8
            local v438 = u9
            u9 = u9 + v435
            local v439 = v436(v437, v438, v435)
            local v440 = u8
            local v441 = u9
            u9 = u9 + 8
            local v442 = buffer.readf64(v440, v441)
            local v443 = {}
            local v444 = u8
            local v445 = u9
            u9 = u9 + 1
            v443.shouldDisplay = buffer.readu8(v444, v445) == 1
            local v446 = u8
            local v447 = u9
            u9 = u9 + 1
            if buffer.readu8(v446, v447) == 1 then
                local v448 = u8
                local v449 = u9
                u9 = u9 + 1
                v443.permanentDisplay = buffer.readu8(v448, v449) == 1
            else
                v443.permanentDisplay = nil
            end
            local v450 = u8
            local v451 = u9
            u9 = u9 + 1
            local v452
            if buffer.readu8(v450, v451) == 1 then
                local v453 = Color3.fromRGB
                local v454 = u8
                local v455 = u9
                u9 = u9 + 1
                local v456 = buffer.readu8(v454, v455)
                local v457 = u8
                local v458 = u9
                u9 = u9 + 1
                local v459 = buffer.readu8(v457, v458)
                local v460 = u8
                local v461 = u9
                u9 = u9 + 1
                v452 = v453(v456, v459, (buffer.readu8(v460, v461)))
            else
                v452 = nil
            end
            local v462 = u8
            local v463 = u9
            u9 = u9 + 1
            local v464
            if buffer.readu8(v462, v463) == 1 then
                local v465 = Color3.fromRGB
                local v466 = u8
                local v467 = u9
                u9 = u9 + 1
                local v468 = buffer.readu8(v466, v467)
                local v469 = u8
                local v470 = u9
                u9 = u9 + 1
                local v471 = buffer.readu8(v469, v470)
                local v472 = u8
                local v473 = u9
                u9 = u9 + 1
                v464 = v465(v468, v471, (buffer.readu8(v472, v473)))
            else
                v464 = nil
            end
            local v474 = u8
            local v475 = u9
            u9 = u9 + 1
            local v476
            if buffer.readu8(v474, v475) == 1 then
                local v477 = u8
                local v478 = u9
                u9 = u9 + 4
                v476 = buffer.readf32(v477, v478)
            else
                v476 = nil
            end
            if u23[8][1] then
                for _, v479 in u23[8] do
                    task.spawn(v479, v425, v432, v439, v442, v443, v452, v464, v476)
                end
            else
                local v480 = u24[8]
                table.insert(v480, {
                    v425,
                    v432,
                    v439,
                    v442,
                    v443,
                    v452,
                    v464,
                    v476
                })
                if #u24[8] > 64 then
                    warn((("[ZAP] %* events in queue for AddMatchEventCountdownZap. Did you forget to attach a listener?"):format(#u24[8])))
                end
            end
        elseif v30 == 9 then
            local v481 = u8
            local v482 = u9
            u9 = u9 + 8
            local v483 = buffer.readf64(v481, v482)
            local v484 = u8
            local v485 = u9
            u9 = u9 + 2
            local v486 = buffer.readu16(v484, v485)
            local v487 = buffer.readstring
            local v488 = u8
            local v489 = u9
            u9 = u9 + v486
            local v490 = v487(v488, v489, v486)
            if u23[9][1] then
                for _, v491 in u23[9] do
                    task.spawn(v491, v483, v490)
                end
            else
                local v492 = u24[9]
                table.insert(v492, { v483, v490 })
                if #u24[9] > 64 then
                    warn((("[ZAP] %* events in queue for KitsUpdateEventZap. Did you forget to attach a listener?"):format(#u24[9])))
                end
            end
        elseif v30 == 10 then
            local v493 = u8
            local v494 = u9
            u9 = u9 + 1
            local v495 = buffer.readu8(v493, v494)
            local v496 = {}
            local v497 = u8
            local v498 = u9
            u9 = u9 + 2
            for v499 = 1, buffer.readu16(v497, v498) do
                local v500 = {}
                local v501 = u8
                local v502 = u9
                u9 = u9 + 2
                local v503 = buffer.readu16(v501, v502)
                local v504 = u8
                local v505 = u9
                u9 = u9 + 2
                local v506 = buffer.readu16(v504, v505)
                local v507 = u8
                local v508 = u9
                u9 = u9 + 2
                local v509 = buffer.readu16(v507, v508)
                v500.center = vector.create(v503, v506, v509)
                local v510 = u8
                local v511 = u9
                u9 = u9 + 1
                local v512 = buffer.readu8(v510, v511)
                local v513 = u8
                local v514 = u9
                u9 = u9 + 1
                local v515 = buffer.readu8(v513, v514)
                v500.radius = vector.create(v512, v515, 0)
                local v516 = u8
                local v517 = u9
                u9 = u9 + 1
                v500.box = buffer.readu8(v516, v517) == 1
                local v518 = u8
                local v519 = u9
                u9 = u9 + 1
                if buffer.readu8(v518, v519) == 1 then
                    local v520 = u8
                    local v521 = u9
                    u9 = u9 + 2
                    local v522 = buffer.readu16(v520, v521)
                    local v523 = buffer.readstring
                    local v524 = u8
                    local v525 = u9
                    u9 = u9 + v522
                    v500.whiteListTeamId = v523(v524, v525, v522)
                else
                    v500.whiteListTeamId = nil
                end
                v496[v499] = v500
            end
            local v526 = u24[10][v495]
            if v526 then
                task.spawn(v526, v496)
            end
            u24[10][v495] = nil
        else
            error("Unknown event id")
        end
    end
end)
table.freeze(v15)
local v562 = {
    ["SendEvents"] = v22,
    ["EntityDamageEventZap"] = {
        ["On"] = function(u527) --[[ Name: On, Line 721 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u24
            --]]
            local v528 = u23[0]
            table.insert(v528, u527)
            for _, v529 in u24[0] do
                task.spawn(u527, unpack(v529))
            end
            u24[0] = {}
            return function() --[[ Line: 751 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u527
                --]]
                table.remove(u23[0], table.find(u23[0], u527))
            end
        end
    },
    ["PickupItemEventZap"] = {
        ["On"] = function(u530) --[[ Name: On, Line 757 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u24
            --]]
            local v531 = u23[1]
            table.insert(v531, u530)
            for _, v532 in u24[1] do
                task.spawn(u530, unpack(v532))
            end
            u24[1] = {}
            return function() --[[ Line: 763 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u530
                --]]
                table.remove(u23[1], table.find(u23[1], u530))
            end
        end
    },
    ["ProjectileLaunchZap"] = {
        ["On"] = function(u533) --[[ Name: On, Line 769 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u24
            --]]
            local v534 = u23[2]
            table.insert(v534, u533)
            for _, v535 in u24[2] do
                task.spawn(u533, unpack(v535))
            end
            u24[2] = {}
            return function() --[[ Line: 780 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u533
                --]]
                table.remove(u23[2], table.find(u23[2], u533))
            end
        end
    },
    ["ProjectileImpactZap"] = {
        ["On"] = function(u536) --[[ Name: On, Line 786 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u24
            --]]
            local v537 = u23[3]
            table.insert(v537, u536)
            for _, v538 in u24[3] do
                task.spawn(u536, unpack(v538))
            end
            u24[3] = {}
            return function() --[[ Line: 792 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u536
                --]]
                table.remove(u23[3], table.find(u23[3], u536))
            end
        end
    },
    ["UpdateMapDataZap"] = {
        ["On"] = function(u539) --[[ Name: On, Line 798 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u24
            --]]
            local v540 = u23[4]
            table.insert(v540, u539)
            for _, v541 in u24[4] do
                task.spawn(u539, unpack(v541))
            end
            u24[4] = {}
            return function() --[[ Line: 809 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u539
                --]]
                table.remove(u23[4], table.find(u23[4], u539))
            end
        end
    },
    ["PlaceBlockEventZap"] = {
        ["On"] = function(u542) --[[ Name: On, Line 815 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u24
            --]]
            local v543 = u23[5]
            table.insert(v543, u542)
            for _, v544 in u24[5] do
                task.spawn(u542, unpack(v544))
            end
            u24[5] = {}
            return function() --[[ Line: 821 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u542
                --]]
                table.remove(u23[5], table.find(u23[5], u542))
            end
        end
    },
    ["BreakBlockEventZap"] = {
        ["On"] = function(u545) --[[ Name: On, Line 827 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u24
            --]]
            local v546 = u23[6]
            table.insert(v546, u545)
            for _, v547 in u24[6] do
                task.spawn(u545, unpack(v547))
            end
            u24[6] = {}
            return function() --[[ Line: 833 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u545
                --]]
                table.remove(u23[6], table.find(u23[6], u545))
            end
        end
    },
    ["EntityHealEventZap"] = {
        ["On"] = function(u548) --[[ Name: On, Line 839 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u24
            --]]
            local v549 = u23[7]
            table.insert(v549, u548)
            for _, v550 in u24[7] do
                task.spawn(u548, unpack(v550))
            end
            u24[7] = {}
            return function() --[[ Line: 845 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u548
                --]]
                table.remove(u23[7], table.find(u23[7], u548))
            end
        end
    },
    ["AddMatchEventCountdownZap"] = {
        ["On"] = function(u551) --[[ Name: On, Line 851 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u24
            --]]
            local v552 = u23[8]
            table.insert(v552, u551)
            for _, v553 in u24[8] do
                task.spawn(u551, unpack(v553))
            end
            u24[8] = {}
            return function() --[[ Line: 860 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u551
                --]]
                table.remove(u23[8], table.find(u23[8], u551))
            end
        end
    },
    ["KitsUpdateEventZap"] = {
        ["On"] = function(u554) --[[ Name: On, Line 866 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u24
            --]]
            local v555 = u23[9]
            table.insert(v555, u554)
            for _, v556 in u24[9] do
                task.spawn(u554, unpack(v556))
            end
            u24[9] = {}
            return function() --[[ Line: 872 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u554
                --]]
                table.remove(u23[9], table.find(u23[9], u554))
            end
        end
    },
    ["FetchMapDataFuncZap"] = {
        ["Call"] = function() --[[ Name: Call, Line 878 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u3
                [3] = u7
                [4] = u25
                [5] = u24
            --]]
            u14(1)
            local v557 = u3
            local v558 = u7
            buffer.writeu8(v557, v558, 0)
            u25 = u25 + 1
            u25 = u25 % 256
            if u24[10][u25] then
                u25 = u25 - 1
                error("Zap has more than 256 calls awaiting a response, and therefore this packet has been dropped")
            end
            u14(1)
            local v559 = u3
            local v560 = u7
            local v561 = u25
            buffer.writeu8(v559, v560, v561)
            u24[10][u25] = coroutine.running()
            return coroutine.yield()
        end
    }
}
return v562