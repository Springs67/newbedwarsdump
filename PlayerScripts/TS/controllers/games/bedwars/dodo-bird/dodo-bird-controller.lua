-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConstantManager = v1.ConstantManager;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local UserInputService = v5.UserInputService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local DodoAction = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "dodo-bird", "dodo-bird").DodoAction;
local MountType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-type").MountType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = ConstantManager.registerConstants(script, {
    MaxDodoJumps = 2
});
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "DodoBirdController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 37
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9, ...) -- Line: 41
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p9, ...);
    p9.Name = "DodoBirdController";
    p9.requestMountDodoBirdRemote = default.Client:Get("InteractDodoBird");
    p9.playerToDodoBird = {};
end;

function u7.KnitStart(u10) -- Line: 47
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), KnitClient2 (copy), DodoAction (copy), ClientSyncEvents (copy), MountType (copy), Players (copy), u3 (copy)
    KnitController.KnitStart(u10);
    WatchCollectionTag("dodo-bird", function(u11) -- Line: 49
        -- upvalues: KnitClient2 (ref), u10 (copy), DodoAction (ref)
        u11:SetAttribute("NextSquawk", -1);
        KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            Name = "DodoMountPrompt",
            ActionText = "Mount",
            ObjectText = "Dodo Bird",
            HoldDuration = 1.1,
            RequiresLineOfSight = false,

            Triggered = function() -- Line: 57, Name: Triggered
                -- upvalues: u10 (ref), DodoAction (ref), u11 (copy)
                u10.requestMountDodoBirdRemote:SendToServer({
                    action = DodoAction.Mount,
                    dodoBird = u11
                });
            end,

            Parent = u11
        });
    end);
    ClientSyncEvents.GenericMountMounted:connect(function(p12) -- Line: 66
        -- upvalues: MountType (ref), Players (ref), u10 (copy), u3 (ref)
        if p12.mountType ~= MountType.DODO_BIRD then
            return nil;
        end;

        if p12.player == Players.LocalPlayer then
            u10:toggleDodoProximityPrompts(false);

            if u10.dodoBirdMaid then
                u10.dodoBirdMaid:DoCleaning();
            end;

            u10.dodoBirdMaid = u3.new();
            u10.dodoBirdMaid:GiveTask(function() -- Line: 76
                -- upvalues: u10 (ref)
                u10:toggleDodoProximityPrompts(true);
            end);
            u10.dodoBirdMaid:GiveTask(u10:enableDoubleJump(p12.player.Character));
        end;

        if p12.player.Character ~= nil then
            u10.playerToDodoBird[p12.player] = u10:mountPlayerOnDodoBird(p12.player.Character, p12.model);
        end;
    end);
    ClientSyncEvents.GenericMountDismounted:connect(function(p13) -- Line: 88
        -- upvalues: MountType (ref), u10 (copy)
        if p13.mountType ~= MountType.DODO_BIRD then
            return nil;
        end;

        u10:unmountPlayerFromDodoBird(p13.player);
    end);

    for _, v in Players:GetPlayers() do
        v.CharacterRemoving:Connect(function() -- Line: 95
            -- upvalues: u10 (copy), v (copy)
            u10:unmountPlayerFromDodoBird(v);
        end);
    end;

    Players.PlayerAdded:Connect(function(u14) -- Line: 99
        -- upvalues: u10 (copy)
        u14.CharacterRemoving:Connect(function() -- Line: 100
            -- upvalues: u10 (ref), u14 (copy)
            u10:unmountPlayerFromDodoBird(u14);
        end);
    end);
end;

