local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.Players
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag
local v18 = {}
local u19 = setmetatable({}, {
    ["__index"] = v18
})
u19.BED_DEFENSE = "bed_defense"
v18.bed_defense = "BED_DEFENSE"
u19.DIAMOND_GUARDIANS = "diamond_guardians"
v18.diamond_guardians = "DIAMOND_GUARDIANS"
u19.TITAN = "titan"
v18.titan = "TITAN"
u19.BHAA = "bhaa"
v18.bhaa = "BHAA"
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "GameTipsController"
    end,
    ["__index"] = u11
})
u20.__index = u20
function u20.new(...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p23)
    p23.Name = "GameTipsController"
    p23.tipsQueued = false
    p23.tipsShown = {}
end
function u20.KnitStart(u24) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
        [3] = u14
        [4] = u5
        [5] = u15
        [6] = u9
        [7] = u12
        [8] = u8
        [9] = u2
        [10] = u13
        [11] = u19
        [12] = u16
        [13] = u17
    --]]
    u11.KnitStart(u24)
    u10.MatchStateChange:connect(function(p25) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u24
            [3] = u5
            [4] = u15
            [5] = u9
            [6] = u12
            [7] = u8
            [8] = u2
            [9] = u13
            [10] = u19
        --]]
        if p25.matchState == u14.RUNNING and not u24.tipsQueued then
            local u26 = u5.Controllers.MatchController:getQueueMeta()
            local u27 = u15.getGamePlayer(u9.LocalPlayer):getTeamId()
            task.delay(180, function() --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u26
                    [2] = u12
                    [3] = u8
                    [4] = u27
                    [5] = u2
                    [6] = u13
                    [7] = u24
                    [8] = u19
                --]]
                local v28 = u26
                if v28 ~= nil then
                    v28 = v28.game
                end
                if v28 ~= u12.BEDWARS then
                    return nil
                end
                local v29 = u27
                local v30 = u8:GetTagged("bed:" .. tostring(v29))
                local v31 = v30[1]
                local u32 = {
                    Vector3.new(1, 0, 0),
                    Vector3.new(-1, 0, 0),
                    Vector3.new(0, 0, 1),
                    Vector3.new(0, 0, -1),
                    Vector3.new(0, 1, 0)
                }
                local u33 = false
                local v34 = u2:getHandlerRegistry():getHandler(u13.BED)
                if v34 ~= nil then
                    local v35 = v34:getContainedPositions(v31)
                    local function v40(p36) --[[ Line: 76 ]]
                        --[[
                        Upvalues:
                            [1] = u2
                            [2] = u33
                            [3] = u32
                        --]]
                        for v37, v38 in u32 do
                            local _ = v37 - 1
                            local v39 = u2:getStore():getBlockAt(p36 + v38)
                            if v39 and v39.Name ~= "bed" then
                                u33 = true
                            end
                        end
                    end
                    for v41, v42 in v35 do
                        v40(v42, v41 - 1, v35)
                    end
                end
                if not u33 then
                    u24:showTip(u19.BED_DEFENSE, "Your bed is unprotected! Remember you can build blocks around the bed to defend it.", { v30[1]:FindFirstChild("Bed", true) })
                end
            end)
            u24.tipsQueued = true
        end
    end)
    u16.Client:Get("DiamondGuardiansSpawned"):Connect(function() --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u19
            [3] = u8
            [4] = u17
        --]]
        u24:showTip(u19.DIAMOND_GUARDIANS, "Diamond guardians at generators can be slain for extra diamonds.", u8:GetTagged("GameEntity_" .. u17.DIAMOND_GUARDIAN))
    end)
    u16.Client:Get("BossSpawned"):Connect(function(p43) --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u19
            [3] = u8
            [4] = u17
        --]]
        if p43.bossType == "Golem" or (p43.bossType == "SpiritGolem" or p43.bossType == "VoidGolem") then
            u24:showTip(u19.TITAN, "Titans can be slain to grant enormous buffs to the entire team!", u8:GetTagged("GameEntity_" .. u17.GOLEM_BOSS))
        end
        if p43.bossType == "Bhaa" then
            u24:showTip(u19.BHAA, "Bhaa grants an extra life to every member on the team if slain!", u8:GetTagged("GameEntity_" .. u17.BHAA))
        end
    end)
end
function u20.showTip(u44, p45, p46, u47) --[[ Line: 115 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v48 = u44.tipsShown
    if table.find(v48, p45) ~= nil then
        return nil
    end
    local u49 = {}
    u4.Controllers.TipsController:showTip(p46, {
        ["duration"] = 10,
        ["onMount"] = function() --[[ Name: onMount, Line 124 ]]
            --[[
            Upvalues:
                [1] = u47
                [2] = u44
                [3] = u49
            --]]
            local v50 = u47
            if v50 ~= nil then
                for v51, v52 in v50 do
                    local _ = v51 - 1
                    local v53 = u44:highlight(v52)
                    local v54 = u49
                    table.insert(v54, v53)
                end
            end
        end,
        ["onDismount"] = function() --[[ Name: onDismount, Line 136 ]]
            --[[
            Upvalues:
                [1] = u49
            --]]
            for v55, v56 in u49 do
                local _ = v55 - 1
                v56:Destroy()
            end
            return nil
        end
    })
    local v57 = u44.tipsShown
    table.insert(v57, p45)
end
function u20.highlight(_, p58) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v59 = Color3.fromRGB(0, 255, 255)
    return u6("Highlight", {
        ["Name"] = "TipHighlight",
        ["FillTransparency"] = 0.7,
        ["Parent"] = p58,
        ["FillColor"] = v59,
        ["OutlineColor"] = v59
    })
end
u4.CreateController(u20.new())
return nil