-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local RunService = v4.RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local AchievementsMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-meta").AchievementsMeta;
local AchievementRankMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-rank").AchievementRankMeta;
local AchievementUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local AchievementNotification = RuntimeLib.import(script, script.Parent, "ui", "achievement-notification").AchievementNotification;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "AchievementController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 32
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 36
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "AchievementController";
    p7.lastNotifTime = 0;
    p7.notifDelay = 3.5;
end;

function u5.KnitStart(u8) -- Line: 42
    -- upvalues: KnitController (copy), KnitClient2 (copy), GameSound (copy), u2 (copy), AchievementsMeta (copy), AchievementRankMeta (copy), default (copy), ClientStore (copy), Players (copy), RunService (copy), Flamework (copy), BedwarsAppIds (copy)
    KnitController.KnitStart(u8);
    local PreloadController = KnitClient2.Controllers.PreloadController;
    local v9 = {
        sounds = {
            GameSound.ACHIEVEMENT_UNLOCK_COMMON,
            GameSound.ACHIEVEMENT_UNLOCK_RARE,
            GameSound.ACHIEVEMENT_UNLOCK_EPIC,
            GameSound.ACHIEVEMENT_UNLOCK_LEGENDARY
        }
    };
    local v10 = {};
    local v11 = #v10;

    local function _(p12) -- Line: 52
        local icon = p12.icon;

        if icon ~= nil then
            icon = icon.image;
        end;

        return icon;
    end;

    local v13 = 0;
    local v14 = {};

    for i, v in u2.values(AchievementsMeta) do
        local _ = i - 1;
        local icon = v.icon;

        if icon ~= nil then
            icon = icon.image;
        end;

        if icon ~= nil then
            v13 = v13 + 1;
            v14[v13] = icon;
        end;
    end;

    local v15 = #v14;
    table.move(v14, 1, v15, v11 + 1, v10);
    local v16 = v11 + v15;

    local function _(p17) -- Line: 74
        return p17.background;
    end;

    local v18 = 0;
    local v19 = {};

    for i, v in u2.values(AchievementRankMeta) do
        local _ = i - 1;
        local background = v.background;

        if background ~= nil then
            v18 = v18 + 1;
            v19[v18] = background;
        end;
    end;

    local v20 = #v19;
    table.move(v19, 1, v20, v16 + 1, v10);

    local function _(p21) -- Line: 92
        return p21.frame;
    end;

    local v22 = 0;
    local v23 = {};

    for i, v in u2.values(AchievementRankMeta) do
        local _ = i - 1;
        local frame = v.frame;

        if frame ~= nil then
            v22 = v22 + 1;
            v23[v22] = frame;
        end;
    end;

    table.move(v23, 1, #v23, v16 + v20 + 1, v10);
    v9.imageIds = v10;
    PreloadController:runPreload(v9);
    default.Client:Get("AchievementsUpdate"):Connect(function(p24) -- Line: 110
        -- upvalues: ClientStore (ref), default (ref), Players (ref)
        ClientStore:dispatch({
            type = "LobbySetAchievements",
            achievements = p24.achievements
        });
        default.Client:Get("RequestProfileData"):CallServerAsync(Players.LocalPlayer):andThen(function(p25) -- Line: 116
            -- upvalues: ClientStore (ref)
            if p25 then
                ClientStore:dispatch({
                    type = "LobbySetProfileData",
                    profileData = p25
                });
            end;
        end);
    end);
    default.Client:Get("AchievementUnlocked"):Connect(function(u26) -- Line: 126
        -- upvalues: u8 (copy), RunService (ref)
        if tick() - u8.lastNotifTime >= u8.notifDelay then
            u8:playUnlockNotification(u26.id);
            u8.lastNotifTime = tick();

            return;
        end;

        local u27 = nil;
        u27 = RunService.Heartbeat:Connect(function() -- Line: 133
            -- upvalues: u8 (ref), u26 (copy), u27 (ref)
            if tick() - u8.lastNotifTime >= u8.notifDelay then
                u8:playUnlockNotification(u26.id);
                u8.lastNotifTime = tick();
                u27:Disconnect();
            end;
        end);
    end);
    default.Client:Get("OpenAchievementApp"):Connect(function() -- Line: 143
        -- upvalues: Flamework (ref), BedwarsAppIds (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.ACHIEVEMENTS, {});
    end);
end;

function u5.playUnlockNotification(p28, p29) -- Line: 147
    -- upvalues: GameSound (copy), AchievementUtil (copy), AchievementRankMeta (copy), SoundManager (copy), u3 (copy), AchievementNotification (copy), Players (copy)
    local ACHIEVEMENT_UNLOCK_COMMON = GameSound.ACHIEVEMENT_UNLOCK_COMMON;
    local v30 = AchievementUtil.getMeta(p29);

    if v30.rank then
        ACHIEVEMENT_UNLOCK_COMMON = AchievementRankMeta[v30.rank].sound;
    end;

    SoundManager:playSound(ACHIEVEMENT_UNLOCK_COMMON);
    local u31 = u3.mount(u3.createElement(AchievementNotification, {
        Id = p29
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    task.delay(p28.notifDelay, function() -- Line: 157
        -- upvalues: u3 (ref), u31 (copy)
        u3.unmount(u31);
    end);
end;

KnitClient.CreateController(u5.new());

return nil;