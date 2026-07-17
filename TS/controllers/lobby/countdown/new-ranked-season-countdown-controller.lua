-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local StringUtil = v1.StringUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local RankUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "NewRankedSeasonCountdownController";
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
    -- upvalues: KnitController (copy), getQueueMeta (copy), RankUtil (copy)
    KnitController.constructor(p4);
    p4.Name = "NewRankedSeasonCountdownController";
    p4.countdownTag = "ranked-countdown";
    p4.endTime = getQueueMeta(RankUtil.activeRankMeta.queueType).endTime;
end;

function u2.KnitStart(u5) -- Line: 30
    -- upvalues: KnitController (copy), WatchCollectionTag (copy)
    KnitController.KnitStart(u5);
    WatchCollectionTag(u5.countdownTag, function(u6) -- Line: 32
        -- upvalues: u5 (copy)
        local endTime = u5.endTime;

        if endTime == 0 or (endTime ~= endTime or not endTime) then
            return nil;
        end;

        u6.RichText = false;

        if os.time() > u5.endTime then
            u6:Destroy();

            return nil;
        end;

        task.spawn(function() -- Line: 42
            -- upvalues: u5 (ref), u6 (copy)
            while true do
                local endTime2 = u5.endTime;

                if endTime2 == 0 or (endTime2 ~= endTime2 or not endTime2) then
                    break;
                end;

                u6.Text = u5:getTime(u5.endTime, "Ranked Season Ending");
                local v7 = task.wait(1);

                if v7 == 0 or (v7 ~= v7 or not v7) then
                    return;
                end;
            end;

            return nil;
        end);
    end);
end;

function u2.getTime(p8, p9, p10) -- Line: 56
    -- upvalues: StringUtil (copy)
    local v11 = p9 - os.time();
    local v12 = math.max(0, v11);

    if v12 == 0 then
        return p10;
    end;

    return StringUtil.formatCountdownTime(v12, {
        days = true,
        hours = true,
        seperator = " : "
    });
end;

KnitClient.CreateController(u2.new());

return nil;