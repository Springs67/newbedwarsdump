-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local BarbarianRageBarWrapper = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "bedwars", "kit", "kits", "barbarian", "ui", "barbarian-rage-bar").BarbarianRageBarWrapper;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BarbarianKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "barbarian", "barbarian-kit").BarbarianKit;
local PvPArenaAugmentType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PvPArenaBaseAugmentController = RuntimeLib.import(script, script.Parent.Parent.Parent, "pvp-arena-base-augment-controller").PvPArenaBaseAugmentController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "PvPArenaBarbarianAugmentController";
    end,

    __index = PvPArenaBaseAugmentController
});
u1.__index = u1;

function u1.new(...) -- Line: 23
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 27
    -- upvalues: PvPArenaBaseAugmentController (copy), PvPArenaAugmentType (copy)
    PvPArenaBaseAugmentController.constructor(p3, PvPArenaAugmentType.BARBARIAN);
    p3.Name = "PvPArenaBarbarianAugmentController";
end;

function u1.onGameInit(p4) -- Line: 31
    -- upvalues: PvPArenaBaseAugmentController (copy)
    PvPArenaBaseAugmentController.onGameInit(p4);
end;

function u1.onActivated(p5) -- Line: 34
    -- upvalues: Players (copy), ClientStore (copy), BarbarianKit (copy), SoundManager (copy), GameSound (copy), CreateRoduxApp (copy), BarbarianRageBarWrapper (copy)
    Players.LocalPlayer:GetAttributeChangedSignal("BarbarianRageLevel"):Connect(function() -- Line: 35
        -- upvalues: ClientStore (ref), Players (ref)
        ClientStore:dispatch({
            type = "KitBarbarianSetRage",
            rage = Players.LocalPlayer:GetAttribute("BarbarianRageLevel")
        });
    end);
    local u6 = BarbarianKit.SwordProgression[1];
    ClientStore.changed:connect(function(p7, p8) -- Line: 42
        -- upvalues: BarbarianKit (ref), Players (ref), u6 (ref), SoundManager (ref), GameSound (ref)
        if p7.Kit.barbarianRage ~= p8.Kit.barbarianRage then
            local v9 = BarbarianKit.getSwordProgress(Players.LocalPlayer);

            if v9.prev ~= u6 then
                u6 = v9.prev;

                if p7.Kit.barbarianRage > p8.Kit.barbarianRage then
                    SoundManager:playSound(GameSound.BEDWARS_PURCHASE_ITEM);
                end;
            end;
        end;
    end);
    CreateRoduxApp("BarbarianRageBar", BarbarianRageBarWrapper, {});
end;

KnitClient.CreateController(u1.new());

return nil;