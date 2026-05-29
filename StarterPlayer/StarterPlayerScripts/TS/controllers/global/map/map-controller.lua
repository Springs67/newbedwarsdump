local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "block-engine-client-events").BlockEngineClientEvents
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.OfflinePlayerUtil
local u6 = v4.SoundManager
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.RunService
local u14 = v11.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent, "game", "spectate", "map-credits-billboard").MapCreditsBillboard
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local v17 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "network")
local u18 = v17.FetchMapDataFuncZap
local u19 = v17.UpdateMapDataZap
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "custom-match", "custom-match-role").CustomMatchRole
local v22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-meta")
local u23 = v22.getMapMeta
local u24 = v22.getMapName
local u25 = v22.getMapType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").HostPanelToggleValue
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 35 ]]
        return "MapController"
    end,
    ["__index"] = u16
})
u29.__index = u29
function u29.new(...) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32, ...) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u14
    --]]
    u16.constructor(p32, ...)
    p32.Name = "MapController"
    p32.mapCFrames = u14:WaitForChild("MapCFrames")
    p32.denyRegions = {}
end
function u29.KnitStart(u33) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u6
        [4] = u27
        [5] = u19
        [6] = u28
        [7] = u18
        [8] = u23
        [9] = u25
        [10] = u24
    --]]
    u3.PlaceBlock:connect(function(p34) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u6
            [3] = u27
        --]]
        if u8.Controllers.MapController:isInDenyRegion(p34.blockPosition) or u8.Controllers.MapController:isOutOfBounds(p34.blockPosition) then
            u6:playSound(u27.UI_ERROR)
            p34:setCancelled(true)
            return nil
        end
    end)
    u19.On(function(p35, p36) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        if p36 then
            for v37, v38 in p35 do
                local _ = v37 - 1
                local v39 = u33.denyRegions
                table.insert(v39, v38)
                local _ = #v39
            end
        else
            u33.denyRegions = p35
        end
    end)
    if u28.isGameServer() then
        u33.denyRegions = u18.Call()
        task.spawn(function() --[[ Line: 80 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u23
                [3] = u25
                [4] = u24
            --]]
            local v40 = u33:waitForMapName()
            local v41 = u23(v40)
            local v42 = u25(v40)
            if v42 then
                if v41 ~= nil then
                    v41 = v41.credits
                    if v41 ~= nil then
                        v41 = v41[v42]
                    end
                end
            else
                v41 = nil
            end
            if v41 then
                local v43 = u24(v40)
                local v44 = u33
                if v43 ~= nil then
                    v40 = v43
                end
                v44:setupMapCreditsBillboard(v41, v40)
            end
        end)
    end
end
function u29.getMapName(_) --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
    --]]
    while u14:GetAttribute("MapName") == nil do
        u14:GetAttributeChangedSignal("MapName"):Wait()
        u13.Heartbeat:Wait()
    end
    return u14:GetAttribute("MapName")
end
function u29.waitForMapName(p45) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v46 = p45:getMapName()
    if v46 ~= "" and v46 then
        return v46
    end
    u14:GetAttributeChangedSignal("MapName"):Wait()
    return u14:GetAttribute("MapName")
end
u29.waitForCFrame = v1.async(function(p47, p48) --[[ Line: 125 ]]
    return p47:getCFramesFolder():WaitForChild(p48).Value
end)
u29.getCFrame = v1.async(function(p49, p50) --[[ Line: 128 ]]
    local v51 = p49:getCFramesFolder():FindFirstChild(p50)
    if v51 ~= nil then
        v51 = v51.Value
    end
    return v51
end)
function u29.getCFrameWithoutYield(p52, p53) --[[ Line: 135 ]]
    local v54 = p52.mapCFrames
    if v54 ~= nil then
        v54 = v54:FindFirstChild(p53)
    end
    if v54 ~= nil then
        v54 = v54.Value
    end
    return v54
end
function u29.getCFramesFolder(p55) --[[ Line: 146 ]]
    local v56 = p55.mapCFrames:GetAttribute("Setup")
    if v56 == 0 or (v56 ~= v56 or (v56 == "" or not v56)) then
        while p55.mapCFrames.AttributeChanged:Wait() ~= "Setup" do

        end
    end
    return p55.mapCFrames
end
function u29.isInDenyRegion(p57, p58) --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u12
    --]]
    for _, v59 in p57.denyRegions do
        local v60 = u9.Controllers.TeamController:getPlayerTeam(u12.LocalPlayer)
        if v60 ~= nil then
            v60 = v60.id
        end
        local v61 = v59.whiteListTeamId
        if v61 ~= "" and v61 then
            v61 = v59.whiteListTeamId == v60
        end
        if v61 == "" or not v61 then
            if v59.box then
                local v62 = p58 - v59.center
                local v63 = v62.X
                if math.abs(v63) <= v59.radius.X then
                    local v64 = v62.Z
                    if math.abs(v64) <= v59.radius.X then
                        local v65 = v62.Y
                        if math.abs(v65) <= v59.radius.Y then
                            return true
                        end
                    end
                end
            end
            local v66 = v59.center
            if (p58 * Vector3.new(1, 0, 1) - v66 * Vector3.new(1, 0, 1)).Magnitude <= v59.radius.X then
                local v67 = p58.Y - v59.center.Y
                if math.abs(v67) <= v59.radius.Y then
                    return true
                end
            end
        end
    end
    return false
