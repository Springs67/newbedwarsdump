-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local v4 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v4.InteractionCategory;
local InteractionPriority = v4.InteractionPriority;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "DrillController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 31
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 35
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p7);
    p7.Name = "DrillController";
    p7.alarmMaid = u2.new();
end;

function u5.KnitStart(u8) -- Line: 40
    -- upvalues: KnitController (copy), default (copy), Players (copy), Theme (copy), CollectionService (copy), ReplicatedStorage (copy), GameQueryUtil (copy), Workspace (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(u8);
    u8:initPrompt();
    default.Client:Get("DrillPlaced"):Connect(function(p9) -- Line: 43
        -- upvalues: Players (ref), Theme (ref), CollectionService (ref)
        local v10 = p9.drill:GetAttribute("PlacedByUserId");

        if v10 == 0 or (v10 ~= v10 or not v10) then
            return nil;
        end;

        local v11 = Players:GetPlayerByUserId(v10);

        if not v11 then
            return nil;
        end;

        local _ = Theme.mcGreen;

        if Players.LocalPlayer.Team == v11.Team then
            CollectionService:AddTag(p9.drill, "Friendly_Drill");

            return;
        end;

        local _ = Theme.mcRed;
    end);
    default.Client:Get("DrillAlarmTriggered"):Connect(function(p12) -- Line: 59
        -- upvalues: ReplicatedStorage (ref), GameQueryUtil (ref), Workspace (ref), CollectionService (ref), SoundManager (ref), GameSound (ref), u8 (copy)
        local PrimaryPart = p12.drill.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position + Vector3.new(0, 15, 0);
        end;

        if not PrimaryPart then
            return nil;
        end;

        local u13 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("BedAlarm"):Clone();
        u13:SetAttribute("RotationSpeed", 270);
        u13:PivotTo(CFrame.new(PrimaryPart));

        local function _(p14) -- Line: 74
            -- upvalues: GameQueryUtil (ref)
            GameQueryUtil:setQueryIgnored(p14, true);
        end;

        for i, descendant in u13:GetDescendants() do
            local _ = i - 1;
            GameQueryUtil:setQueryIgnored(descendant, true);
        end;

        u13.Parent = Workspace;
        CollectionService:AddTag(u13, "RotatingObject");
        local u15 = SoundManager:playSound(GameSound.BED_ALARM, {
            rollOffMaxDistance = 100,
            looped = true,
            position = PrimaryPart
        });
        u8.alarmMaid:GiveTask(function() -- Line: 87
            -- upvalues: u13 (copy)
            u13:Destroy();
        end);

        if u15 then
            u8.alarmMaid:GiveTask(function() -- Line: 91
                -- upvalues: SoundManager (ref), u15 (copy)
                SoundManager:tweenSoundVolume(u15, 0, 0.2);
                task.delay(0.3, function() -- Line: 93
                    -- upvalues: u15 (ref)
                    u15:Stop();
                end);
            end);
            task.delay(3, function() -- Line: 97
                -- upvalues: u8 (ref)
                u8.alarmMaid:DoCleaning();
            end);
        end;
    end);
end;

function u5.initPrompt(p16) -- Line: 103
    -- upvalues: KnitClient (copy), DeviceUtil (copy), InteractionPriority (copy), InteractionCategory (copy), default (copy)
    KnitClient.Controllers.InteractionRegistryController:RegisterInteraction({
        interactionLabel = "Extract",
        interactionObjectText = "Extract ore",
        interactionTag = "Friendly_Drill",
        holdDuration = 0.5,
        maxActivationDistance = 5,
        clickablePrompt = DeviceUtil.isMobileControls(),
        priority = InteractionPriority.OTHER,
        category = InteractionCategory.OTHER,
        KeyCode = Enum.KeyCode.R,

        onInteracted = function(p17, p18, p19) -- Line: 114, Name: onInteracted
            -- upvalues: default (ref)
            if not p18.PrimaryPart.Position then
                return nil;
            end;

            default.Client:Get("ExtractFromDrill"):SendToServer({
                drill = p18
            });
        end
    });
end;

KnitClient.CreateController(u5.new());

return nil;