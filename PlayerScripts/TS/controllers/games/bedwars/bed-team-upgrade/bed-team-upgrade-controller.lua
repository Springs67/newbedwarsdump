-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "BedTeamUpgradeController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 20
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 24
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p4);
    p4.Name = "BedTeamUpgradeController";
    p4.requestPurchaseBedTeamUpgradeRemote = default.Client:Get("RequestPurchaseBedTeamUpgrade");
end;

function u2.KnitStart(p5) -- Line: 29
    -- upvalues: KnitController (copy), default (copy), KnitClient2 (copy), Players (copy), ClientStore (copy)
    KnitController.KnitStart(p5);
    default.Client:OnEvent("BedTeamUpgradeChanged", function(p6, p7) -- Line: 31
        -- upvalues: KnitClient2 (ref), Players (ref), ClientStore (ref)
        local v8 = KnitClient2.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

        if v8 ~= nil then
            v8 = v8.id;
        end;

        if p6 == v8 then
            ClientStore:dispatch({
                type = "SetMyBedTeamUpgrades",
                myBedTeamUpgrades = p7
            });
        end;

        ClientStore:dispatch({
            type = "BedwarsSetBedTeamUpgrades",
            teamId = p6,
            bedTeamUpgrades = p7
        });
    end);
end;

function u2.requestPurchaseBedTeamUpgrade(p9, p10) -- Line: 53
    return p9.requestPurchaseBedTeamUpgradeRemote:CallServer(p10);
end;

KnitClient.CreateController(u2.new());

return nil;