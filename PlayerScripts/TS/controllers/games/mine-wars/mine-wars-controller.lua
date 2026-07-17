-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ComponentUtil = v1.ComponentUtil;
local WatchPlayerCharacter = v1.WatchPlayerCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "billboard").default;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "MineWarsController";
    end,

    __index = GameKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 24
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 28
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p5, { GameType.MINE_WARS });
    p5.Name = "MineWarsController";
end;

function u3.KnitStart(p6) -- Line: 32
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p6);
end;

function u3.onGameInit(p7) -- Line: 35
    -- upvalues: GameKnitController (copy), ClientSyncEvents (copy), MatchState (copy), KnitClient (copy), Players (copy), ComponentUtil (copy), default (copy), WatchPlayerCharacter (copy), u2 (copy)
    GameKnitController.onGameInit(p7);
    ClientSyncEvents.MatchStateChange:connect(function(p8) -- Line: 37
        -- upvalues: MatchState (ref), KnitClient (ref), Players (ref), ComponentUtil (ref), default (ref)
        if p8.matchState ~= MatchState.PRE then
            return nil;
        end;

        for _, v in KnitClient.Controllers.TeamController:getTeams() do
            if v.members[Players.LocalPlayer.UserId] == nil then
                for _, v2 in { "item_shop", "upgrade_shop" } do
                    local v9 = KnitClient.Controllers.ShopkeeperController:getShopkeeperModel(v2, v.id);

                    if v9 then
                        local v10 = ComponentUtil:extractComponent(v9, default, true);

                        if v10 then
                            local roact_billboard = v10.instance:WaitForChild("roact_billboard");

                            if roact_billboard then
                                roact_billboard.AlwaysOnTop = false;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end);
    ClientSyncEvents.MatchStateChange:connect(function(p11) -- Line: 62
        -- upvalues: MatchState (ref), Players (ref)
        if p11.matchState ~= MatchState.RUNNING then
            return nil;
        end;

        local LocalPlayer = Players.LocalPlayer;
        local Character = LocalPlayer.Character;

        if not Character then
            return nil;
        end;

        local v12 = Character:FindFirstChildOfClass("Humanoid");

        if not v12 then
            return nil;
        end;

        LocalPlayer.CameraMaxZoomDistance = 14;
        LocalPlayer.CameraMinZoomDistance = 0.5;

        if v12 then
            v12.CameraOffset = Vector3.new(0, 0, 0);
        end;

        LocalPlayer.CameraMaxZoomDistance = 0.5;
        LocalPlayer.CameraMaxZoomDistance = 14;
    end);
    WatchPlayerCharacter(Players.LocalPlayer, function(u13, u14) -- Line: 83
        -- upvalues: u2 (ref)
        task.spawn(function() -- Line: 84
            -- upvalues: u2 (ref), u13 (copy), u14 (copy)
            u14:GiveTask((u2("PointLight", {
                Range = 12,
                Brightness = 1.25,
                Color = Color3.fromRGB(255, 222, 150),
                Parent = u13:WaitForChild("HumanoidRootPart")
            })));
        end);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;