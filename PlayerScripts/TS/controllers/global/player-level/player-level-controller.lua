-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local PlayerLevelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "PlayerLevelController";
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
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p4);
    p4.Name = "PlayerLevelController";
    p4.playerLevel = nil;
    p4.playerLevelTotalExperience = nil;
    p4.playerLevelUpdateSignal = u1.new();
    p4.matchXpGained = nil;
    p4.xpFinalizedSignal = u1.new();
end;

function u2.KnitStart(u5) -- Line: 33
    -- upvalues: KnitController (copy), default (copy), ClientStore (copy), Flamework (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("PlayerLevelUpdate"):Connect(function(p6, p7) -- Line: 35
        -- upvalues: ClientStore (ref), u5 (copy)
        ClientStore:dispatch({
            type = "BedwarsSetSome",
            data = {
                playerLevel = p6,
                playerLevelTotalExperience = p7
            }
        });
        u5.playerLevelUpdateSignal:Fire(p6, p7);
        u5.playerLevel = p6;
        u5.playerLevelTotalExperience = p7;
    end);
    default.Client:WaitFor("PlayerLevelMatchXpFinalize"):andThen(function(p8) -- Line: 49
        -- upvalues: u5 (copy), Flamework (ref), ClientStore (ref)
        p8:Connect(function(p9) -- Line: 50
            -- upvalues: u5 (ref), Flamework (ref), ClientStore (ref)
            u5.matchXpGained = p9.matchXpGained;
            u5.xpFinalizedSignal:Fire(p9.matchXpGained);
            local v10 = Flamework.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(ClientStore:getState().Game.queueType);
            local v11 = {};
            local v12 = {};
            local playerLevelTotalExperience = u5.playerLevelTotalExperience;
            v12.startingExperience = (playerLevelTotalExperience == nil and 0 or playerLevelTotalExperience) - p9.matchXpGained;
            v12.totalExperienceEarned = p9.matchXpGained;
            v12.reasons = p9.reasons;
            v11.matchExperienceEarned = v12;
            v11.reachedDailyCap = p9.reachedDailyCap;
            local _ = v10.rankCategory;
        end);
    end);
end;

function u2.getPlayerLevel(p13) -- Line: 74
    return p13.playerLevel;
end;

function u2.getPlayerLevelTotalExperience(p14) -- Line: 77
    return p14.playerLevelTotalExperience;
end;

function u2.waitForPlayerLevel(p15) -- Line: 80
    local playerLevel = p15.playerLevel;

    if playerLevel == 0 or (playerLevel ~= playerLevel or not playerLevel) then
        return p15.playerLevelUpdateSignal:Wait();
    end;

    return p15.playerLevel;
end;

function u2.waitForPlayerLevelTotalExperience(p16) -- Line: 88
    local playerLevelTotalExperience = p16.playerLevelTotalExperience;

    if playerLevelTotalExperience == 0 or (playerLevelTotalExperience ~= playerLevelTotalExperience or not playerLevelTotalExperience) then
        return select(2, p16.playerLevelUpdateSignal:Wait());
    end;

    return p16.playerLevelTotalExperience;
end;

function u2.waitForTotalMatchXpGained(p17) -- Line: 96
    local matchXpGained = p17.matchXpGained;

    if matchXpGained == 0 or (matchXpGained ~= matchXpGained or not matchXpGained) then
        return p17.xpFinalizedSignal:Wait();
    end;

    return p17.matchXpGained;
end;

function u2.isBeginner(p18) -- Line: 104
    -- upvalues: PlayerLevelUtil (copy)
    return p18:waitForPlayerLevel() < PlayerLevelUtil.BEGINNER_LEVEL;
end;

KnitClient.CreateController(u2.new());

return nil;