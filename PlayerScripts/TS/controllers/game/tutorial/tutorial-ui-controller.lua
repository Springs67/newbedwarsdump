-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local TutorialDialogue = RuntimeLib.import(script, script.Parent, "ui", "tutorial-dialogue").TutorialDialogue;
local TutorialTaskTracker = RuntimeLib.import(script, script.Parent, "ui", "tutorial-task-tracker").TutorialTaskTracker;
local DIALOGUE = GameSound.DIALOGUE;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "TutorialController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 29
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 33
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p7);
    p7.Name = "TutorialController";
    p7.mountingUi = false;
    p7.tasksMaid = u2.new();
    p7.dialogueMaid = u2.new();
end;

function u5.KnitStart(u8) -- Line: 40
    -- upvalues: KnitController (copy), KnitClient2 (copy), QueueType (copy), KnitClient (copy), DIALOGUE (copy), default (copy), Players (copy), Workspace (copy), u3 (copy), TutorialTaskTracker (copy), TutorialDialogue (copy)
    KnitController.KnitStart(u8);
    local v9, v10 = KnitClient2.Controllers.MatchController:getQueueTypeAsync():await();

    if v9 and v10 == QueueType.BEGINNER_TUTORIAL then
        KnitClient.Controllers.PreloadController:runPreload({
            sounds = { DIALOGUE }
        });
    end;

    default.Client:OnEvent("TutorialTasksAssigned", function(p11) -- Line: 49
        -- upvalues: u8 (copy), Players (ref), Workspace (ref), u3 (ref), TutorialTaskTracker (ref)
        u8.mountingUi = true;
        local LocalPlayer = Players.LocalPlayer;
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.ViewportSize.Y;
        end;

        local u12 = u3.mount(u3.createElement(TutorialTaskTracker, {
            CurrentTasks = p11.tutorialData.currentTasks,
            ScreenSizeY = CurrentCamera == nil and 374 or CurrentCamera
        }), LocalPlayer:WaitForChild("PlayerGui"));
        u8.tasksMaid:GiveTask(function() -- Line: 65
            -- upvalues: u3 (ref), u12 (copy)
            u3.unmount(u12);
        end);
        u8.mountingUi = false;
    end);
    default.Client:OnEvent("TutorialDialogueBegin", function(p13) -- Line: 71
        -- upvalues: Players (ref), u3 (ref), TutorialDialogue (ref), u8 (copy), DIALOGUE (ref)
        local LocalPlayer = Players.LocalPlayer;
        local u14 = u3.mount(u3.createElement(TutorialDialogue, {
            TutorialType = p13.tutorialType,
            Dialogue = u8:getStringsFromDialogue(p13.dialogue),
            TalkSound = DIALOGUE
        }), LocalPlayer:WaitForChild("PlayerGui"));
        u8.dialogueMaid:GiveTask(function() -- Line: 78
            -- upvalues: u3 (ref), u14 (copy)
            u3.unmount(u14);
        end);
    end);
    default.Client:OnEvent("TutorialTasksComplete", function(p15) -- Line: 83
        -- upvalues: u8 (copy)
        task.spawn(function() -- Line: 84
            -- upvalues: u8 (ref)
            while u8.mountingUi == true do
                task.wait(0.01);
            end;

            u8.tasksMaid:DoCleaning();
        end);
    end);
end;

function u5.closeDialogue(p16) -- Line: 92
    p16.dialogueMaid:DoCleaning();
end;

function u5.getStringsFromDialogue(p17, p18) -- Line: 95
    -- upvalues: DeviceUtil (copy)
    local v19 = {};

    for _, v in p18 do
        if typeof(v) == "string" then
            table.insert(v19, v);
        else
            local v20 = DeviceUtil.isMobileControls() and v.mobileText;

            if v20 == "" or not v20 then
                local v21 = DeviceUtil.isGamepadControls() and v.gamepadText;

                if v21 == "" or not v21 then
                    table.insert(v19, v.text);
                else
                    table.insert(v19, v.gamepadText);
                end;
            else
                table.insert(v19, v.mobileText);
            end;
        end;
    end;

    return v19;
end;

KnitClient.CreateController(u5.new());

return nil;