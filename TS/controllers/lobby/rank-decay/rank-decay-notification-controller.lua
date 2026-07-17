-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local RankMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "RankDecayNotificationController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, ...) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3, ...);
    p3.Name = "RankDecayNotificationController";
end;

function u1.KnitStart(u4) -- Line: 27
    -- upvalues: KnitController (copy), default (copy), RankMeta (copy)
    KnitController.KnitStart(u4);
    default.Client:Get("RankDecayWarning"):Connect(function(p5) -- Line: 29
        -- upvalues: RankMeta (ref), u4 (copy)
        local name = RankMeta[p5.rankDivision].name;
        u4:showNotification("Rank decay warning", "You will start decaying in " .. (p5.daysUntilDecay == 1 and "1 day" or tostring(p5.daysUntilDecay) .. " days") .. ". Play a ranked match to keep " .. name .. ".", Color3.fromRGB(255, 196, 79), p5.rankDivision);
    end);
    default.Client:Get("RankDecayApplied"):Connect(function(p6) -- Line: 34
        -- upvalues: RankMeta (ref), u4 (copy)
        local name = RankMeta[p6.newDivision].name;
        local name2 = RankMeta[p6.oldDivision].name;
        u4:showNotification("Rank decay applied", "-" .. tostring(p6.decayAmount) .. " RP. New rank: " .. name .. " " .. tostring(p6.newRankPoints % 100) .. "RP from " .. name2 .. " " .. tostring(p6.oldRankPoints % 100) .. "RP.", Color3.fromRGB(255, 84, 84), p6.newDivision);
    end);
end;

function u1.showNotification(p7, p8, p9, p10, p11, p12) -- Line: 40
    -- upvalues: Flamework (copy), BedwarsAppIds (copy), default (copy)
    local v13 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");

    if v13:isAppOpen(BedwarsAppIds.RANK_DECAY_NOTIFICATION_APP) then
        v13:closeApp(BedwarsAppIds.RANK_DECAY_NOTIFICATION_APP);
    end;

    v13:openApp(BedwarsAppIds.RANK_DECAY_NOTIFICATION_APP, {
        title = p8,
        body = p9,
        accentColor = p10,
        durationSeconds = p12,
        rankDivision = p11,

        onClose = function() -- Line: 51, Name: onClose
            -- upvalues: default (ref)
            return default.Client:Get("RankDecayNotificationClosed"):SendToServer();
        end
    });
end;

KnitClient.CreateController(u1.new());

return nil;