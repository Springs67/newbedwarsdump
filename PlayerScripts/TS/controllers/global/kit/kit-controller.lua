-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchPlayer = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchPlayer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local BedwarsKitShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util");
local doesPlayerHaveExtraKitAttribute = v2.doesPlayerHaveExtraKitAttribute;
local getKitArrayFromCommaSeparatedString = v2.getKitArrayFromCommaSeparatedString;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "KitController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 27
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "KitController";
end;

function u3.KnitStart(u6) -- Line: 35
    -- upvalues: KnitController (copy), WatchPlayer (copy), ClientSyncEvents (copy), Players (copy), ClientStore (copy)
    KnitController.KnitStart(u6);
    WatchPlayer(function(u7) -- Line: 37
        -- upvalues: u6 (copy), ClientSyncEvents (ref), Players (ref), ClientStore (ref)
        local u8 = u6:getActiveKits(u7);
        u7:GetAttributeChangedSignal("PlayingAsKits"):Connect(function() -- Line: 39
            -- upvalues: u6 (ref), u7 (copy), u8 (ref), ClientSyncEvents (ref), Players (ref), ClientStore (ref)
            local v9 = u6:getActiveKits(u7);

            for _, v in u8 do
                if table.find(v9, v) == nil then
                    ClientSyncEvents.KitUnequip:fire(u7, v);
                end;
            end;

            for _, v in v9 do
                if table.find(u8, v) == nil then
                    ClientSyncEvents.KitEquip:fire(u7, v);
                end;
            end;

            u8 = v9;

            if u7 == Players.LocalPlayer then
                ClientStore:dispatch({
                    type = "SetBedwarsKit",
                    kit = u6:getPrimaryActiveKit(u7)
                });
            end;
        end);

        if u8 and #u8 > 0 then
            for _, v in u8 do
                ClientSyncEvents.KitEquip:fire(u7, v);

                if u7 == Players.LocalPlayer then
                    ClientStore:dispatch({
                        type = "SetBedwarsKit",
                        kit = u6:getPrimaryActiveKit(u7)
                    });
                end;
            end;
        end;
    end);
end;

function u3.getActiveKits(p10, p11) -- Line: 74
    -- upvalues: BedwarsKit (copy), getKitArrayFromCommaSeparatedString (copy)
    local v12 = p11:GetAttribute("PlayingAsKits");

    if v12 == nil then
        return { BedwarsKit.NONE };
    end;

    local v13 = getKitArrayFromCommaSeparatedString(v12);

    return #v13 == 0 and { BedwarsKit.NONE } or v13;
end;

function u3.getPrimaryActiveKit(p14, p15) -- Line: 85
    -- upvalues: BedwarsKit (copy)
    local v16 = p14:getActiveKits(p15);

    if #v16 > 0 then
        return v16[1];
    end;

    return BedwarsKit.NONE;
end;

function u3.isUsingKit(p17, p18, p19) -- Line: 92
    -- upvalues: doesPlayerHaveExtraKitAttribute (copy)
    if p18 == nil then
        return false;
    end;

    local v20 = p17:getActiveKits(p18);

    return table.find(v20, p19) ~= nil and true or (doesPlayerHaveExtraKitAttribute(p18, p19) and true or false);
end;

function u3.isUsingKitModel(p21, p22) -- Line: 106
    local v23 = p22:GetAttribute("UsingKitSkinModel");

    if v23 == nil then
        v23 = false;
    end;

    return v23;
end;

function u3.getKitSkin(p24, p25) -- Line: 113
    -- upvalues: BedwarsKitSkin (copy)
    if not p25:IsA("Player") then
        return p25:GetAttribute("KitSkin") or BedwarsKitSkin.DEFAULT;
    end;

    local Character = p25.Character;

    if Character ~= nil then
        Character = Character:GetAttribute("KitSkin");
    end;

    if Character == nil then
        Character = BedwarsKitSkin.DEFAULT;
    end;

    return Character;
end;

function u3.watchLocalKit(p26, u27) -- Line: 128
    -- upvalues: u1 (copy), ClientSyncEvents (copy), Players (copy)
    local v28 = u1.new();
    v28:GiveTask(ClientSyncEvents.KitEquip:connect(function(u29) -- Line: 130
        -- upvalues: Players (ref), u27 (copy)
        if u29.player ~= Players.LocalPlayer then
            return nil;
        end;

        task.spawn(function() -- Line: 134
            -- upvalues: u27 (ref), u29 (copy)
            u27(u29.kit);
        end);
    end));
    u27(p26:getPrimaryActiveKit(Players.LocalPlayer));

    return v28;
end;

function u3.watchKit(p30, u31) -- Line: 141
    -- upvalues: u1 (copy), ClientSyncEvents (copy), Players (copy)
    local v32 = u1.new();
    v32:GiveTask(ClientSyncEvents.KitEquip:connect(function(u33) -- Line: 143
        -- upvalues: u31 (copy)
        task.spawn(function() -- Line: 144
            -- upvalues: u31 (ref), u33 (copy)
            u31(u33.player, u33.kit);
        end);
    end));

    for _, v in Players:GetPlayers() do
        local u34 = p30:getPrimaryActiveKit(v);

        if u34 then
            task.spawn(function() -- Line: 151
                -- upvalues: u31 (copy), v (copy), u34 (copy)
                u31(v, u34);
            end);
        end;
    end;

    return v32;
end;

function u3.isKitFree(p35, p36) -- Line: 158
    -- upvalues: getBedwarsKitMeta (copy), BedwarsKitShop (copy), ClientStore (copy)
    return getBedwarsKitMeta(p36).freeKit or BedwarsKitShop.FreeKitRotation.kitAvailableThisWeek(p36, ClientStore:getState().Bedwars.freeKitLevel);
end;

function u3.ownsKit(p37, p38) -- Line: 161
    -- upvalues: ClientStore (copy)
    local ownedKits = ClientStore:getState().Bedwars.ownedKits;

    return table.find(ownedKits, p38) ~= nil;
end;

KnitClient.CreateController(u3.new());

return nil;