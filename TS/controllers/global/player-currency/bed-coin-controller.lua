-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "BedCoinController";
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
    p4.Name = "BedCoinController";
    p4.bedCoins = nil;
    p4.bedCoinsUpdateSignal = u1.new();
end;

function u2.KnitStart(u5) -- Line: 29
    -- upvalues: KnitController (copy), default (copy), Players (copy), ClientStore (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("BedCoinsUpdate"):Connect(function(p6, p7) -- Line: 31
        -- upvalues: Players (ref), ClientStore (ref), u5 (copy)
        if Players.LocalPlayer == p6 then
            ClientStore:dispatch({
                type = "BedwarsSetSome",
                data = {
                    bedCoins = p7
                }
            });
            u5.bedCoinsUpdateSignal:Fire(p7);
            u5.bedCoins = p7;
        end;
    end);
end;

function u2.getBedCoins(p8) -- Line: 44
    return p8.bedCoins;
end;

function u2.waitForBedCoins(p9) -- Line: 47
    local bedCoins = p9.bedCoins;

    if bedCoins == 0 or (bedCoins ~= bedCoins or not bedCoins) then
        return p9.bedCoinsUpdateSignal:Wait();
    end;

    return p9.bedCoins;
end;

KnitClient.CreateController(u2.new());

return nil;