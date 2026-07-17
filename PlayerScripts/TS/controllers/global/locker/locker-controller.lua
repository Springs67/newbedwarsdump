-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local UILayers = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local LockerApp = RuntimeLib.import(script, script.Parent.Parent.Parent, "lobby", "locker", "ui", "locker-app").LockerApp;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local LockerItemCategory = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-item-types").LockerItemCategory;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "LockerController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 24
    -- upvalues: u1 (copy)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 28
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p3);
    p3.Name = "LockerController";
    p3.namespace = default.Client:GetNamespace("Locker");
    p3.sentEquippedRequest = {};
    p3.sentOwnedItemsRequest = {};
    p3.isLockerItemOwnedRequestSent = {};
end;

function u1.KnitStart(p4) -- Line: 36
    -- upvalues: ClientStore (copy)
    p4.namespace:WaitFor("FullLockerUpdate"):andThen(function(p5) -- Line: 38
        -- upvalues: ClientStore (ref)
        p5:Connect(function(p6) -- Line: 39
            -- upvalues: ClientStore (ref)
            ClientStore:dispatch({
                type = "LockerUpdateAll",
                locker = p6.locker
            });
        end);
    end);
    p4.namespace:WaitFor("NewLockerItems"):andThen(function(p7) -- Line: 48
        -- upvalues: ClientStore (ref)
        p7:Connect(function(p8) -- Line: 49
            -- upvalues: ClientStore (ref)
            ClientStore:dispatch({
                type = "LockerAddOwnedItems",
                items = p8
            });
        end);
    end);
end;

function u1.openLockerWithTab(p9, p10) -- Line: 58
    -- upvalues: Flamework (copy), BedwarsAppIds (copy), LockerApp (copy), UILayers (copy)
    if not Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(BedwarsAppIds.LOCKER) then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            appId = BedwarsAppIds.LOCKER,
            app = LockerApp,
            layer = UILayers.MAIN
        }, {
            InitialTab = p10
        });
    end;
end;

function u1.getLockerCategoryItems(p11, p12) -- Line: 69
    -- upvalues: LockerItemCategory (copy), ClientStore (copy)
    if p11.sentOwnedItemsRequest[p12] == nil then
        p11.sentOwnedItemsRequest[p12] = true;
        local v13 = p11.namespace:Get("GetLockerCategoryItems"):CallServer(p12);
        ClientStore:dispatch({
            type = "LockerSetOwnedItems",
            items = {
                [p12] = v13
            }
        });

        return v13;
    end;

    if p12 == LockerItemCategory.EMOTE then
        return ClientStore:getState().Locker.emotes;
    end;

    if p12 == LockerItemCategory.BED_BREAK_EFFECT then
        return ClientStore:getState().Locker.breakBedEffects;
    end;

    if p12 == LockerItemCategory.KILL_EFFECT then
        return ClientStore:getState().Locker.killEffects;
    end;

    if p12 == LockerItemCategory.LOBBY_GADGET then
        return ClientStore:getState().Locker.lobbyGadgets;
    end;

    if p12 == LockerItemCategory.TITLE then
        return ClientStore:getState().Locker.titles;
    end;

    if p12 == LockerItemCategory.WIN_EFFECT then
        return ClientStore:getState().Locker.winEffects;
    end;

    if p12 == LockerItemCategory.BADGE then
        return ClientStore:getState().Locker.badges;
    end;

    if p12 == LockerItemCategory.BED_SKIN then
        return ClientStore:getState().Locker.bedSkins;
    end;

    if p12 == LockerItemCategory.ITEM_SKIN then
        return ClientStore:getState().Locker.itemSkins;
    end;
end;

