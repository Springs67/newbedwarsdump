-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BarbarianKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "barbarian", "barbarian-kit").BarbarianKit;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local BarbarianRageBarWrapper = RuntimeLib.import(script, script.Parent, "ui", "barbarian-rage-bar").BarbarianRageBarWrapper;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "BarbarianKitController";
    end,

    __index = BaseKitController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 28
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p4, BedwarsKit.BARBARIAN);
    p4.Name = "BarbarianKitController";
end;

function u2.onKitLocalActivated(p5, p6) -- Line: 32
    -- upvalues: Players (copy), ClientStore (copy), BarbarianKit (copy), SoundManager (copy), GameSound (copy), CreateRoduxApp (copy), BarbarianRageBarWrapper (copy)
    p6:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("BarbarianRageLevel"):Connect(function() -- Line: 33
        -- upvalues: ClientStore (ref), Players (ref)
        ClientStore:dispatch({
            type = "KitBarbarianSetRage",
            rage = Players.LocalPlayer:GetAttribute("BarbarianRageLevel")
        });
    end));
    local u7 = BarbarianKit.SwordProgression[1];
    local u11 = ClientStore.changed:connect(function(p8, p9) -- Line: 40
        -- upvalues: BarbarianKit (ref), Players (ref), u7 (ref), SoundManager (ref), GameSound (ref)
        if p8.Kit.barbarianRage ~= p9.Kit.barbarianRage then
            local v10 = BarbarianKit.getSwordProgress(Players.LocalPlayer);

            if v10.prev ~= u7 then
                u7 = v10.prev;

                if p8.Kit.barbarianRage > p9.Kit.barbarianRage then
                    SoundManager:playSound(GameSound.BEDWARS_PURCHASE_ITEM);
                end;
            end;
        end;
    end);
    p6:GiveTask(function() -- Line: 51
        -- upvalues: u11 (copy)
        u11:disconnect();
    end);
    p5:unmountRageBar();
    p5.rageBarTree = CreateRoduxApp("BarbarianRageBar", BarbarianRageBarWrapper, {});
end;

function u2.onKitLocalDeactivated(p12) -- Line: 57
    p12:unmountRageBar();
end;

function u2.onKitReplicationActivated(p13, p14) -- Line: 60
end;

function u2.onKitReplicationDeactivated(p15) -- Line: 62
end;

function u2.onInnateAbilityEnabled(p16, p17, p18) -- Line: 64
end;

function u2.onAbilityUsed(p19, p20, p21) -- Line: 66
end;

function u2.unmountRageBar(p22) -- Line: 68
    -- upvalues: u1 (copy)
    if p22.rageBarTree then
        u1.unmount(p22.rageBarTree);
        p22.rageBarTree = nil;
    end;
end;

KnitClient.CreateController(u2.new());

return nil;