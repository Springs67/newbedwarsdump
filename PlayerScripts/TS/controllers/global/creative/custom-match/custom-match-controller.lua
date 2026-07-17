-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ExpireList = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ExpireList;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local CustomMatchRoleAttribute = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "custom-match", "custom-match-role").CustomMatchRoleAttribute;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto");
local HostPanelDropdown = v2.HostPanelDropdown;
local HostPanelDropdownMeta = v2.HostPanelDropdownMeta;
local HostPanelToggle = v2.HostPanelToggle;
local HostPanelToggleValue = v2.HostPanelToggleValue;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ServerBrowserConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "server-browser", "server-browser-constants").ServerBrowserConstants;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "CustomMatchController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 32
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 36
    -- upvalues: KnitController (copy), ServerBrowserConstants (copy), default2 (copy), ExpireList (copy)
    KnitController.constructor(p5);
    p5.Name = "CustomMatchController";
    p5.isServerPublished = ServerBrowserConstants.DEFAULT_VISIBILITY_MODE;
    p5.playerAvatarImages = {};
    p5.playerMaxHealth = {};
    p5.customMatchRemotes = default2.Client:GetNamespace("CustomMatches");
    p5.roleCacheExpireList = ExpireList.new(3);
    p5.roleCache = {};
end;

function u3.KnitStart(u6) -- Line: 46
    -- upvalues: KnitController (copy), ClientStore (copy), PlaceUtil (copy), default2 (copy), KnitClient (copy), MatchState (copy)
    KnitController.KnitStart(u6);
    u6.customMatchRemotes:OnEvent("SavedMapsUpdate", function(p7) -- Line: 48
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "CustomMatchSetMapSaves",
            mapSaves = p7
        });
    end);

    if PlaceUtil.isGameServer() then
        u6.customMatchRemotes:OnEvent("HostPanelUpdate", function(p8) -- Line: 56
            -- upvalues: ClientStore (ref)
            if p8.hostPanelSettings then
                ClientStore:dispatch({
                    type = "CustomMatchSetSettings",
                    settings = p8.hostPanelSettings
                });
            end;

            if p8.auditLog then
                ClientStore:dispatch({
                    type = "CustomMatchSetHostPanelAuditLog",
                    updateType = p8.auditLog.updateType,
                    hostPanelAuditLog = p8.auditLog.log
                });
            end;
        end);
        u6.customMatchRemotes:Get("RequestHostPanelUpdate"):SendToServer();
        default2.Client:WaitFor("MatchStateEvent"):expect():Connect(function(p9, p10, p11) -- Line: 73
            -- upvalues: default2 (ref), ClientStore (ref), KnitClient (ref), MatchState (ref), u6 (copy)
            if not p10 then
                return nil;
            end;

            default2.Client:GetNamespace("CustomMatches"):Get("RequestMatchMapSaveInfo"):CallServerAsync():andThen(function(p12) -- Line: 78
                -- upvalues: ClientStore (ref), KnitClient (ref), MatchState (ref), u6 (ref)
                if not p12 then
                    return nil;
                end;

                ClientStore:dispatch({
                    type = "CustomMatchSetMapSaveInfo",
                    mapSaveData = p12
                });

                if KnitClient.Controllers.MatchController:getMatchState() == MatchState.PRE then
                    u6:setupMapCreditsBillboard(p12);
                end;
            end);
            u6.customMatchRemotes:Get("SendMatchMapSaveInfo"):Connect(function(p13) -- Line: 92
                -- upvalues: ClientStore (ref), KnitClient (ref), MatchState (ref), u6 (ref)
                ClientStore:dispatch({
                    type = "CustomMatchSetMapSaveInfo",
                    mapSaveData = p13
                });

                if KnitClient.Controllers.MatchController:getMatchState() == MatchState.PRE then
                    u6:setupMapCreditsBillboard(p13);
                end;
            end);
        end);
    end;
end;

function u3.isCustomMatch(p14) -- Line: 113
    -- upvalues: KnitClient (copy)
    local v15, v16 = KnitClient.Controllers.MatchController:getCustomMatchConfigAsync():await();

    if v15 then
        v15 = v16 ~= nil;
    end;

    return v15;
end;

function u3.getRole(p17, p18) -- Line: 117
    -- upvalues: CustomMatchRoleAttribute (copy)
    if p17.roleCacheExpireList:has(p18.UserId) then
        return p17.roleCache[p18.UserId];
    end;

    local v19 = p18:GetAttribute(CustomMatchRoleAttribute);
    p17.roleCacheExpireList:add(p18.UserId);

    if v19 then
        p17.roleCache[p18.UserId] = v19;
    end;
