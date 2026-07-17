-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local ExpireList = v1.ExpireList;
local SoundManager = v1.SoundManager;
local WatchCharacterAnimation = v1.WatchCharacterAnimation;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local v6 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v6.InteractionCategory;
local InteractionPriority = v6.InteractionPriority;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CombatConstant = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "combat-constant").CombatConstant;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local DragonSlayerConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "dragon-slayer", "dragon-slayer-constants").DragonSlayerConstants;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 40, Name: __tostring
        return "DragonSlayerController";
    end,

    __index = BaseKitController
});
u7.__index = u7;

function u7.new(...) -- Line: 46
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 50
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), AnimationType (copy), GameSound (copy)
    BaseKitController.constructor(p9, BedwarsKit.DRAGON_SLAYER, {
        animations = { AnimationType.DRAGON_SLAYER_PUNCH, AnimationType.DRAGON_SLAYER_LAUNCH_LOOP, AnimationType.DRAGON_SLAYER_LAUNCH_IMPACT },
        sounds = { GameSound.KALIYAH_EXPLOSION, GameSound.KALIYAH_PUNCH, GameSound.KALIYAH_WALL_HIT }
    });
    p9.Name = "DragonSlayerController";
    p9.dragonEmblems = {};
end;

function u7.KnitStart(p10) -- Line: 58
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p10);
end;

function u7.onKitLocalActivated(u11, p12) -- Line: 61
    -- upvalues: KnitClient (copy), CombatConstant (copy), DeviceUtil (copy), InteractionPriority (copy), InteractionCategory (copy), Players (copy), EntityUtil (copy), default2 (copy)
    p12:GiveTask(KnitClient.Controllers.InteractionRegistryController:RegisterInteraction({
        interactionLabel = "Punch",
        interactionTag = "KaliyahPunchInteraction",
        instantActivation = true,
        maxActivationDistance = CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE,
        clickablePrompt = DeviceUtil.isMobileControls(),
        priority = InteractionPriority.ABILITY,
        category = InteractionCategory.ABILITY,

        onInteracted = function(p13, p14, p15) -- Line: 70, Name: onInteracted
            -- upvalues: Players (ref), EntityUtil (ref), u11 (copy), default2 (ref)
            if not p14:IsA("Model") then
                return nil;
            end;

            local Position = p14:GetPrimaryPartCFrame().Position;
            local Character = Players.LocalPlayer.Character;
            local v16 = EntityUtil:getLocalPlayerEntity();

            if not Character or (not v16 or v16:isDead()) then
                return nil;
            end;

            u11:deleteEmblem(p14);
            local Position2 = Character:GetPrimaryPartCFrame().Position;
            local v17 = Vector3.new(0, Position2.Y, 0);
            local v18 = CFrame.new(Position2, Position * Vector3.new(1, 0, 1) + v17);
            Character:PivotTo(v18);
            u11:playPunchAnimation(v18 - v18.Position);
            default2.Client:Get("RequestDragonPunch"):SendToServer({
                target = p14
            });
        end
    }));
end;

function u7.onKitLocalDeactivated(p19) -- Line: 96
end;

