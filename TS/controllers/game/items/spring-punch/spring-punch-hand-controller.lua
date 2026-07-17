-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local MobileTouchType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MobileTouchType;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local Workspace = v2.Workspace;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local SpringPunchBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "spring-punch", "spring-punch-balance").SpringPunchBalance;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "SpringPunchHandController";
    end,

    __index = HandKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 24
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 28
    -- upvalues: HandKnitController (copy), u1 (copy)
    HandKnitController.constructor(p5);
    p5.Name = "SpringPunchHandController";
    p5.maid = u1.new();
    p5.lastAttackTime = 0;
    p5.enableTime = 0;
end;

function u3.KnitStart(p6) -- Line: 35
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p6);
end;

function u3.onEnable(u7, p8) -- Line: 38
    -- upvalues: Workspace (copy), Flamework (copy), MobileTouchType (copy)
    u7.enableTime = Workspace:GetServerTimeNow();
    local v12 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "Spring Punch Attack",

        boundFunction = function(p9, p10, p11) -- Line: 44, Name: boundFunction
            -- upvalues: u7 (copy)
            if p10 == Enum.UserInputState.Begin then
                u7:attack();
            end;
        end,

        mobile = {
            touchType = MobileTouchType.TouchTap,

            mobileBoundFunction = function() -- Line: 51, Name: mobileBoundFunction
                -- upvalues: u7 (copy)
                u7:attack();
            end
        }
    });
    u7.maid:GiveTask(v12);
end;

function u3.onDisable(p13) -- Line: 64
    p13.maid:DoCleaning();
end;

function u3.isRelevantItem(p14, p15) -- Line: 67
    -- upvalues: ItemType (copy)
    return p15.itemType == ItemType.SPRING_PUNCH;
end;

function u3.attack(p16) -- Line: 70
    -- upvalues: Workspace (copy), SpringPunchBalance (copy), Players (copy), KnitClient (copy), default (copy)
    if Workspace:GetServerTimeNow() - p16.enableTime < 0.1 then
        return nil;
    end;

    if Workspace:GetServerTimeNow() - p16.lastAttackTime < SpringPunchBalance.COOLDOWN then
        return nil;
    end;

    p16.lastAttackTime = Workspace:GetServerTimeNow();
    local LookVector = Workspace.CurrentCamera.CFrame.LookVector;
    local Position = Players.LocalPlayer.Character.PrimaryPart.Position;
    task.spawn(function() -- Line: 81
        -- upvalues: KnitClient (ref), Players (ref)
        KnitClient.Controllers.SpringPunchController:animatePunch(Players.LocalPlayer, nil);
    end);
    default.Client:Get("SpringPunchFromClient"):SendToServer({
        originPosition = Position,
        direction = LookVector
    });
end;

KnitClient.CreateController(u3.new());

return nil;