-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local TimedProgressBar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").TimedProgressBar;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local Linear = v1.Linear;
local OutBounce = v1.OutBounce;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "PitItemController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 26
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "PitItemController";
    p7.pitItemDatas = {};
end;

function u5.KnitStart(u8) -- Line: 35
    -- upvalues: KnitController (copy), default2 (copy)
    KnitController.KnitStart(u8);
    default2.Client:Get("PitItemPlaced"):Connect(function(u9) -- Line: 38
        -- upvalues: u8 (copy)
        task.spawn(function() -- Line: 39
            -- upvalues: u8 (ref), u9 (copy)
            u8:pitItemPlaced(u9.pitItemData);
        end);
    end);
end;

function u5.pitItemPlaced(p10, p11) -- Line: 44
    -- upvalues: u2 (copy), u3 (copy), TimedProgressBar (copy), Players (copy), Workspace (copy)
    table.insert(p10.pitItemDatas, p11);
    p11.maid = u2.new();
    local u12 = u3.mount(u3.createElement("BillboardGui", {
        ResetOnSpawn = false,
        MaxDistance = 200,
        StudsOffsetWorldSpace = Vector3.new(0, 5, 0),
        Adornee = p11.pitModel.Pivot.GUIParent,
        Size = UDim2.fromScale(8, 0.8)
    }, { u3.createElement(TimedProgressBar, {
            HideOnComplete = true,
            Size = UDim2.fromScale(1, 1),
            StartTime = p11.timePlaced,
            EndTime = p11.activationTime,
            ProgressBarConfig = {
                Flip = true,
                BarGradient = ColorSequence.new(Color3.fromRGB(232, 33, 33), Color3.fromRGB(181, 97, 56)),
                Title = {
                    text = "Danger!"
                }
            }
        }) }), Players.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
    p11.maid:GiveTask(function() -- Line: 72
        -- upvalues: u3 (ref), u12 (copy)
        return u3.unmount(u12);
    end);
    local v13 = p11.activationTime - Workspace:GetServerTimeNow();

    if v13 > 0 then
        task.wait(v13 + 0.1);
    end;

    p10:openDoor(p11.pitModel.Pivot.Door, p11.pitModel.Pivot.TrafficCone);
end;

function u5.openDoor(p14, u15, p16) -- Line: 83
    -- upvalues: default (copy), OutBounce (copy)
    local u17 = u15:GetPivot();
    local Position = u15:GetPivot().Position;
    local u18 = CFrame.new(Position - Vector3.new(0, 0.25, 0)) * CFrame.Angles(0.17453292519943295, 0, 0);
    default(2, OutBounce, function(p19) -- Line: 96
        -- upvalues: u17 (copy), u18 (copy), u15 (copy)
        u15:PivotTo((u17:Lerp(u18, p19)));
    end):Play():Wait();
    u15.CanCollide = false;
end;

function u5.closeDoor(p20, p21) -- Line: 103
    -- upvalues: default (copy), Linear (copy)
    local Door = p21.Door;
    local u22 = Door:GetPivot();
    local u23 = CFrame.new(Door:GetPivot().Position) * CFrame.Angles(0, 0, 0);
    default(0.5, Linear, function(p24) -- Line: 109
        -- upvalues: u22 (copy), u23 (copy), Door (copy)
        Door:PivotTo((u22:Lerp(u23, p24)));
    end):Play();
end;

KnitClient.CreateController(u5.new());

return nil;