local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "select", "block-selector").BlockSelectorMode
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u6 = v5.DeviceUtil
local u7 = v5.OfflinePlayerUtil
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = v8.Signal
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u17 = v16.ContextActionService
local u18 = v16.Players
local u19 = v16.Workspace
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u26 = v1.import(script, script.Parent.Parent, "worldedit", "region-highlight").RegionHighlight
local u27 = v1.import(script, script.Parent.Parent, "worldedit", "worldedit-position-hud").WorldToolPositionHUD
local u28 = v1.import(script, script.Parent, "world-guard-region-billboard").WorldGuardRegionNametag
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 40 ]]
        return "WorldGuardController"
    end,
    ["__index"] = u21
})
u29.__index = u29
function u29.new(...) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u25
        [3] = u13
        [4] = u11
    --]]
    u21.constructor(p32)
    p32.Name = "WorldGuardController"
    p32.worldGuardRemotes = u25.Client:GetNamespace("WorldGuard")
    p32.contextActionMaid = u13.new()
    p32.positionHudMaid = u13.new()
    p32.positionHUDTree = nil
    p32.regionUpdateSignal = u11.new()
    p32.modifyingPos1 = false
    p32.modifyingPos2 = false
    p32.modifyingRegionId = nil
    p32.pos1 = nil
    p32.temporaryPos1Highlight = nil
    p32.regionBlockCoordMap = {}
    p32.regionAllowListMap = {}
    p32.allRegionHighlightMap = {}
    p32.regionPartMap = {}
    p32.regionPromptMap = {}
    p32.regionNametagVisibilityMap = {}