end
function u29.isOutOfBounds(p68, p69) --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u26
        [3] = u8
        [4] = u12
        [5] = u21
    --]]
    local v70 = u20:getState().CustomMatch.generalToggles.IgnoreBuildRestrictedRegions
    if v70 == u26.ON then
        return false
    end
    if v70 == u26.HOST_ONLY then
        local v71 = u8.Controllers.CustomMatchController:getRole(u12.LocalPlayer)
        if v71 == u21.COHOST or v71 == u21.HOST then
            return false
        end
    end
    if not (p68.minMapCorner and p68.maxMapCorner) then
        p68:cacheMapBounds()
    end
    return p68.minMapCorner and (p68.maxMapCorner and (p69.X < p68.minMapCorner.X or (p69.X > p68.maxMapCorner.X or (p69.Y < p68.minMapCorner.Y or (p69.Y > p68.maxMapCorner.Y or (p69.Z < p68.minMapCorner.Z or p69.Z > p68.maxMapCorner.Z)))))) and true or false
end
function u29.setupMapCreditsBillboard(u72, p73, u74, u75) --[[ Line: 211 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
        [3] = u10
        [4] = u15
    --]]
    local u76 = u8.Controllers.SpectatePlatformController:getCreditsFolder()
    if u76 ~= nil then
        u76 = u76.Location2
    end
    local v77 = 0
    local v78 = {}
    for v79, v80 in p73 do
        local _ = v79 - 1
        if type(v80) == "number" == true then
            v77 = v77 + 1
            v78[v77] = v80
        end
    end
    local v81 = 0
    local v82 = {}
    for v83, v84 in p73 do
        local _ = v83 - 1
        if type(v84) == "string" == true then
            v81 = v81 + 1
            v82[v81] = v84
        end
    end
    local u85 = table.create(#v82)
    for v86, v87 in v82 do
        local _ = v86 - 1
        u85[v86] = {
            ["displayName"] = v87
        }
    end
    if #v78 > 0 then
        u5.getOfflinePlayersByUserIds(v78):andThen(function(p88) --[[ Line: 265 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u75
                [3] = u74
                [4] = u85
                [5] = u72
                [6] = u15
                [7] = u76
            --]]
            if #p88 ~= 0 then
                local v89 = u10
                local v90 = {
                    ["Image"] = u75,
                    ["MapName"] = u74
                }
                local v91 = {}
                local v92 = #v91
                local v93 = #p88
                table.move(p88, 1, v93, v92 + 1, v91)
                local v94 = v92 + v93
                table.move(u85, 1, #u85, v94 + 1, v91)
                v90.Creators = v91
                u72.mapCreditsBillboard = v89.mount(u10.createElement(u15, v90), u76)
            end
        end)
    else
        u72.mapCreditsBillboard = u10.mount(u10.createElement(u15, {
            ["Image"] = u75,
            ["MapName"] = u74,
            ["Creators"] = u85
        }), u76)
    end
end
function u29.cacheMapBounds(p95) --[[ Line: 291 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v96 = p95:getCFrame("bound_1"):expect()
    if v96 ~= nil then
        v96 = v96.Position
    end
    if v96 == nil then
        v96 = p95:getCFrame("corner_1"):expect()
        if v96 ~= nil then
            v96 = v96.Position
        end
    end
    local v97 = p95:getCFrame("bound_2"):expect()
    if v97 ~= nil then
        v97 = v97.Position
    end
    if v97 == nil then
        v97 = p95:getCFrame("corner_2"):expect()
        if v97 ~= nil then
            v97 = v97.Position
        end
    end
    if v96 and v97 then
        local v98 = u2:getBlockPosition(v96)
        local v99 = u2:getBlockPosition(v97)
        local v100 = v98.X
        local v101 = v99.X
        local v102 = math.min(v100, v101)
        local v103 = v98.X
        local v104 = v99.X
        local v105 = math.max(v103, v104)
        local v106 = v98.Y
        local v107 = v99.Y
        local v108 = math.min(v106, v107)
        local v109 = v98.Y
        local v110 = v99.Y
        local v111 = math.max(v109, v110)
        local v112 = v98.Z
        local v113 = v99.Z
        local v114 = math.min(v112, v113)
        local v115 = v98.Z
        local v116 = v99.Z
        local v117 = math.max(v115, v116)
        p95.minMapCorner = Vector3.new(v102, v108, v114)
        p95.maxMapCorner = Vector3.new(v105, v111, v117)
    end
end
u8.CreateController(u29.new())
return nil