function u7.mountPlayerOnDodoBird(p15, p16, p17) -- Line: 105
    -- upvalues: SoundManager (copy), GameSound (copy), u4 (copy), CollectionService (copy), GameAnimationUtil (copy), AnimationType (copy)
    SoundManager:playSound(GameSound.DODO_BIRD_MOUNT, {
        position = p16:GetPrimaryPartCFrame().Position
    });
    p17:SetAttribute("NextSquawk", -1);
    p17:PivotTo(p16:GetPrimaryPartCFrame() * CFrame.new(0, -p17.RootPart.Size.Y, 0));
    local Humanoid = p16.Humanoid;
    Humanoid.HipHeight = Humanoid.HipHeight + (p17.RootPart.Size.Y / 2 - 0.1);
    u4("WeldConstraint", {
        Part0 = p16.HumanoidRootPart,
        Part1 = p17.RootPart,
        Parent = p17.RootPart
    });
    p17.Parent = p16;
    CollectionService:AddTag(p17, "dodo-bird-mount");
    local v18 = p16.Humanoid.Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.SIT_ON_DODO_BIRD));
    v18.Priority = Enum.AnimationPriority.Action;
    v18:Play();

    return {
        model = p17,
        sitTrack = v18
    };
end;

function u7.unmountPlayerFromDodoBird(p19, p20) -- Line: 131
    -- upvalues: Players (copy), SoundManager (copy), GameSound (copy)
    if p20 == Players.LocalPlayer then
        local dodoBirdMaid = p19.dodoBirdMaid;

        if dodoBirdMaid ~= nil then
            dodoBirdMaid:DoCleaning();
        end;
    end;

    local v21 = p19.playerToDodoBird[p20];

    if v21 and v21.model.PrimaryPart then
        if p20.Character then
            if p20.Character.PrimaryPart then
                SoundManager:playSound(GameSound.DODO_BIRD_DISMOUNT, {
                    position = p20.Character.PrimaryPart.Position
                });
            end;

            local v22 = p20.Character:FindFirstChildOfClass("Humanoid");

            if v22 then
                v22.HipHeight = v22.HipHeight - (v21.model.PrimaryPart.Size.Y / 2 - 0.1);
            end;
        end;

        v21.sitTrack:Stop();
        v21.sitTrack:Destroy();
    end;

    p19.playerToDodoBird[p20] = nil;
end;

function u7.enableDoubleJump(p23, u24) -- Line: 161
    -- upvalues: u3 (copy), KnitClient2 (copy), UserInputService (copy), u6 (copy)
    local u25 = false;
    local u26 = 0;
    local u27 = -1;
    local v28 = u3.new();
    v28:GiveTask(KnitClient2.Controllers.JumpHeightController:getJumpModifier():addModifier({
        jumpHeightMultiplier = 1.2
    }));
    v28:GiveTask(KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        moveSpeedMultiplier = 1.7,
        blockSprint = true
    }));
    v28:GiveTask(u24.Humanoid.StateChanged:Connect(function(p29, p30) -- Line: 173
        -- upvalues: u25 (ref), u26 (ref)
        if p30 ~= Enum.HumanoidStateType.Landed then
            if p30 == Enum.HumanoidStateType.Jumping or p30 == Enum.HumanoidStateType.Freefall then
                u25 = true;
            end;

            return;
        end;

        u25 = false;
        u26 = 0;
    end));
    v28:GiveTask(UserInputService.JumpRequest:Connect(function() -- Line: 181
        -- upvalues: u25 (ref), u26 (ref), u6 (ref), u27 (ref), u24 (copy)
        if u25 and (u26 < u6.MaxDodoJumps and u27 < time()) then
            u27 = time() + 0.25;
            u26 = u26 + 1;
            u24.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
        end;
    end));

    return v28;
end;

function u7.toggleDodoProximityPrompts(p31, p32) -- Line: 190
    -- upvalues: CollectionService (copy)
    for _, v in CollectionService:GetTagged("dodo-bird") do
        local DodoMountPrompt = v:FindFirstChild("DodoMountPrompt");

        if DodoMountPrompt ~= nil then
            DodoMountPrompt.Enabled = p32;
        end;
    end;
end;

KnitClient.CreateController(u7.new());

return nil;