function u1.getEquippedLockerItem(u14, u15, p16) -- Line: 117
    -- upvalues: LockerItemCategory (copy), ClientStore (copy), Players (copy)
    local v17 = nil;

    local function _() -- Line: 119
        -- upvalues: u14 (copy), u15 (copy)
        u14.sentEquippedRequest[u15] = true;

        return u14.namespace:Get("GetEquippedLockerItem"):CallServer(u15);
    end;

    if not p16 then
        if u15 == LockerItemCategory.EMOTE then
            local v18;

            if u14.sentEquippedRequest[u15] == nil then
                v18 = nil;
            else
                v18 = ClientStore:getState().Locker.selectedEmotes;
            end;

            if v18 then
                return v18;
            end;

            u14.sentEquippedRequest[u15] = true;
            local v19 = u14.namespace:Get("GetEquippedLockerItem"):CallServer(u15);
            ClientStore:dispatch({
                type = "LockerSetEmoteWheel",
                emoteWheel = v19
            });

            return v19;
        end;

        if u15 == LockerItemCategory.BED_BREAK_EFFECT then
            v17 = Players.LocalPlayer:GetAttribute("BreakBedEffectType");

            if v17 ~= ClientStore:getState().Locker.selectedBreakBedEffect then
                ClientStore:dispatch({
                    type = "LockerSetBreakBedEffect",
                    breakBedEffect = v17
                });

                return v17;
            end;
        elseif u15 == LockerItemCategory.KILL_EFFECT then
            v17 = Players.LocalPlayer:GetAttribute("KillEffectType");

            if v17 ~= ClientStore:getState().Locker.selectedKillEffect then
                ClientStore:dispatch({
                    type = "LockerSetKillEffect",
                    killEffect = v17
                });

                return v17;
            end;
        elseif u15 == LockerItemCategory.LOBBY_GADGET then
            v17 = Players.LocalPlayer:GetAttribute("LobbyGadgetType");

            if v17 ~= ClientStore:getState().Locker.selectedLobbyGadget then
                ClientStore:dispatch({
                    type = "LockerSetLobbyGadget",
                    lobbyGadget = v17
                });

                return v17;
            end;
        elseif u15 == LockerItemCategory.TITLE then
            v17 = Players.LocalPlayer:GetAttribute("TitleType");

            if v17 ~= ClientStore:getState().Locker.selectedTitle then
                ClientStore:dispatch({
                    type = "LockerSetTitle",
                    title = v17
                });

                return v17;
            end;
        elseif u15 == LockerItemCategory.WIN_EFFECT then
            v17 = Players.LocalPlayer:GetAttribute("WinEffectType");

            if v17 ~= ClientStore:getState().Locker.selectedWinEffect then
                ClientStore:dispatch({
                    type = "LockerSetWinEffect",
                    winEffect = v17
                });

                return v17;
            end;
        elseif u15 == LockerItemCategory.BED_SKIN then
            v17 = Players.LocalPlayer:GetAttribute("BedSkin");

            if v17 ~= ClientStore:getState().Locker.bedSkin then
                ClientStore:dispatch({
                    type = "LockerSetBedSkin",
                    bedSkin = v17
                });

                return v17;
            end;
        else
            if u15 == LockerItemCategory.BADGE then
                local v20;

                if u14.sentEquippedRequest[u15] == nil then
                    v20 = nil;
                else
                    v20 = ClientStore:getState().Locker.featuredBadges[1];
                end;

                if v20 then
                    return v20;
                end;

                u14.sentEquippedRequest[u15] = true;
                local v21 = u14.namespace:Get("GetEquippedLockerItem"):CallServer(u15);
                ClientStore:dispatch({
                    type = "LockerSetFeaturedBadge",
                    badge = v21
                });

                return v21;
            end;

            if u15 == LockerItemCategory.ITEM_SKIN then
                local v22;

                if u14.sentEquippedRequest[u15] == nil then
                    v22 = nil;
                else
                    v22 = ClientStore:getState().Locker.selectedItemSkins;
                end;

                if v22 then
                    return v22;
                end;

                u14.sentEquippedRequest[u15] = true;
                local v23 = u14.namespace:Get("GetEquippedLockerItem"):CallServer(u15);
                ClientStore:dispatch({
                    type = "LockerSetSelectedItemSkins",
                    selectedItemSkins = v23
                });

                return v23;
            end;
        end;
    end;

    return v17;
end;

function u1.setEmote(p24, p25, p26) -- Line: 236
    -- upvalues: ClientStore (copy)
    if p24.namespace:Get("SetEmote"):CallServer({
        emote = p25,
        slot = p26
    }) then
        ClientStore:dispatch({
            type = "LockerSetEmote",
            emote = p25,
            slot = p26
        });
    end;
end;

function u1.setKillEffect(p27, p28) -- Line: 249
    -- upvalues: ClientStore (copy)
    if p27.namespace:Get("SetKillEffect"):CallServer({
        killEffect = p28
    }) then
        ClientStore:dispatch({
            type = "LockerSetKillEffect",
            killEffect = p28
        });
    end;
end;

function u1.setTitle(p29, p30) -- Line: 260
    -- upvalues: ClientStore (copy)
    if p29.namespace:Get("SetTitle"):CallServer({
        title = p30
    }) then
        ClientStore:dispatch({
            type = "LockerSetTitle",
            title = p30
        });
    end;
end;

function u1.setLobbyGadget(p31, p32) -- Line: 271
    -- upvalues: ClientStore (copy)
    if p31.namespace:Get("SetLobbyGadget"):CallServer({
        lobbyGadget = p32
    }) then
        ClientStore:dispatch({
            type = "LockerSetLobbyGadget",
            lobbyGadget = p32
        });
    end;
end;

