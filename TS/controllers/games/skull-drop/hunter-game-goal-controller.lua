-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ExpireList = v1.ExpireList;
local ExpireMap = v1.ExpireMap;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = {
    GameSound.SKULL_DROP_SKULL_DEPOSIT_01,
    GameSound.SKULL_DROP_SKULL_DEPOSIT_02,
    GameSound.SKULL_DROP_SKULL_DEPOSIT_03,
    GameSound.SKULL_DROP_SKULL_DEPOSIT_04
};
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "HunterGameGoalController";
    end,

    __index = GameKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 29
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 33
    -- upvalues: GameKnitController (copy), GameType (copy), default (copy), ExpireList (copy), ExpireMap (copy)
    GameKnitController.constructor(p8, { GameType.SKULL_DROP });
    p8.Name = "HunterGameGoalController";
    p8.attemptHunterGoalDeposit = default.Client:Get("AttemptHunterGoalDeposit");
    p8.recentDepositAttemptingPlayers = ExpireList.new(1.5);
    p8.depositSoundCooldownDuration = 3;
    p8.recentSuccessfulDeposit = ExpireMap.new(p8.depositSoundCooldownDuration);
end;

function u6.onGameInit(u9) -- Line: 41
    -- upvalues: default (copy), u2 (copy), SoundManager (copy), u5 (copy)
    default.Client:Get("HunterGoalUpdateEvent"):Connect(function(p10) -- Line: 42
        -- upvalues: u2 (ref), u9 (copy)
        local goalPosition = p10.goalPosition;
        local activeDuration = p10.activeDuration;
        local u11 = u2.new();

        if goalPosition == nil then
            return nil;
        end;

        local v12 = u9:initGoalIndicator(goalPosition);

        if v12 == nil then
            return nil;
        end;

        u11:GiveTask(v12);
        task.delay(activeDuration, function() -- Line: 54
            -- upvalues: u11 (copy)
            u11:DoCleaning();
        end);
    end);
    default.Client:Get("SuccessfulHunterGoalDeposit"):Connect(function(p13) -- Line: 58
        -- upvalues: u9 (copy), SoundManager (ref), u5 (ref)
        local UserId = p13.player.UserId;
        local v14 = 0;
        local v15 = 1;
        local v16 = 0.75;
        local v17;

        if u9.recentSuccessfulDeposit:has(UserId) then
            local v18 = u9.recentSuccessfulDeposit:get(UserId);
            v17 = (v18 == nil and 0 or v18) + 1;

            if v17 > 2 and v17 <= 5 then
                v14 = 1;
            elseif v17 > 5 and v17 <= 8 then
                v14 = 2;
            elseif v17 > 8 and v17 <= 11 then
                v14 = 3;
            elseif v17 > 11 then
                v15 = 1.2;
                v14 = 3;
                v16 = 0.9;
            end;
        else
            v17 = 0;
        end;

        u9.recentSuccessfulDeposit:set(UserId, v17);
        SoundManager:playSound(u5[v14 + 1], {
            rollOffMaxDistance = 300,
            rollOffMinDistance = 35,
            position = p13.depositPosition,
            volumeMultiplier = v16,
            playbackSpeedMultiplier = v15
        });
    end);
end;

function u6.KnitStart(p19) -- Line: 92
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p19);
end;

function u6.initGoalIndicator(u20, p21) -- Line: 95
    -- upvalues: ReplicatedStorage (copy), Players (copy), Workspace (copy)
    local v22 = ReplicatedStorage.Assets.Misc.GoalIndicator:Clone();

    if v22 == nil then
        return nil;
    end;

    local SkullIndicator = v22:WaitForChild("SkullIndicator", 1);
    local GoalCylinder = v22:WaitForChild("GoalCylinder", 1);

    if GoalCylinder ~= nil then
        GoalCylinder.Touched:Connect(function(p23) -- Line: 103
            -- upvalues: Players (ref), u20 (copy)
            local LocalPlayer = Players.LocalPlayer;

            if u20.recentDepositAttemptingPlayers:has(LocalPlayer) then
                return false;
            end;

            if LocalPlayer.Character and LocalPlayer.Character == p23.Parent then
                u20.attemptHunterGoalDeposit:SendToServer({
                    player = LocalPlayer
                });
                u20.recentDepositAttemptingPlayers:add(LocalPlayer);
            end;
        end);
    end;

    if SkullIndicator ~= nil then
        u20:highlightModel(SkullIndicator, true);
    end;

    v22.Parent = Workspace;
    v22:PivotTo(CFrame.new(p21));

    return v22;
end;

function u6.highlightModel(p24, p25, p26) -- Line: 127
    -- upvalues: u3 (copy)
    local v27 = u3("Highlight", {
        FillTransparency = 0.3,
        OutlineTransparency = 0.2,
        Parent = nil,
        FillColor = Color3.fromRGB(0, 237, 255),
        OutlineColor = Color3.fromRGB(0, 237, 255)
    });

    if p26 then
        v27.Parent = p25;
        v27.Enabled = true;

        return;
    end;

    v27.Enabled = false;
    v27:Destroy();
end;

KnitClient.CreateController(u6.new());

return nil;