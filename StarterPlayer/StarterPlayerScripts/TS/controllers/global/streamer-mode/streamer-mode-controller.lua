local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitClient
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.Players
local u8 = v5.RunService
local u9 = u1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "custom-match", "custom-match-role")
local u13 = v12.CustomMatchRole
local u14 = v12.CustomMatchRoleAttribute
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getPrimaryActiveKit
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u22 = u1.import(script, script.Parent.Parent, "nametag", "nametag-controller").NametagController
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "StreamerModeController"
    end,
    ["__index"] = u10
})
u23.__index = u23
function u23.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p26)
    p26.Name = "StreamerModeController"
    p26.isActive = false
end
function u23.KnitStart(u27) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u19
        [4] = u4
    --]]
    u10.KnitStart(u27)
    u9.SettingChanged:connect(function(p28) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u4
            [3] = u27
        --]]
        if p28.setting == u19.STREAMER_MODE then
            local v29 = u4.Controllers.SettingsController:getSettings()
            if v29 ~= nil then
                v29 = v29[u19.STREAMER_MODE]
            end
            if v29 then
                u27:activate()
            else
                u27:deactivate()
            end
        else
            return nil
        end
    end)
    u4.Controllers.SettingsController:waitForSettingsAsync():andThen(function(p30) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u27
        --]]
        if p30[u19.STREAMER_MODE] then
            u27:activate()
        end
    end)
end
function u23.inStreamerMode(_) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u19
    --]]
    local v31 = u3.Controllers.SettingsController:getSetting(u19.STREAMER_MODE)
    if v31 == nil then
        v31 = false
    end
    return v31
end
function u23.getDisplayName(_, p32) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u17
        [3] = u21
        [4] = u4
        [5] = u18
        [6] = u11
    --]]
    local v33 = u17((u20(p32))).name
    if u21.isGameServer() then
        local v34 = u4.Controllers.MatchController:getMatchState() == u18.PRE and "Player" or v33
        local v35 = u4.Controllers.TeamController:getPlayerTeam(p32)
        if v35 ~= nil then
            v35 = v35.id
        end
        local v36 = v34 .. "-" .. (v35 == nil and "" or v35)
        local v37 = u11:getState().Game.startTime
        local v38 = Random.new(v37 + p32.UserId)
        v33 = v36 .. tostring(v38:NextInteger(0, 9)) .. tostring(v38:NextInteger(0, 9))
    end
    return v33
end
function u23.hasPermissionToSeeThrough(_) --[[ Line: 104 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
        [3] = u7
        [4] = u14
        [5] = u13
    --]]
    if u8:IsStudio() then
        return false
    else
        return u4.Controllers.PermissionController:hasPermission("anticheat_mod") or (u7.LocalPlayer:GetAttribute(u14) == u13.COHOST and true or u7.LocalPlayer:GetAttribute(u14) == u13.HOST)
    end
end
function u23.activate(p39) --[[ Line: 113 ]]
    p39:updateNametags(true)
    p39.isActive = true
end
function u23.deactivate(p40) --[[ Line: 117 ]]
    p40:updateNametags(false)
    p40.isActive = false
end
function u23.updateNametags(_, _) --[[ Line: 121 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u16
        [3] = u1
        [4] = u15
        [5] = u22
    --]]
    local v41 = u6:GetTagged("entity")
    local function v46(p42) --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u1
            [3] = u15
            [4] = u22
        --]]
        local v43 = u16:getEntity(p42)
        if not u1.instanceof(v43, u15) then
            return nil
        end
        local v44 = v43:getPlayer()
        local v45 = v44:GetAttribute("DisguiseDisplayName")
        if v45 == "" or not v45 then
            v43:setNametag((u22:getNewNametagTextForPlayer(v44)))
        end
    end
    for v47, v48 in v41 do
        v46(v48, v47 - 1, v41)
    end
end
u3.CreateController(u23.new())
return nil