function u1.setBedSkin(p33, p34) -- Line: 282
    -- upvalues: ClientStore (copy)
    if p33.namespace:Get("SetBedSkin"):CallServer({
        bedSkin = p34
    }) then
        ClientStore:dispatch({
            type = "LockerSetBedSkin",
            bedSkin = p34
        });
    end;
end;

function u1.setItemSkin(p35, p36, p37) -- Line: 293
    -- upvalues: ClientStore (copy)
    local v38 = p35.namespace:Get("SetItemSkin"):CallServer({
        itemType = p36,
        itemSkin = p37
    });

    if v38 then
        ClientStore:dispatch({
            type = "LockerSetItemSkin",
            itemType = p36,
            itemSkin = p37
        });
    end;

    return v38;
end;

function u1.setWinEffect(p39, p40) -- Line: 307
    -- upvalues: ClientStore (copy)
    if p39.namespace:Get("SetWinEffect"):CallServer({
        winEffect = p40
    }) then
        ClientStore:dispatch({
            type = "LockerSetWinEffect",
            winEffect = p40
        });
    end;
end;

function u1.setBreakBedEffect(p41, p42) -- Line: 318
    -- upvalues: ClientStore (copy)
    if p41.namespace:Get("SetBreakBedEffect"):CallServer({
        breakBedEffect = p42
    }) then
        ClientStore:dispatch({
            type = "LockerSetBreakBedEffect",
            breakBedEffect = p42
        });
    end;
end;

function u1.setFeaturedBadge(p43, p44) -- Line: 329
    -- upvalues: ClientStore (copy)
    if p43.namespace:Get("SetFeaturedBadge"):CallServer({
        badge = p44
    }) then
        ClientStore:dispatch({
            type = "LockerSetFeaturedBadge",
            badge = p44
        });
    end;
end;

function u1.ownsLobbyGadget(p45, p46) -- Line: 340
    -- upvalues: ClientStore (copy), LockerItemCategory (copy)
    local lobbyGadgets = ClientStore:getState().Locker.lobbyGadgets;
    local v47 = table.find(lobbyGadgets, p46) ~= nil;

    if v47 then
        return true;
    end;

    if p45.isLockerItemOwnedRequestSent[p46] ~= nil then
        return v47;
    end;

    local v48 = p45.namespace:Get("CheckOwnsLockerItem"):CallServer(LockerItemCategory.LOBBY_GADGET, p46);
    p45.isLockerItemOwnedRequestSent[p46] = true;

    if v48 then
        ClientStore:dispatch({
            type = "LockerAddOwnedItems",
            items = {
                [LockerItemCategory.LOBBY_GADGET] = { p46 }
            }
        });
    end;

    return v48;
end;

function u1.ownsTitle(p49, p50) -- Line: 366
    -- upvalues: ClientStore (copy), LockerItemCategory (copy)
    local titles = ClientStore:getState().Locker.titles;
    local v51 = table.find(titles, p50) ~= nil;

    if v51 then
        return true;
    end;

    if p49.isLockerItemOwnedRequestSent[p50] ~= nil then
        return v51;
    end;

    local v52 = p49.namespace:Get("CheckOwnsLockerItem"):CallServer(LockerItemCategory.TITLE, p50);
    p49.isLockerItemOwnedRequestSent[p50] = true;

    if v52 then
        ClientStore:dispatch({
            type = "LockerAddOwnedItems",
            items = {
                [LockerItemCategory.TITLE] = { p50 }
            }
        });
    end;

    return v52;
end;

function u1.ownsEmote(p53, p54) -- Line: 392
    -- upvalues: ClientStore (copy), LockerItemCategory (copy)
    local emotes = ClientStore:getState().Locker.emotes;
    local v55 = table.find(emotes, p54) ~= nil;

    if v55 then
        return true;
    end;

    if p53.isLockerItemOwnedRequestSent[p54] ~= nil then
        return v55;
    end;

    local v56 = p53.namespace:Get("CheckOwnsLockerItem"):CallServer(LockerItemCategory.EMOTE, p54);
    p53.isLockerItemOwnedRequestSent[p54] = true;

    if v56 then
        ClientStore:dispatch({
            type = "LockerAddOwnedItems",
            items = {
                [LockerItemCategory.EMOTE] = { p54 }
            }
        });
    end;

    return v56;
end;

function u1.ownsWinEffect(p57, p58) -- Line: 418
    -- upvalues: ClientStore (copy), LockerItemCategory (copy)
    local winEffects = ClientStore:getState().Locker.winEffects;
    local v59 = table.find(winEffects, p58) ~= nil;

    if v59 then
        return true;
    end;

    if p57.isLockerItemOwnedRequestSent[p58] ~= nil then
        return v59;
    end;

    local v60 = p57.namespace:Get("CheckOwnsLockerItem"):CallServer(LockerItemCategory.WIN_EFFECT, p58);
    p57.isLockerItemOwnedRequestSent[p58] = true;

    if v60 then
        ClientStore:dispatch({
            type = "LockerAddOwnedItems",
            items = {
                [LockerItemCategory.WIN_EFFECT] = { p58 }
            }
        });
    end;

    return v60;
