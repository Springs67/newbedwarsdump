-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "ShipBarController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p4);
    p4.Name = "ShipBarController";
    p4.maid = u1.new();
end;

function u2.KnitStart(p5) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p5);
end;

function u2.mountEntityBossBar(u6, u7, p8) -- Line: 31
    u6:mountBossBar(u7:getHealth(), u7:getMaxHealth(), p8);
    u6.maid:GiveTask(u7:getInstance():GetAttributeChangedSignal("Health"):Connect(function() -- Line: 33
        -- upvalues: u6 (copy), u7 (copy)
        u6:updateHealth(u7:getHealth());
    end));
    u6.maid:GiveTask(u7:getInstance():GetAttributeChangedSignal("MaxHealth"):Connect(function() -- Line: 36
        -- upvalues: u6 (copy), u7 (copy)
        u6:updateHealth(u7:getHealth(), u7:getMaxHealth());
    end));
    u6.maid:GiveTask(u7:getInstance().AncestryChanged:Connect(function() -- Line: 39
        -- upvalues: u6 (copy)
        u6:updateHealth(0);
    end));
end;

function u2.mountBossBar(p9, p10, p11, p12) -- Line: 43
    -- upvalues: Flamework (copy), BedwarsAppIds (copy)
    p9:unmountBar();
    p9:updateHealth(p10, p11);
    local v13 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
    local BOSS_BAR = BedwarsAppIds.BOSS_BAR;
    local v14 = {};

    if type(p12) == "table" then
        for i, v in p12 do
            v14[i] = v;
        end;
    end;

    v13:openApp(BOSS_BAR, v14);
end;

function u2.updateHealth(p15, p16, p17) -- Line: 56
    -- upvalues: ClientStore (copy)
    local v18 = p16 < 0 and 0 or p16;

    if v18 == 0 then
        p15:unmountBar();
    end;

    if p17 == 0 or (p17 ~= p17 or not p17) then
        ClientStore:dispatch({
            type = "BedwarsUpdateBossBar",
            health = v18
        });

        return nil;
    end;

    ClientStore:dispatch({
        type = "BedwarsUpdateBossBar",
        health = v18,
        maxHealth = p17
    });
end;

function u2.unmountBar(p19) -- Line: 76
    -- upvalues: Flamework (copy), BedwarsAppIds (copy)
    p19.maid:DoCleaning();
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.BOSS_BAR);
end;

KnitClient.CreateController(u2.new());

return nil;