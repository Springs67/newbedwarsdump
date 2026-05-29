local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golem-boss", "golem-boss-util").GolemBossUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil
local u11 = v1.import(script, script.Parent, "goose-boss-client").GooseBossClient
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "GooseBossController"
    end,
    ["__index"] = u4
})
u12.__index = u12
function u12.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p15)
    p15.Name = "GooseBossController"
    p15.positionToDangerIndicator = {}
    p15.despawned = false
    p15.isPreloaded = false
end
function u12.KnitStart(u16) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u3
        [4] = u5
        [5] = u8
        [6] = u2
        [7] = u9
    --]]
    u4.KnitStart(u16)
    u7.Client:Get("GooseDespawn"):Connect(function() --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16.despawned = true
    end)
    u7.Client:Get("GooseScheduled"):Connect(function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u3
            [3] = u5
            [4] = u8
        --]]
        if not u16.isPreloaded then
            u3.Controllers.PreloadController:runPreload({
                ["animations"] = { u5.CRAB_BOSS_SPAWN },
                ["sounds"] = { u8.CRAB_BOSS_SPAWN_GLOBAL, u8.CRAB_BOSS_SPAWN_LOCAL }
            })
            u3.Controllers.PreloadController:runPreload({
                ["animations"] = {
                    u5.CRAB_BOSS_BARRAGE_ATTACK,
                    u5.CRAB_BOSS_CLAW_ATTACK,
                    u5.CRAB_BOSS_DEATH,
                    u5.CRAB_BOSS_DIG_DOWN,
                    u5.CRAB_BOSS_DIG_UP,
                    u5.CRAB_BOSS_FLIP_GROUND,
                    u5.CRAB_BOSS_IDLE,
                    u5.CRAB_BOSS_WALK,
                    u5.CRAB_BOSS_STAB_50,
                    u5.CRAB_BOSS_STAB_90,
                    u5.CRAB_BOSS_STAB_130,
                    u5.CRAB_BOSS_STAB_230,
                    u5.CRAB_BOSS_STAB_270,
                    u5.CRAB_BOSS_STAB_310
                },
                ["sounds"] = {
                    u8.CRAB_BOSS_BURROW_IN,
                    u8.CRAB_BOSS_BURROW_LOOP,
                    u8.CRAB_BOSS_BURROW_OUT,
                    u8.CRAB_BOSS_CLAW_ATTACK,
                    u8.CRAB_BOSS_DEATH,
                    u8.CRAB_BOSS_FLIP,
                    u8.CRAB_BOSS_FLIP_BUILDUP,
                    u8.CRAB_BOSS_FOOTSTEP_1,
                    u8.CRAB_BOSS_FOOTSTEP_2,
                    u8.CRAB_BOSS_FOOTSTEP_3,
                    u8.CRAB_BOSS_IMPACT_1,
                    u8.CRAB_BOSS_IMPACT_2,
                    u8.CRAB_BOSS_IMPACT_3,
                    u8.CRAB_BOSS_IMPACT_4,
                    u8.CRAB_BOSS_LAUNCH_1,
                    u8.CRAB_BOSS_LAUNCH_2,
                    u8.CRAB_BOSS_LAUNCH_3,
                    u8.CRAB_BOSS_LAUNCH_4,
                    u8.CRAB_BOSS_POISON_LOOP,
                    u8.CRAB_BOSS_STAB_ATTACK
                }
            })
            u16.isPreloaded = true
        end
    end)
    u2(u9.GOOSE_BOSS, function(p17) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:spawnBoss(p17)
    end)
end
function u12.spawnBoss(_, p18) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
    --]]
    local v19 = u10:getEntityFloorCFrame(p18)
    local v20 = p18:GetAttribute("EntityUUID")
    u11.new(v19, v20, p18)
    return v19
end
function u12.showDangerIndicators(u21, u22) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    task.spawn(function() --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u21
            [3] = u6
        --]]
        local v23 = u22
        local function v27(p24) --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u6
            --]]
            for v25 in p24 do
                local v26 = u21.positionToDangerIndicator[v25]
                if v26 then
                    u6:toggleBlockDangerIndicatorVisibility(v26, true)
                end
            end
        end
        for v28, v29 in v23 do
            v27(v29, v28 - 1, v23)
        end
    end)
end
function u12.vectorToRemoteFormat(_, p30) --[[ Line: 88 ]]
    local v31 = p30.X
    local v32 = tostring(v31)
    local v33 = p30.Y
    local v34 = tostring(v33)
    local v35 = p30.Z
    return "<Vector3> (" .. v32 .. ", " .. v34 .. ", " .. tostring(v35) .. ")"
end
function u12.isGooseDespawned(p36) --[[ Line: 91 ]]
    return p36.despawned
end
u3.CreateController(u12.new())
return nil