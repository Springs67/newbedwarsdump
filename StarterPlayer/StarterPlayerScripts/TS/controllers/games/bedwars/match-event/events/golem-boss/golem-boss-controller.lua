local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.RandomUtil
local u5 = v3.SoundManager
local u6 = v3.WatchCollectionTag
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golem-boss", "golem-boss-constants")
local u14 = v13.GOLEM_DISLODGE_SOUNDS
local u15 = v13.GOLEM_DISLODGE_SOUND_CHANCE
local u16 = v13.GOLEM_PILLAR_BLOCK_TAG
local u17 = v13.GOLEM_PLATFORM_SIZE_BLOCKS
local u18 = v13.GROUND_Y_OFFSET
local u19 = v13.SHOCKWAVE_INTERVAL
local u20 = v13.SpiritGolemBossConstants
local u21 = v13.VoidGolemBossConstants
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golem-boss", "golem-boss-util").GolemBossUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil
local u25 = v1.import(script, script.Parent, "bhaa-boss-client").BhaaBossClient
local u26 = v1.import(script, script.Parent, "golem-boss-client").GolemBossClient
local u27 = v1.import(script, script.Parent, "spirit-golem-boss-client").SpiritGolemBossClient
local u28 = v1.import(script, script.Parent, "void-golem-boss-client").VoidGolemBossClient
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 37 ]]
        return "GolemBossController"
    end,
    ["__index"] = u10
})
u29.__index = u29
function u29.new(...) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p32)
    p32.Name = "GolemBossController"
    p32.hasbossSpawned = false
    p32.positionToDummyBlock = {}
    p32.positionToDangerIndicator = {}
    p32.shockwaveTweenCache = {}
    p32.bossPlatformBlockTypes = {}
end
function u29.KnitStart(u33) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u6
        [3] = u23
        [4] = u18
        [5] = u16
    --]]
    u10.KnitStart(u33)
    u6(u23.GOLEM_BOSS, function(p34) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u18
        --]]
        local v35 = u33:spawnBoss(p34) + u18
        if not u33.hasbossSpawned then
            u33.hasbossSpawned = true
            u33:createDummyBlocks(v35.Position)
        end
    end)
    u6(u16, function(p36) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:animatePillarBlock(p36)
    end)
end
function u29.animatePillarBlock(_, p37) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u11
    --]]
    local v38 = u9
    local v39 = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 1, true)
    local v40 = {}
    local v41 = p37.Size.X + math.random() * (u11 / 2)
    local v42 = p37.Size.Y + math.random() * (u11 / 2)
    local v43 = p37.Size.Z + math.random() * (u11 / 2)
    v40.Size = Vector3.new(v41, v42, v43)
    v38:Create(p37, v39, v40):Play()
end
function u29.spawnBoss(p44, p45) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u27
        [3] = u28
        [4] = u25
        [5] = u26
    --]]
    local v46 = u24:getGameEntityCFrame(p45)
    local v47 = p45:GetAttribute("EntityUUID")
    local v48 = p45:GetAttribute("BossType")
    if v48 == "SpiritGolem" then
        u27.new(v46, v47, p45)
        return v46
    elseif v48 == "VoidGolem" then
        u28.new(v46, v47, p45)
        return v46
    elseif v48 == "Bhaa" then
        u25.new(v46, v47, p45)
        return v46
    else
        p44.bossClient = u26.new(v46, v47, p45)
        return v46
    end
end
function u29.createDummyBlocks(u49, p50) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u22
        [3] = u17
        [4] = u12
    --]]
    local v51 = u22:getBlocksAroundOrigin(u2:getBlockPosition(p50), u17)
    if v51 ~= nil then
        v51:andThen(function(p52) --[[ Line: 103 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u12
                [3] = u22
                [4] = u49
            --]]
            local function v63(p53) --[[ Line: 105 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u12
                    [3] = u22
                    [4] = u49
                --]]
                local v54 = 0
                local u55 = v54
                for u56 in p53 do
                    task.spawn(function() --[[ Line: 109 ]]
                        --[[
                        Upvalues:
                            [1] = u55
                            [2] = u2
                            [3] = u56
                            [4] = u12
                            [5] = u22
                            [6] = u49
                        --]]
                        task.wait(u55 * 0.125)
                        local v57 = u2:getStore():getBlockAt(u56)
                        local v58
                        if v57 == nil then
                            v58 = v57
                        else
                            v58 = v57.Name
                        end
                        if v58 == nil then
                            v58 = u12.STONE
                        end
                        local v59
                        if v57 == nil then
                            v59 = v57
                        else
                            v59 = v57.Name
                        end
                        local v60 = v59 == u12.LADDER
                        if not v60 then
                            if v57 ~= nil then
                                v57 = v57.Name
                            end
                            v60 = v57 == u12.VINE_LADDER
                        end
                        if v60 then
                            v58 = u12.STONE
                        end
                        local v61 = u22:createDummyBlockAt(u56, v58)
                        v61.Name = "DummyBlock"
                        u22:toggleDummyBlockVisibility(v61, false)
                        u49.positionToDummyBlock[u56] = v61
                        u49.bossPlatformBlockTypes[v58] = true
                        local v62 = u22:createBlockDangerIndicatorAt(u56, Vector3.new(0, 0.15, 0))
                        u22:toggleBlockDangerIndicatorVisibility(v62, false)
                        u49.positionToDangerIndicator[u56] = v62
                    end)
                    v54 = u55 + 1
                    u55 = v54
                end
            end
            for v64, v65 in p52 do
                v63(v65, v64 - 1, p52)
            end
        end)
    end
