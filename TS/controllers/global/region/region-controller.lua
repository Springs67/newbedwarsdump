-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local LobbyEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").LobbyEvents;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local QueueRegionButton = RuntimeLib.import(script, script.Parent, "ui", "region-button").QueueRegionButton;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "RegionController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "RegionController";
end;

function u2.KnitStart(u5) -- Line: 31
    -- upvalues: KnitController (copy), PlaceUtil (copy), RuntimeLib (copy), default (copy), ClientStore (copy), LobbyEvents (copy)
    KnitController.KnitStart(u5);

    if PlaceUtil.isGameServer() then
        RuntimeLib.Promise.defer(function() -- Line: 34
            -- upvalues: default (ref), ClientStore (ref), u5 (copy)
            default.Client:WaitFor("FetchServerRegion"):andThen(function(p6) -- Line: 36
                -- upvalues: ClientStore (ref), u5 (ref)
                local v7 = p6:CallServer();
                ClientStore:dispatch({
                    type = "SetServerRegion",
                    serverRegion = v7
                });
                u5:mountServerRegionDisplay(v7);
            end);
        end);

        return;
    end;

    if PlaceUtil.isLobbyServer() then
        LobbyEvents.client.deviceInfoUpdate:connect(function(p8) -- Line: 47
            -- upvalues: u5 (copy)
            if p8.deviceInfo then
                u5:mountQueueRegionDisplay(p8.deviceInfo);
            end;
        end);
    end;
end;

function u2.mountServerRegionDisplay(p9, p10) -- Line: 54
    -- upvalues: u1 (copy), ColorUtil (copy), Players (copy)
    u1.mount(u1.createFragment({
        ServerRegionDisplay = u1.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, {
            ServerRegionText = u1.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                TextTransparency = 0.4,
                AnchorPoint = Vector2.new(1, 1),
                Position = UDim2.fromScale(0.99, 0.99),
                Size = UDim2.fromScale(0.065, 0.05),
                Text = "<b>REGION: " .. p10 .. "</b>",
                TextColor3 = ColorUtil.WHITE
            }, { u1.createElement("UITextSizeConstraint", {
                    MaxTextSize = 16
                }) })
        })
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
end;

function u2.mountQueueRegionDisplay(p11, p12) -- Line: 80
    -- upvalues: u1 (copy), QueueRegionButton (copy), Players (copy)
    u1.mount(u1.createElement(QueueRegionButton, {
        Region = p12.region
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
end;

KnitClient.CreateController(u2.new());

return nil;