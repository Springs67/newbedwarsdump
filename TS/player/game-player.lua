local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.Players
local u5 = v3.RunService
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "attribute", "attribute-util").WatchAttribute
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "GamePlayer"
    end
})
u9.__index = u9
function u9.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12, p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    p12.player = p13
    if u5:IsServer() then
        local v14 = p13:GetAttribute("CompletedSetup")
        if v14 == 0 or (v14 ~= v14 or (v14 == "" or not v14)) then
            p13:SetAttribute("Spectator", false)
            p13:SetAttribute("CompletedSetup", true)
        end
    end
end
function u9.getPlayer(p15) --[[ Line: 39 ]]
    return p15.player
end
function u9.getDisplayName(p16, p17) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u8
        [4] = u4
    --]]
    local v18 = u5:IsClient()
    local v19
    if v18 then
        v19 = u2.Controllers.SettingsController:getSettings()
    else
        v19 = nil
    end
    if p17 == nil then
        if v19 ~= nil then
            v19 = v19[u8.STREAMER_MODE]
        end
    else
        v19 = p17
    end
    local v20 = p16.player:GetAttribute("DisguiseDisplayName")
    local v21 = p16.player:GetAttribute("StreamerModeDisguise")
    local v22
    if v18 then
        v22 = v19 == false
    else
        v22 = v18
    end
    if v22 then
        if v21 == "" or not v21 then
            v22 = v21
        else
            v22 = u2.Controllers.StreamerModeController:hasPermissionToSeeThrough()
        end
    end
    if v22 ~= "" and v22 then
        return p16.player.DisplayName
    end
    local v23
    if v20 == "" or not v20 then
        v23 = v19
    else
        v23 = v20
    end
    if v23 == "" or not v23 then
        return p16.player.DisplayName
    end
    local v24
    if v20 == nil then
        v24 = p16.player.DisplayName
    else
        v24 = v20
    end
    if v18 then
        if u4.LocalPlayer == p16.player then
            local v25
            if v20 == "" or not v20 then
                v25 = v20
            else
                if v21 == "" then
                    v21 = false
                end
                v25 = not v21
            end
            if v25 ~= "" and v25 then
                return v20
            end
            if v19 then
                return "Me"
            end
        else
            if v20 ~= "" and v20 then
                return v20
            end
            if v19 then
                return u2.Controllers.StreamerModeController:getDisplayName(p16.player)
            end
        end
    else
        if v20 ~= "" and v20 then
            return v20
        end
        v24 = v19 and "Player" or v24
    end
    return v24
end
function u9.getUsername(p26) --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u8
        [4] = u4
    --]]
    local v27 = u5:IsClient()
    local v28
    if v27 then
        v28 = u2.Controllers.SettingsController:getSettings()
    else
        v28 = nil
    end
    if v28 ~= nil then
        v28 = v28[u8.STREAMER_MODE]
    end
    local v29 = p26.player:GetAttribute("DisguiseUsername")
    local v30 = p26.player:GetAttribute("StreamerModeDisguise")
    if v27 and v28 == false then
        local v31
        if v27 then
            v31 = v28 == false
        else
            v31 = v27
        end
        if v31 then
            if v30 == "" or not v30 then
                v31 = v30
            else
                v31 = u2.Controllers.StreamerModeController:hasPermissionToSeeThrough()
            end
        end
        if v31 ~= "" and v31 then
            return p26.player.Name
        end
    end
    local v32
    if v29 == "" or not v29 then
        v32 = v28
    else
        v32 = v29
    end
    if v32 == "" or not v32 then
        return p26.player.Name
    end
    local v33
    if v29 == nil then
        v33 = p26.player.Name
    else
        v33 = v29
    end
    if v27 then
        if u4.LocalPlayer == p26.player then
            local v34
            if v29 == "" or not v29 then
                v34 = v29
            else
                if v30 == "" then
                    v30 = false
                end
                v34 = not v30
            end
            if v34 ~= "" and v34 then
                return v29
            end
            if v28 then
                return "Me"
            end
        else
            if v29 ~= "" and v29 then
                return v29
            end
            if v28 then
                return u2.Controllers.StreamerModeController:getDisplayName(p26.player)
            end
        end
    else
        if v29 ~= "" and v29 then
            return v29
        end
        v33 = v28 and "Player" or v33
    end
    return v33
end
function u9.getClanTag(p35) --[[ Line: 180 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u8
    --]]
    if u5:IsClient() then
        local v36 = u2.Controllers.SettingsController:getSettings()
        if v36 ~= nil then
            v36 = v36[u8.STREAMER_MODE]
        end
        if v36 then
            return ""
        end
    end
    local v37 = u5:IsClient()
    if v37 then
        v37 = u2.Controllers.PermissionController:hasPermission("anticheat_mod")
    end
    if p35:isInStreamerMode() and not v37 then
        return ""
    end
    local v38 = p35.player:GetAttribute("ClanTag")
    return v38 == nil and "" or v38
end
function u9.getLevel(p39) --[[ Line: 203 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u2
    --]]
    local v40 = u7.levelSystem.startingLevel
    local v41 = p39.player:GetAttribute("PlayerLevel")
    if v41 == nil then
        v41 = v40
    end
    local v42 = p39.player:GetAttribute("StreamerModeDisguise") and true or false
    local v43 = u5:IsClient()
    if v43 then
        v43 = u2.Controllers.StreamerModeController:hasPermissionToSeeThrough()
    end
    if v42 and not v43 then
        return -1
    end
    if v41 ~= nil then
        v40 = v41
    end
    return v40
end
function u9.isInGame(p44) --[[ Line: 224 ]]
    return not p44:isSpectator()
end
function u9.hasFinishedConnecting(p45) --[[ Line: 227 ]]
    return p45.player:GetAttribute("PlayerConnected") == true
end
function u9.isSpectator(p46) --[[ Line: 230 ]]
    return p46.player:GetAttribute("Spectator") == true
end
function u9.setSpectator(p47, p48) --[[ Line: 233 ]]
    p47.player:SetAttribute("Spectator", p48)
end
function u9.getTeamId(p49) --[[ Line: 236 ]]
    return p49.player:GetAttribute("Team")
end
function u9.watchTeamId(p50, p51) --[[ Line: 239 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    return u6(p50.player, "Team", p51)
end
function u9.setTeamId(p52, p53) --[[ Line: 242 ]]
    p52.player:SetAttribute("Team", p53)
end
function u9.isInStreamerMode(p54) --[[ Line: 245 ]]
    return p54.player:GetAttribute("StreamerModeDisguise") == true
end
function u9.isReady(p55) --[[ Line: 248 ]]
    return p55.player:GetAttribute("PlayerConnected") == true
end
return {
    ["GamePlayer"] = u9
}