end;

function u3.setupMapCreditsBillboard(p20, p21) -- Line: 131
    -- upvalues: KnitClient (copy)
    KnitClient.Controllers.MapController:setupMapCreditsBillboard({ p21.creatorUserId }, p21.mapTitle, p21.thumbnailImage);
end;

function u3.setTeamOreGenerators(p22, p23, p24) -- Line: 134
    -- upvalues: ClientStore (copy)
    p22.customMatchRemotes:Get("SetTeamOreGeneratorSpeedMult"):CallServerAsync(p23, p24);
    ClientStore:dispatch({
        type = "CustomMatchUpdateTeamOreGen",
        teamId = p24,
        speedMultiplier = p23
    });
end;

function u3.setGlobalOreGenerators(p25, p26, p27) -- Line: 142
    -- upvalues: ItemType (copy), ClientStore (copy)
    p25.customMatchRemotes:Get("SetGlobalOreGeneratorSpeedMult"):CallServerAsync(p26, p27);

    if p27 == ItemType.EMERALD then
        ClientStore:dispatch({
            type = "CustomMatchUpdateGlobalOreGen",
            itemType = p27,
            speedMultiplier = p26
        });
    end;
end;

function u3.setDeathmatchTime(p28, p29) -- Line: 152
    -- upvalues: ClientStore (copy)
    p28.customMatchRemotes:Get("SetDeathmatchTime"):CallServerAsync(p29);
    ClientStore:dispatch({
        type = "CustomMatchUpdateSome",
        settings = {
            deathmatchTime = p29
        }
    });
end;

function u3.setRandomlySelectedShopItemCount(p30, p31) -- Line: 161
    -- upvalues: ClientStore (copy)
    p30.customMatchRemotes:Get("SetRandomlySelectedShopItemCount"):CallServerAsync(p31);
    ClientStore:dispatch({
        type = "CustomMatchUpdateSome",
        settings = {
            randomlySelectedShopItemCount = p31
        }
    });
end;

function u3.setBlockDecayTime(p32, p33) -- Line: 170
    -- upvalues: ClientStore (copy)
    p32.customMatchRemotes:Get("SetBlockDecayTime"):CallServerAsync(p33);
    ClientStore:dispatch({
        type = "CustomMatchUpdateSome",
        settings = {
            blockDecayTime = p33
        }
    });
end;

function u3.setSeverMaxPlayers(p34, p35) -- Line: 179
    -- upvalues: ClientStore (copy)
    p34.customMatchRemotes:Get("SetServerMaxPlayers"):CallServerAsync(p35);
    ClientStore:dispatch({
        type = "CustomMatchUpdateSome",
        settings = {
            serverMaxPlayers = p35
        }
    });
end;