end
function u29.KnitStart(u33) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.KnitStart(u33)
    u33.worldGuardRemotes:Get("RegionUpdate"):Connect(function(p34) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        if not u33.regionAllowListMap[p34.regionId] then
            u33.regionAllowListMap[p34.regionId] = {}
        end
        local v35 = {
            ["blockPos1"] = p34.blockPos1,
            ["blockPos2"] = p34.blockPos2
        }
        u33.regionBlockCoordMap[p34.regionId] = v35
        u33.regionUpdateSignal:Fire(p34.regionId, v35)
    end)
    u33.regionUpdateSignal:Connect(function(p36, p37) --[[ Line: 91 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:updateRegionHighlights(p36, p37)
        u33:updatePromptAndNametag(p36, p37)
        if u33:isEnabled() then
            u33:displayPositionHUD(p36, p37)
        end
    end)
    u33.worldGuardRemotes:Get("BulkUpdateRegions"):Connect(function(p38) --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        local function v52(p39) --[[ Line: 104 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            local v40 = p39.blockPos1.x
            local v41 = p39.blockPos1.y
            local v42 = p39.blockPos1.z
            local v43 = Vector3.new(v40, v41, v42)
            local v44 = p39.blockPos2.x
            local v45 = p39.blockPos2.y
            local v46 = p39.blockPos2.z
            local v47 = {
                ["blockPos1"] = v43,
                ["blockPos2"] = Vector3.new(v44, v45, v46)
            }
            u33.regionBlockCoordMap[p39.regionId] = v47
            local v48 = u33.regionAllowListMap
            local v49 = p39.regionId
            local v50 = {}
            for _, v51 in p39.addedPlayers do
                v50[v51] = true
            end
            v48[v49] = v50
            u33:updateRegionHighlights(p39.regionId, v47)
            u33:updatePromptAndNametag(p39.regionId, v47)
        end
        for v53, v54 in p38 do
            v52(v54, v53 - 1, p38)
        end
    end)
    u33.worldGuardRemotes:Get("RegionDeleted"):Connect(function(p55) --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:deleteRegion(p55.regionId)
    end)
    u33.worldGuardRemotes:Get("PlayerAdded"):Connect(function(p56) --[[ Line: 134 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        local v57 = p56.regionId
        local v58 = p56.userId
        local v59 = u33.regionAllowListMap[v57] or {}
        v59[v58] = true
        u33.regionAllowListMap[v57] = v59
    end)
    u33.worldGuardRemotes:Get("PlayerRemoved"):Connect(function(p60) --[[ Line: 141 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        local v61 = p60.regionId
        local v62 = p60.userId
        local v63 = u33.regionAllowListMap[v61]
        if v63 ~= nil then
            v63[v62] = nil
        end
    end)
end
function u29.isRelevantItem(_, p64) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    return p64.itemType == u24.WORLD_GUARD_WAND
end
function u29.onEnable(u65, _) --[[ Line: 153 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u17
        [3] = u20
        [4] = u4
        [5] = u3
        [6] = u2
        [7] = u26
        [8] = u23
    --]]
    if not u10.Controllers.GamemodeController:isLocalPlayerInCreativeMode() then
        return nil
    end
    for _, v66 in u65.allRegionHighlightMap do
        v66.pos1:enable()
        v66.pos2:enable()
        v66.overall:enable()
    end
    for _, v67 in u65.regionPromptMap do
        v67.Enabled = true
        local _ = v67.Enabled
    end
    for _, v68 in u65.regionNametagVisibilityMap do
        v68(true)
    end
    u17:BindActionAtPriority("world-guard-wand-left-click", function(_, p69, _) --[[ Line: 181 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u4
            [3] = u3
            [4] = u65
            [5] = u2
            [6] = u26
            [7] = u23
        --]]
        if p69 == Enum.UserInputState.Begin then
            local v70 = u20:getBlockSelector():getMouseInfo(u4.SELECT)
            local v71
            if v70 == nil then
                v71 = v70
            else
                v71 = v70.target
            end
            if v71 then
                local v72 = v70.target
                if not u3:getStore():getBlockAt(v72.blockRef.blockPosition) then
                    return nil
                end
                local v73 = v72.blockRef.blockPosition
                local v74, v75
                if u65:isInAnyRegion(v73) then
                    v74 = u65:isPos1CornerOfExistingRegion(v73)
                    v75 = u65:isPos2CornerOfExistingRegion(v73)
                else
                    v74 = nil
                    v75 = nil
                end
                local v76 = u65.modifyingPos1
                if v76 then
                    v76 = u65.modifyingRegionId
                end
                if v76 ~= "" and v76 then
                    u65.worldGuardRemotes:Get("SetPosition1"):CallServer(u65.modifyingRegionId, v73)
                    u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                        ["message"] = "[WG]: POS1 of region " .. u65.modifyingRegionId .. " moved to " .. tostring(v73)
                    })
                    u65.modifyingPos1 = false
                    u65.modifyingRegionId = nil
                    return nil
                end
                local v77 = u65.modifyingPos2
                if v77 then
                    v77 = u65.modifyingRegionId
                end
                if v77 ~= "" and v77 then
                    u65.worldGuardRemotes:Get("SetPosition2"):CallServer(u65.modifyingRegionId, v73)
                    u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                        ["message"] = "[WG]: POS2 of region " .. u65.modifyingRegionId .. " moved to " .. tostring(v73)
                    })
                    u65.modifyingPos2 = false
                    u65.modifyingRegionId = nil
                    return nil
                end
                if v74 ~= "" and v74 then
                    u65.modifyingPos1 = true
                    u65.modifyingRegionId = v74
                    u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                        ["message"] = "[WG]: Moving POS1 of region " .. u65.modifyingRegionId
                    })
                    return nil
                end
                if v75 ~= "" and v75 then
                    u65.modifyingPos2 = true
                    u65.modifyingRegionId = v75
                    u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                        ["message"] = "[WG]: Moving POS2 of region " .. u65.modifyingRegionId
                    })
                    return nil
                end
                if u65.pos1 then
                    u65.worldGuardRemotes:Get("CreateRegion"):CallServer(u65.pos1, v73)
                    u65.pos1 = nil
                    local v78 = u65.temporaryPos1Highlight
                    if v78 ~= nil then
                        v78:destroy()
                    end
                    u65.temporaryPos1Highlight = nil
                    return nil
                end
                u65.pos1 = v73
                local v79 = u65
                local v80 = u26.new
                local v81 = u3:getWorldPosition(v73)
                local v82 = u3:getWorldPosition(v73)
                local v83 = {
                    ["name"] = "TempHighlightPos1",
                    ["selectionBox"] = {
                        ["Transparency"] = 0,
                        ["LineThickness"] = 0.06,
                        ["Color3"] = Color3.fromRGB(255, 227, 77),
                        ["SurfaceColor3"] = Color3.fromRGB(209, 186, 59)
                    },
                    ["extraSizeIncrement"] = u23 + 0.01
                }
                v79.temporaryPos1Highlight = v80(v81, v82, v83)
                return nil
            end
        end
        return Enum.ContextActionResult.Pass
    end, false, 5000, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2, Enum.UserInputType.Touch)
    u65.contextActionMaid:GiveTask(function() --[[ Line: 280 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17:UnbindAction("world-guard-wand-left-click")
    end)
end
function u29.onDisable(p84) --[[ Line: 284 ]]
    p84.contextActionMaid:DoCleaning()
    p84.modifyingPos1 = false
    p84.modifyingPos2 = false
    p84.modifyingRegionId = nil
    p84.pos1 = nil
    local v85 = p84.temporaryPos1Highlight
    if v85 ~= nil then
        v85:destroy()
    end
    p84.temporaryPos1Highlight = nil
    p84.positionHudMaid:DoCleaning()
    for _, v86 in p84.allRegionHighlightMap do
        v86.pos1:disable()
        v86.pos2:disable()
        v86.overall:disable()
    end
    for _, v87 in p84.regionPromptMap do
        v87.Enabled = false
        local _ = v87.Enabled
    end
    for _, v88 in p84.regionNametagVisibilityMap do
        v88(false)
    end
end
function u29.requestRenameRegion(p89, p90, p91) --[[ Line: 325 ]]
    return p89.worldGuardRemotes:Get("RequestRenameRegion"):CallServer(p90, p91)
end
function u29.requestAddPlayer(p92, p93, p94) --[[ Line: 329 ]]
    return p92.worldGuardRemotes:Get("RequestAddPlayer"):CallServer(p93, p94)
end
function u29.requestRemovePlayer(p95, p96, p97) --[[ Line: 333 ]]
    return p95.worldGuardRemotes:Get("RequestRemovePlayer"):CallServer(p96, p97)
end
function u29.requestRegionDeletion(p98, p99) --[[ Line: 337 ]]
    return p98.worldGuardRemotes:Get("RequestDeleteRegion"):CallServer(p99)
end
function u29.openRegionMenu(p100, u101) --[[ Line: 341 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
        [3] = u2
        [4] = u22
    --]]
    local v102 = u12
    local v103 = p100.regionAllowListMap[u101]
    local v104 = v103 == nil and {} or v103
    local v105 = v102.keys(v104)
    if #v105 > 0 then
        u7.getOfflinePlayersByUserIds(v105):andThen(function(p106) --[[ Line: 352 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u22
                [3] = u101
            --]]
            local v107 = {
                ["RegionId"] = u101,
                ["AddedOfflinePlayers"] = p106
            }
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u22.WORLD_GUARD_MENU, v107)
        end)
    else
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u22.WORLD_GUARD_MENU, {
            ["RegionId"] = u101,
            ["AddedOfflinePlayers"] = {}
        })
    end