function u7.onKitReplicationActivated(u20) -- Line: 98
    -- upvalues: default2 (copy), Players (copy), MapUtil (copy), RunService (copy), Workspace (copy), ReplicatedStorage (copy), DragonSlayerConstants (copy), KnitClient2 (copy), CollectionService (copy), u3 (copy), GameAnimationUtil (copy), AnimationType (copy), default (copy), Linear (copy), SoundManager (copy), GameSound (copy), EffectUtil (copy), ExpireList (copy), WatchCharacterAnimation (copy), isUsingKit (copy), BedwarsKit (copy), KnitClient (copy)
    default2.Client:Get("UpdateDragonSlayerStacks"):Connect(function(u21) -- Line: 99
        -- upvalues: Players (ref), u20 (copy), MapUtil (ref)
        if u21.kitUser ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        if u21.stacks == 0 then
            u20:deleteEmblem(u21.target);

            return nil;
        end;

        if u20.dragonEmblems[u21.target] == nil then
            local u22 = nil;
            u22 = u21.target.AncestryChanged:Connect(function() -- Line: 111
                -- upvalues: u20 (ref), u21 (copy), u22 (ref)
                u20:deleteEmblem(u21.target);
                u22:Disconnect();
            end);
        end;

        MapUtil.getOrCreate(u20.dragonEmblems, u21.target, {
            stackCount = 0
        }).stackCount = u21.stacks;
    end);
    RunService.Heartbeat:Connect(function() -- Line: 121
        -- upvalues: Workspace (ref), u20 (copy), ReplicatedStorage (ref), DragonSlayerConstants (ref), KnitClient2 (ref), CollectionService (ref)
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame;
        end;

        if not CurrentCamera then
            return nil;
        end;

        for i, v in u20.dragonEmblems do
            if i.PrimaryPart then
                local Position = (i:GetPrimaryPartCFrame() + Vector3.new(0, 5, 0)).Position;
                local v23 = CFrame.new(Position, (Vector3.new(CurrentCamera.X, Position.Y, CurrentCamera.Z))) * CFrame.Angles(0, 1.5707963267948966, 0);

                if not v.model then
                    v.model = ReplicatedStorage.Assets.Misc.DragonEmblem:Clone();
                    v.model.Parent = u20:getDragonEmblemFolder();
                end;

                v.model:PivotTo(v23);
                local v24 = false;
                local v25 = 1;

                while true do
                    if true then
                        if v24 then
                            v25 = v25 + 1;
                        else
                            v24 = true;
                        end;
                    end;

                    if v25 > DragonSlayerConstants.MAX_STACKS then
                        break;
                    end;

                    local v26 = v.model:FindFirstChild(v25);

                    if v26 then
                        local v27 = v25 <= v.stackCount;
                        local v28;

                        if v27 then
                            v28 = Color3.fromRGB(255, 67, 45);
                        else
                            v28 = Color3.fromRGB(185, 148, 153);
                        end;

                        v26.Color = v28;
                        local v29;

                        if v27 then
                            v29 = Enum.Material.Neon;
                        else
                            v29 = Enum.Material.Glass;
                        end;

                        v26.Material = v29;
                        v26.Transparency = 0.1;
                    end;
                end;

                local v30 = i:FindFirstChildWhichIsA("ProximityPrompt");
                local v31 = v.stackCount == DragonSlayerConstants.MAX_STACKS;

                if not v31 and v30 then
                    KnitClient2.Controllers.InteractionRegistryController:removePrompt(i, "KaliyahPunchInteraction");
                end;

                if v31 and not v30 then
                    CollectionService:AddTag(i, "KaliyahPunchInteraction");
                end;
            end;
        end;
    end);
    default2.Client:Get("PlayerDragonPunched"):Connect(function(u32) -- Line: 178
        -- upvalues: u3 (ref), ReplicatedStorage (ref), u20 (copy), GameAnimationUtil (ref), AnimationType (ref), default (ref), Linear (ref), Players (ref), SoundManager (ref), GameSound (ref), Workspace (ref), EffectUtil (ref)
        if not u32.target.PrimaryPart then
            return nil;
        end;

        local u33 = u3.new();
        local Position = u32.target:GetPrimaryPartCFrame().Position;
        local v34 = u32.destination.Position - Position;
        local v35 = Vector3.new(v34.X, 0, v34.Z);
        local v36 = CFrame.lookAt(Vector3.new(0, 0, 0), v35) * CFrame.Angles(0, 3.141592653589793, 0);
        local Position2 = (u32.target:GetPrimaryPartCFrame() + Vector3.new(0, 5, 0)).Position;
        local v37 = CFrame.new(Position2) * v36 * CFrame.Angles(0, 1.5707963267948966, 0);
        local v38 = ReplicatedStorage.Assets.Misc.DragonEmblem:Clone();
        u33:GiveTask(v38);
        v38.Parent = u20:getDragonEmblemFolder();
        v38:PivotTo(v37);
        local u39 = CFrame.new(Position) * v36;
        local u40 = CFrame.new(u32.destination.Position) * v36;
        local u41 = u32.target:FindFirstChildWhichIsA("Humanoid");

        if u41 ~= nil then
            u41 = u41:FindFirstChild("Animator");
        end;

        if u41 then
            local u42 = GameAnimationUtil:playAnimation(u41, AnimationType.DRAGON_SLAYER_LAUNCH_LOOP);
            u33:GiveTask(function() -- Line: 208
                -- upvalues: u42 (copy)
                local v43 = u42;

                if v43 ~= nil then
                    v43:Stop();
                end;
            end);
        end;

        default(u32.knockbackDuration, Linear, function(p44) -- Line: 215
            -- upvalues: u32 (copy), u39 (copy), u40 (copy)
            if not u32.target.PrimaryPart then
                return nil;
            end;

            u32.target:PivotTo(u39:Lerp(u40, p44));
        end);
        local u45 = u32.target == Players.LocalPlayer.Character;
        task.delay(math.max(0, u32.knockbackDuration - 0.1), function() -- Line: 222
            -- upvalues: u45 (copy), u32 (copy), SoundManager (ref), GameSound (ref)
            if u45 or u32.target.PrimaryPart then
                local v46 = {};
                local v47;

                if u45 then
                    v47 = nil;
                else
                    v47 = u32.target:GetPrimaryPartCFrame().Position;
                end;

                v46.position = v47;
                SoundManager:playSound(GameSound.KALIYAH_WALL_HIT, v46);
                local KALIYAH_EXPLOSION = GameSound.KALIYAH_EXPLOSION;
                local v48 = {
                    rollOffMaxDistance = 80,
                    rollOffMinDistance = 30
                };

                for i, v in v46 do
                    v48[i] = v;
                end;

                SoundManager:playSound(KALIYAH_EXPLOSION, v48);
            end;
        end);
        task.delay(u32.knockbackDuration, function() -- Line: 240
            -- upvalues: u33 (copy), u32 (copy), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), u41 (copy), GameAnimationUtil (ref), AnimationType (ref)
            u33:DoCleaning();

            if u32.target.PrimaryPart then
                local v49 = u32.target:GetPrimaryPartCFrame().Position + Vector3.new(0, 5, 0);
                local v50 = ReplicatedStorage.Assets.Effects.DragonEmblemExplode:Clone();
                v50.Position = v49;
                v50.Parent = Workspace;
                EffectUtil:playEffects({ v50 }, nil, {
                    destroyAfterSec = 3
                });
            end;

            if u41 then
                GameAnimationUtil:playAnimation(u41, AnimationType.DRAGON_SLAYER_LAUNCH_IMPACT);
            end;
        end);
    end);
    local u51 = ExpireList.new(2);
    WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.DRAGON_SLAYER_PUNCH) }, function(p52, p53) -- Line: 260
        -- upvalues: Players (ref), isUsingKit (ref), BedwarsKit (ref), u51 (copy), SoundManager (ref), GameSound (ref), KnitClient (ref), ReplicatedStorage (ref), Workspace (ref), default (ref), Linear (ref)
        local Character = p52.Character;

        if not Character then
            return nil;
        end;

        local u54 = p52 == Players.LocalPlayer;

        if not isUsingKit(p52, BedwarsKit.DRAGON_SLAYER) then
            return nil;
        end;

        if not u54 and u51:has(p52) then
            return nil;
        end;

        u51:add(p52);

        if Character.PrimaryPart or u54 then
            local KALIYAH_PUNCH = GameSound.KALIYAH_PUNCH;
            local v55 = {};
            local v56;

            if u54 then
                v56 = nil;
            else
                v56 = Character:GetPrimaryPartCFrame().Position;
            end;

            v55.position = v56;
            SoundManager:playSound(KALIYAH_PUNCH, v55);
        end;

        p53:GetMarkerReachedSignal("impact"):Connect(function() -- Line: 278
            -- upvalues: u54 (copy), Players (ref), KnitClient (ref), Character (copy), ReplicatedStorage (ref), Workspace (ref), default (ref), Linear (ref)
            if u54 then
                local Character2 = Players.LocalPlayer.Character;

                if Character2 ~= nil then
                    Character2 = Character2.PrimaryPart;

                    if Character2 ~= nil then
                        Character2 = Character2.CFrame;
                    end;
                end;

                if Character2 == nil then
                    Character2 = CFrame.new();
                end;

                KnitClient.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Character2.LookVector, {
                    cycles = 3
                });
            end;

            task.delay(0.03, function() -- Line: 302
                -- upvalues: Character (ref), ReplicatedStorage (ref), Workspace (ref), default (ref), Linear (ref)
                local RightHand = Character:FindFirstChild("RightHand");

                if RightHand then
                    local u57 = ReplicatedStorage.Assets.Misc.DragonPunchRune:Clone();
                    local v58 = RightHand.CFrame * CFrame.Angles(1.5707963267948966, 0, 0);
                    u57.CFrame = CFrame.new(v58 * Vector3.new(0, 0, 1.5)) * (v58 - RightHand.Position);
                    u57.Parent = Workspace;
                    task.delay(0.04, function() -- Line: 315
                        -- upvalues: u57 (copy), default (ref), Linear (ref)
                        local Brightness = u57.SurfaceGui.Brightness;
                        default(0.4, Linear, function(p59) -- Line: 317
                            -- upvalues: u57 (ref), Brightness (copy)
                            for _, child in u57:GetChildren() do
                                if child:IsA("SurfaceGui") then
                                    child.Brightness = (1 - p59 / 2) * Brightness;

                                    for _, child2 in child:GetChildren() do
                                        if child2:IsA("ImageLabel") then
                                            child2.ImageTransparency = p59;
                                        end;
                                    end;
                                end;
                            end;
                        end):Wait();
                        u57:Destroy();
                    end);
                end;
            end);
        end);
    end);