function u3.generateDropdownItems(p36, p37) -- Line: 188
    -- upvalues: HostPanelDropdownMeta (copy)
    local v38 = HostPanelDropdownMeta[p37];

    local function _(p39) -- Line: 190
        return {
            text = p39,
            value = p39
        };
    end;

    local v40 = table.create(#v38);

    for i, v in v38 do
        local _ = i - 1;
        v40[i] = {
            text = v,
            value = v
        };
    end;

    return v40;
end;

function u3.setDropdown(p41, p42, p43) -- Line: 205
    -- upvalues: HostPanelDropdownMeta (copy), HostPanelDropdown (copy), default (copy), ClientStore (copy)
    if table.find(HostPanelDropdownMeta[p42], p43) == nil then
        return nil;
    end;

    if p42 == HostPanelDropdown.LateJoinTeam then
        p41.customMatchRemotes:Get("SetLateJoinTeam"):CallServerAsync(p43);
    elseif p42 == HostPanelDropdown.Weather then
        p41.customMatchRemotes:Get("SetWeather"):CallServerAsync(p43);
    else
        default.Warn("Host panel " .. tostring(p42) .. " is not being handled in the setDropdown function of custom-match-controller.tsx");
    end;

    ClientStore:dispatch({
        type = "CustomMatchUpdateDropdown",
        dropdown = p42,
        value = p43
    });
end;

function u3.setToggle(p44, p45, p46) -- Line: 231
    -- upvalues: HostPanelToggleValue (copy), HostPanelToggle (copy), default (copy), ClientStore (copy)
    if HostPanelToggleValue[p46] ~= nil then
        local v47 = false;

        if p45 == HostPanelToggle.BypassPlacementLimits then
            p44.customMatchRemotes:Get("SetPlacementLimits"):CallServerAsync(p46);
        elseif p45 == HostPanelToggle.HideAllNametags then
            p44.customMatchRemotes:Get("SetHideNametags"):CallServerAsync(p46);
        elseif p45 == HostPanelToggle.LockServer then
            p44.customMatchRemotes:Get("SetLockServer"):CallServerAsync(p46);
        elseif p45 == HostPanelToggle.TeamOverflow then
            p44.customMatchRemotes:Get("SetTeamOverflow"):CallServerAsync(p46);
        elseif p45 == HostPanelToggle.TeamSwitching then
            p44.customMatchRemotes:Get("SetTeamSwitching"):CallServerAsync(p46);
        else
            if p45 == HostPanelToggle.LateJoining then
                p44.customMatchRemotes:Get("SetLateJoining"):CallServerAsync(p46);
                v47 = true;
            end;

            if v47 or p45 == HostPanelToggle.PvP then
                p44.customMatchRemotes:Get("SetPvP"):CallServerAsync(p46);
            elseif p45 == HostPanelToggle.Emotes then
                p44.customMatchRemotes:Get("SetEmotes"):CallServerAsync(p46);
            elseif p45 == HostPanelToggle.BedBreaking then
                p44.customMatchRemotes:Get("SetBedBreaking"):CallServerAsync(p46);
            elseif p45 == HostPanelToggle.BlockBreaking then
                p44.customMatchRemotes:Get("SetBlockBreaking"):CallServerAsync(p46);
            elseif p45 == HostPanelToggle.BlockPlacing then
                p44.customMatchRemotes:Get("SetBlockPlacing"):CallServerAsync(p46);
            elseif p45 == HostPanelToggle.IgnoreBuildRestrictedRegions then
                p44.customMatchRemotes:Get("SetIgnoreBuildRestrictedRegions"):CallServerAsync(p46);
            elseif p45 == HostPanelToggle.MapBorderDamage then
                p44.customMatchRemotes:Get("SetDisableOutsideMapDamage"):CallServerAsync(p46);
            elseif p45 == HostPanelToggle.KeepInventoryOnDeath then
                p44.customMatchRemotes:Get("SetKeepInventoryOnDeath"):CallServerAsync(p46);
            elseif p45 == HostPanelToggle.AllowRandomlySelectedShopItems then
                p44.customMatchRemotes:Get("SetAllowRandomlySelectedShopItems"):CallServerAsync(p46);
            elseif p45 == HostPanelToggle.SpawnGuardians then
                p44.customMatchRemotes:Get("SetSpawnGuardians"):CallServerAsync(p46);
            elseif p45 == HostPanelToggle.SpawnTitan then
                p44.customMatchRemotes:Get("SetSpawnTitan"):CallServerAsync(p46);
            elseif p45 == HostPanelToggle.SpawnOres then
                p44.customMatchRemotes:Get("SetSpawnOres"):CallServerAsync(p46);
            elseif p45 == HostPanelToggle.PassiveWeatherEffectsEnabled then
                p44.customMatchRemotes:Get("SetToggle"):CallServerAsync(HostPanelToggle.PassiveWeatherEffectsEnabled, p46);
            elseif p45 == HostPanelToggle.WeatherEventsEnabled then
                p44.customMatchRemotes:Get("SetToggle"):CallServerAsync(HostPanelToggle.WeatherEventsEnabled, p46);
            elseif p45 == HostPanelToggle.Recalling then
                p44.customMatchRemotes:Get("SetToggle"):CallServerAsync(HostPanelToggle.Recalling, p46);
            elseif p45 == HostPanelToggle.GameVisibilityMode then
                p44.customMatchRemotes:Get("SetToggle"):CallServerAsync(HostPanelToggle.GameVisibilityMode, p46);
            elseif p45 == HostPanelToggle.AutoRestartGame then
                p44.customMatchRemotes:Get("SetToggle"):CallServerAsync(HostPanelToggle.AutoRestartGame, p46);
            elseif p45 == HostPanelToggle.SpawnVoidMonsters then
                p44.customMatchRemotes:Get("SetToggle"):CallServerAsync(HostPanelToggle.SpawnVoidMonsters, p46);
            else
                default.Warn("Host panel " .. tostring(p45) .. " is not being handled in the setToggle function of custom-match-controller.tsx");
            end;
        end;

        ClientStore:dispatch({
            type = "CustomMatchUpdateGeneralToggle",
            toggle = p45,
            value = p46
        });
    end;
end;

function u3.setKitDisabled(p48, p49, p50) -- Line: 344
    -- upvalues: ClientStore (copy)
    p48.customMatchRemotes:Get("SetKitDisabled"):CallServerAsync(p49, p50);
    ClientStore:dispatch({
        type = "CustomMatchUpdateKit",
        kit = p49,
        value = p50
    });
end;

function u3.setAllKitsDisabled(p51, u52) -- Line: 352
    -- upvalues: u1 (copy), BedwarsKit (copy), ClientStore (copy)
    p51.customMatchRemotes:Get("SetAllKitsDisabled"):CallServerAsync(u52);
    local v53 = u1.values(BedwarsKit);

    local function _(p54, p55) -- Line: 355
        -- upvalues: u52 (copy)
        p54[p55] = u52;

        return p54;
    end;

    local v56 = {};

    for i = 1, #v53 do
        local _ = i - 1;
        v56[v53[i]] = u52;
    end;

    ClientStore:dispatch({
        type = "CustomMatchUpdateAllKits",
        disabledKits = v56
    });
end;

function u3.setItemDisabled(p57, p58, p59) -- Line: 372
    -- upvalues: ClientStore (copy)
    p57.customMatchRemotes:Get("SetItemDisabled"):CallServerAsync(p58, p59);
    ClientStore:dispatch({
        type = "CustomMatchUpdateItem",
        item = p58,
        value = p59
    });
end;

function u3.setAllItemsDisabled(p60, u61) -- Line: 380
    -- upvalues: u1 (copy), BedwarsShop (copy), ClientStore (copy)
    p60.customMatchRemotes:Get("SetAllItemsDisabled"):CallServerAsync(u61);
    local v62 = u1.values(BedwarsShop.ShopItems);

    local function _(p63, p64) -- Line: 383
        -- upvalues: u61 (copy)
        p63[p64.itemType] = u61;

        return p63;
    end;

    local v65 = {};

    for i = 1, #v62 do
        local _ = i - 1;
        v65[v62[i].itemType] = u61;
    end;

    ClientStore:dispatch({
        type = "CustomMatchUpdateAllItems",
        disabledItems = v65
    });
end;

function u3.blacklistPlayer(p66, p67) -- Line: 400
    p66.customMatchRemotes:Get("BlacklistPlayer"):CallServerAsync(p67);
end;

function u3.toggleCohost(p68, p69) -- Line: 403
    p68.customMatchRemotes:Get("CohostPlayer"):CallServerAsync(p69);
end;

function u3.setPlayerTeam(p70, p71, p72) -- Line: 406
    p70.customMatchRemotes:Get("SetPlayerTeam"):CallServerAsync(p71, p72);
end;

function u3.setPlayerMaxHealth(p73, p74, p75) -- Line: 409
    p73.customMatchRemotes:Get("SetPlayerMaxHealth"):CallServerAsync(p74, p75);
end;

function u3.saveMap(p76, p77) -- Line: 412
    return p76.customMatchRemotes:Get("SaveMap"):CallServerAsync(p77);
end;

function u3.getMySavedMaps(p78) -- Line: 415
    -- upvalues: ClientStore (copy), RuntimeLib (copy)
    local mapSaves = ClientStore:getState().CustomMatch.mapSaves;

    if mapSaves then
        return RuntimeLib.Promise.new(function(p79) -- Line: 418
            -- upvalues: mapSaves (copy)
            return p79(mapSaves);
        end);
    end;

    local v80 = p78.customMatchRemotes:Get("GetMySavedMaps"):CallServerAsync();
    v80:andThen(function(p81) -- Line: 423
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "CustomMatchSetMapSaves",
            mapSaves = p81
        });
    end);

    return v80;
end;

function u3.getMapDisplayInfo(p82, p83) -- Line: 432
    return p82.customMatchRemotes:Get("GetMapInfo"):CallServerAsync(p83);
end;

function u3.deleteMapSave(p84, p85) -- Line: 435
    return p84.customMatchRemotes:Get("DeleteSavedMap"):CallServerAsync(p85);
end;

function u3.updateMapSaveSettings(p86, p87, p88) -- Line: 438
    return p86.customMatchRemotes:Get("UpdateSavedMapSettings"):CallServerAsync(p87, p88);
end;

function u3.autoSplitTeams(p89) -- Line: 441
    p89.customMatchRemotes:Get("AutoSplitTeams"):CallServer();
end;

KnitClient.CreateController(u3.new());

return nil;