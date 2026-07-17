-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local NecromancerStaffDisplay = RuntimeLib.import(script, script.Parent, "ui", "necromancer-staff-ui").NecromancerStaffDisplay;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "NecromancerController";
    end,

    __index = BaseKitController
});
u6.__index = u6;

function u6.new(...) -- Line: 39
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 43
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p8, BedwarsKit.NECROMANCER);
    p8.Name = "NecromancerController";
    p8.settingUpStackTree = false;
    p8.gravestoneSecretsMap = {};
end;

function u6.onKitLocalActivated(u9, u10) -- Line: 49
    -- upvalues: default (copy), ReplicatedStorage (copy), Workspace (copy), CollectionService (copy), WatchCollectionTag (copy), KnitClient2 (copy), Players (copy), WeldUtil (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient (copy)
    u9:setUpStackTree(u10);
    default.Client:Get("NecromancerNewTarget"):Connect(function(p11) -- Line: 51
        -- upvalues: u9 (copy)
        u9:newTarget(p11.entityInstance);
    end);
    default.Client:OnEvent("SpawnGravestone", function(p12) -- Line: 54
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), u9 (copy), CollectionService (ref)
        local v13 = ReplicatedStorage.Assets.Misc.Gravestone:Clone();
        v13.Parent = Workspace;
        v13:SetAttribute("GravestoneSecret", p12.secret);
        v13:SetAttribute("GravestonePosition", p12.position);
        v13:SetAttribute("GravestonePlayerUserId", p12.skeletonData.associatedPlayerUserId);
        v13:SetAttribute("ArmorType", p12.skeletonData.armorType);
        v13:SetAttribute("SwordType", p12.skeletonData.weaponType);
        v13:SetAttribute("BowType", p12.skeletonData.bowType);
        v13:PivotTo(CFrame.new(p12.position));
        u9.gravestoneSecretsMap[p12.secret] = v13;
        CollectionService:AddTag(v13, "Gravestone");
    end):andThen(function(p14) -- Line: 69
        -- upvalues: u10 (copy)
        u10:GiveTask(p14);
    end);
    u10:GiveTask((default.Client:Get("UseGravestone"):Connect(function(p15) -- Line: 72
        -- upvalues: u9 (copy)
        local v16 = u9.gravestoneSecretsMap[p15.secret];

        if not v16 then
            return nil;
        end;

        u9:lowerGravestone(v16, p15.secret);
    end)));
    u10:GiveTask(WatchCollectionTag("Gravestone", function(u17) -- Line: 82
        -- upvalues: KnitClient2 (ref), Players (ref), ReplicatedStorage (ref), WeldUtil (ref), GameAnimationUtil (ref), AnimationType (ref), KnitClient (ref), default (ref), u9 (copy)
        local u18 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ActionText = "Claim Skeleton",
            ObjectText = "Gravestone",
            HoldDuration = 0.1,
            RequiresLineOfSight = false,
            MaxActivationDistance = 12,
            ClickablePrompt = true,
            Parent = u17:WaitForChild("Root"):WaitForChild("GravestoneModel"):WaitForChild("Gravestone"):WaitForChild("PromptAttachment")
        });
        local v19 = Players:GetPlayerByUserId(u17:GetAttribute("GravestonePlayerUserId"));

        if v19 ~= nil then
            v19 = v19.Name;
        end;

        if v19 ~= "" and v19 then
            u17.Root.GravestoneModel.Gravestone.SurfaceGui.GravestoneText.Text = v19;
            u17.Root.GravestoneModel.Gravestone.SurfaceGui.AlwaysOnTop = false;
        end;

        local v20 = u17:GetAttribute("ArmorType");
        local v21 = ReplicatedStorage.Assets.Armor:WaitForChild(v20):Clone();

        if v21 then
            for _, descendant in v21:GetDescendants() do
                if descendant:IsA("Accessory") then
                    descendant.Parent = u17.Root.GravestoneModel;
                    WeldUtil:weldCharacterAccessories(u17.Root.GravestoneModel);
                end;
            end;
        end;

        u18.PromptButtonHoldEnded:Connect(function(p22) -- Line: 111
            -- upvalues: Players (ref), u18 (copy), GameAnimationUtil (ref), AnimationType (ref), KnitClient (ref), u17 (copy), default (ref), u9 (ref)
            if p22 == Players.LocalPlayer then
                u18.Enabled = false;
                GameAnimationUtil:playAnimation(p22, AnimationType.PUNCH);
                KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_USE_ITEM);
                local v23 = u17:GetAttribute("GravestoneSecret");
                local v24 = {
                    associatedPlayerUserId = u17:GetAttribute("GravestonePlayerUserId"),
                    armorType = u17:GetAttribute("ArmorType"),
                    weaponType = u17:GetAttribute("SwordType"),
                    bowType = u17:GetAttribute("BowType")
                };

                if default.Client:Get("ActivateGravestone"):CallServer({
                    secret = v23,
                    position = u17:GetAttribute("GravestonePosition"),
                    skeletonData = v24
                }).success then
                    u18:Destroy();
                    u9:useGravestone(p22, u17);
                end;

                if u18 then
                    u18.Enabled = true;
                end;
            end;
        end);
    end));
