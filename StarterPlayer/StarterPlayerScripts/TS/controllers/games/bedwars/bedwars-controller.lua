local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.ContentProvider
local u10 = v7.Players
local u11 = u1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").KitsUpdateEventZap
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "BedwarsController"
    end,
    ["__index"] = u12
})
u26.__index = u26
function u26.new(...) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(p29) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p29)
    p29.Name = "BedwarsController"
end
function u26.KnitStart(_) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u22
        [3] = u21
        [4] = u23
        [5] = u6
        [6] = u9
        [7] = u25
        [8] = u5
        [9] = u18
        [10] = u10
        [11] = u14
        [12] = u13
        [13] = u19
        [14] = u16
        [15] = u2
        [16] = u24
        [17] = u15
        [18] = u20
        [19] = u11
        [20] = u17
    --]]
    u1.Promise.defer(function() --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u21
            [3] = u23
            [4] = u6
            [5] = u9
        --]]
        local v30 = {
            u22.WOOL_BLUE,
            u22.WOOL_RED,
            u22.WOOL_GREEN,
            u22.WOOL_YELLOW,
            u22.WOOD_PLANK_OAK,
            u22.STONE_BRICK,
            u22.TNT
        }
        local u31 = {}
        local function v38(p32) --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u23
                [3] = u31
                [4] = u6
            --]]
            local v33 = u21(p32)
            local v34 = u23.createItemInstance(p32)
            local v35 = u31
            table.insert(v35, v34)
            local v36 = u6("ImageLabel", {
                ["Image"] = v33.image
            })
            local v37 = u31
            table.insert(v37, v36)
        end
        for v39, v40 in v30 do
            v38(v40, v39 - 1, v30)
        end
        u9:PreloadAsync(u31)
    end)
    u25.Client:WaitFor("EntityDeathEvent"):andThen(function(p41) --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u5
            [3] = u18
            [4] = u10
            [5] = u14
        --]]
        p41:Connect(function(u42) --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u5
                [3] = u18
                [4] = u10
                [5] = u14
            --]]
            u1.Promise.defer(function() --[[ Line: 68 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u18
                    [3] = u10
                    [4] = u42
                    [5] = u14
                --]]
                local v43 = u5.Controllers.MatchController:getQueueType() == u18.JUGGERNAUT_V2 and u10:GetPlayerFromCharacter(u42.fromEntity)
                if v43 then
                    local v44 = u5.Controllers.TeamController:getPlayerTeam(v43)
                    if v44 and v44.id == "1" then
                        return nil
                    end
                end
                local v45 = u10:GetPlayerFromCharacter(u42.fromEntity)
                local v46 = u10:GetPlayerFromCharacter(u42.entityInstance)
                if v45 then
                    local v47 = v46 or u42.entityInstance:GetAttribute("CountAsPlayer")
                    if v47 == 0 or (v47 ~= v47 or (v47 == "" or not v47)) then
                        if u5.Controllers.MatchController:getQueueType() == u18.SURVIVAL then
                            if u42.entityInstance.Name == "SurvivalCrateEntity" then
                                return nil
                            end
                            u14:dispatch({
                                ["type"] = "BedwarsIncrementKills",
                                ["userId"] = v45.UserId
                            })
                        end
                    else
                        u14:dispatch({
                            ["type"] = "BedwarsIncrementKills",
                            ["userId"] = v45.UserId
                        })
                    end
                end
                if not v46 then
                    return nil
                end
                if u42.finalKill then
                    u14:dispatch({
                        ["type"] = "BedwarsSetFinalDeaths",
                        ["dead"] = true,
                        ["userId"] = v46.UserId
                    })
                end
            end)
        end)
    end)
    u13.On(function(p48, p49) --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        u14:dispatch({
            ["type"] = "BedwarsSetKits",
            ["userId"] = p48,
            ["kit"] = p49
        })
    end)
    u25.Client:WaitFor("BedwarsBedBreak"):andThen(function(p50) --[[ Line: 122 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u19
            [3] = u16
            [4] = u5
            [5] = u10
            [6] = u2
            [7] = u24
            [8] = u1
            [9] = u15
            [10] = u20
        --]]
        p50:Connect(function(p51) --[[ Line: 123 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u19
                [3] = u16
                [4] = u5
                [5] = u10
                [6] = u2
                [7] = u24
                [8] = u1
                [9] = u15
                [10] = u20
            --]]
            u14:dispatch({
                ["type"] = "BedwarsSetBedStatus",
                ["teamId"] = p51.brokenBedTeam.id,
                ["bedStatus"] = u19.BedStatus.BED_BROKEN
            })
            local v52 = u14
            local v53 = {
                ["type"] = "BedwarsSetBedBreaks"
            }
            local v54 = p51.player
            if v54 ~= nil then
                v54 = v54.UserId
            end
            v53.userId = v54
            v52:dispatch(v53)
            if p51.player then
                local v55 = u16:getEntity(p51.player)
                u5.Controllers.TeamController:getPlayerTeam(u10.LocalPlayer)
                local v56 = u2.resolveDependency("client/controllers/game/kill-feed/kill-feed-controller@KillFeedController")
                local v57 = {}
                local v58 = {
                    ["name"] = u24.getGamePlayer(p51.player):getDisplayName(),
                    ["userId"] = p51.player.UserId
                }
                local v59
                if u1.instanceof(v55, u15) then
                    v59 = u5.Controllers.TeamController:getPlayerTeam(v55:getPlayer())
                    if v59 ~= nil then
                        v59 = v59.id
                    end
                else
                    v59 = nil
                end
                v58.teamId = v59
                v57.killer = v58
                v57.victim = {
                    ["name"] = p51.brokenBedTeam.displayName .. " Bed",
                    ["teamId"] = p51.brokenBedTeam.id,
                    ["icon"] = u20.BED_BROKEN_ICON
                }
                v57.killIcons = { u20.STAT_UPGRADE_DESTRUCTION }
                v56:addToKillFeed(v57)
            end
        end)
    end)
    u25.Client:WaitFor("BedwarsSuddenDeath"):andThen(function(p60) --[[ Line: 175 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        p60:Connect(function(_) --[[ Line: 176 ]]
            --[[
            Upvalues:
                [1] = u14
            --]]
            u14:dispatch({
                ["type"] = "BedwarsSetBedAliveSuddenDeath"
            })
        end)
    end)
    u11.PlaceBlock:connect(function(p61) --[[ Line: 183 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u17
        --]]
        local v62 = u14:getState().Game.queueType
        if not v62 then
            return nil
        end
        local v63 = u17(v62)
        if v63 and v63.disableBlockPlace then
            p61:setCancelled(true)
        end
    end)
end
function u26.getTeamBed(_, p64) --[[ Line: 194 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v65 = u8:GetTagged("bed:" .. p64)
    if v65 ~= nil then
        v65 = v65[1]
    end
    return v65
end
function u26.getAllBeds(_) --[[ Line: 201 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return u8:GetTagged("bed")
end
return {
    ["BedwarsController"] = v4.CreateController(u26.new())
}