-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local StringUtil = v1.StringUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "SaleCountdownController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 18
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "SaleCountdownController";
    p4.countdownTag = "sale-countdown";
    p4.endTime = 1767999600;
end;

function u2.KnitStart(u5) -- Line: 28
    -- upvalues: KnitController (copy), WatchCollectionTag (copy)
    KnitController.KnitStart(u5);
    WatchCollectionTag(u5.countdownTag, function(u6) -- Line: 30
        -- upvalues: u5 (copy)
        task.spawn(function() -- Line: 31
            -- upvalues: u6 (copy), u5 (ref)
            local v7;

            repeat
                u6.Text = u5:getTime(u5.endTime, "LAST CHANCE!!");
                v7 = task.wait(1);
            until v7 == 0 or (v7 ~= v7 or not v7);
        end);
    end);
end;

function u2.getTime(p8, p9, p10) -- Line: 41
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