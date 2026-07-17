-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local preloadImages = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").preloadImages;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local RankMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;
local RankUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local MatchEndScreenController = RuntimeLib.import(script, script.Parent.Parent.Parent, "match-end-screen-controller").MatchEndScreenController;
local ProvisionalProgressBarApp = RuntimeLib.import(script, script.Parent, "ui", "provisional-progress-bar-app").ProvisionalProgressBarApp;
local RankedProgressBarApp = RuntimeLib.import(script, script.Parent, "ui", "ranked-progress-bar-app").RankedProgressBarApp;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "RankedScreenController";
    end,

    __index = MatchEndScreenController
});
u1.__index = u1;

function u1.new(...) -- Line: 23
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 27
    -- upvalues: MatchEndScreenController (copy)
    MatchEndScreenController.constructor(p3, 3);
    p3.Name = "RankedScreenController";
end;

function u1.KnitStart(u4) -- Line: 31
    -- upvalues: MatchEndScreenController (copy), default (copy)
    MatchEndScreenController.KnitStart(u4);
    default.Client:OnEvent("MatchRankReport", function(p5) -- Line: 34
        -- upvalues: u4 (copy)
        u4.rankChangeDto = p5.rankChange;
    end);
end;

function u1.renderScreen(p6) -- Line: 38
    -- upvalues: KnitClient (copy), RankUtil (copy), Flamework (copy), ProvisionalProgressBarApp (copy), RankedProgressBarApp (copy)
    if not p6.rankChangeDto then
        KnitClient.Controllers.MatchEndController:skipCurrDisplay();

        return nil;
    end;

    if p6.rankChangeDto.matchesPlayed < RankUtil.NUM_PROVISIONAL_MATCHES then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            appId = "MatchEndProvisionalProgression",
            app = ProvisionalProgressBarApp
        }, {
            RankedMatchesPlayed = p6.rankChangeDto.matchesPlayed
        });

        return;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "MatchEndRankedProgression",
        app = RankedProgressBarApp
    }, {
        RankChangeData = p6.rankChangeDto
    });
end;

function u1.unmountScreen(p7) -- Line: 59
    -- upvalues: Flamework (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("MatchEndRankedProgression") then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("MatchEndRankedProgression");
    end;

    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("MatchEndProvisionalProgression") then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("MatchEndProvisionalProgression");
    end;
end;

function u1.preRenderRankDivisionIcons(p8, p9) -- Line: 67
    -- upvalues: RankMeta (copy), BedwarsImageId (copy), preloadImages (copy)
    local function _(p10, p11) -- Line: 70
        -- upvalues: RankMeta (ref)
        local v12 = {};
        local v13 = #v12;
        local v14 = #p10;
        table.move(p10, 1, v14, v13 + 1, v12);
        v12[v13 + v14 + 1] = RankMeta[p11].image;

        return v12;
    end;

    local v15 = {};

    for i = 1, #p9 do
        local v16 = p9[i];
        local _ = i - 1;
        local v17 = {};
        local v18 = #v17;
        local v19 = #v15;
        table.move(v15, 1, v19, v18 + 1, v17);
        v17[v18 + v19 + 1] = RankMeta[v16].image;
        v15 = v17;
    end;

    if p9[1] ~= p9[2] then
        table.insert(v15, BedwarsImageId.SHINING_SPINNER);
    end;

    preloadImages(v15);
end;

KnitClient.CreateController(u1.new());

return nil;