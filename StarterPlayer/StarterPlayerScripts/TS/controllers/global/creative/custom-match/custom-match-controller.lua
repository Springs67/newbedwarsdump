local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ExpireList
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u6 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "custom-match", "custom-match-role").CustomMatchRoleAttribute
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto")
local u12 = v11.HostPanelDropdown
local u13 = v11.HostPanelDropdownMeta
local u14 = v11.HostPanelToggle
local u15 = v11.HostPanelToggleValue
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "server-browser", "server-browser-constants").ServerBrowserConstants
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "CustomMatchController"
    end,
    ["__index"] = u6
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u17
        [3] = u19
        [4] = u2
    --]]
    u6.constructor(p24)
    p24.Name = "CustomMatchController"
    p24.isServerPublished = u17.DEFAULT_VISIBILITY_MODE
    p24.playerAvatarImages = {}
    p24.playerMaxHealth = {}
    p24.customMatchRemotes = u19.Client:GetNamespace("CustomMatches")
    p24.roleCacheExpireList = u2.new(3)
    p24.roleCache = {}
end
function u21.KnitStart(u25) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u20
        [4] = u19
        [5] = u3
        [6] = u18
    --]]
    u6.KnitStart(u25)
    u25.customMatchRemotes:OnEvent("SavedMapsUpdate", function(p26) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        u7:dispatch({
            ["type"] = "CustomMatchSetMapSaves",
            ["mapSaves"] = p26
        })
    end)
    if u20.isGameServer() then
        u25.customMatchRemotes:OnEvent("HostPanelUpdate", function(p27) --[[ Line: 56 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            if p27.hostPanelSettings then
                u7:dispatch({
                    ["type"] = "CustomMatchSetSettings",
                    ["settings"] = p27.hostPanelSettings
                })
            end
            if p27.auditLog then
                u7:dispatch({
                    ["type"] = "CustomMatchSetHostPanelAuditLog",
                    ["updateType"] = p27.auditLog.updateType,
                    ["hostPanelAuditLog"] = p27.auditLog.log
                })
            end
        end)
        u25.customMatchRemotes:Get("RequestHostPanelUpdate"):SendToServer()
        u19.Client:WaitFor("MatchStateEvent"):expect():Connect(function(_, p28, _) --[[ Line: 73 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u7
                [3] = u3
                [4] = u18
                [5] = u25
            --]]
            if not p28 then
                return nil
            end
            u19.Client:GetNamespace("CustomMatches"):Get("RequestMatchMapSaveInfo"):CallServerAsync():andThen(function(p29) --[[ Line: 78 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u3
                    [3] = u18
                    [4] = u25
                --]]
                if not p29 then
                    return nil
                end
                u7:dispatch({
                    ["type"] = "CustomMatchSetMapSaveInfo",
                    ["mapSaveData"] = p29
                })
                if u3.Controllers.MatchController:getMatchState() == u18.PRE then
                    u25:setupMapCreditsBillboard(p29)
                end
            end)
            u25.customMatchRemotes:Get("SendMatchMapSaveInfo"):Connect(function(p30) --[[ Line: 92 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u3
                    [3] = u18
                    [4] = u25
                --]]
                u7:dispatch({
                    ["type"] = "CustomMatchSetMapSaveInfo",
                    ["mapSaveData"] = p30
                })
                if u3.Controllers.MatchController:getMatchState() == u18.PRE then
                    u25:setupMapCreditsBillboard(p30)
                end
            end)
        end)
    end
end
function u21.isCustomMatch(_) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v31, v32 = u3.Controllers.MatchController:getCustomMatchConfigAsync():await()
    if v31 then
        v31 = v32 ~= nil
    end
    return v31
end
function u21.getRole(p33, p34) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if p33.roleCacheExpireList:has(p34.UserId) then
        return p33.roleCache[p34.UserId]
    end
    local v35 = p34:GetAttribute(u8)
    p33.roleCacheExpireList:add(p34.UserId)
    if v35 then
        p33.roleCache[p34.UserId] = v35
    end
end
function u21.setupMapCreditsBillboard(_, p36) --[[ Line: 131 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.Controllers.MapController:setupMapCreditsBillboard({ p36.creatorUserId }, p36.mapTitle, p36.thumbnailImage)
end
function u21.setTeamOreGenerators(p37, p38, p39) --[[ Line: 134 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    p37.customMatchRemotes:Get("SetTeamOreGeneratorSpeedMult"):CallServerAsync(p38, p39)
    u7:dispatch({
        ["type"] = "CustomMatchUpdateTeamOreGen",
        ["teamId"] = p39,
        ["speedMultiplier"] = p38
    })
end
function u21.setGlobalOreGenerators(p40, p41, p42) --[[ Line: 142 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u7
    --]]
    p40.customMatchRemotes:Get("SetGlobalOreGeneratorSpeedMult"):CallServerAsync(p41, p42)
    if p42 == u16.EMERALD then
        u7:dispatch({
            ["type"] = "CustomMatchUpdateGlobalOreGen",
            ["itemType"] = p42,
            ["speedMultiplier"] = p41
        })
    end
end
function u21.setDeathmatchTime(p43, p44) --[[ Line: 152 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    p43.customMatchRemotes:Get("SetDeathmatchTime"):CallServerAsync(p44)
    local v45 = {
        ["type"] = "CustomMatchUpdateSome",
        ["settings"] = {
            ["deathmatchTime"] = p44
        }
    }
    u7:dispatch(v45)
end
function u21.setRandomlySelectedShopItemCount(p46, p47) --[[ Line: 161 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    p46.customMatchRemotes:Get("SetRandomlySelectedShopItemCount"):CallServerAsync(p47)
    local v48 = {
        ["type"] = "CustomMatchUpdateSome",
        ["settings"] = {
            ["randomlySelectedShopItemCount"] = p47
        }
    }
    u7:dispatch(v48)
end
function u21.setBlockDecayTime(p49, p50) --[[ Line: 170 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    p49.customMatchRemotes:Get("SetBlockDecayTime"):CallServerAsync(p50)
    local v51 = {
        ["type"] = "CustomMatchUpdateSome",
        ["settings"] = {
            ["blockDecayTime"] = p50
        }
    }
    u7:dispatch(v51)
end
function u21.setSeverMaxPlayers(p52, p53) --[[ Line: 179 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    p52.customMatchRemotes:Get("SetServerMaxPlayers"):CallServerAsync(p53)
    local v54 = {
        ["type"] = "CustomMatchUpdateSome",
        ["settings"] = {
            ["serverMaxPlayers"] = p53
        }
    }
    u7:dispatch(v54)
end
function u21.generateDropdownItems(_, p55) --[[ Line: 188 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v56 = u13[p55]
    local v57 = table.create(#v56)
    for v58, v59 in v56 do
        local _ = v58 - 1
        v57[v58] = {
            ["text"] = v59,
            ["value"] = v59
        }
    end
    return v57
end
function u21.setDropdown(p60, p61, p62) --[[ Line: 205 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u12
        [3] = u5
        [4] = u7
    --]]
    local v63 = u13[p61]
    if table.find(v63, p62) == nil then
        return nil
    end
    if p61 == u12.LateJoinTeam then
        p60.customMatchRemotes:Get("SetLateJoinTeam"):CallServerAsync(p62)
    elseif p61 == u12.Weather then
        p60.customMatchRemotes:Get("SetWeather"):CallServerAsync(p62)
    else
        u5.Warn("Host panel " .. tostring(p61) .. " is not being handled in the setDropdown function of custom-match-controller.tsx")
    end
    u7:dispatch({
        ["type"] = "CustomMatchUpdateDropdown",
        ["dropdown"] = p61,
        ["value"] = p62
    })
end
function u21.setToggle(p64, p65, p66) --[[ Line: 231 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u14
        [3] = u5
        [4] = u7
    --]]
    if u15[p66] ~= nil then
        local v67 = false
        if p65 == u14.BypassPlacementLimits then
            p64.customMatchRemotes:Get("SetPlacementLimits"):CallServerAsync(p66)
        elseif p65 == u14.HideAllNametags then
            p64.customMatchRemotes:Get("SetHideNametags"):CallServerAsync(p66)
        elseif p65 == u14.LockServer then
            p64.customMatchRemotes:Get("SetLockServer"):CallServerAsync(p66)
        elseif p65 == u14.TeamOverflow then
            p64.customMatchRemotes:Get("SetTeamOverflow"):CallServerAsync(p66)
        elseif p65 == u14.TeamSwitching then
            p64.customMatchRemotes:Get("SetTeamSwitching"):CallServerAsync(p66)
        else
            if p65 == u14.LateJoining then
                p64.customMatchRemotes:Get("SetLateJoining"):CallServerAsync(p66)
                v67 = true
            end
            if v67 or p65 == u14.PvP then
                p64.customMatchRemotes:Get("SetPvP"):CallServerAsync(p66)
            elseif p65 == u14.Emotes then
                p64.customMatchRemotes:Get("SetEmotes"):CallServerAsync(p66)
            elseif p65 == u14.BedBreaking then
                p64.customMatchRemotes:Get("SetBedBreaking"):CallServerAsync(p66)
            elseif p65 == u14.BlockBreaking then
                p64.customMatchRemotes:Get("SetBlockBreaking"):CallServerAsync(p66)
            elseif p65 == u14.BlockPlacing then
                p64.customMatchRemotes:Get("SetBlockPlacing"):CallServerAsync(p66)
            elseif p65 == u14.IgnoreBuildRestrictedRegions then
                p64.customMatchRemotes:Get("SetIgnoreBuildRestrictedRegions"):CallServerAsync(p66)
            elseif p65 == u14.MapBorderDamage then
                p64.customMatchRemotes:Get("SetDisableOutsideMapDamage"):CallServerAsync(p66)
            elseif p65 == u14.KeepInventoryOnDeath then
                p64.customMatchRemotes:Get("SetKeepInventoryOnDeath"):CallServerAsync(p66)
            elseif p65 == u14.AllowRandomlySelectedShopItems then
                p64.customMatchRemotes:Get("SetAllowRandomlySelectedShopItems"):CallServerAsync(p66)
            elseif p65 == u14.SpawnGuardians then
                p64.customMatchRemotes:Get("SetSpawnGuardians"):CallServerAsync(p66)
            elseif p65 == u14.SpawnTitan then
                p64.customMatchRemotes:Get("SetSpawnTitan"):CallServerAsync(p66)
            elseif p65 == u14.SpawnOres then
                p64.customMatchRemotes:Get("SetSpawnOres"):CallServerAsync(p66)
            elseif p65 == u14.PassiveWeatherEffectsEnabled then
                p64.customMatchRemotes:Get("SetToggle"):CallServerAsync(u14.PassiveWeatherEffectsEnabled, p66)
            elseif p65 == u14.WeatherEventsEnabled then
                p64.customMatchRemotes:Get("SetToggle"):CallServerAsync(u14.WeatherEventsEnabled, p66)
            elseif p65 == u14.Recalling then
                p64.customMatchRemotes:Get("SetToggle"):CallServerAsync(u14.Recalling, p66)
            elseif p65 == u14.GameVisibilityMode then
                p64.customMatchRemotes:Get("SetToggle"):CallServerAsync(u14.GameVisibilityMode, p66)
            elseif p65 == u14.AutoRestartGame then
                p64.customMatchRemotes:Get("SetToggle"):CallServerAsync(u14.AutoRestartGame, p66)
            elseif p65 == u14.SpawnVoidMonsters then
                p64.customMatchRemotes:Get("SetToggle"):CallServerAsync(u14.SpawnVoidMonsters, p66)
            else
                u5.Warn("Host panel " .. tostring(p65) .. " is not being handled in the setToggle function of custom-match-controller.tsx")
            end
        end
        u7:dispatch({
            ["type"] = "CustomMatchUpdateGeneralToggle",
            ["toggle"] = p65,
            ["value"] = p66
        })
    end
end
function u21.setKitDisabled(p68, p69, p70) --[[ Line: 344 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    p68.customMatchRemotes:Get("SetKitDisabled"):CallServerAsync(p69, p70)
    u7:dispatch({
        ["type"] = "CustomMatchUpdateKit",
        ["kit"] = p69,
        ["value"] = p70
    })
end
function u21.setAllKitsDisabled(p71, p72) --[[ Line: 352 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
        [3] = u7
    --]]
    p71.customMatchRemotes:Get("SetAllKitsDisabled"):CallServerAsync(p72)
    local v73 = u4.values(u9)
    local v74 = {}
    for v75 = 1, #v73 do
        local v76 = v73[v75]
        local _ = v75 - 1
        v74[v76] = p72
    end
    u7:dispatch({
        ["type"] = "CustomMatchUpdateAllKits",
        ["disabledKits"] = v74
    })
end
function u21.setItemDisabled(p77, p78, p79) --[[ Line: 372 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    p77.customMatchRemotes:Get("SetItemDisabled"):CallServerAsync(p78, p79)
    u7:dispatch({
        ["type"] = "CustomMatchUpdateItem",
        ["item"] = p78,
        ["value"] = p79
    })
end
function u21.setAllItemsDisabled(p80, p81) --[[ Line: 380 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u10
        [3] = u7
    --]]
    p80.customMatchRemotes:Get("SetAllItemsDisabled"):CallServerAsync(p81)
    local v82 = u4.values(u10.ShopItems)
    local v83 = {}
    for v84 = 1, #v82 do
        local v85 = v82[v84]
        local _ = v84 - 1
        v83[v85.itemType] = p81
    end
    u7:dispatch({
        ["type"] = "CustomMatchUpdateAllItems",
        ["disabledItems"] = v83
    })
end
function u21.blacklistPlayer(p86, p87) --[[ Line: 400 ]]
    p86.customMatchRemotes:Get("BlacklistPlayer"):CallServerAsync(p87)
end
function u21.toggleCohost(p88, p89) --[[ Line: 403 ]]
    p88.customMatchRemotes:Get("CohostPlayer"):CallServerAsync(p89)
end
function u21.setPlayerTeam(p90, p91, p92) --[[ Line: 406 ]]
    p90.customMatchRemotes:Get("SetPlayerTeam"):CallServerAsync(p91, p92)
end
function u21.setPlayerMaxHealth(p93, p94, p95) --[[ Line: 409 ]]
    p93.customMatchRemotes:Get("SetPlayerMaxHealth"):CallServerAsync(p94, p95)
end
function u21.saveMap(p96, p97) --[[ Line: 412 ]]
    return p96.customMatchRemotes:Get("SaveMap"):CallServerAsync(p97)
end
function u21.getMySavedMaps(p98) --[[ Line: 415 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u1
    --]]
    local u99 = u7:getState().CustomMatch.mapSaves
    if u99 then
        return u1.Promise.new(function(p100) --[[ Line: 418 ]]
            --[[
            Upvalues:
                [1] = u99
            --]]
            return p100(u99)
        end)
    end
    local v101 = p98.customMatchRemotes:Get("GetMySavedMaps"):CallServerAsync()
    v101:andThen(function(p102) --[[ Line: 423 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        u7:dispatch({
            ["type"] = "CustomMatchSetMapSaves",
            ["mapSaves"] = p102
        })
    end)
    return v101
end
function u21.getMapDisplayInfo(p103, p104) --[[ Line: 432 ]]
    return p103.customMatchRemotes:Get("GetMapInfo"):CallServerAsync(p104)
end
function u21.deleteMapSave(p105, p106) --[[ Line: 435 ]]
    return p105.customMatchRemotes:Get("DeleteSavedMap"):CallServerAsync(p106)
end
function u21.updateMapSaveSettings(p107, p108, p109) --[[ Line: 438 ]]
    return p107.customMatchRemotes:Get("UpdateSavedMapSettings"):CallServerAsync(p108, p109)
end
function u21.autoSplitTeams(p110) --[[ Line: 441 ]]
    p110.customMatchRemotes:Get("AutoSplitTeams"):CallServer()
end
u3.CreateController(u21.new())
return nil