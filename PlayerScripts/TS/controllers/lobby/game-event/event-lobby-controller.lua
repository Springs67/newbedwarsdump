-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ComponentUtil = v1.ComponentUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local RunService = v4.RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local NpcSpawnComponent = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "npc-spawn-component").NpcSpawnComponent;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "EventLobbyController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 30
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "EventLobbyController";
end;

function u5.KnitStart(p8) -- Line: 38
    -- upvalues: KnitController (copy), u3 (copy), EventMeta (copy), CollectionService (copy), RunService (copy), ComponentUtil (copy), NpcSpawnComponent (copy), KnitClient (copy)
    KnitController.KnitStart(p8);
    local v9 = u3.entries(EventMeta);

    local function v20(p10) -- Line: 41
        -- upvalues: CollectionService (ref), RunService (ref), ComponentUtil (ref), NpcSpawnComponent (ref), KnitClient (ref)
        local u11 = p10[1];
        local u12 = p10[2];

        if not u12.active then
            return nil;
        end;

        local v13 = CollectionService:GetTagged(u12.npcCollectionTag);

        local function v16(u14) -- Line: 49
            -- upvalues: RunService (ref), ComponentUtil (ref), NpcSpawnComponent (ref), u12 (copy), KnitClient (ref), u11 (copy)
            task.delay(RunService:IsStudio() and 3 or 0, function() -- Line: 51
                -- upvalues: ComponentUtil (ref), u14 (copy), NpcSpawnComponent (ref), u12 (ref)
                local v15 = ComponentUtil:getComponent(u14, NpcSpawnComponent);

                if v15 ~= nil then
                    v15:setNametag(u12.name, u12.subtitle);
                end;
            end);
            KnitClient.Controllers.EventLobbyController:mountEventApp(u14, u11);
        end;

        for i, v in v13 do
            v16(v, i - 1, v13);
        end;

        local shops = u12.shops;

        local function v19(p17) -- Line: 65
            -- upvalues: CollectionService (ref), KnitClient (ref), u11 (copy)
            local collectionTag = p17.collectionTag;

            if collectionTag ~= "" and collectionTag then
                local function _(p18) -- Line: 69
                    -- upvalues: KnitClient (ref), u11 (ref)
                    KnitClient.Controllers.EventLobbyController:mountEventShop(p18, u11);
                end;

                for i, v in CollectionService:GetTagged(p17.collectionTag) do
                    local _ = i - 1;
                    KnitClient.Controllers.EventLobbyController:mountEventShop(v, u11);
                end;
            end;
        end;

        for i, v in shops do
            v19(v, i - 1, shops);
        end;
    end;

    for i, v in v9 do
        v20(v, i - 1, v9);
    end;
end;

function u5.mountEventApp(p21, p22, u23) -- Line: 85
    -- upvalues: EventMeta (copy), KnitClient2 (copy), Players (copy), SoundManager (copy), GameSound (copy), Flamework (copy), BedwarsAppIds (copy)
    KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
        RequiresLineOfSight = false,
        MaxActivationDistance = 12,
        HoldDuration = 0,
        ObjectText = "Open Event",
        ActionText = EventMeta[u23].name,
        Parent = p22
    }).Triggered:Connect(function(p24) -- Line: 95
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), u23 (copy)
        if p24 == Players.LocalPlayer then
            SoundManager:playSound(GameSound.UI_OPEN);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.EVENT_APP, {
                event = u23
            });
        end;
    end);
end;

function u5.mountEventShop(p25, p26, u27) -- Line: 104
    -- upvalues: EventMeta (copy), KnitClient2 (copy), Players (copy), SoundManager (copy), GameSound (copy), Flamework (copy), BedwarsAppIds (copy)
    KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
        RequiresLineOfSight = false,
        MaxActivationDistance = 11,
        HoldDuration = 0,
        ObjectText = "Open Shop",
        ActionText = EventMeta[u27].name .. "Shop",
        Parent = p26
    }).Triggered:Connect(function(p28) -- Line: 114
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), u27 (copy)
        if p28 == Players.LocalPlayer then
            SoundManager:playSound(GameSound.UI_OPEN);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.EVENT_APP, {
                tab = "shop",
                event = u27
            });
        end;
    end);
end;

KnitClient.CreateController(u5.new());

return nil;