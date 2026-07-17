-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local ConstantManager = v1.ConstantManager;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local Linear = v3.Linear;
local OutQuad = v3.OutQuad;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Debris = v6.Debris;
local Players = v6.Players;
local TweenService = v6.TweenService;
local Workspace = v6.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local SwordShieldKitBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "sword-shield-kit-balance").SwordShieldKitBalance;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local getPlayerBestBaseSword = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-melees").getPlayerBestBaseSword;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SharedSyncEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u7 = ConstantManager.registerConstants(script, {
    velX = 5,
    velY = 9,
    velZ = 5,
    gravityDamage = 0.9,
    gravityHeal = 0.98,
    textSize = 28,
    blowUpCompleteDuration = 0.05,
    blowUpDuration = 0.125,
    blowUpSize = 76,
    anchoredDuration = 0.4,
    strokeThickness = 1.5
});
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 53, Name: __tostring
        return "SwordShieldController";
    end,

    __index = HandKnitController
});
u8.__index = u8;

function u8.new(...) -- Line: 59
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 63
    -- upvalues: HandKnitController (copy), u4 (copy)
    HandKnitController.constructor(p10);
    p10.Name = "SwordShieldController";
    p10.shieldCooldownList = {};
    p10.shieldMap = {};
    p10.animationMaid = u4.new();
end;

function u8.KnitStart(u11) -- Line: 70
    -- upvalues: HandKnitController (copy), SharedSyncEvents (copy), Players (copy), SwordShieldKitBalance (copy), getItemMeta (copy), default2 (copy)
    HandKnitController.KnitStart(u11);
    SharedSyncEvents.HandItemRendered:connect(function(p12) -- Line: 72
        -- upvalues: Players (ref), SwordShieldKitBalance (ref), getItemMeta (ref), u11 (copy)
        local v13 = Players:GetPlayerFromCharacter(p12.entity);

        if not v13 then
            return nil;
        end;

        if table.find(SwordShieldKitBalance.SwordsToExclude, p12.itemType) ~= nil or not getItemMeta(p12.itemType).sword then
            u11:removeShield(v13);

            return nil;
        end;

        u11:equipShield(v13);
    end);
    default2.Client:Get("ShieldBreak"):Connect(function(p14) -- Line: 89
        -- upvalues: u11 (copy), Players (ref)
        u11:breakShield(p14.player);

        if p14.attacker == Players.LocalPlayer then
            local Character = p14.player.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;

                if Character ~= nil then
                    Character = Character.Position;
                end;
            end;

            if not Character then
                return nil;
            end;

            u11:spawnDamageIndicator(Character, p14.amountBlocked);
        end;
    end);
    default2.Client:Get("EntityDeathEvent"):Connect(function(p15) -- Line: 106
        -- upvalues: Players (ref), u11 (copy)
        local v16 = Players:GetPlayerFromCharacter(p15.entityInstance);

        if not v16 then
            return nil;
        end;

        u11:removeShield(v16);

        if u11.shieldCooldownList[v16] ~= nil then
            u11.shieldCooldownList[v16] = nil;
        end;
    end);
end;

function u8.isRelevantMatchState(p17) -- Line: 117
    -- upvalues: KnitClient2 (copy), MatchState (copy)
    return KnitClient2.Controllers.MatchController:getMatchState() ~= MatchState.PRE;
end;

function u8.isRelevantKit(p18, p19) -- Line: 120
    -- upvalues: isUsingKit (copy), BedwarsKit (copy)
    return isUsingKit(p19, BedwarsKit.SWORD_SHIELD);
end;

function u8.isRelevantItem(p20, p21) -- Line: 123
    -- upvalues: SwordShieldKitBalance (copy), getItemMeta (copy)
    local v22 = table.find(SwordShieldKitBalance.SwordsToExclude, p21.itemType) == nil and getItemMeta(p21.itemType).sword ~= nil;

    return v22;
end;

function u8.onEnable(p23, p24, p25) -- Line: 132
    -- upvalues: Players (copy)
    p23:equipShield(Players.LocalPlayer);
end;

function u8.onDisable(p26) -- Line: 135
    -- upvalues: Players (copy)
    p26:cleanUpAnimation();
    p26:removeShield(Players.LocalPlayer);
end;

