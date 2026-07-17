-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "GameUpdatesController";
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
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p3);
    p3.Name = "GameUpdatesController";
    p3.remotes = default.Client:GetNamespace("Update");
end;

function u1.KnitStart(u4) -- Line: 29
    -- upvalues: KnitController (copy), PlaceUtil (copy), ClientStore (copy), Players (copy)
    KnitController.KnitStart(u4);

    if PlaceUtil.isGameServer() then
        return nil;
    end;

    u4.remotes:WaitFor("FetchGameUpdates"):andThen(function(p5) -- Line: 35
        -- upvalues: ClientStore (ref), Players (ref), u4 (copy)
        local v6 = p5:CallServer();

        if not v6.success then
            return nil;
        end;

        if v6.updates then
            ClientStore:dispatch({
                type = "GameUpdatesSetAll",
                updates = v6.updates,
                newestKit = v6.newestKit,
                newestKitBG = v6.newestKitBG
            });
        end;

        if v6.newUpdate then
            if Players.LocalPlayer:GetAttribute("FirstTimePlayer") == nil then
                Players.LocalPlayer:GetAttributeChangedSignal("FirstTimePlayer"):Wait();
            end;

            if Players.LocalPlayer:GetAttribute("HideOtherPopupsForRental") == nil then
                Players.LocalPlayer:GetAttributeChangedSignal("HideOtherPopupsForRental"):Wait();
            end;

            if Players.LocalPlayer:GetAttribute("FirstTimePlayer") ~= true and Players.LocalPlayer:GetAttribute("HideOtherPopupsForRental") ~= true then
                u4:openGameUpdateApp();
            end;
        end;
    end);
end;

function u1.openGameUpdateApp(p7) -- Line: 62
    -- upvalues: KnitClient (copy), BedwarsAppIds (copy)
    KnitClient.Controllers.UiQueueManagerController:queueApp({
        priority = 10000,
        app = BedwarsAppIds.GAME_UPDATES,
        props = {}
    });
end;

KnitClient.CreateController(u1.new());

return nil;