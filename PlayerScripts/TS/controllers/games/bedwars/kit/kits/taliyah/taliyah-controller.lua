-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local TaliyahUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "taliyah", "taliyah-util").TaliyahUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local ChickenUi = RuntimeLib.import(script, script.Parent, "ui", "chicken-ui").ChickenUi;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "TaliyahController";
    end,

    __index = BaseKitController
});
u2.__index = u2;

function u2.new(...) -- Line: 20
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 24
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p4, BedwarsKit.TALIYAH);
    p4.Name = "TaliyahController";
    p4.settingUpStackTree = false;
end;

function u2.KnitStart(p5) -- Line: 29
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p5);
end;

function u2.onKitLocalActivated(u6, p7) -- Line: 32
    -- upvalues: TaliyahUtil (copy), KnitClient (copy), u1 (copy), ChickenUi (copy), Workspace (copy)
    if u6.priceTree or u6.settingUpStackTree then
        return nil;
    end;

    u6.settingUpStackTree = true;
    local v8 = TaliyahUtil:getPrice();
    u6.priceTree = KnitClient.Controllers.StatusInfoListController:waitForSetupAddElement(u1.createElement(ChickenUi, {
        chickenPrice = v8.price,
        currency = v8.currency
    }));
    p7:GiveTask(function() -- Line: 42
        -- upvalues: u6 (copy), u1 (ref)
        if u6.priceTree then
            u1.unmount(u6.priceTree);
        end;
    end);
    p7:GiveTask(Workspace:GetAttributeChangedSignal("ChickenPrice"):Connect(function(p9) -- Line: 47
        -- upvalues: u6 (copy)
        u6:updateTree();
    end));
end;

function u2.onKitLocalDeactivated(p10) -- Line: 51
end;

function u2.onKitReplicationActivated(p11, p12) -- Line: 53
end;

function u2.onKitReplicationDeactivated(p13) -- Line: 55
end;

function u2.onInnateAbilityEnabled(p14, p15, p16) -- Line: 57
end;

function u2.onAbilityUsed(p17, p18, p19) -- Line: 59
end;

function u2.updateTree(p20) -- Line: 61
    -- upvalues: TaliyahUtil (copy), u1 (copy), ChickenUi (copy)
    if p20.priceTree then
        local v21 = TaliyahUtil:getPrice();
        u1.update(p20.priceTree, u1.createElement(ChickenUi, {
            chickenPrice = v21.price,
            currency = v21.currency
        }));
    end;
end;

KnitClient.CreateController(u2.new());

return nil;