function u8.equipShield(u27, u28) -- Line: 139
    -- upvalues: Players (copy), EntityUtil (copy), SwordShieldKitBalance (copy), getItemMeta (copy), getPlayerBestBaseSword (copy), ItemType (copy), WeldUtil (copy), SoundManager (copy)
    if not u27:isRelevantMatchState() then
        return nil;
    end;

    if not u27:isRelevantKit(u28) then
        return nil;
    end;

    if u27.shieldCooldownList[u28] ~= nil then
        return nil;
    end;

    if u28 == Players.LocalPlayer then
        u27:setUpAnimation();
    end;

    local v29 = EntityUtil:getEntity(u28);

    if not v29 then
        return nil;
    end;

    local Character = u28.Character;

    if not Character then
        return nil;
    end;

    local v30 = v29:getHandItemInstanceFromCharacter();

    if not v30 then
        return nil;
    end;

    local Name = v30.Name;

    if table.find(SwordShieldKitBalance.SwordsToExclude, Name) ~= nil then
        return nil;
    end;

    if not getItemMeta(Name).sword then
        return nil;
    end;

    local v31 = getPlayerBestBaseSword(u28);

    if v31 == nil then
        v31 = SwordShieldKitBalance.getEquivalentNormalSwordFromSpecialSword(Name);
    end;

    if v31 == nil then
        return nil;
    end;

    local v32;

    if v31 then
        v32 = SwordShieldKitBalance.ShieldMap[v31];

        if v32 ~= nil then
            v32 = v32.Name;
        end;
    else
        v32 = SwordShieldKitBalance.ShieldMap[ItemType.WOOD_SWORD];

        if v32 ~= nil then
            v32 = v32.Name;
        end;
    end;

    if v32 == nil then
        return nil;
    end;

    local v33 = u27.shieldMap[u28];

    if v33 ~= nil then
        if v33.Name == v32 then
            return nil;
        end;

        v33:Destroy();
        u27.shieldMap[u28] = nil;
    end;

    local u34;

    if v31 then
        u34 = SwordShieldKitBalance.ShieldMap[v31];

        if u34 ~= nil then
            u34 = u34:Clone();
        end;
    else
        u34 = SwordShieldKitBalance.ShieldMap[ItemType.WOOD_SWORD];

        if u34 ~= nil then
            u34 = u34:Clone();
        end;
    end;

    if not u34 then
        return nil;
    end;

    u34.Parent = Character;
    WeldUtil:weldCharacterAccessories(Character);
    u27.shieldMap[u28] = u34;
    v30.Destroying:Connect(function() -- Line: 246
        -- upvalues: u34 (copy), u27 (copy), u28 (copy)
        local v35 = u34;

        if v35 ~= nil then
            v35:Destroy();
        end;

        u27.shieldMap[u28] = nil;
    end);

    if u28 == Players.LocalPlayer then
        local v36 = SwordShieldKitBalance.ShieldSounds[u34.Name];

        if v36 ~= nil then
            v36 = v36[2];
        end;

        if v36 ~= "" and v36 then
            SoundManager:playSound(v36, {
                parent = Character.PrimaryPart
            });
        end;
    end;
end;

function u8.breakShield(u37, u38) -- Line: 270
    -- upvalues: Players (copy), Workspace (copy), SwordShieldKitBalance (copy), SoundManager (copy), ClientSyncEvents (copy)
    if u38 == Players.LocalPlayer then
        u37:cleanUpAnimation();
    end;

    local u39 = u37.shieldMap[u38];

    if not u39 then
        return nil;
    end;

    local Name = u39.Name;
    u39.Parent = Workspace;
    task.spawn(function() -- Line: 282
        -- upvalues: u39 (copy)
        u39.Handle.Full:Destroy();
        u39.Handle.Transparency = 1;
    end);
    task.spawn(function() -- Line: 286
        -- upvalues: u39 (copy)
        local Broken = u39.Handle.Broken;

        if Broken ~= nil then
            local function _(p40) -- Line: 290
                if p40:IsA("WeldConstraint") then
                    p40:Destroy();
                end;

                if p40:IsA("MeshPart") then
                    p40.CanCollide = true;
                    p40.Massless = true;
                    p40.CollisionGroup = "Players";
                end;
            end;

            for i, descendant in Broken:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("WeldConstraint") then
                    descendant:Destroy();
                end;

                if descendant:IsA("MeshPart") then
                    descendant.CanCollide = true;
                    descendant.Massless = true;
                    descendant.CollisionGroup = "Players";
                end;
            end;
        end;
    end);
    local Character = u38.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if Character then
        local v41 = SwordShieldKitBalance.ShieldSounds[Name];

        if v41 ~= nil then
            v41 = v41[1];
        end;

        if v41 ~= "" and v41 then
            SoundManager:playSound(v41, {
                position = Character
            });
        end;
    end;

    u37.shieldCooldownList[u38] = true;
    task.delay(3, function() -- Line: 328
        -- upvalues: u39 (copy)
        u39:Destroy();
    end);
    u37.shieldMap[u38] = nil;
    local cooldown = ClientSyncEvents.AbilityCooldownModifierCheck:fire(SwordShieldKitBalance.ShieldCooldown).cooldown;
    task.delay(cooldown, function() -- Line: 335
        -- upvalues: u37 (copy), u38 (copy)
        u37.shieldCooldownList[u38] = nil;
        u37:equipShield(u38);
    end);
