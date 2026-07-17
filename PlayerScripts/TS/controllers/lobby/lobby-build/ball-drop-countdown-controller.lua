-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local StringUtil = v1.StringUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BallDropUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "new-years", "ball-drop-util").BallDropUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "BallDropCountdownController";
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
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "BallDropCountdownController";
end;

function u2.KnitStart(u5) -- Line: 28
    -- upvalues: KnitController (copy), WatchCollectionTag (copy)
    KnitController.KnitStart(u5);
    WatchCollectionTag("NewYearCountdownBoard", function(p6) -- Line: 30
        -- upvalues: u5 (copy)
        local v7 = p6:FindFirstChildOfClass("SurfaceGui");

        if v7 ~= nil then
            v7 = v7:FindFirstChildOfClass("TextLabel");
        end;

        if v7 then
            u5:countdown(v7);
        end;
    end);
    WatchCollectionTag("BallDropCountdownTimer", function(u8) -- Line: 40
        -- upvalues: u5 (copy)
        task.spawn(function() -- Line: 41
            -- upvalues: u5 (ref), u8 (copy)
            u5:countdown(u8, "JOIN GAME!", -120);
        end);
    end);
end;

function u2.countdown(p9, p10, p11, p12) -- Line: 47
    -- upvalues: BallDropUtil (copy), StringUtil (copy), Workspace (copy)
    while true do
        local v13 = BallDropUtil:getTimeToNextBallDropSec() + (p12 == nil and 0 or p12);

        if v13 == nil then
            break;
        end;

        if v13 < 0 then
            p10.Text = p11 == nil and "" or p11;
        else
            p10.Text = StringUtil.fromNow(Workspace:GetServerTimeNow() + v13, {
                long = false,
                seconds = true,
                minutes = true,
                hours = false,
                days = false,
                weeks = false
            });
        end;

        local v14 = task.wait(1);

        if v14 == 0 or (v14 ~= v14 or not v14) then
            return;
        end;
    end;

    local Parent = p10.Parent;

    while Parent and not Parent:IsA("Model") do
        Parent = Parent.Parent;
    end;

    if Parent ~= nil then
        Parent:Destroy();
    end;

    return nil;
end;

KnitClient.CreateController(u2.new());

return nil;