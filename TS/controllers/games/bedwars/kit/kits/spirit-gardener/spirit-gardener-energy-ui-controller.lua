-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local SpiritGardenerEnergyUi = RuntimeLib.import(script, script.Parent, "spirit-gardener-energy-ui").SpiritGardenerEnergyUi;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "SpiritGardenerEnergyUiController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 23
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 27
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p5);
    p5.Name = "SpiritGardenerEnergyUiController";
    p5.spiritEnergyUiKey = "LifeForceUI";
    p5.spiritEnergyUiMaid = u1.new();
    p5.spiritEnergyUiMaid = u1.new();
end;

function u3.KnitStart(u6) -- Line: 34
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), isUsingKit (copy), Players (copy), BedwarsKit (copy)
    KnitController.KnitStart(u6);
    ClientSyncEvents.KitUnequip:connect(function() -- Line: 36
        -- upvalues: isUsingKit (ref), Players (ref), BedwarsKit (ref), u6 (copy)
        if not isUsingKit(Players.LocalPlayer, BedwarsKit.SPIRIT_GARDENER) then
            u6.spiritEnergyUiMaid:DoCleaning();
        end;
    end);
end;

function u3.mountSpiritEnergyUi(p7) -- Line: 42
    -- upvalues: Flamework (copy), u2 (copy), SpiritGardenerEnergyUi (copy)
    p7.spiritEnergyUiMaid:DoCleaning();
    p7.spiritEnergyUiMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u2.createFragment({
        [p7.spiritEnergyUiKey] = u2.createElement(SpiritGardenerEnergyUi)
    })));
end;

function u3.unmountSpiritEnergyUi(p8) -- Line: 48
    p8.spiritEnergyUiMaid:DoCleaning();
end;

KnitClient.CreateController(u3.new());

return nil;