end;

function u8.setUpAnimation(u42) -- Line: 367
    -- upvalues: Players (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local LocalPlayer = Players.LocalPlayer;
    local Character = LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    local Humanoid = Character.Humanoid;
    local u43 = false;
    local u44 = AnimationUtil:playAnimation(LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.SHIELD_SWORD_IDLE));
    u42.animationMaid:GiveTask(function() -- Line: 377
        -- upvalues: u44 (ref)
        local v45 = u44;

        if v45 ~= nil then
            v45:Stop();
        end;

        local v46 = u44;

        if v46 ~= nil then
            v46:Destroy();
        end;
    end);
    u42.animationMaid:GiveTask(Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function() -- Line: 387
        -- upvalues: Humanoid (copy), u43 (ref), u42 (copy), LocalPlayer (copy), u44 (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        if Humanoid.MoveDirection.Magnitude > 0 and (Humanoid:GetState() == Enum.HumanoidStateType.Running and (not u43 and u42.shieldCooldownList[LocalPlayer] == nil)) then
            local v47 = u44;

            if v47 ~= nil then
                v47:Stop();
            end;

            local v48 = u44;

            if v48 ~= nil then
                v48:Destroy();
            end;

            u44 = AnimationUtil:playAnimation(LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.SHIELD_SWORD_WALKING));
            u43 = true;
        end;

        if Humanoid.MoveDirection.Magnitude == 0 and (Humanoid:GetState() == Enum.HumanoidStateType.Running and u42.shieldCooldownList[LocalPlayer] == nil) then
            u43 = false;
            local v49 = u44;

            if v49 ~= nil then
                v49:Stop();
            end;

            local v50 = u44;

            if v50 ~= nil then
                v50:Destroy();
            end;

            u43 = false;
            u44 = AnimationUtil:playAnimation(LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.SHIELD_SWORD_IDLE));
        end;
    end));
end;

function u8.cleanUpAnimation(p51) -- Line: 415
    p51.animationMaid:DoCleaning();
end;

