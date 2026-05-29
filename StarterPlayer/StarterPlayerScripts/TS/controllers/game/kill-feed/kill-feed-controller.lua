local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.Players
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type-meta").getDamageTypeMeta
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u23 = u1.import(script, script.Parent, "monster-icons").MonsterIconUtil
local u24 = u1.import(script, script.Parent, "ui", "kill-feed-app").KillFeedWrapper
local u25 = u1.import(script, script.Parent, "ui", "kill-feed-card", "kill-feed-card").KillFeedCard
local u26 = {
    v21.DIAMOND_GUARDIAN,
    v21.GOLEM_BOSS,
    v21.GOOSE_BOSS,
    v21.VOID_CRATE,
    v21.TARGET_DUMMY,
    v21.BHAA,
    v18.PLAYER_DUMMY,
    "Drone"
}
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "KillFeedController"
    end
})
u27.__index = u27
function u27.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(_) --[[ Line: 41 ]] end
function u27.onStart(u30) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u3
        [3] = u14
        [4] = u20
        [5] = u13
        [6] = u1
        [7] = u12
        [8] = u19
        [9] = u10
        [10] = u15
        [11] = u4
        [12] = u23
    --]]
    if u22.isLobbyServer() then
        return nil
    end
    if u14((u3.Controllers.MatchController:getQueueTypeAsync():expect())).disableKillFeed then
        return nil
    end
    u30:setupKillFeedContainer()
    u20.Client:OnEvent("EntityDeathEvent", function(u31) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u30
            [3] = u1
            [4] = u12
            [5] = u19
            [6] = u10
            [7] = u15
            [8] = u4
            [9] = u3
            [10] = u23
        --]]
        local u32 = u13:getEntity(u31.entityInstance)
        if not u32 then
            return nil
        end
        if not u30:shouldShowKillfeed(u32) then
            return nil
        end
        local u33
        if u31.fromEntity then
            u33 = u13:getEntity(u31.fromEntity)
        else
            u33 = nil
        end
        local u34 = {}
        local u35 = {}
        local u36
        if u1.instanceof(u33, u12) then
            u36 = u19.getGamePlayer(u33:getPlayer()):getDisplayName()
            if u36 == nil then
                u36 = u33:getPlayer().DisplayName
            end
        elseif u33 then
            if u33 == nil then
                u36 = u33
            else
                u36 = u33:getInstance().Name
            end
        else
            u36 = u30:getKillerNameFromDamageType(u31.damageType)
            if u36 == nil then
                u36 = string.gsub(u10[u31.damageType], "_", " ")
            end
        end
        for v37, v38 in u30:getDamageIconsFromDamageEvent(u31.damageType, u31.itemUsed) do
            local _ = v37 - 1
            table.insert(u34, v38)
            local _ = #u34
        end
        if u31.finalKill and u1.instanceof(u32, u12) then
            local v39 = u15.SKULL_LINE_ICON
            table.insert(u34, v39)
        end
        local u40
        if u1.instanceof(u32, u12) then
            u40 = u19.getGamePlayer(u32:getPlayer()):getDisplayName()
            if u40 == nil then
                u40 = u32:getPlayer().DisplayName
            end
        else
            u40 = u32:getInstance().Name
        end
        if u31.deathPayout then
            for v41, v42 in u4.entries(u31.deathPayout) do
                local _ = v41 - 1
                local v43 = v42[1]
                local v44 = tonumber(v43)
                if v44 ~= 0 and (v44 == v44 and v44) then
                    u35[v44] = v42[2]
                end
            end
        end
        task.spawn(function() --[[ Line: 133 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u36
                [3] = u1
                [4] = u33
                [5] = u12
                [6] = u3
                [7] = u40
                [8] = u32
                [9] = u23
                [10] = u34
                [11] = u35
                [12] = u31
            --]]
            local v45 = u30
            local v46 = {}
            local v47 = {
                ["name"] = u36
            }
            local v48
            if u1.instanceof(u33, u12) then
                v48 = u33:getPlayer().UserId
            else
                v48 = nil
            end
            v47.userId = v48
            local v49
            if u1.instanceof(u33, u12) then
                v49 = u3.Controllers.TeamController:getPlayerTeam(u33:getPlayer())
                if v49 ~= nil then
                    v49 = v49.id
                end
            else
                v49 = nil
            end
            v47.teamId = v49
            v46.killer = v47
            local v50 = {
                ["name"] = u40
            }
            local v51
            if u1.instanceof(u32, u12) then
                v51 = u32:getPlayer().UserId
            else
                v51 = nil
            end
            v50.userId = v51
            local v52
            if u1.instanceof(u32, u12) then
                v52 = u3.Controllers.TeamController:getPlayerTeam(u32:getPlayer())
                if v52 ~= nil then
                    v52 = v52.id
                end
            else
                v52 = nil
            end
            v50.teamId = v52
            local v53
            if u1.instanceof(u32, u12) then
                v53 = nil
            else
                v53 = u23.getIconFromName(u32:getInstance().Name)
            end
            v50.icon = v53
            v46.victim = v50
            v46.killIcons = u34
            local v54
            if u1.instanceof(u33, u12) then
                v54 = u35[u33:getPlayer().UserId]
            else
                v54 = nil
            end
            v46.killPayout = v54
            v46.multiKillCount = u31.multiKillCount
            v45:addToKillFeed(v46)
        end)
    end)
    u20.Client:Get("AddPlayerToKillFeed"):Connect(function(p55) --[[ Line: 187 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30:addToKillFeed(p55)
    end)
end
function u27.setupKillFeedContainer(p56) --[[ Line: 191 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u24
        [3] = u9
    --]]
    p56.killFeedContainer = u6.mount(u6.createElement(u24), u9.LocalPlayer:WaitForChild("PlayerGui"))
end
function u27.addToKillFeed(p57, p58) --[[ Line: 195 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u6
        [3] = u25
        [4] = u9
    --]]
    if not p57.killFeedContainer then
        return nil
    end
    if p58.killPayout then
        local v59 = false
        for v60, v61 in {
            {
                ["minAmount"] = 2,
                ["itemType"] = u17.EMERALD
            },
            {
                ["minAmount"] = 2,
                ["itemType"] = u17.DIAMOND
            },
            {
                ["minAmount"] = 2,
                ["itemType"] = u17.GOLD
            },
            {
                ["minAmount"] = 2,
                ["itemType"] = u17.VOID_CRYSTAL
            }
        } do
            local _ = v60 - 1
            local v62 = p58.killPayout
            if v62 ~= nil then
                v62 = v62[v61.itemType]
                if v62 ~= nil then
                    v62 = v62.amount
                end
            end
            if (v62 == nil and 0 or v62) >= v61.minAmount then
                v59 = true
                break
            end
        end
        if not v59 then
            p58.killPayout = nil
        end
    end
    u6.mount(u6.createElement(u25, {
        ["KillFeedData"] = p58
    }), u9.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("KillFeedGui"):WaitForChild("KillFeedContainer"))
end
function u27.getKillerNameFromDamageType(_, p63) --[[ Line: 248 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
    --]]
    if p63 == u10.VOID then
        return "VOID"
    end
    if p63 == u10.FALL then
        return "FALL DAMAGE"
    end
    if p63 == u10.MINIGAME_DAMAGE then
        return "STORM"
    end
    if p63 == u10.WINTER_BOSS_DAMAGE then
        return "Adetunde"
    end
    if p63 == u10.SPIDER_QUEEN_BOSS then
        return "Spider Queen"
    end
    if p63 == u10.BOMBER_PENGUIN then
        return "Bomber Penguin"
    end
    if p63 == u10.SKELETON_KIT_POISON then
        return "Marrow\'s Poison"
    end
    local v64 = u11(p63)
    if v64 ~= nil then
        v64 = v64.name
    end
    return v64
end
function u27.getDamageIconsFromDamageEvent(_, p65, p66) --[[ Line: 280 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u10
        [3] = u11
        [4] = u15
    --]]
    local v67 = {}
    local v68
    if p66 then
        v68 = u16(p66)
    else
        v68 = nil
    end
    local v69 = p65 == u10.SWORD
    if not v69 then
        if v68 == nil then
            v69 = v68
        else
            v69 = v68.sword
        end
    end
    if v69 then
        v69 = p66
    end
    if v69 then
        local v70 = u16(p66).image
        if v70 ~= "" and v70 then
            table.insert(v67, v70)
        end
    else
        local v71 = p65 == u10.PROJECTILE
        if v71 then
            v68 = v71
        elseif v68 ~= nil then
            v68 = v68.projectileSource
        end
        if v68 then
            v68 = p66
        end
        if v68 then
            local v72 = u16(p66).image
            if v72 ~= "" and v72 then
                table.insert(v67, v72)
            end
        end
    end
    local v73 = u11(p65)
    if v73 ~= nil then
        v73 = v73.killFeedIcon
    end
    if v73 ~= "" and v73 then
        table.insert(v67, v73)
        return v67
    end
    local v74 = u15.killfeed.sword
    table.insert(v67, v74)
    return v67
end
function u27.shouldShowKillfeed(_, p75) --[[ Line: 335 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u12
        [3] = u8
        [4] = u26
    --]]
    if u1.instanceof(p75, u12) then
        return true
    end
    local v76 = p75:getInstance()
    local v77 = false
    for v78, v79 in u26 do
        local _ = v78 - 1
        if u8:HasTag(v76, v79) then
            return true
        end
    end
    return v77
end
v2.defineMetadata(u27, "identifier", "client/controllers/game/kill-feed/kill-feed-controller@KillFeedController")
v2.defineMetadata(u27, "flamework:implements", { "$:flamework@OnStart" })
v2.decorate(u27, "$:flamework@Controller", v5, {
    {}
})
return {
    ["KillFeedController"] = u27
}