end
function u29.showDangerIndicators(u66, u67) --[[ Line: 169 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    task.spawn(function() --[[ Line: 170 ]]
        --[[
        Upvalues:
            [1] = u67
            [2] = u66
            [3] = u22
        --]]
        for v68, v69 in u67 do
            local _ = v68 - 1
            local v70 = u66.positionToDangerIndicator[v69]
            if v70 then
                u22:toggleBlockDangerIndicatorVisibility(v70, true)
            end
        end
    end)
end
function u29.playShockwaveEffect(u71, u72, u73, p74, u75) --[[ Line: 185 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u9
        [3] = u11
        [4] = u22
        [5] = u15
        [6] = u4
        [7] = u20
        [8] = u21
        [9] = u14
        [10] = u5
    --]]
    if u73 == nil then
        u73 = u19
    end
    local u76 = p74 == nil and true or p74
    task.spawn(function() --[[ Line: 192 ]]
        --[[
        Upvalues:
            [1] = u72
            [2] = u71
            [3] = u9
            [4] = u73
            [5] = u11
            [6] = u22
            [7] = u15
            [8] = u75
            [9] = u4
            [10] = u20
            [11] = u21
            [12] = u14
            [13] = u5
            [14] = u76
        --]]
        local v77 = u72
        local function v104(p78) --[[ Line: 194 ]]
            --[[
            Upvalues:
                [1] = u71
                [2] = u9
                [3] = u73
                [4] = u11
                [5] = u22
                [6] = u15
                [7] = u75
                [8] = u4
                [9] = u20
                [10] = u21
                [11] = u14
                [12] = u5
                [13] = u76
            --]]
            local function v101(p79) --[[ Line: 196 ]]
                --[[
                Upvalues:
                    [1] = u71
                    [2] = u9
                    [3] = u73
                    [4] = u11
                    [5] = u22
                    [6] = u15
                    [7] = u75
                    [8] = u4
                    [9] = u20
                    [10] = u21
                    [11] = u14
                    [12] = u5
                    [13] = u76
                --]]
                local u80 = u71.positionToDummyBlock[p79]
                if u80 then
                    local v81 = u71.shockwaveTweenCache[p79]
                    local v82
                    if v81 then
                        v82 = v81
                    else
                        local v83 = u9
                        local v84 = TweenInfo.new(u73, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true)
                        local v85 = {}
                        local v86 = u80.Position.X + math.random() * (u11 / 2)
                        local v87 = u80.Position.Y + u11 / 1.5
                        local v88 = u80.Position.Z + math.random() * (u11 / 2)
                        v85.Position = Vector3.new(v86, v87, v88)
                        local v89 = u80.Size.X
                        local v90 = u80.Size.Y + math.random() * (u11 / 2)
                        local v91 = u80.Size.Z
                        v85.Size = Vector3.new(v89, v90, v91)
                        v82 = v83:Create(u80, v84, v85)
                    end
                    if not v81 then
                        u71.shockwaveTweenCache[p79] = v82
                    end
                    local u92 = nil
                    u92 = v82.Completed:Connect(function() --[[ Line: 216 ]]
                        --[[
                        Upvalues:
                            [1] = u92
                            [2] = u22
                            [3] = u80
                        --]]
                        u92:Disconnect()
                        u22:toggleDummyBlockVisibility(u80, false)
                    end)
                    u22:toggleDummyBlockVisibility(u80, true)
                    v82:Play()
                    if math.random(0, 100) <= u15 then
                        local v93 = u75
                        if v93 ~= nil then
                            v93 = v93:GetAttribute("BossType")
                        end
                        local v94
                        if v93 == "SpiritGolem" then
                            local v95 = u4.fromList
                            local v96 = u20.SPIRIT_GOLEM_DISLODGE_SOUNDS
                            v94 = v95(unpack(v96))
                        elseif v93 == "VoidGolem" then
                            local v97 = u4.fromList
                            local v98 = u21.VOID_GOLEM_DISLODGE_SOUNDS
                            v94 = v97(unpack(v98))
                        elseif v93 == "Bhaa" then
                            v94 = nil
                        else
                            local v99 = u14
                            v94 = u4.fromList(unpack(v99))
                        end
                        if v94 ~= "" and v94 then
                            u5:playSound(v94, {
                                ["position"] = u80.Position
                            })
                        end
                    end
                    local u100 = u76 and u71.positionToDangerIndicator[p79]
                    if u100 then
                        task.delay(0.175, function() --[[ Line: 256 ]]
                            --[[
                            Upvalues:
                                [1] = u22
                                [2] = u100
                            --]]
                            return u22:toggleBlockDangerIndicatorVisibility(u100, false)
                        end)
                    end
                end
            end
            for v102, v103 in p78 do
                v101(v103, v102 - 1, p78)
            end
            task.wait(u73 / 2)
        end
        for v105, v106 in v77 do
            v104(v106, v105 - 1, v77)
        end
    end)
end
function u29.hideAllBlockDangerIndicators(p107) --[[ Line: 273 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u22
    --]]
    for v108, v109 in u8.values(p107.positionToDangerIndicator) do
        local _ = v108 - 1
        u22:toggleBlockDangerIndicatorVisibility(v109, false)
    end
end
function u29.vectorToRemoteFormat(_, p110) --[[ Line: 282 ]]
    local v111 = p110.X
    local v112 = tostring(v111)
    local v113 = p110.Y
    local v114 = tostring(v113)
    local v115 = p110.Z
    return "<Vector3> (" .. v112 .. ", " .. v114 .. ", " .. tostring(v115) .. ")"
end
function u29.getBossClient(p116) --[[ Line: 285 ]]
    return p116.bossClient
end
v7.CreateController(u29.new())
return nil