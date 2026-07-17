-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ComponentUtil = v1.ComponentUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local Signal = v2.Signal;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local RunService = v3.RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local NpcSpawnComponent = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "npc-spawn-component").NpcSpawnComponent;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local AfkShopUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-utils").AfkShopUtils;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "AfkShopController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 32
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 36
    -- upvalues: KnitController (copy), default (copy), Signal (copy)
    KnitController.constructor(p6);
    p6.Name = "AfkShopController";
    p6.eventRemotes = default.Client:GetNamespace("AfkPlace");
    p6.afkDataSignal = Signal.new();
end;

function u4.KnitStart(u7) -- Line: 42
    -- upvalues: KnitController (copy), CollectionService (copy), RunService (copy), ComponentUtil (copy), NpcSpawnComponent (copy), AfkShopUtils (copy), ClientStore (copy)
    KnitController.KnitStart(u7);

    local function _(u8) -- Line: 45
        -- upvalues: RunService (ref), ComponentUtil (ref), NpcSpawnComponent (ref), AfkShopUtils (ref), u7 (copy)
        task.delay(RunService:IsStudio() and 3 or 0, function() -- Line: 46
            -- upvalues: ComponentUtil (ref), u8 (copy), NpcSpawnComponent (ref), AfkShopUtils (ref)
            local v9 = ComponentUtil:getComponent(u8, NpcSpawnComponent);

            if v9 ~= nil then
                v9:setNametag(AfkShopUtils.name);
            end;
        end);
        u7:mountAfkApp(u8);
    end;

    for i, v in CollectionService:GetTagged("AfkNPC") do
        local _ = i - 1;
        task.delay(RunService:IsStudio() and 3 or 0, function() -- Line: 46
            -- upvalues: ComponentUtil (ref), v (copy), NpcSpawnComponent (ref), AfkShopUtils (ref)
            local v10 = ComponentUtil:getComponent(v, NpcSpawnComponent);

            if v10 ~= nil then
                v10:setNametag(AfkShopUtils.name);
            end;
        end);
        u7:mountAfkApp(v);
    end;

    u7.eventRemotes:Get("AfkDataUpdate"):Connect(function(p11) -- Line: 58
        -- upvalues: u7 (copy), ClientStore (ref)
        u7.afkData = p11;
        ClientStore:dispatch({
            type = "SetAfkDataAll",
            afkData = p11
        });
        u7.afkDataSignal:Fire(p11);
    end);
end;

function u4.mountAfkApp(p12, p13) -- Line: 67
    -- upvalues: KnitClient2 (copy), AfkShopUtils (copy), Players (copy), SoundManager (copy), GameSound (copy), Flamework (copy), BedwarsAppIds (copy)
    KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
        RequiresLineOfSight = false,
        MaxActivationDistance = 12,
        HoldDuration = 0,
        ObjectText = "Open Shop",
        ActionText = AfkShopUtils.name,
        Parent = p13
    }).Triggered:Connect(function(p14) -- Line: 76
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref)
        if p14 == Players.LocalPlayer then
            SoundManager:playSound(GameSound.UI_OPEN);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.AFK_APP, {});
        end;
    end);
end;

function u4.purchaseItem(p15, p16) -- Line: 83
    return p15.eventRemotes:Get("PurchaseShopItem"):CallServer(p16);
end;

KnitClient.CreateController(u4.new());

return nil;