end
function u29.isInAnyRegion(p108, p109) --[[ Line: 366 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v110 = nil
    for v111, v112 in u12.entries(p108.regionBlockCoordMap) do
        local _ = v111 - 1
        if p108:isInRegion(v112[1], p109) == true then
            v110 = v112
            break
        end
    end
    return v110 ~= nil
end
function u29.isInRegion(p113, p114, p115) --[[ Line: 383 ]]
    local v116 = p113.regionBlockCoordMap[p114]
    if not v116 then
        return false
    end
    local v117 = v116.blockPos1
    local v118 = v116.blockPos2
    local v119 = v117.X
    local v120 = v118.X
    local v121 = math.min(v119, v120)
    local v122 = v117.X
    local v123 = v118.X
    local v124 = math.max(v122, v123)
    local v125 = v117.Y
    local v126 = v118.Y
    local v127 = math.min(v125, v126)
    local v128 = v117.Y
    local v129 = v118.Y
    local v130 = math.max(v128, v129)
    local v131 = v117.Z
    local v132 = v118.Z
    local v133 = math.min(v131, v132)
    local v134 = v117.Z
    local v135 = v118.Z
    local v136 = math.max(v134, v135)
    local v137 = v121 <= p115.X
    local v138 = p115.X <= v124
    local v139 = v127 <= p115.Y
    local v140 = p115.Y <= v130
    local v141 = v133 <= p115.Z
    local v142 = p115.Z <= v136
    if v137 then
        if v138 then
            if v139 then
                if v140 then
                    v140 = v141 and v142
                end
            else
                v140 = v139
            end
        else
            v140 = v138
        end
    else
        v140 = v137
    end
    return v140
end
function u29.isPos1CornerOfExistingRegion(p143, p144) --[[ Line: 407 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v145 = nil
    for v146, v147 in u12.entries(p143.regionBlockCoordMap) do
        local _ = v146 - 1
        local _ = v147[1]
        if v147[2].blockPos1 == p144 == true then
            v145 = v147
            break
        end
    end
    if v145 ~= nil then
        v145 = v145[1]
    end
    return v145
end
function u29.isPos2CornerOfExistingRegion(p148, p149) --[[ Line: 429 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v150 = nil
    for v151, v152 in u12.entries(p148.regionBlockCoordMap) do
        local _ = v151 - 1
        local _ = v152[1]
        if v152[2].blockPos2 == p149 == true then
            v150 = v152
            break
        end
    end
    if v150 ~= nil then
        v150 = v150[1]
    end
    return v150
end
function u29.getCenterPositionOfRegion(_, p153, p154) --[[ Line: 451 ]]
    local v155 = (p153.X + p154.X) / 2
    local v156 = (p153.Y + p154.Y) / 2
    local v157 = (p153.Z + p154.Z) / 2
    return Vector3.new(v155, v156, v157)
end
function u29.deleteRegion(p158, p159) --[[ Line: 454 ]]
    p158.regionBlockCoordMap[p159] = nil
    local v160 = p158.allRegionHighlightMap[p159]
    if v160 then
        v160.pos1:destroy()
        v160.pos2:destroy()
        v160.overall:destroy()
        p158.allRegionHighlightMap[p159] = nil
    end
    local v161 = p158.regionPartMap[p159]
    if v161 ~= nil then
        v161:Destroy()
    end
    p158.regionPartMap[p159] = nil
    p158.regionPromptMap[p159] = nil
    p158.regionNametagVisibilityMap[p159] = nil
    p158.positionHudMaid:DoCleaning()
    p158.regionAllowListMap[p159] = nil
end
function u29.displayPositionHUD(u162, p163, p164) --[[ Line: 489 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u27
        [3] = u18
    --]]
    local v165 = p164.blockPos1
    local v166 = p164.blockPos2
    local v167 = v165.X - v166.X
    local v168 = math.abs(v167)
    local v169 = v165.Y - v166.Y
    local v170 = math.abs(v169)
    local v171 = v165.Z - v166.Z
    local v172 = math.abs(v171)
    local v173 = Vector3.new(v168, v170, v172)
    if u162.positionHUDTree then
        u15.update(u162.positionHUDTree, u15.createElement(u27, {
            ["Label"] = "[World Guard] Region " .. p163,
            ["Pos1Color"] = Color3.fromRGB(255, 227, 77),
            ["Pos2Color"] = Color3.fromRGB(66, 201, 219),
            ["SizeColor"] = Color3.fromRGB(255, 115, 176),
            ["Pos1"] = v165,
            ["Pos2"] = v166,
            ["Size"] = v173
        }))
    else
        u162.positionHUDTree = u15.mount(u15.createElement(u27, {
            ["Label"] = "[World Guard] Region " .. p163,
            ["Pos1Color"] = Color3.fromRGB(255, 227, 77),
            ["Pos2Color"] = Color3.fromRGB(66, 201, 219),
            ["SizeColor"] = Color3.fromRGB(255, 115, 176),
            ["Pos1"] = v165,
            ["Pos2"] = v166,
            ["Size"] = v173
        }), u18.LocalPlayer:WaitForChild("PlayerGui"))
        u162.positionHudMaid:GiveTask(function() --[[ Line: 514 ]]
            --[[
            Upvalues:
                [1] = u162
                [2] = u15
            --]]
            if u162.positionHUDTree then
                u15.unmount(u162.positionHUDTree)
                u162.positionHUDTree = nil
            end
        end)
    end
end
function u29.updateRegionHighlights(p174, p175, p176) --[[ Line: 522 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u26
        [3] = u23
    --]]
    local v177 = u3:getWorldPosition(p176.blockPos1)
    local v178 = u3:getWorldPosition(p176.blockPos2)
    local v179 = p174.allRegionHighlightMap[p175]
    if v179 then
        v179.pos1:updateRegion(v177, v177)
        v179.pos2:updateRegion(v178, v178)
        v179.overall:updateRegion(v177, v178)
    else
        local v180 = u26.new
        local v181 = {
            ["decalTexture"] = "rbxassetid://15949352446",
            ["selectionBox"] = {
                ["Transparency"] = 0,
                ["LineThickness"] = 0.06,
                ["Color3"] = Color3.fromRGB(255, 227, 77),
                ["SurfaceColor3"] = Color3.fromRGB(209, 186, 59)
            },
            ["extraSizeIncrement"] = u23 + 0.01,
            ["name"] = "WorldGuardHighlightPos1_" .. p175
        }
        local v182 = v180(v177, v177, v181)
        local v183 = u26.new
        local v184 = {
            ["decalTexture"] = "rbxassetid://15949352446",
            ["selectionBox"] = {
                ["Transparency"] = 0,
                ["LineThickness"] = 0.06,
                ["Color3"] = Color3.fromRGB(66, 201, 219),
                ["SurfaceColor3"] = Color3.fromRGB(48, 150, 163)
            },
            ["extraSizeIncrement"] = u23 + 0.01,
            ["name"] = "WorldGuardHighlightPos2_" .. p175
        }
        local v185 = v183(v178, v178, v184)
        local v186 = u26.new
        local v187 = {
            ["selectionBox"] = {
                ["Transparency"] = 0,
                ["LineThickness"] = 0.06,
                ["Color3"] = Color3.fromRGB(255, 115, 176),
                ["SurfaceColor3"] = Color3.fromRGB(189, 74, 122)
            },
            ["extraSizeIncrement"] = u23,
            ["name"] = "WorldGuardHighlightRegion_" .. p175
        }
        local v188 = v186(v177, v178, v187)
        if p174:isEnabled() then
            v182:enable()
            v185:enable()
            v188:enable()
        else
            v182:disable()
            v185:disable()
            v188:disable()
        end
        p174.allRegionHighlightMap[p175] = {
            ["pos1"] = v182,
            ["pos2"] = v185,
            ["overall"] = v188
        }
    end
end
function u29.updatePromptAndNametag(u189, u190, p191) --[[ Line: 585 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u14
        [3] = u19
        [4] = u10
        [5] = u6
        [6] = u18
        [7] = u15
        [8] = u28
    --]]
    local v192 = u189:getCenterPositionOfRegion(u3:getWorldPosition(p191.blockPos1), (u3:getWorldPosition(p191.blockPos2)))
    local v193 = u189.regionPartMap[u190]
    if v193 then
        v193:PivotTo(CFrame.new(v192))
    else
        local v194 = u14("Part", {
            ["Size"] = Vector3.new(1, 1, 1),
            ["Anchored"] = true,
            ["CanCollide"] = false,
            ["CanTouch"] = false,
            ["CanQuery"] = false,
            ["Transparency"] = 1,
            ["Name"] = "WorldGuardRegion_" .. u190,
            ["Color"] = Color3.fromRGB(255, 115, 176),
            ["CFrame"] = CFrame.new(v192),
            ["Parent"] = u19
        })
        u189.regionPartMap[u190] = v194
        local v195 = u10.Controllers.ProximityPromptController:createProximityPrompt({
            ["ActionText"] = "Configure Region",
            ["HoldDuration"] = 0,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 14,
            ["ObjectText"] = "ID: " .. u190,
            ["Parent"] = v194,
            ["ClickablePrompt"] = u6.isMobileControls()
        })
        v195.Triggered:Connect(function(p196) --[[ Line: 619 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u189
                [3] = u190
            --]]
            if p196 ~= u18.LocalPlayer then
                return nil
            end
            u189:openRegionMenu(u190)
        end)
        v195.Enabled = u189:isEnabled()
        u189.regionPromptMap[u190] = v195
        local v197, u198 = u15.createBinding(u189:isEnabled())
        u15.mount(u15.createElement(u28, {
            ["regionId"] = u190,
            ["adornee"] = v194,
            ["visible"] = v197
        }), v194)
        u189.regionNametagVisibilityMap[u190] = u198
        v195.PromptHidden:Connect(function() --[[ Line: 640 ]]
            --[[
            Upvalues:
                [1] = u198
                [2] = u189
            --]]
            u198(u189:isEnabled())
        end)
        v195.PromptShown:Connect(function() --[[ Line: 644 ]]
            --[[
            Upvalues:
                [1] = u198
            --]]
            u198(false)
        end)
    end
end
v9.CreateController(u29.new())
return nil