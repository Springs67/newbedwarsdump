-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "MilestonesController";
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
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p4);
    p4.Name = "MilestonesController";
    p4.milestoneRewardsUpdateSignal = u1.new();
    p4.milestoneRewardsClaimed = nil;
    p4.freeKitLevel = nil;
end;

function u2.KnitStart(u5) -- Line: 29
    -- upvalues: KnitController (copy), default (copy), ClientStore (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("MilestoneRewardUpdate"):Connect(function(p6, p7) -- Line: 31
        -- upvalues: ClientStore (ref), u5 (copy)
        ClientStore:dispatch({
            type = "BedwarsSetSome",
            data = {
                milestoneRewardsClaimed = p6,
                freeKitLevel = p7
            }
        });
        u5.milestoneRewardsUpdateSignal:Fire(p6, p7);
        u5.milestoneRewardsClaimed = p6;
        u5.freeKitLevel = p7;
    end);
end;

function u2.getMilestoneRewardsClaimed(p8) -- Line: 44
    return p8.milestoneRewardsClaimed;
end;

function u2.getFreeKitLevel(p9) -- Line: 47
    return p9.freeKitLevel;
end;

function u2.waitForMilestoneRewardsClaimed(p10) -- Line: 50
    if p10.milestoneRewardsClaimed then
        return p10.milestoneRewardsClaimed;
    end;

    return p10.milestoneRewardsUpdateSignal:Wait();
end;

function u2.waitForFreeKitLevel(p11) -- Line: 57
    local freeKitLevel = p11.freeKitLevel;

    if freeKitLevel == 0 or (freeKitLevel ~= freeKitLevel or not freeKitLevel) then
        return select(2, p11.milestoneRewardsUpdateSignal:Wait());
    end;

    return p11.freeKitLevel;
end;

KnitClient.CreateController(u2.new());

return nil;