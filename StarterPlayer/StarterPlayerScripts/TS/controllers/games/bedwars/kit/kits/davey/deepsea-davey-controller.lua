local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.WatchCharacter
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u14 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "DeepseaDaveyController"
    end,
    ["__index"] = u14
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u12
    --]]
    u14.constructor(p18, u12.DAVEY)
    p18.Name = "DeepseaDaveyController"
    p18.combatSet = {}
end
function u15.onKitLocalActivated(_, _) --[[ Line: 35 ]] end
function u15.onKitLocalDeactivated(_) --[[ Line: 37 ]] end
function u15.onKitReplicationActivated(u19, p20) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u11
        [4] = u10
    --]]
    p20:GiveTask(u4(function(p21, p22, p23) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u11
            [3] = u10
            [4] = u19
        --]]
        if u6.Controllers.KitSkinController:getKitSkin(p22) ~= u11.DAVEY_DEEPSEA then
            return nil
        end
        if not u10:getEntity(p21) then
            return nil
        end
        p23:GiveTask((u19:setUpCombatListener(p21)))
    end))
    p20:GiveTask(u4(function(p24, p25) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u11
            [3] = u19
        --]]
        if u6.Controllers.KitSkinController:getKitSkin(p25) ~= u11.DAVEY_DEEPSEA then
            return nil
        end
        local v26 = u19:getFishModel(p25)
        local v27 = p25:WaitForChild("pufferfish", 1)
        if v27 ~= nil then
            v27 = v27:WaitForChild("Handle", 1)
        end
        if v27 then
            v27.Transparency = 1
        end
        if v26 then
            u19:setUpTrack(p24, v26)
        end
    end))
end
function u15.onKitReplicationDeactivated(_) --[[ Line: 71 ]] end
function u15.onInnateAbilityEnabled(_, _, _) --[[ Line: 73 ]] end
function u15.onAbilityUsed(_, _, _) --[[ Line: 75 ]] end
function u15.setUpCombatListener(u28, u29) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u13
        [4] = u10
        [5] = u9
        [6] = u3
    --]]
    local v30 = u8.new()
    v30:GiveTask((task.spawn(function() --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u13
            [3] = u10
            [4] = u29
            [5] = u28
            [6] = u9
            [7] = u3
        --]]
        while true do
            local v31 = task.wait(1)
            if v31 == 0 or (v31 ~= v31 or not v31) then
                break
            end
            if u7.Controllers.MatchController:getMatchState() == u13.RUNNING then
                local v32 = u10:getEntity(u29)
                if v32 and not v32:isDead() then
                    if u28.combatSet[v32] == nil then
                        if v32:getLastSwordHitTime() + 1 > u9:GetServerTimeNow() then
                            u28.combatSet[v32] = true
                            local v33 = u28:getFishModel(v32:getInstance())
                            if v33 then
                                u3:playAnimation(v33, "rbxassetid://18241229092")
                            end
                        end
                    elseif v32:getLastSwordHitTime() + 3 < u9:GetServerTimeNow() then
                        u28.combatSet[v32] = nil
                        local v34 = u28:getFishModel(v32:getInstance())
                        if v34 then
                            u3:playAnimation(v34, "rbxassetid://18241231624")
                        end
                    end
                end
            end
        end
    end)))
    return v30
end
function u15.setUpTrack(_, _, p35) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3:playAnimation(p35, "rbxassetid://18241231624")
end
function u15.getFishModel(_, p36) --[[ Line: 120 ]]
    local v37 = p36:WaitForChild("pufferfish", 1)
    if v37 ~= nil then
        v37 = v37:WaitForChild("Handle", 1)
        if v37 ~= nil then
            v37 = v37:WaitForChild("rig", 1)
        end
    end
    return v37
end
u6.CreateController(u15.new())
return nil