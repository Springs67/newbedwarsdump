local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.Players
local u8 = v5.Workspace
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "team-util").getPlayerTeamId
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity").Entity
local v13 = {}
local u14 = setmetatable({}, {
    ["__index"] = v13
})
u14.ReceivesDamageAsPlayer = "ReceivesDamageAsPlayer"
v13.ReceivesDamageAsPlayer = "ReceivesDamageAsPlayer"
u14.DealsDamageAsPlayer = "DealsDamageAsPlayer"
v13.DealsDamageAsPlayer = "DealsDamageAsPlayer"
u14.DiesAsPlayer = "DiesAsPlayer"
v13.DiesAsPlayer = "DiesAsPlayer"
u14.KillsAsPlayer = "KillsAsPlayer"
v13.KillsAsPlayer = "KillsAsPlayer"
u14.ReceivesHealingAsPlayer = "ReceivesHealingAsPlayer"
v13.ReceivesHealingAsPlayer = "ReceivesHealingAsPlayer"
local v15 = {}
local u16 = setmetatable({}, {
    ["__index"] = v15
})
u16.PartialPlayerValue = "PartialPlayerValue"
v15.PartialPlayerValue = "PartialPlayerValue"
u16.FullPlayerValue = "FullPlayerValue"
v15.FullPlayerValue = "FullPlayerValue"
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 45 ]]
        return "EntityUtil"
    end
})
u17.__index = u17
function u17.new(...) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(_) --[[ Line: 54 ]] end
function u17.getEntity(u20, u21) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u11
        [4] = u6
        [5] = u10
        [6] = u12
    --]]
    local v22 = u20.entities[u21]
    if v22 then
        return v22
    else
        if u21.Parent == u8 and u21:IsA("Model") then
            local v23 = u7:FindFirstChild(u21.Name)
            local v24
            if v23 == nil then
                v24 = v23
            else
                v24 = v23:IsA("Player")
            end
            if v24 then
                local u25 = u11.new(v23, u21)
                u20.entities[u21] = u25
                u21.Destroying:Once(function() --[[ Line: 77 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                        [2] = u20
                        [3] = u21
                    --]]
                    u25:cleanup()
                    u20.entities[u21] = nil
                end)
                return u25
            end
        end
        if u21:IsA("Player") and u21.Character then
            if not u21.Character then
                return nil
            end
            if u20.entities[u21.Character] ~= nil then
                return u20.entities[u21.Character]
            end
            local u26 = u11.new(u21, u21.Character)
            u20.entities[u21.Character] = u26
            u21.Character.Destroying:Once(function() --[[ Line: 99 ]]
                --[[
                Upvalues:
                    [1] = u26
                    [2] = u20
                    [3] = u21
                --]]
                u26:cleanup()
                u20.entities[u21.Character] = nil
            end)
            return u26
        elseif u6:HasTag(u21, "inventory-entity") then
            local u27 = u10.new(u21)
            u20.entities[u21] = u27
            u21.Destroying:Once(function() --[[ Line: 114 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u20
                    [3] = u21
                --]]
                u27:cleanup()
                u20.entities[u21] = nil
            end)
            return u27
        elseif u6:HasTag(u21, "entity") then
            local v28 = u12.new(u21)
            u20.entities[u21] = v28
            u21.Destroying:Once(function() --[[ Line: 127 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u21
                --]]
                u20.entities[u21] = nil
            end)
            return v28
        elseif u21.Parent then
            return u20:getEntity(u21.Parent)
        else
            return nil
        end
    end