end;

function u6.setUpStackTree(u25, p26) -- Line: 142
    -- upvalues: Players (copy), KnitClient (copy), u4 (copy), NecromancerStaffDisplay (copy)
    if not (u25.skeletonStackTree or u25.settingUpStackTree) then
        u25.settingUpStackTree = true;
        local v27 = Players.LocalPlayer:GetAttribute("SkeletonCount");
        u25.skeletonStackTree = KnitClient.Controllers.StatusInfoListController:waitForSetupAddElement(u4.createElement(NecromancerStaffDisplay, {
            skeletonStacks = v27 == nil and 0 or v27
        }));
    end;

    Players.LocalPlayer:GetAttributeChangedSignal("SkeletonCount"):Connect(function(p28) -- Line: 155
        -- upvalues: u25 (copy)
        u25:updateTree();
    end);
    p26:GiveTask(function() -- Line: 158
        -- upvalues: u25 (copy), u4 (ref)
        if u25.skeletonStackTree then
            u4.unmount(u25.skeletonStackTree);
        end;
    end);
end;

function u6.updateTree(p29) -- Line: 164
    -- upvalues: Players (copy), u4 (copy), NecromancerStaffDisplay (copy)
    if p29.skeletonStackTree then
        local v30 = Players.LocalPlayer:GetAttribute("SkeletonCount");
        u4.update(p29.skeletonStackTree, u4.createElement(NecromancerStaffDisplay, {
            skeletonStacks = v30 == nil and 0 or v30
        }));
    end;
end;

function u6.useGravestone(p31, u32, u33) -- Line: 178
    -- upvalues: KnitClient2 (copy), GameSound (copy), BedwarsKitSkin (copy), SoundManager (copy), ReplicatedStorage (copy), Workspace (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), BalanceFile (copy)
    task.spawn(function() -- Line: 179
        -- upvalues: u32 (copy), KnitClient2 (ref), GameSound (ref), BedwarsKitSkin (ref), SoundManager (ref), u33 (copy), ReplicatedStorage (ref), Workspace (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), BalanceFile (ref)
        if u32.Parent ~= nil and u32.Character then
            local v34 = KnitClient2.Controllers.KitSkinController:getKitSkin(u32);
            local GRAVESTONE_USE = GameSound.GRAVESTONE_USE;

            if v34 == BedwarsKitSkin.CRYPTWRECKED then
                GRAVESTONE_USE = GameSound.GRAVESTONE_USE_CRYPTWRECKED;
            end;

            SoundManager:playSound(GRAVESTONE_USE, {
                position = u33:GetPivot().Position
            });
            local u35 = ReplicatedStorage.Assets.Effects.GravestoneBeams:Clone();
            u35.CFrame = u33:GetPivot();
            u35.Parent = Workspace;

            for _, child in u35:GetChildren() do
                if child:IsA("Beam") then
                    child.Attachment0 = u33.Root.GravestoneModel.Gravestone.BeamAttachment;
                    local LeftHand = u32.Character:WaitForChild("LeftHand", 3);

                    if LeftHand ~= nil then
                        LeftHand = LeftHand:WaitForChild("LeftGripAttachment", 3);
                    end;

                    child.Attachment1 = LeftHand;
                    child.Enabled = true;
                end;
            end;

            AnimationUtil:playAnimation(u32, GameAnimationUtil:getAssetId(AnimationType.USE_GRAVESTONE), {
                looped = false
            });
            task.delay(BalanceFile.NECROMANCER_CLAIM_SKELETON_EFFECT_DURATION, function() -- Line: 206
                -- upvalues: u35 (copy)
                u35:Destroy();
            end);
        end;
    end);