end;

function u1.ownsKillEffect(p61, p62) -- Line: 444
    -- upvalues: ClientStore (copy), LockerItemCategory (copy)
    local killEffects = ClientStore:getState().Locker.killEffects;
    local v63 = table.find(killEffects, p62) ~= nil;

    if v63 then
        return true;
    end;

    if p61.isLockerItemOwnedRequestSent[p62] ~= nil then
        return v63;
    end;

    local v64 = p61.namespace:Get("CheckOwnsLockerItem"):CallServer(LockerItemCategory.KILL_EFFECT, p62);
    p61.isLockerItemOwnedRequestSent[p62] = true;

    if v64 then
        ClientStore:dispatch({
            type = "LockerAddOwnedItems",
            items = {
                [LockerItemCategory.KILL_EFFECT] = { p62 }
            }
        });
    end;

    return v64;
end;

function u1.ownsBedSkin(p65, p66) -- Line: 470
    -- upvalues: ClientStore (copy), LockerItemCategory (copy)
    local bedSkins = ClientStore:getState().Locker.bedSkins;
    local v67 = table.find(bedSkins, p66) ~= nil;

    if v67 then
        return true;
    end;

    if p65.isLockerItemOwnedRequestSent[p66] ~= nil then
        return v67;
    end;

    local v68 = p65.namespace:Get("CheckOwnsLockerItem"):CallServer(LockerItemCategory.BED_SKIN, p66);
    p65.isLockerItemOwnedRequestSent[p66] = true;

    if v68 then
        ClientStore:dispatch({
            type = "LockerAddOwnedItems",
            items = {
                [LockerItemCategory.BED_SKIN] = { p66 }
            }
        });
    end;

    return v68;
end;

function u1.ownsItemSkin(p69, p70) -- Line: 496
    -- upvalues: ClientStore (copy), LockerItemCategory (copy)
    local itemSkins = ClientStore:getState().Locker.itemSkins;
    local v71 = table.find(itemSkins, p70) ~= nil;

    if v71 then
        return true;
    end;

    if p69.isLockerItemOwnedRequestSent[p70] ~= nil then
        return v71;
    end;

    local v72 = p69.namespace:Get("CheckOwnsLockerItem"):CallServer(LockerItemCategory.ITEM_SKIN, p70);
    p69.isLockerItemOwnedRequestSent[p70] = true;

    if v72 then
        ClientStore:dispatch({
            type = "LockerAddOwnedItems",
            items = {
                [LockerItemCategory.ITEM_SKIN] = { p70 }
            }
        });
    end;

    return v72;
end;

function u1.ownsBedBreakEffect(p73, p74) -- Line: 522
    -- upvalues: ClientStore (copy), LockerItemCategory (copy)
    local breakBedEffects = ClientStore:getState().Locker.breakBedEffects;
    local v75 = table.find(breakBedEffects, p74) ~= nil;

    if v75 then
        return true;
    end;

    if p73.isLockerItemOwnedRequestSent[p74] ~= nil then
        return v75;
    end;

    local v76 = p73.namespace:Get("CheckOwnsLockerItem"):CallServer(LockerItemCategory.BED_BREAK_EFFECT, p74);
    p73.isLockerItemOwnedRequestSent[p74] = true;

    if v76 then
        ClientStore:dispatch({
            type = "LockerAddOwnedItems",
            items = {
                [LockerItemCategory.BED_BREAK_EFFECT] = { p74 }
            }
        });
    end;

    return v76;
end;

function u1.ownsBadge(p77, p78) -- Line: 548
    -- upvalues: ClientStore (copy), LockerItemCategory (copy)
    local badges = ClientStore:getState().Locker.badges;
    local v79 = table.find(badges, p78) ~= nil;

    if v79 then
        return true;
    end;

    if p77.isLockerItemOwnedRequestSent[p78] ~= nil then
        return v79;
    end;

    local v80 = p77.namespace:Get("CheckOwnsLockerItem"):CallServer(LockerItemCategory.BADGE, p78);
    p77.isLockerItemOwnedRequestSent[p78] = true;

    if v80 then
        ClientStore:dispatch({
            type = "LockerAddOwnedItems",
            items = {
                [LockerItemCategory.BADGE] = { p78 }
            }
        });
    end;

    return v80;
end;

KnitClient.CreateController(u1.new());

return nil;