end
function u17.getEntities(p29) --[[ Line: 139 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4.values(p29.entities)
end
function u17.getPlayerFromEntity(_, p30) --[[ Line: 142 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u11
    --]]
    if u1.instanceof(p30, u11) then
        return p30:getPlayer()
    else
        return nil
    end
end
function u17.getPlayerFromEntityInstance(p31, p32) --[[ Line: 149 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u11
    --]]
    local v33 = p31:getEntity(p32)
    if u1.instanceof(v33, u11) then
        return v33:getPlayer()
    else
        return nil
    end
end
function u17.getLocalPlayerEntity(p34) --[[ Line: 157 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return p34:getEntity(u7.LocalPlayer)
end
function u17.getAllEntityInstances(_) --[[ Line: 160 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    return u6:GetTagged("entity")
end
function u17.getAliveEntityInstances(p35) --[[ Line: 163 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v36 = 0
    local v37 = {}
    for v38, v39 in p35:getAllEntityInstances() do
        local _ = v38 - 1
        local v40 = u17:getEntity(v39)
        if v40 ~= nil then
            v40 = v40:isAlive()
        end
        if v40 == true then
            v36 = v36 + 1
            v37[v36] = v39
        end
    end
    return v37
end
function u17.getAliveEnemyEntityInstances(p41, p42) --[[ Line: 184 ]]
    local v43 = 0
    local v44 = {}
    for v45, v46 in p41:getAliveEntityInstances() do
        local _ = v45 - 1
        local v47 = p41:getEntity(v46)
        local v48
        if v47 then
            v48 = p42:canAttack(v47) and true or false
        else
            v48 = false
        end
        if v48 == true then
            v43 = v43 + 1
            v44[v43] = v46
        end
    end
    return v44
end
function u17.getAlivePlayers(_) --[[ Line: 209 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u17
    --]]
    local v49 = 0
    local v50 = {}
    for v51, v52 in u7:GetPlayers() do
        local _ = v51 - 1
        local v53 = u17:getEntity(v52)
        if v53 ~= nil then
            v53 = v53:isAlive()
        end
        if v53 == true then
            v49 = v49 + 1
            v50[v49] = v52
        end
    end
    return v50
end
function u17.getAlivePlayerEntityInstances(p54) --[[ Line: 230 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u11
    --]]
    local v55 = 0
    local v56 = {}
    for v57, v58 in p54:getAliveEntityInstances() do
        local _ = v57 - 1
        if u1.instanceof(p54:getEntity(v58), u11) == true then
            v55 = v55 + 1
            v56[v55] = v58
        end
    end
    return v56
end
function u17.getAlivePlayerEntities(p59) --[[ Line: 249 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u11
    --]]
    local v60 = 0
    local v61 = {}
    for v62, v63 in p59:getAliveEntityInstances() do
        local _ = v62 - 1
        local v64 = p59:getEntity(v63)
        if not u1.instanceof(v64, u11) then
            v64 = nil
        end
        if v64 ~= nil then
            v60 = v60 + 1
            v61[v60] = v64
        end
    end
    return v61
end
function u17.getEntityFromDescendant(p65, p66) --[[ Line: 273 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    if p66 then
        if table.find(u6:GetTags(p66), "entity") == nil then
            return p65:getEntityFromDescendant(p66.Parent)
        else
            return p65:getEntity(p66)
        end
    else
        return nil
    end
end
function u17.getEntityInstanceFromDescendant(p67, p68) --[[ Line: 282 ]]
    local v69 = p67:getEntityFromDescendant(p68)
    if v69 then
        return v69:getInstance()
    else
        return nil
    end
end
function u17.getEntitiesNearPosition(p70, u71, u72, p73, p74) --[[ Line: 289 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    local u75 = p73 == nil and true or p73
    local u76 = p74 == nil and true or p74
    local v77 = p70:getAliveEntityInstances()
    local function v86(p78) --[[ Line: 297 ]]
        --[[
        Upvalues:
            [1] = u75
            [2] = u76
            [3] = u3
            [4] = u71
            [5] = u2
            [6] = u72
        --]]
        if not p78.PrimaryPart then
            return false
        end
        if not (u75 and u76) then
            local v79 = RaycastParams.new()
            v79.CollisionGroup = "Players"
            local v80 = u3:raycast(u71, p78.PrimaryPart.Position - u71, v79)
            local v81
            if v80 == nil then
                v81 = v80
            else
                v81 = v80.Instance
            end
            if v81 then
                local v82 = not u75
                if v82 then
                    local v83 = u2
                    local v84
                    if v80 == nil then
                        v84 = v80
                    else
                        v84 = v80.Instance
                    end
                    v82 = v83:getBlockInstanceFromChild(v84)
                end
                if v82 then
                    return false
                end
                local v85 = not u76
                if v85 then
                    if v80 ~= nil then
                        v80 = v80.Instance
                    end
                else
                    v80 = v85
                end
                if v80 then
                    return false
                end
            end
        end
        return (p78.PrimaryPart.Position - u71).Magnitude <= u72
    end
    local v87 = 0
    local v88 = {}
    for v89, v90 in v77 do
        if v86(v90, v89 - 1, v77) == true then
            v87 = v87 + 1
            v88[v87] = v90
        end
    end
    return v88
end
function u17.disableHitbox(_, p91) --[[ Line: 356 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
    --]]
    local v92 = 0
    local v93 = {}
    for v94, v95 in u8:GetDescendants() do
        local _ = v94 - 1
        if v95.Name == "hitbox-" .. p91.Name == true then
            v92 = v92 + 1
            v93[v92] = v95
        end
    end
    if #v93 > 1 then
        warn("Cannot disable hitbox of entity instance that is not uniquely identifiable by name: " .. p91.Name)
        return false
    end
    if #v93 <= 0 then
        warn("No hitbox found for entity instance: " .. p91.Name)
        return false
    end
    local v96 = v93[1]
    u3:setQueryIgnored(v96, true)
    v96:SetAttribute("IgnoreProjectileCollision", true)
    u3:setQueryIgnored(p91, true)
    p91:SetAttribute("IgnoreProjectileCollision", true)
    for _, v97 in p91:GetChildren() do
        u3:setQueryIgnored(v97, true)
        v97:SetAttribute("IgnoreProjectileCollision", true)
    end
    return true
end
function u17.enableHitbox(_, p98) --[[ Line: 393 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u6
    --]]
    local v99 = 0
    local v100 = {}
    for v101, v102 in u8:GetDescendants() do
        local _ = v101 - 1
        if v102.Name == "hitbox-" .. p98.Name == true then
            v99 = v99 + 1
            v100[v99] = v102
        end
    end
    if #v100 > 1 then
        warn("Cannot enable hitbox of entity instance that is not uniquely identifiable by name: " .. p98.Name)
        return false
    end
    if #v100 <= 0 then
        warn("No hitbox found for entity instance: " .. p98.Name)
        return false
    end
    local v103 = v100[1]
    u3:setQueryIgnored(v103, false)
    v103:SetAttribute("IgnoreProjectileCollision", false)
    u6:RemoveTag(v103, "ProjectilesIgnored")
    u3:setQueryIgnored(p98, false)
    p98:SetAttribute("IgnoreProjectileCollision", false)
    u6:RemoveTag(p98, "ProjectilesIgnored")
    for _, v104 in p98:GetChildren() do
        u3:setQueryIgnored(v104, false)
        v104:SetAttribute("IgnoreProjectileCollision", false)
        u6:RemoveTag(v104, "ProjectilesIgnored")
    end
    return true
end
function u17.getEntityTeamId(_, p105) --[[ Line: 433 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u11
        [3] = u9
    --]]
    if u1.instanceof(p105, u11) then
        return u9(p105:getPlayer())
    else
        local v106 = p105:getInstance()
        if v106 then
            return v106:GetAttribute("Team")
        else
            return nil
        end
    end
end
function u17.isEntityOnSameTeamAsPlayer(p107, p108, p109) --[[ Line: 444 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if p109 then
        return p107:getEntityTeamId(p108) == u9(p109)
    else
        return false
    end
end
function u17.entityIsAPlayer(_, p110) --[[ Line: 452 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u11
    --]]
    return u1.instanceof(p110, u11)
end
function u17.entityInstanceIsAPlayer(p111, p112) --[[ Line: 455 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u11
    --]]
    return u1.instanceof(p111:getEntity(p112), u11)
end
function u17.getAttributeFromPlayerOrNonPlayerEntity(_, p113, p114) --[[ Line: 458 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u11
    --]]
    if u1.instanceof(p113, u11) then
        return p113:getPlayer():GetAttribute(p114)
    elseif p113:getInstance() then
        return p113:getInstance():GetAttribute(p114)
    else
        return nil
    end
end
function u17.entityHasAsPlayerAttributeOrIsPlayer(_, p115, p116) --[[ Line: 466 ]]
    return p115:isPlayer() and true or p115:getInstance():GetAttribute(p116)
end
function u17.entityHasAsPlayerAttributesOrIsPlayer(_, p117, p118) --[[ Line: 472 ]]
    if p117:isPlayer() then
        return true
    end
    for _, v119 in p118 do
        local v120 = p117:getInstance():GetAttribute(v119)
        if v120 == 0 or (v120 ~= v120 or (v120 == "" or not v120)) then
            return false
        end
    end
    return true
end
function u17.getEntityAsPlayerAttributeTier(_, p121, p122) --[[ Line: 484 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    if p121:isPlayer() then
        return u16.FullPlayerValue
    else
        return p121:getInstance():GetAttribute(p122 .. "Tier")
    end
end
function u17.setEntityWithAsPlayerAttributes(_, p123, p124) --[[ Line: 490 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u12
    --]]
    if u1.instanceof(p123, u12) then
        p123 = p123:getInstance()
    end
    if not p123 then
        return nil
    end
    for _, v125 in p124 do
        p123:SetAttribute(v125.attributeType, true)
        p123:SetAttribute(v125.attributeType .. "Tier", v125.tier)
    end
end
function u17.entityReceivesDamageAsPlayer(p126, p127) --[[ Line: 505 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return p126:getEntityAsPlayerAttributeTier(p127, u14.ReceivesDamageAsPlayer) ~= nil
end
function u17.getEntityReceivesDamageAsPlayerTier(p128, p129) --[[ Line: 508 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return p128:getEntityAsPlayerAttributeTier(p129, u14.ReceivesDamageAsPlayer)
end
function u17.entityDealsDamageAsPlayer(p130, p131) --[[ Line: 511 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return p130:getEntityAsPlayerAttributeTier(p131, u14.DealsDamageAsPlayer) ~= nil
end
function u17.getEntityDealsDamageAsPlayerTier(p132, p133) --[[ Line: 514 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return p132:getEntityAsPlayerAttributeTier(p133, u14.DealsDamageAsPlayer)
end
function u17.entityDiesAsPlayer(p134, p135) --[[ Line: 517 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return p134:getEntityAsPlayerAttributeTier(p135, u14.DiesAsPlayer) ~= nil
end
function u17.getEntityDiesAsPlayerTier(p136, p137) --[[ Line: 520 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return p136:getEntityAsPlayerAttributeTier(p137, u14.DiesAsPlayer)
end
function u17.entityKillsAsPlayer(p138, p139) --[[ Line: 523 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return p138:getEntityAsPlayerAttributeTier(p139, u14.KillsAsPlayer) ~= nil
end
function u17.getEntityKillsAsPlayerTier(p140, p141) --[[ Line: 526 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return p140:getEntityAsPlayerAttributeTier(p141, u14.KillsAsPlayer)
end
function u17.entityReceivesHealingAsPlayer(p142, p143) --[[ Line: 529 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return p142:getEntityAsPlayerAttributeTier(p143, u14.ReceivesHealingAsPlayer) ~= nil
end
function u17.getEntityReceivesHealingAsPlayerTier(p144, p145) --[[ Line: 532 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return p144:getEntityAsPlayerAttributeTier(p145, u14.ReceivesHealingAsPlayer)
end
function u17.getAllPlayersWithAnyBodyPartsTouchingObject(_, p146) --[[ Line: 535 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u8
        [3] = u7
    --]]
    local v147 = u17:getAlivePlayers()
    local u148 = {}
    local function v158(p149) --[[ Line: 538 ]]
        --[[
        Upvalues:
            [1] = u148
        --]]
        local v150 = p149.Character
        if v150 == nil then
            return nil
        end
        local v151 = 0
        local v152 = {}
        for v153, v154 in v150:GetChildren() do
            local _ = v153 - 1
            if v154:IsA("MeshPart") == true then
                v151 = v151 + 1
                v152[v151] = v154
            end
        end
        for v155, v156 in v152 do
            local _ = v155 - 1
            local v157 = u148
            table.insert(v157, v156)
        end
    end
    for v159, v160 in v147 do
        v158(v160, v159 - 1, v147)
    end
    local v161 = OverlapParams.new()
    v161.FilterDescendantsInstances = u148
    v161.FilterType = Enum.RaycastFilterType.Include
    local v162 = {}
    for v163, v164 in u8:GetPartsInPart(p146, v161) do
        local _ = v163 - 1
        local v165 = u7:GetPlayerFromCharacter((v164:FindFirstAncestorOfClass("Model")))
        if v165 then
            if v162[v165] == nil then
                v162[v165] = true
            end
        end
    end
    return v162
end
function u17.canPlayerSeeEntity(_, p166, p167) --[[ Line: 590 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
    --]]
    local v168 = p166.Character
    if not v168 then
        return false
    end
    if not p167 then
        return false
    end
    local v169 = v168:FindFirstChildWhichIsA("Humanoid")
    if v169 ~= nil then
        v169 = v169:FindFirstChild("BodyHeightScale")
    end
    if v169 ~= nil then
        v169 = v169.Value
    end
    local v170 = 5 * (v169 == nil and 1 or v169)
    local v171
    if v168.PrimaryPart then
        local v172 = v168:FindFirstChildWhichIsA("Humanoid")
        local v173 = not v172 and 0 or v172.HipHeight
        local v174 = v168.PrimaryPart.Position
        local v175 = -1 * (v173 + v168.PrimaryPart.Size.Y / 2)
        v171 = v174 + Vector3.new(0, v175, 0)
    else
        v171 = nil
    end
    local v176 = p167:getInstance()
    local v177
    if v176.PrimaryPart then
        local v178 = v176:FindFirstChildWhichIsA("Humanoid")
        local v179 = not v178 and 0 or v178.HipHeight
        local v180 = v176.PrimaryPart.Position
        local v181 = -1 * (v179 + v176.PrimaryPart.Size.Y / 2)
        v177 = v180 + Vector3.new(0, v181, 0)
    else
        v177 = nil
    end
    if not (v171 and v177) then
        return false
    end
    local v182 = v171 + Vector3.new(0, v170, 0)
    local v183 = v177 + Vector3.new(0, v170, 0)
    local v184 = { v168, p167:getInstance() }
    local v185 = #v184
    local v186 = u6:GetTagged("DontBlockSwordRaycast")
    table.move(v186, 1, #v186, v185 + 1, v184)
    local v187 = RaycastParams.new()
    v187.FilterDescendantsInstances = v184
    v187.FilterType = Enum.RaycastFilterType.Blacklist
    local v188 = u3:raycast(v171, v177 - v171, v187) ~= nil
    if not v188 then
        local v189 = RaycastParams.new()
        v189.FilterDescendantsInstances = v184
        v189.FilterType = Enum.RaycastFilterType.Blacklist
        v188 = u3:raycast(v177, v171 - v177, v189) ~= nil
    end
    local v190 = not v188
    if not v190 then
        local v191 = RaycastParams.new()
        v191.FilterDescendantsInstances = v184
        v191.FilterType = Enum.RaycastFilterType.Blacklist
        local v192 = u3:raycast(v182, v183 - v182, v191) ~= nil
        if not v192 then
            local v193 = RaycastParams.new()
            v193.FilterDescendantsInstances = v184
            v193.FilterType = Enum.RaycastFilterType.Blacklist
            v192 = u3:raycast(v183, v182 - v183, v193) ~= nil
        end
        v190 = not v192
        if not v190 then
            local v194 = (v171 + v182) / 2
            local v195 = (v177 + v183) / 2
            local v196 = RaycastParams.new()
            v196.FilterDescendantsInstances = v184
            v196.FilterType = Enum.RaycastFilterType.Blacklist
            local v197 = u3:raycast(v194, v195 - v194, v196) ~= nil
            if not v197 then
                local v198 = RaycastParams.new()
                v198.FilterDescendantsInstances = v184
                v198.FilterType = Enum.RaycastFilterType.Blacklist
                v197 = u3:raycast(v195, v194 - v195, v198) ~= nil
            end
            v190 = not v197
        end
    end
    return v190
end
u17.entities = {}
return {
    ["EntityAsPlayerAttributeType"] = u14,
    ["EntityAsPlayerAttributeTier"] = u16,
    ["EntityUtil"] = u17
}