end;

function u6.lowerGravestone(u36, u37, u38) -- Line: 212
    -- upvalues: BalanceFile (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), TweenService (copy)
    local NECROMANCER_CLAIM_SKELETON_EFFECT_DURATION = BalanceFile.NECROMANCER_CLAIM_SKELETON_EFFECT_DURATION;
    local PrimaryPart = u37.PrimaryPart;

    if PrimaryPart == nil then
        local function _(p39) -- Line: 217
            return p39:IsA("BasePart");
        end;

        PrimaryPart = nil;

        for i, descendant in u37:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") == true then
                PrimaryPart = descendant;
                break;
            end;
        end;
    end;

    SoundManager:playSound(GameSound.GRAVESTONE_LOWER, {
        position = PrimaryPart.Position
    });
    task.spawn(function() -- Line: 235
        -- upvalues: NECROMANCER_CLAIM_SKELETON_EFFECT_DURATION (copy), u37 (copy), ReplicatedStorage (ref), Workspace (ref), TweenService (ref), u36 (copy), u38 (copy)
        local u40 = TweenInfo.new(NECROMANCER_CLAIM_SKELETON_EFFECT_DURATION, Enum.EasingStyle.Exponential, Enum.EasingDirection.In);

        for _, descendant in u37:GetDescendants() do
            task.spawn(function() -- Line: 238
                -- upvalues: ReplicatedStorage (ref), Workspace (ref), u37 (ref)
                local v41 = ReplicatedStorage.Assets.Effects.GravestoneLower:Clone();
                v41.Parent = Workspace;
                v41:PivotTo(u37:GetPivot() - Vector3.new(0, 3, 0));
                v41:WaitForChild("Bits"):Emit(10);
                task.wait(1);
                v41:Destroy();
            end);
            task.spawn(function() -- Line: 250
                -- upvalues: descendant (copy), TweenService (ref), u40 (copy)
                if descendant:IsA("BasePart") then
                    TweenService:Create(descendant, u40, {
                        CFrame = descendant:GetPivot() - Vector3.new(0, 5, 0)
                    }):Play();
                end;
            end);
        end;

        task.wait(NECROMANCER_CLAIM_SKELETON_EFFECT_DURATION);
        u37:Destroy();
        u36.gravestoneSecretsMap[u38] = nil;
    end);
end;

function u6.onKitLocalDeactivated(p42) -- Line: 270
end;

function u6.onKitReplicationActivated(p43, p44) -- Line: 272
end;

function u6.onKitReplicationDeactivated(p45) -- Line: 274
end;

function u6.onInnateAbilityEnabled(p46, p47, p48) -- Line: 276
end;

function u6.onAbilityUsed(p49, p50, p51) -- Line: 278
end;

function u6.newTarget(p52, p53) -- Line: 280
    -- upvalues: u3 (copy), ColorUtil (copy)
    if not p53 then
        local targetIcon = p52.targetIcon;

        if targetIcon ~= nil then
            targetIcon:Destroy();
        end;

        p52.targetIcon = nil;

        return nil;
    end;

    if p52.targetIcon then
        p52.targetIcon.Parent = p53;

        return;
    end;

    p52.targetIcon = u3("BillboardGui", {
        ResetOnSpawn = false,
        AlwaysOnTop = true,
        Parent = p53.PrimaryPart,
        Size = UDim2.fromScale(3, 3),
        Children = { u3("ImageLabel", {
                ImageTransparency = 0.25,
                BackgroundTransparency = 1,
                Image = "rbxassetid://71410359692884",
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.new(1.5, 0, 1.5, 0),
                ImageColor3 = ColorUtil.WHITE
            }) }
    });
end;

KnitClient.CreateController(u6.new());

return nil;