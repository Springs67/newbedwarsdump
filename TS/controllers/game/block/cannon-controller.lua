-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CollectionTagAdded = v1.CollectionTagAdded;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local ContextActionService = v4.ContextActionService;
local Players = v4.Players;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local GamepadUtil = RuntimeLib.import(script, script.Parent.Parent.Parent, "global", "controls", "gamepad-util").GamepadUtil;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getItemSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta;
local ItemSkinType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-types").ItemSkinType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = {
    ItemSkinType.GOLD_VICTORIOUS_CANNON,
    ItemSkinType.PLATINUM_VICTORIOUS_CANNON,
    ItemSkinType.DIAMOND_VICTORIOUS_CANNON,
    ItemSkinType.EMERALD_VICTORIOUS_CANNON,
    ItemSkinType.NIGHTMARE_VICTORIOUS_CANNON
};
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 30, Name: __tostring
        return "CannonController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 36
    -- upvalues: u6 (copy)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 40
    -- upvalues: KnitController (copy), u3 (copy), Flamework (copy)
    KnitController.constructor(p8);
    p8.Name = "CannonController";
    p8.aimingMaid = u3.new();
    p8.aiming = false;
    p8.actionBinderController = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController");
end;

function u6.KnitStart(u9) -- Line: 47
    -- upvalues: CollectionTagAdded (copy), KnitClient2 (copy), GamepadUtil (copy), Players (copy), KnitClient (copy), ItemSkinType (copy), u5 (copy), TweenService (copy), default (copy), GameSound (copy), BlockEngine (copy), getItemSkinMeta (copy), SoundManager (copy)
    CollectionTagAdded("cannon", function(u10) -- Line: 48
        -- upvalues: KnitClient2 (ref), GamepadUtil (ref), Players (ref), u9 (copy), KnitClient (ref), ItemSkinType (ref), u5 (ref), TweenService (ref)
        local v11 = u10:GetAttribute("ItemSkin");
        KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            Name = "AimPrompt",
            HoldDuration = 0.2,
            RequiresLineOfSight = false,
            MaxActivationDistance = 10,
            ActionText = "Aim Cannon",
            ClickablePrompt = false,
            Parent = u10,
            GamepadKeyCode = GamepadUtil.getGamepadKeybind("Ping")
        }).Triggered:Connect(function(p12) -- Line: 60
            -- upvalues: Players (ref), u9 (ref), u10 (copy)
            if p12 == Players.LocalPlayer then
                u9:startAiming(u10);
            end;
        end);
        KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            Name = "StopAimingPrompt",
            HoldDuration = 0,
            RequiresLineOfSight = false,
            MaxActivationDistance = 10,
            ActionText = "Stop Aiming",
            Enabled = false,
            Parent = u10,
            GamepadKeyCode = GamepadUtil.getGamepadKeybind("Ping")
        }).Triggered:Connect(function(p13) -- Line: 75
            -- upvalues: Players (ref), u9 (ref)
            if p13 == Players.LocalPlayer then
                u9:stopAiming();
            end;
        end);
        KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            Name = "FirePrompt",
            HoldDuration = 0.4,
            RequiresLineOfSight = false,
            MaxActivationDistance = 10,
            ActionText = "Shoot TNT",
            Enabled = false,
            ClickablePrompt = false,
            Parent = u10,
            GamepadKeyCode = Enum.KeyCode.ButtonA
        }).Triggered:Connect(function(p14) -- Line: 91
            -- upvalues: Players (ref), KnitClient (ref), u10 (copy)
            if p14 == Players.LocalPlayer then
                KnitClient.Controllers.CannonHandController:fireCannon(u10);
            end;
        end);
        KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            Name = "LaunchSelfPrompt",
            HoldDuration = 0.4,
            RequiresLineOfSight = false,
            MaxActivationDistance = 10,
            ActionText = "Launch Self",
            Enabled = true,
            ClickablePrompt = false,
            KeyboardKeyCode = Enum.KeyCode.X,
            GamepadKeyCode = GamepadUtil.getGamepadKeybind("Interact"),
            UIOffset = Vector2.new(0, -80),
            Parent = u10
        }).Triggered:Connect(function(p15) -- Line: 109
            -- upvalues: Players (ref), KnitClient (ref), u10 (copy)
            if p15 == Players.LocalPlayer then
                KnitClient.Controllers.CannonHandController:launchSelf(u10);
            end;
        end);
        local u16 = v11 == ItemSkinType.CANNON_GHOST and 90 or (v11 and table.find(u5, v11) ~= nil and 0 or (v11 == ItemSkinType.CANNON_DEEPSEA and 0 or -90));

        local function u20() -- Line: 120
            -- upvalues: u10 (copy), u16 (ref), TweenService (ref)
            local v17 = u10:GetAttribute("LookVector") or Vector3.new();

            if u10:FindFirstChild("Base") then
                local v18 = CFrame.new(u10.Base.Position, u10.Base.Position + v17 * Vector3.new(5, 0, 5)) * CFrame.Angles(0, math.rad(u16), 0);
                TweenService:Create(u10.Base, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
                    CFrame = v18
                }):Play();
            end;

            if u10:FindFirstChild("Barrel") then
                local v19 = CFrame.new(u10.Barrel.Position, u10.Barrel.Position + v17 * 5) * CFrame.Angles(0, math.rad(u16), 0);
                TweenService:Create(u10.Barrel, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
                    CFrame = v19
                }):Play();
            end;
        end;

        u10:GetAttributeChangedSignal("LookVector"):Connect(function() -- Line: 148
            -- upvalues: u20 (copy)
            u20();
        end);
        u20();
    end);
    default.Client:WaitFor("CannonFired"):andThen(function(p21) -- Line: 156
        -- upvalues: Players (ref), GameSound (ref), BlockEngine (ref), getItemSkinMeta (ref), SoundManager (ref)
        p21:Connect(function(p22) -- Line: 157
            -- upvalues: Players (ref), GameSound (ref), BlockEngine (ref), getItemSkinMeta (ref), SoundManager (ref)
            local v23 = p22.player == Players.LocalPlayer;
            local CANNON_FIRE = GameSound.CANNON_FIRE;
            local v24 = BlockEngine:getStore():getBlockAt(p22.cannonBlockPos);
            local v25;

            if v24 == nil then
                v25 = v24;
            else
                v25 = v24:GetAttribute("ItemSkin");
            end;

            if v25 then
                local davey = getItemSkinMeta(v25).davey;

                if davey ~= nil then
                    davey = davey.cannonFireSound;
                end;

                if davey ~= "" then
                    CANNON_FIRE = davey or CANNON_FIRE;
                end;
            end;

            local v26 = {
                rollOffMaxDistance = 220
            };
            local v27;

            if v23 then
                v27 = nil;
            else
                v27 = BlockEngine:getWorldPosition(p22.cannonBlockPos);
            end;

            v26.position = v27;
            SoundManager:playSound(CANNON_FIRE, v26);

            if v24 ~= nil then
                v24 = v24:FindFirstChild("Barrel");

                if v24 ~= nil then
                    v24 = v24:FindFirstChild("Attachment");
                end;
            end;

            if v24 then
                local function _(p28) -- Line: 191
                    if p28:IsA("ParticleEmitter") then
                        p28:Emit(10);
                    end;
                end;

                for i, descendant in v24:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("ParticleEmitter") then
                        descendant:Emit(10);
                    end;
                end;
            end;
        end);
    end);
