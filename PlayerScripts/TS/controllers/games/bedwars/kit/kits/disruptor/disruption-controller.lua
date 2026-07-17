-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local TeamController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "team", "team-controller").TeamController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local ZenithShopTaxProgressBar = RuntimeLib.import(script, script.Parent, "ui", "zenith-shop-tax-progress-bar").ZenithShopTaxProgressBar;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "DisruptionController";
    end,

    __index = BaseKitController
});
u3.__index = u3;

function u3.new(...) -- Line: 29
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 33
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p5, BedwarsKit.DISRUPTOR);
    p5.Name = "DisruptionController";
    p5.lastOpen = 0;
    p5.highlightMap = {};
end;

function u3.KnitStart(p6) -- Line: 39
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p6);
end;

function u3.onKitLocalActivated(u7, p8) -- Line: 42
    -- upvalues: Flamework (copy), u2 (copy), ZenithShopTaxProgressBar (copy), ClientSyncEvents (copy), MatchState (copy), TeamController (copy), Players (copy)
    p8:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u2.createElement(ZenithShopTaxProgressBar)));
    p8:GiveTask(ClientSyncEvents.MatchStateChange:connect(function(p9) -- Line: 44
        -- upvalues: MatchState (ref), TeamController (ref), Players (ref), u7 (copy)
        if p9.matchState == MatchState.RUNNING then
            local u10 = TeamController:getPlayerTeam(Players.LocalPlayer);

            if u10 ~= nil then
                u10 = u10.name;
            end;

            local v11 = Players:GetPlayers();

            local function v15(u12) -- Line: 52
                -- upvalues: u7 (ref), u10 (copy)
                u12:GetAttributeChangedSignal("DisruptorActivation"):Connect(function() -- Line: 53
                    -- upvalues: u12 (copy), u7 (ref), u10 (ref)
                    local v13 = u12:GetAttribute("DisruptorActivation");

                    if v13 == 0 or (v13 ~= v13 or (v13 == "" or not v13)) then
                        u7:removeHighLight(u12);

                        return;
                    end;

                    if u12:GetAttribute("DisruptorTarget") == u10 then
                        u7:createHighLight(u12);

                        return;
                    end;

                    u7:removeHighLight(u12);
                end);
                u12:GetAttributeChangedSignal("DisruptorTarget"):Connect(function() -- Line: 65
                    -- upvalues: u12 (copy), u10 (ref), u7 (ref)
                    if u12:GetAttribute("DisruptorTarget") ~= u10 then
                        u7:removeHighLight(u12);

                        return;
                    end;

                    local v14 = u12:GetAttribute("DisruptorActivation");

                    if v14 ~= 0 and (v14 == v14 and (v14 ~= "" and v14)) then
                        u7:createHighLight(u12);
                    end;
                end);
            end;

            for i, v in v11 do
                v15(v, i - 1, v11);
            end;
        end;
    end));
end;

function u3.onKitLocalDeactivated(p16) -- Line: 82
end;

function u3.onKitReplicationActivated(u17, p18) -- Line: 84
    -- upvalues: default (copy), SoundManager (copy), GameSound (copy), Players (copy), Flamework (copy), BedwarsAppIds (copy)
    local u20 = default.Client:OnEvent("DisruptionCollect", function(p19) -- Line: 86
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.PICKUP_ITEM_DROP);
    end);
    p18:GiveTask(function() -- Line: 89
        -- upvalues: u20 (copy)
        u20:cancel();
    end);
    local u22 = Players.LocalPlayer:GetAttributeChangedSignal("DisruptionPriceIncrease"):Connect(function() -- Line: 93
        -- upvalues: u17 (copy), Flamework (ref), BedwarsAppIds (ref)
        local v21 = time();

        if v21 - u17.lastOpen >= 2.5 and Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(BedwarsAppIds.BEDWARS_ITEM_SHOP) then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.BEDWARS_ITEM_SHOP);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.BEDWARS_ITEM_SHOP, {});
            u17.lastOpen = v21;
        end;
    end);
    p18:GiveTask(function() -- Line: 103
        -- upvalues: u22 (copy)
        u22:Disconnect();
    end);
end;

function u3.onKitReplicationDeactivated(p23) -- Line: 107
end;

function u3.onInnateAbilityEnabled(p24, p25, p26) -- Line: 109
end;

function u3.onAbilityUsed(p27, p28, p29) -- Line: 111
end;

function u3.createHighLight(p30, p31) -- Line: 113
    -- upvalues: u1 (copy)
    local v32 = u1("Highlight", {
        FillTransparency = 1,
        OutlineTransparency = 0,
        Parent = p31.Character,
        OutlineColor = Color3.fromRGB(255, 120, 120),
        FillColor = Color3.fromRGB(255, 150, 150),
        DepthMode = Enum.HighlightDepthMode.Occluded
    });
    p30.highlightMap[p31] = v32;
end;

function u3.removeHighLight(p33, p34) -- Line: 127
    local v35 = p33.highlightMap[p34];

    if v35 ~= nil then
        v35:Destroy();
    end;

    p33.highlightMap[p34] = nil;
end;

KnitClient.CreateController(u3.new());

return nil;