-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local UILayers = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local IdUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "id-util").IdUtil;
local RewardNotification = RuntimeLib.import(script, script.Parent, "ui", "reward-notification").RewardNotification;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "RewardNotificationController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 22
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "RewardNotificationController";
    p3.rewardsDisplayed = {};
end;

function u1.KnitStart(p4) -- Line: 31
    -- upvalues: KnitController (copy), default (copy), RunService (copy), ClientStore (copy), IdUtil (copy), Flamework (copy), RewardNotification (copy), UILayers (copy)
    KnitController.KnitStart(p4);
    default.Client:Get("RewardNotification"):Connect(function(p5) -- Line: 33
        -- upvalues: RunService (ref), ClientStore (ref), IdUtil (ref), Flamework (ref), RewardNotification (ref), UILayers (ref)
        if RunService:IsStudio() then
            return nil;
        end;

        local rewards = p5.rewards;

        local function _(p6) -- Line: 43
            -- upvalues: IdUtil (ref)
            local v7 = {};

            for i, v in p6 do
                v7[i] = v;
            end;

            v7.id = IdUtil.generateId(5);

            return v7;
        end;

        local v8 = table.create(#rewards);
        local v9 = {
            type = "LobbyAddRewardsToDisplay"
        };

        for i, v in rewards do
            local _ = i - 1;
            local v10 = {};

            for i2, v2 in v do
                v10[i2] = v2;
            end;

            v10.id = IdUtil.generateId(5);
            v8[i] = v10;
        end;

        v9.rewards = v8;
        ClientStore:dispatch(v9);

        if p5.rewards == nil or #p5.rewards == 0 then
            return nil;
        end;

        if not Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("RewardNotification") then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                appId = "RewardNotification",
                app = RewardNotification
            }, {}, UILayers.OVERLAY);
        end;
    end);
end;

function u1.getRewardsDisplayed(p11) -- Line: 70
    return p11.rewardsDisplayed;
end;

function u1.addRewardDisplayed(p12, p13) -- Line: 73
    if table.find(p12.rewardsDisplayed, p13) == nil then
        table.insert(p12.rewardsDisplayed, p13);
    end;
end;

KnitClient.CreateController(u1.new());

return nil;