end;

function u7.onKitReplicationDeactivated(p60) -- Line: 339
end;

function u7.onInnateAbilityEnabled(p61, p62, p63) -- Line: 341
end;

function u7.onAbilityUsed(p64, p65, p66) -- Line: 343
end;

function u7.playPunchAnimation(p67, u68) -- Line: 345
    -- upvalues: u3 (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy), KnitClient (copy), RunService (copy)
    local u69 = u3.new();
    local u70 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.DRAGON_SLAYER_PUNCH);
    u69:GiveTask(function() -- Line: 348
        -- upvalues: u70 (copy)
        local v71 = u70;

        if v71 ~= nil then
            v71:Stop();
        end;
    end);
    u69:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
        moveSpeedMultiplier = 0
    }));
    u69:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 357
        -- upvalues: Players (ref), u69 (copy), u68 (copy)
        local Character = Players.LocalPlayer.Character;
        local v72;

        if Character == nil then
            v72 = Character;
        else
            v72 = Character.PrimaryPart;
        end;

        if not v72 then
            u69:DoCleaning();

            return nil;
        end;

        Character:PivotTo(CFrame.new(Character:GetPrimaryPartCFrame().Position) * u68);
    end));
    task.delay(0.46, function() -- Line: 372
        -- upvalues: u69 (copy)
        u69:DoCleaning();
    end);

    return u69;
end;

function u7.deleteEmblem(p73, p74) -- Line: 377
    -- upvalues: KnitClient2 (copy)
    KnitClient2.Controllers.InteractionRegistryController:removePrompt(p74, "KaliyahPunchInteraction");
    local v75 = p73.dragonEmblems[p74];

    if v75 ~= nil then
        local model = v75.model;

        if model ~= nil then
            model:Destroy();
        end;
    end;

    p73.dragonEmblems[p74] = nil;
end;

function u7.getDragonEmblemFolder(p76) -- Line: 392
    -- upvalues: u4 (copy), Workspace (copy)
    if not p76.dragonEmblemFolder then
        p76.dragonEmblemFolder = u4("Folder", {
            Name = "DragonEmblems",
            Parent = Workspace
        });
    end;

    return p76.dragonEmblemFolder;
end;

KnitClient.CreateController(u7.new());

return nil;