function u8.spawnDamageIndicator(p52, p53, p54) -- Line: 418
    -- upvalues: Workspace (copy), u7 (copy), u5 (copy), default (copy), Linear (copy), TweenService (copy), RuntimeLib (copy), OutQuad (copy), Debris (copy)
    if (Workspace.CurrentCamera.CFrame.Position - p53).Magnitude > 200 then
        return nil;
    end;

    local Part = Instance.new("Part");
    Part.Name = "DamageIndicatorPart";
    Part.Size = Vector3.new(1, 1, 1);
    Part.Transparency = 1;
    Part.CanCollide = false;
    Part.CanQuery = false;
    Part.CFrame = CFrame.new(p53);
    Part:SetAttribute("FirstPersonVisible", false);
    Part.Anchored = true;
    task.delay(u7.anchoredDuration, function() -- Line: 433
        -- upvalues: Part (copy)
        Part.Anchored = false;
    end);
    local BodyForce = Instance.new("BodyForce");
    local gravityHeal = u7.gravityHeal;
    local v55 = Part:GetMass() * Workspace.Gravity * gravityHeal;
    BodyForce.Force = Vector3.new(0, v55, 0);
    BodyForce.Parent = Part;
    local v56 = math.random(-50, 50) / 100 * u7.velX;
    local v57 = math.random(-50, 50) / 100 * u7.velZ;
    Part.Velocity = Vector3.new(v56, 0, v57);
    local BillboardGui = Instance.new("BillboardGui");
    BillboardGui.Size = UDim2.new(5.88, 0, 2.8, 0);
    BillboardGui.AlwaysOnTop = true;
    BillboardGui.MaxDistance = 100;
    local u58 = u5("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Parent = BillboardGui
    });
    local TextLabel = Instance.new("TextLabel");
    TextLabel.Name = "DamageIndicatorTextLabel";
    TextLabel.Text = "Blocked (" .. tostring(p54) .. ")";
    TextLabel.Size = UDim2.new(0.5, 0, 1, 0);
    TextLabel.BackgroundTransparency = 1;
    TextLabel.BorderSizePixel = 0;
    TextLabel.Font = Enum.Font.GothamBlack;
    TextLabel.Position = UDim2.fromScale(0.5, 0.5);
    TextLabel.AnchorPoint = Vector2.new(0, 0.5);
    TextLabel.TextSize = 25;
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
    TextLabel.TextColor3 = Color3.fromRGB(209, 209, 209);
    TextLabel:SetAttribute("FirstPersonVisible", false);
    local v59 = u5("UIStroke", {
        Parent = TextLabel,
        Thickness = u7.strokeThickness,
        Color = Color3.fromRGB(0, 0, 0)
    });
    TextLabel.Parent = u58;
    BillboardGui.Parent = Part;
    Part.Parent = Workspace;
    task.spawn(function() -- Line: 476
        -- upvalues: TextLabel (copy), u58 (copy), u7 (ref), default (ref), Linear (ref)
        local TextSize = TextLabel.TextSize;
        local Size = u58.Size;

        local function _(p60, p61) -- Line: 479
            return UDim2.new(p60.X.Scale * p61, p60.X.Offset * p61, p60.Y.Scale * p61, p60.Y.Offset * p61);
        end;

        local u62 = u7.blowUpSize / TextSize;
        local v69 = default(u7.blowUpDuration, Linear, function(p63) -- Line: 483
            -- upvalues: TextLabel (ref), TextSize (ref), u7 (ref), Size (ref), u62 (copy), u58 (ref)
            TextLabel.TextSize = TextSize * (1 - p63) + p63 * u7.blowUpSize;
            local v64 = Size;
            local v65 = 1 - p63;
            local v66 = UDim2.new(v64.X.Scale * v65, v64.X.Offset * v65, v64.Y.Scale * v65, v64.Y.Offset * v65);
            local v67 = Size;
            local v68 = p63 * u62;
            u58.Size = v66 + UDim2.new(v67.X.Scale * v68, v67.X.Offset * v68, v67.Y.Scale * v68, v67.Y.Offset * v68);
        end, 0, 1);
        v69:Play();
        v69:Wait();
        TextSize = TextLabel.TextSize;
        Size = u58.Size;
        local u70 = u7.textSize / TextSize;
        default(u7.blowUpCompleteDuration, Linear, function(p71) -- Line: 494
            -- upvalues: TextLabel (ref), TextSize (ref), u7 (ref), Size (ref), u70 (copy), u58 (ref)
            TextLabel.TextSize = TextSize * (1 - p71) + p71 * u7.textSize;
            local v72 = Size;
            local v73 = 1 - p71;
            local v74 = UDim2.new(v72.X.Scale * v73, v72.X.Offset * v73, v72.Y.Scale * v73, v72.Y.Offset * v73);
            local v75 = Size;
            local v76 = p71 * u70;
            u58.Size = v74 + UDim2.new(v75.X.Scale * v76, v75.X.Offset * v76, v75.Y.Scale * v76, v75.Y.Offset * v76);
        end, 0, 1):Play();
    end);
    local u77 = TweenService:Create(v59, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Transparency = 1
    });
    RuntimeLib.Promise.delay(u7.anchoredDuration + 0.3):andThen(function() -- Line: 507
        -- upvalues: default (ref), OutQuad (ref), TextLabel (copy), u77 (copy)
        default(0.2, OutQuad, function(p78) -- Line: 508
            -- upvalues: TextLabel (ref)
            TextLabel.TextTransparency = p78;
        end, 0, 1);
        u77:Play();
    end);
    Debris:AddItem(Part, 0.5);
end;

function u8.removeShield(p79, p80) -- Line: 516
    local v81 = p79.shieldMap[p80];

    if not v81 then
        return nil;
    end;

    v81:Destroy();
    p79.shieldMap[p80] = nil;
end;

KnitClient.CreateController(u8.new());

return nil;