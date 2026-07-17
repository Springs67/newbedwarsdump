-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local StringUtil = v1.StringUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local CollectionService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GameReset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game-reset", "game-reset").GameReset;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "LobbyUpdateCountdownController";
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
    -- upvalues: KnitController (copy), GameReset (copy)
    KnitController.constructor(p4);
    p4.Name = "LobbyUpdateCountdownController";
    p4.weeklyUpdateReset = GameReset.resetTime;
    p4.boardTag = "update-countdown-board";
    p4.boardTitle = "NEXT UPDATE";
    p4.displayThreshold = 1209600;
    p4.updateResetInterval = 604800;
    p4.updateTime = p4:getWeeklyUpdateTime();
    p4.updateTimeOverride = 1760738400;
end;

function u2.KnitStart(u5) -- Line: 35
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), CollectionService (copy)
    KnitController.KnitStart(u5);
    WatchCollectionTag(u5.boardTag, function(u6) -- Line: 37
        -- upvalues: u5 (copy), CollectionService (ref)
        local v7 = u5:getUpdateTime() - os.time() < u5.displayThreshold;
        local u8 = false;
        local TitlePart = u6:FindFirstChild("TitlePart");

        if TitlePart ~= nil then
            TitlePart = TitlePart:FindFirstChildWhichIsA("SurfaceGui");

            if TitlePart ~= nil then
                TitlePart = TitlePart:FindFirstChildWhichIsA("TextLabel");
            end;
        end;

        if TitlePart then
            TitlePart.Text = u5.boardTitle;
        end;

        local function u13() -- Line: 54
            -- upvalues: u8 (ref), u6 (copy), CollectionService (ref), u5 (ref)
            u8 = true;

            local function _(p9) -- Line: 58
                if p9:IsA("SurfaceGui") then
                    p9.Enabled = true;
                end;
            end;

            for i, descendant in u6:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("SurfaceGui") then
                    descendant.Enabled = true;
                end;
            end;

            local function _(u10) -- Line: 67
                -- upvalues: u5 (ref)
                if not u10:IsA("TextLabel") then
                    return nil;
                end;

                task.spawn(function() -- Line: 71
                    -- upvalues: u10 (copy), u5 (ref)
                    local v11;

                    repeat
                        u10.Text = u5:getTime(u5:getUpdateTime(), "UPDATE HYPE!!");
                        v11 = task.wait(1);
                    until v11 == 0 or (v11 ~= v11 or not v11);
                end);
            end;

            for i, v in CollectionService:GetTagged("update-countdown") do
                local _ = i - 1;

                if v:IsA("TextLabel") then
                    task.spawn(function() -- Line: 71
                        -- upvalues: v (copy), u5 (ref)
                        local v12;

                        repeat
                            v.Text = u5:getTime(u5:getUpdateTime(), "UPDATE HYPE!!");
                            v12 = task.wait(1);
                        until v12 == 0 or (v12 ~= v12 or not v12);
                    end);
                end;
            end;
        end;

        if v7 then
            u13();
        end;

        if not u8 then
            u5.weeklyUpdateReset:poll(86400, 3600, function() -- Line: 89
                -- upvalues: u13 (copy)
                u13();
            end);
        end;
    end);
    u5.weeklyUpdateReset:poll(u5.updateResetInterval, 300, function() -- Line: 97
        -- upvalues: u5 (copy)
        u5.updateTime = u5:getWeeklyUpdateTime();
    end);
end;

function u2.getUpdateTime(p14) -- Line: 101
    if p14.updateTimeOverride > os.time() then
        return p14.updateTimeOverride;
    end;

    return p14.updateTime;
end;

function u2.getTime(p15, p16, p17) -- Line: 108
    -- upvalues: StringUtil (copy)
    local v18 = p16 - os.time();
    local v19 = math.max(0, v18);

    if v19 == 0 then
        return p17;
    end;

    return StringUtil.formatCountdownTime(v19, {
        days = true,
        hours = true,
        seperator = " : "
    });
end;

function u2.getWeeklyUpdateTime(p20) -- Line: 119
    return p20.weeklyUpdateReset:getNextWeeklyResetTime();
end;

KnitClient.CreateController(u2.new());

return nil;