end;

function u6.startAiming(u29, u30) -- Line: 204
    -- upvalues: KnitClient (copy), Workspace (copy), Players (copy), RuntimeLib (copy), default (copy), BlockEngine (copy), ContextActionService (copy)
    u29:stopAiming();
    u29.aiming = true;
    u29.aimingMaid:GiveTask(function() -- Line: 207
        -- upvalues: u29 (copy)
        u29.aiming = false;
    end);
    KnitClient.Controllers.CannonHandController:updateAllCannonPrompts();
    u29.aimingMaid:GiveTask(function() -- Line: 211
        -- upvalues: KnitClient (ref)
        KnitClient.Controllers.CannonHandController:updateAllCannonPrompts();
    end);
    u29.aimingMaid:GiveTask(u30.AncestryChanged:Connect(function(p31, p32) -- Line: 214
        -- upvalues: u29 (copy)
        if p32 == nil then
            u29:stopAiming();
        end;
    end));
    Workspace.CurrentCamera.CameraSubject = u30.Camera;
    Players.LocalPlayer.CameraMinZoomDistance = 6.5;
    Players.LocalPlayer.CameraMaxZoomDistance = 6.5;
    u29.aimingMaid:GiveTask(function() -- Line: 222
        -- upvalues: Players (ref), Workspace (ref)
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:FindFirstChild("Humanoid");
        end;

        Workspace.CurrentCamera.CameraSubject = Character;
        Players.LocalPlayer.CameraMinZoomDistance = 0;
        Players.LocalPlayer.CameraMaxZoomDistance = 14;
    end);
    RuntimeLib.Promise.defer(function() -- Line: 231
        -- upvalues: Workspace (ref), default (ref), BlockEngine (ref), u30 (copy), u29 (copy)
        while true do
            local CurrentCamera = Workspace.CurrentCamera;

            if CurrentCamera then
                local LookVector = CurrentCamera.CFrame.LookVector;
                default.Client:Get("AimCannon"):SendToServer({
                    cannonBlockPos = BlockEngine:getBlockPosition(u30.Position),
                    lookVector = LookVector
                });
            end;

            local v33 = task.wait(0.2);

            if v33 ~= 0 and (v33 == v33 and v33) then
                v33 = u29.aiming;
            end;

            if v33 == 0 or (v33 ~= v33 or not v33) then
                return;
            end;
        end;
    end);
    ContextActionService:BindAction("cannon-stop-aiming", function(p34, p35, p36) -- Line: 253
        -- upvalues: u29 (copy)
        u29:stopAiming();
    end, false, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2);
    u29.aimingMaid:GiveTask(function() -- Line: 256
        -- upvalues: ContextActionService (ref)
        ContextActionService:UnbindAction("cannon-stop-aiming");
    end);

    if Players.LocalPlayer.Character then
        local Position = Players.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
        RuntimeLib.Promise.defer(function() -- Line: 262
            -- upvalues: u29 (copy), Players (ref), Position (copy)
            while true do
                local v37 = task.wait(0.2);

                if v37 ~= 0 and (v37 == v37 and v37) then
                    v37 = u29.aiming;
                end;

                if v37 == 0 or (v37 ~= v37 or not v37) then
                    return;
                end;

                local Character = Players.LocalPlayer.Character;

                if Character ~= nil then
                    Character = Character:GetPrimaryPartCFrame().Position;
                end;

                if Character == nil then
                    Character = Vector3.new();
                end;

                if (Character - Position).Magnitude > 6 then
                    u29:stopAiming();
                end;
            end;
        end);
    end;
end;

function u6.stopAiming(p38) -- Line: 287
    p38.aimingMaid:DoCleaning();
end;

function u6.isAiming(p39) -- Line: 290
    return p39.aiming;
end;

function u6.getCannons(p40) -- Line: 293
    -- upvalues: CollectionService (copy)
    return CollectionService:GetTagged("cannon");
end;

KnitClient.CreateController(u6.new());

return nil;