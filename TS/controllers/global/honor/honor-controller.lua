-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local HonorGUI = RuntimeLib.import(script, script.Parent, "ui", "honor-gui").HonorGUI;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "HonorController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 20
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "HonorController";
    p3.appId = "HonorGUI";
    p3.waitingForOpen = false;
    p3.playerDatas = {};
end;

function u1.KnitStart(p4) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p4);
end;

function u1.honorPlayer(p5, u6) -- Line: 34
    -- upvalues: default (copy), ClientStore (copy)
    local v7 = default.Client:Get("TryGiveMatchHonorPoints"):CallServerAsync({
        toPlayerId = u6
    });
    v7:andThen(function(p8) -- Line: 38
        -- upvalues: u6 (copy), ClientStore (ref)
        print("[HONOR] " .. (p8 and "Succesfully " or "Failed to ") .. " honored " .. tostring(u6));

        if p8 then
            ClientStore:dispatch({
                type = "GameAddHonoredPlayer",
                userId = u6
            });
        end;
    end);

    return v7;
end;

function u1.hasHonoredPlayer(p9, p10) -- Line: 50
    -- upvalues: ClientStore (copy)
    local honoredPlayers = ClientStore:getState().Game.honoredPlayers;

    return table.find(honoredPlayers, p10) ~= nil;
end;

function u1.toggleGui(p11, p12) -- Line: 55
    if p11.waitingForOpen then
        return nil;
    end;

    if p11:isGuiOpen() then
        p11:closeGui();

        return;
    end;

    p11:showGui(p12);
end;

function u1.showGui(p13, p14) -- Line: 65
    -- upvalues: default (copy), Flamework (copy), HonorGUI (copy)
    if p13:isGuiOpen() or p13.waitingForOpen then
        return nil;
    end;

    p13:closeGui();
    p13.waitingForOpen = true;
    p13.playerDatas = default.Client:Get("RequestMatchPlayerPerformanceHonorData"):CallServer();
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = p13.appId,
        app = HonorGUI
    }, {
        PadBottom = p14,
        PlayerDatas = p13.playerDatas
    });
    task.wait(0.1);
    p13.waitingForOpen = false;
end;

function u1.closeGui(p15) -- Line: 85
    -- upvalues: Players (copy), Flamework (copy)
    local PlayerGui = Players.LocalPlayer:FindFirstChild("PlayerGui");

    if PlayerGui then
        for _, child in PlayerGui:GetChildren() do
            if child.Name == "HonorMatchEnd" then
                child:Destroy();
            end;
        end;
    end;

    if not p15:isGuiOpen() then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p15.appId);
end;

function u1.isGuiOpen(p16) -- Line: 99
    -- upvalues: Flamework (copy)
    return Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(p16.appId);
end;

KnitClient.CreateController(u1.new());

return nil;