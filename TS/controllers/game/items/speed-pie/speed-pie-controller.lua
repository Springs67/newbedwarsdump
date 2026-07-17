-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "SpeedPieController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 20
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "SpeedPieController";
end;

function u1.KnitStart(u4) -- Line: 28
    -- upvalues: KnitController (copy), WatchCharacter (copy), Players (copy), ClientStore (copy), QueueType (copy), BalanceFile (copy), KnitClient (copy)
    KnitController.KnitStart(u4);
    WatchCharacter(function(u5, u6) -- Line: 30
        -- upvalues: Players (ref), u4 (copy), ClientStore (ref), QueueType (ref), BalanceFile (ref), KnitClient (ref)
        local function u7() -- Line: 31
            -- upvalues: u6 (copy), u5 (copy), Players (ref), u4 (ref), ClientStore (ref), QueueType (ref), BalanceFile (ref), KnitClient (ref)
            if u6:GetAttribute("SpeedPieBuff") == true then
                if u5 == Players.LocalPlayer then
                    u4.pieSprintModifier = {
                        blockSprint = false,
                        moveSpeedMultiplier = ClientStore:getState().Game.queueType == QueueType.SURVIVAL and 1.15 or BalanceFile.BakerKit.SPEED_PIE_MULTIPLIER
                    };
                    KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier(u4.pieSprintModifier);
                end;
            else
                u4:disableSpeedBuff(u6);

                if u5 == Players.LocalPlayer and u4.pieSprintModifier then
                    KnitClient.Controllers.SprintController:getMovementStatusModifier():removeModifier(u4.pieSprintModifier);
                    u4.pieSprintModifier = nil;
                end;
            end;
        end;

        u6:GetAttributeChangedSignal("SpeedPieBuff"):Connect(function() -- Line: 50
            -- upvalues: u7 (copy)
            u7();
        end);
        u7();
    end);
end;

function u1.disableSpeedBuff(p8, p9) -- Line: 56
    local LeftFoot = p9:FindFirstChild("LeftFoot");

    if LeftFoot ~= nil then
        local SpeedPieBuffEmitter = LeftFoot:FindFirstChild("SpeedPieBuffEmitter");

        if SpeedPieBuffEmitter ~= nil then
            SpeedPieBuffEmitter:Destroy();
        end;
    end;

    local RightFoot = p9:FindFirstChild("RightFoot");

    if RightFoot ~= nil then
        local SpeedPieBuffEmitter = RightFoot:FindFirstChild("SpeedPieBuffEmitter");

        if SpeedPieBuffEmitter ~= nil then
            SpeedPieBuffEmitter:Destroy();
        end;
    end;
end;

KnitClient.CreateController(u1.new());

return nil;