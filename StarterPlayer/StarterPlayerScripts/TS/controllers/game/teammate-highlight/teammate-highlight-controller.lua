local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.CollectionService
local u12 = v10.Players
local u13 = v10.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "TeammateHighlightController"
    end,
    ["__index"] = u15
})
u19.__index = u19
function u19.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u8
    --]]
    u15.constructor(p22)
    p22.Name = "TeammateHighlightController"
    p22.highlightMaid = u8.new()
    p22.highlightMap = {}
end
function u19.KnitStart(p23) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.KnitStart(p23)
end
function u19.setupTeamHighlightSystem(u24) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u18
        [3] = u12
        [4] = u16
    --]]
    u14.MatchStateChange:connect(function(p25) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u24
        --]]
        if p25.matchState ~= u18.RUNNING then
            return nil
        end
        u24:disableTeammateHighlights()
        u24:watchTeammateHighlights()
    end)
    u12.LocalPlayer:GetAttributeChangedSignal("Team"):Connect(function() --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u18
            [3] = u24
        --]]
        if u16:getState().Game.matchState == u18.PRE then
            return nil
        end
        u24:disableTeammateHighlights()
        u24:watchTeammateHighlights()
    end)
end
function u19.highlightInstances(u26, p27) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
        [3] = u9
    --]]
    local u28 = u8.new()
    local function v31(u29) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u9
            [3] = u26
            [4] = u28
        --]]
        if u29 == u12.LocalPlayer.Character then
            return nil
        end
        local v30 = u9("Highlight", {
            ["Name"] = "TeammateHighlight",
            ["FillTransparency"] = 0.5,
            ["OutlineTransparency"] = 1,
            ["Parent"] = u29,
            ["FillColor"] = Color3.fromRGB(0, 255, 0),
            ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop
        })
        u26.highlightMap[u29] = v30
        u28:GiveTask(v30)
        u28:GiveTask(function() --[[ Line: 93 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u29
            --]]
            u26.highlightMap[u29] = nil
        end)
    end
    for v32, v33 in p27 do
        v31(v33, v32 - 1, p27)
    end
    return u28
end
function u19.removeHighlightFromInstances(_, p34) --[[ Line: 104 ]]
    for v35, v36 in p34 do
        local _ = v35 - 1
        local v37 = v36:FindFirstChild("TeammateHighlight")
        if v37 ~= nil then
            v37:Destroy()
        end
    end
end
function u19.enableHighlight(p38, p39) --[[ Line: 116 ]]
    for v40, v41 in p39 do
        local _ = v40 - 1
        local v42 = p38.highlightMap[v41]
        if v42 then
            v42.Enabled = true
        end
    end
end
function u19.disableHighlight(p43, p44) --[[ Line: 130 ]]
    for v45, v46 in p44 do
        local _ = v45 - 1
        local v47 = p43.highlightMap[v46]
        if v47 then
            v47.Enabled = false
        end
    end
end
function u19.watchTeammateHighlights(u48) --[[ Line: 144 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
        [3] = u11
        [4] = u4
        [5] = u17
    --]]
    local u49 = u12.LocalPlayer:GetAttribute("Team")
    if u49 == 0 or (u49 ~= u49 or not u49) then
        return nil
    end
    if not u7.Controllers.TeamController:getTeamById((tostring(u49))) then
        return nil
    end
    u48.highlightMaid:GiveTask(u11:GetInstanceRemovedSignal("TEAM_" .. tostring(u49)):Connect(function(p50) --[[ Line: 153 ]]
        --[[
        Upvalues:
            [1] = u48
        --]]
        u48:removeHighlightFromInstances({ p50 })
    end))
    u48.highlightMaid:GiveTask(u4("TEAM_" .. tostring(u49), function(p51) --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u48
        --]]
        local v52 = u17:getLocalPlayerEntity()
        if v52 ~= nil then
            v52 = v52:isDead()
        end
        if v52 then
            return nil
        end
        local v53 = u17:getEntity(p51)
        if v53 ~= nil then
            v53 = v53:isPlayer()
        end
        if not v53 then
            return nil
        end
        u48:highlightInstances({ p51 })
    end))
    local u54 = true
    u48.highlightMaid:GiveTask(function() --[[ Line: 175 ]]
        --[[
        Upvalues:
            [1] = u54
        --]]
        u54 = false
    end)
    task.spawn(function() --[[ Line: 178 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u49
            [3] = u12
            [4] = u17
            [5] = u48
            [6] = u54
        --]]
        while true do
            local v55 = u49
            local v56 = u11:GetTagged("TEAM_" .. tostring(v55))
            local function v59(p57) --[[ Line: 182 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u17
                    [3] = u48
                --]]
                if p57 == u12.LocalPlayer.Character then
                    return nil
                else
                    local v58 = u17:getEntity(p57)
                    if v58 then
                        if v58:isPlayer() then
                            if u48:canCameraSee(v58) then
                                u48:disableHighlight({ v58:getInstance() })
                            else
                                u48:enableHighlight({ v58:getInstance() })
                            end
                        else
                            return nil
                        end
                    else
                        return nil
                    end
                end
            end
            for v60, v61 in v56 do
                v59(v61, v60 - 1, v56)
            end
            local v62 = u54
            if v62 then
                v62 = task.wait(0.5)
            end
            if v62 == 0 or (v62 ~= v62 or not v62) then
                return
            end
        end
    end)
end
function u19.disableTeammateHighlights(p63) --[[ Line: 209 ]]
    p63.highlightMaid:DoCleaning()
end
function u19.canCameraSee(_, p64) --[[ Line: 212 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
        [3] = u3
    --]]
    local v65 = u12.LocalPlayer.Character
    if not v65 then
        return false
    end
    local v66 = p64:getInstance()
    local v67 = p64:getInstance():FindFirstChild("Head") or v66
    local v68 = u13.CurrentCamera
    if not v68 then
        return false
    end
    local v69, v70 = v68:WorldToViewportPoint(v66:GetPivot().Position)
    if not v70 then
        return false
    end
    local v71 = v68:ViewportPointToRay(v69.X, v69.Y, 0)
    local v72 = RaycastParams.new()
    v72.FilterDescendantsInstances = { v65, v66, v67 }
    v72.FilterType = Enum.RaycastFilterType.Exclude
    local v73 = u3:raycast(v71.Origin, v67:GetPivot().Position - v71.Origin, v72)
    if v70 then
        v70 = not v73
    end
    return v70
end
v6.CreateController(u19.new())
return nil