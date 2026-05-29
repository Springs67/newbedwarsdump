local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, script.Parent, "match-end-screen-meta").MatchEndScreensMeta
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "MatchEndController"
    end,
    ["__index"] = u8
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17, ...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p17, ...)
    p17.Name = "MatchEndController"
    p17.currDisplayOrder = (1 / 0)
    p17.matchEndScreens = {}
    p17.currPlayingMatchEndScreens = {}
    p17.reachedMaxDisplayOrder = false
end
function u14.KnitStart(u18) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u9
        [3] = u11
        [4] = u5
    --]]
    u18:setupIMatchEndScreens()
    u12.Client:OnEvent("MatchEndEvent", function(p19) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u9
            [3] = u11
            [4] = u5
        --]]
        if p19.cancelled then
            u18.currDisplayOrder = 1
            u18.matchEndScreens = {
                { 0, 1 }
            }
        end
        u18:startCurrDisplayOrder()
        u9:dispatch({
            ["type"] = "GameSetMatchState",
            ["matchState"] = u11.POST
        })
        u5.Controllers.HotbarController:unmountHotbar()
    end)
end
function u14.waitUntilDisplay(p20, p21) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u10
    --]]
    local v22 = u5.Controllers.MatchController:getQueueType()
    if v22 then
        local v23 = u10(v22).disabledMatchEndScreens
        if v23 ~= nil then
            v23 = table.find(v23, p21) ~= nil
        end
        if v23 then
            return false
        end
    end
    while true do
        local v24 = p20.currPlayingMatchEndScreens
        if table.find(v24, p21) ~= nil then
            break
        end
        wait(0.5)
    end
    return true
end
function u14.getMatchScreensInDisplayOrder(p25, p26) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v27 = p25.matchEndScreens[p26]
    if v27 ~= nil then
        local v28 = 0
        v27 = {}
        for v29, v30 in v27 do
            local _ = v29 - 1
            if u13[v30].displayOrder == p26 == true then
                v28 = v28 + 1
                v27[v28] = v30
            end
        end
    end
    return v27
end
function u14.startCurrDisplayOrder(p31) --[[ Line: 102 ]]
    p31:startDisplayOrder(p31.currDisplayOrder)
end
function u14.startDisplayOrder(u32, u33, u34) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u7
    --]]
    local v35 = u32:getMatchScreensInDisplayOrder(u33)
    u32:stopDisplayAllMatchEndScreens()
    u32.currDisplayOrder = u33
    local v36 = u32:getMaxDisplayOrder()
    if v36 <= u32.currDisplayOrder then
        u32.reachedMaxDisplayOrder = true
    end
    if not v35 then
        if not u34 and u32.currDisplayOrder < v36 then
            u32.currDisplayOrder = u32.currDisplayOrder + 1
            u32:startCurrDisplayOrder()
        end
        return nil
    end
    local function v44(u37) --[[ Line: 121 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u32
            [3] = u7
            [4] = u34
            [5] = u33
        --]]
        local v38 = u13[u37]
        local v39 = u32.currPlayingMatchEndScreens
        table.insert(v39, u37)
        u7.MatchEndScreenStart:fire(u37)
        if not (u34 or v38.persistent) then
            local v40 = task
            local v41 = v38.displaySecs
            local v42 = v41 == nil and 30 or v41
            v40.delay(v42, function() --[[ Line: 133 ]]
                --[[
                Upvalues:
                    [1] = u32
                    [2] = u33
                    [3] = u37
                --]]
                if u32.currDisplayOrder == u33 then
                    if u32:isMatchEndScreensComplete() or u32.reachedMaxDisplayOrder then
                        u32:stopDisplayMatchEndScreen(u37)
                    else
                        u32:stopDisplayMatchEndScreen(u37)
                        local v43 = u32
                        v43.currDisplayOrder = v43.currDisplayOrder + 1
                        u32:startCurrDisplayOrder()
                    end
                else
                    return nil
                end
            end)
        end
    end
    for v45, v46 in v35 do
        v44(v46, v45 - 1, v35)
    end
end
function u14.stopDisplayAllMatchEndScreens(p47) --[[ Line: 151 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v48 = 0
    local v49 = {}
    for v50, v51 in p47.currPlayingMatchEndScreens do
        local _ = v50 - 1
        if not u13[v51].persistent == true then
            v48 = v48 + 1
            v49[v48] = v51
        end
    end
    for v52, v53 in v49 do
        local _ = v52 - 1
        p47:stopDisplayMatchEndScreen(v53)
    end
end
function u14.stopDisplayMatchEndScreen(p54, p55) --[[ Line: 174 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v56 = p54.currPlayingMatchEndScreens
    local v57 = -1
    for v58, v59 in p54.currPlayingMatchEndScreens do
        local _ = v58 - 1
        if v59 == p55 == true then
            v57 = v58 - 1
            break
        end
    end
    table.remove(v56, v57 + 1)
    u7.MatchEndScreenEnd:fire(p55)
end
function u14.skipCurrDisplay(p60) --[[ Line: 192 ]]
    if not p60:getMatchScreensInDisplayOrder(p60.currDisplayOrder) then
        return nil
    end
    p60:stopDisplayAllMatchEndScreens()
    p60.currDisplayOrder = p60.currDisplayOrder + 1
    p60:startCurrDisplayOrder()
end
function u14.getMaxDisplayOrder(p61) --[[ Line: 202 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v62 = u6.keys
    local v63 = p61.matchEndScreens
    local v64 = unpack
    return math.max(v64(v62(v63)))
end
function u14.isReachedMaxDisplayOrder(p65) --[[ Line: 205 ]]
    return p65.reachedMaxDisplayOrder
end
function u14.isMatchEndScreensComplete(p66) --[[ Line: 208 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v67 = true
    local v68 = v67
    for v69, v70 in p66.currPlayingMatchEndScreens do
        local _ = v69 - 1
        if not u13[v70].persistent then
            v67 = false
            v68 = v67
        end
    end
    return v68
end
function u14.setupIMatchEndScreens(u71) --[[ Line: 222 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u10
        [3] = u6
        [4] = u13
        [5] = u2
    --]]
    task.spawn(function() --[[ Line: 223 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u10
            [3] = u6
            [4] = u13
            [5] = u71
            [6] = u2
        --]]
        local v72, u73 = u5.Controllers.MatchController:getQueueTypeAsync():await()
        if v72 then
            local u74 = u10(u73)
            local v75 = {}
            local v76 = #v75
            local v77 = u6.entries(u13)
            table.move(v77, 1, #v77, v76 + 1, v75)
            local function v83(p78) --[[ Line: 231 ]]
                --[[
                Upvalues:
                    [1] = u73
                    [2] = u74
                    [3] = u71
                    [4] = u2
                --]]
                local v79 = p78[1]
                local v80 = p78[2]
                if v80.enabledQueues and table.find(v80.enabledQueues, u73) == nil then
                    return nil
                end
                if v80.rankedOnly and not u74.rankCategory then
                    return nil
                end
                local v81 = u74.disabledMatchEndScreens
                if v81 ~= nil then
                    v81 = table.find(v81, v79) ~= nil
                end
                if v81 then
                    return nil
                end
                if v80.displayOrder < u71.currDisplayOrder then
                    u71.currDisplayOrder = v80.displayOrder
                end
                local v82 = u2.getOrCreate(u71.matchEndScreens, v80.displayOrder, {})
                table.insert(v82, v79)
            end
            for v84, v85 in v75 do
                v83(v85, v84 - 1, v75)
            end
        end
    end)
end
v4.CreateController(u14.new())
return nil