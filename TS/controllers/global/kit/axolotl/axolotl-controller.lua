-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CollectionTagAdded = v1.CollectionTagAdded;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local AxolotlKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "axolotl", "axolotl-kit").AxolotlKit;
local AxolotlState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "axolotl", "axolotl-state").AxolotlState;
local AxolotlType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "axolotl", "axolotl-type").AxolotlType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 35, Name: __tostring
        return "AxolotlController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 41
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 45
    -- upvalues: KnitController (copy), u3 (copy), Workspace (copy)
    KnitController.constructor(p7);
    p7.Name = "AxolotlController";
    p7.axolotlModelFolder = u3("Folder", {
        Name = "AxolotlModel",
        Parent = Workspace
    });
end;

function u5.KnitStart(u8) -- Line: 53
    -- upvalues: KnitController (copy), PlaceUtil (copy), Workspace (copy), u3 (copy), CollectionTagAdded (copy)
    KnitController.KnitStart(u8);

    if PlaceUtil.isGameServer() then
        u8.axolotlDataFolder = Workspace:WaitForChild("AxolotlData");
    else
        u8.axolotlDataFolder = u3("Folder", {
            Name = "AxolotlData",
            Parent = Workspace
        });
    end;

    CollectionTagAdded("axolotl_data", function(p9) -- Line: 63
        -- upvalues: u8 (copy)
        u8:createAxolotlModel(p9);
    end);
    CollectionTagAdded("axolotl_model", function(p10) -- Line: 66
    end);
end;

function u5.createAxolotlModel(u11, u12) -- Line: 68
    -- upvalues: u2 (copy), BedwarsKitSkin (copy), ReplicatedStorage (copy), AxolotlType (copy), BedwarsKitSkinMeta (copy), u3 (copy), CollectionService (copy), AnimationType (copy), GameAnimationUtil (copy), AxolotlState (copy), TweenService (copy), GameSound (copy), SoundManager (copy), GameQueryUtil (copy), RunService (copy), AxolotlKit (copy)
    u12:WaitForChild("AttachedTo");
    u12:WaitForChild("AxolotlModel");
    u12:WaitForChild("Owner");
    local Value = u12.AxolotlModel.Value;

    if Value and Value.Parent then
        return Value;
    end;

    local u13 = u12:GetAttribute("AxolotlSkin");

    if u12.Parent == nil then
        return nil;
    end;

    u12:GetAttribute("RandomFloat");
    local u14 = u12:GetAttribute("AxolotlType");
    local u15 = u2.new();
    u12.AncestryChanged:Connect(function(p16, p17) -- Line: 84
        -- upvalues: u15 (copy)
        if p17 == nil then
            u15:DoCleaning();
        end;
    end);
    local u18;

    if u13 == BedwarsKitSkin.AXOLOTL_REINDEER then
        u18 = ReplicatedStorage.Assets.Misc.Axolotl.ReindeerAxolotl:Clone();
    elseif u13 == BedwarsKitSkin.AXOLOTL_EASTER_BUNNY then
        if u14 == AxolotlType.BREAK_SPEED then
            u18 = ReplicatedStorage.Assets.Misc.AxolotlEaster.BreakSpeedAxolotl:Clone();
        elseif u14 == AxolotlType.DAMAGE then
            u18 = ReplicatedStorage.Assets.Misc.AxolotlEaster.DamageAxolotl:Clone();
        elseif u14 == AxolotlType.HEALTH_REGEN then
            u18 = ReplicatedStorage.Assets.Misc.AxolotlEaster.HealthRegenAxolotl:Clone();
        else
            local _ = u14 == AxolotlType.SHIELD;
            u18 = ReplicatedStorage.Assets.Misc.AxolotlEaster.ShieldAxolotl:Clone();
        end;
    elseif u13 and BedwarsKitSkinMeta[u13].amy then
        local amy = BedwarsKitSkinMeta[u13].amy;

        if u14 == AxolotlType.BREAK_SPEED then
            u18 = amy.breakAxolotl:Clone();

            if amy.applyVariantAxolotlTextures then
                u18.gills_mesh.TextureID = "rbxassetid://7773885647";
                u18.torso_mesh.TextureID = "rbxassetid://7773885647";
                u18.mouth_mesh.TextureID = "rbxassetid://7773885647";
                u18.legs_mesh.TextureID = "rbxassetid://7773885647";
                u18.eye_lids_mesh.Color = Color3.fromRGB(124, 124, 124);
            end;
        elseif u14 == AxolotlType.DAMAGE then
            u18 = amy.damageAxolotl:Clone();

            if amy.applyVariantAxolotlTextures then
                u18.gills_mesh.TextureID = "rbxassetid://7773885833";
                u18.torso_mesh.TextureID = "rbxassetid://7773885833";
                u18.mouth_mesh.TextureID = "rbxassetid://7773885833";
                u18.legs_mesh.TextureID = "rbxassetid://7773885833";
                u18.eye_lids_mesh.Color = Color3.fromRGB(255, 95, 55);
            end;
        elseif u14 == AxolotlType.HEALTH_REGEN then
            u18 = amy.healthRegenAxolotl:Clone();

            if amy.applyVariantAxolotlTextures then
                u18.gills_mesh.TextureID = "rbxassetid://7774076826";
                u18.torso_mesh.TextureID = "rbxassetid://7774076826";
                u18.mouth_mesh.TextureID = "rbxassetid://7774076826";
                u18.legs_mesh.TextureID = "rbxassetid://7774076826";
                u18.eye_lids_mesh.Color = Color3.fromRGB(255, 57, 202);
            end;
        elseif u14 == AxolotlType.SHIELD then
            u18 = amy.shieldAxolotl:Clone();

            if amy.applyVariantAxolotlTextures then
                u18.gills_mesh.TextureID = "rbxassetid://7773886109";
                u18.torso_mesh.TextureID = "rbxassetid://7773886109";
                u18.mouth_mesh.TextureID = "rbxassetid://7773886109";
                u18.legs_mesh.TextureID = "rbxassetid://7773886109";
                u18.eye_lids_mesh.Color = Color3.fromRGB(58, 101, 255);
            end;
        else
            u18 = amy.shieldAxolotl:Clone();

            if amy.applyVariantAxolotlTextures then
                u18.gills_mesh.TextureID = "rbxassetid://7773886109";
                u18.torso_mesh.TextureID = "rbxassetid://7773886109";
                u18.mouth_mesh.TextureID = "rbxassetid://7773886109";
                u18.legs_mesh.TextureID = "rbxassetid://7773886109";
                u18.eye_lids_mesh.Color = Color3.fromRGB(58, 101, 255);
            end;
        end;
    elseif u14 == AxolotlType.BREAK_SPEED then
        u18 = ReplicatedStorage.Assets.Misc.Axolotl.BreakSpeedAxolotl:Clone();
    elseif u14 == AxolotlType.DAMAGE then
        u18 = ReplicatedStorage.Assets.Misc.Axolotl.DamageAxolotl:Clone();
    elseif u14 == AxolotlType.HEALTH_REGEN then
        u18 = ReplicatedStorage.Assets.Misc.Axolotl.HealthRegenAxolotl:Clone();
    else
        local _ = u14 == AxolotlType.SHIELD;
        u18 = ReplicatedStorage.Assets.Misc.Axolotl.ShieldAxolotl:Clone();
    end;

    local function _(p19) -- Line: 191
        if p19:IsA("BasePart") then
            p19.CastShadow = false;
        end;
    end;

    for i, descendant in u18:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CastShadow = false;
        end;
    end;

    u3("ObjectValue", {
        Name = "AxolotlData",
        Value = u12,
        Parent = u18
    });
    u12.AxolotlModel.Value = u18;
    u18.Parent = u11.axolotlModelFolder;
    CollectionService:AddTag(u18, "axolotl_model");
    u15:GiveTask(function() -- Line: 207
        -- upvalues: u12 (copy), u18 (ref)
        if u12.Parent and u12.AxolotlModel.Value == u18 then
            u12.AxolotlModel.Value = nil;
        end;

        u18:Destroy();
    end);
    u15:GiveTask(u18.AncestryChanged:Connect(function(p20, p21) -- Line: 213
        -- upvalues: u12 (copy), u11 (copy)
        if p21 == nil and u12.Parent then
            task.defer(function() -- Line: 215
                -- upvalues: u11 (ref), u12 (ref)
                return u11:createAxolotlModel(u12);
            end);
        end;
    end));
    local Animator = u18.AnimationController.Animator;
    u15:GiveTask(function() -- Line: 221
        -- upvalues: u18 (ref)
        u18:Destroy();
    end);

    local function _(p22) -- Line: 225
        -- upvalues: u15 (copy)
        if p22:IsA("BasePart") then
            u15:GiveTask(p22.AncestryChanged:Connect(function(p23, p24) -- Line: 227
                -- upvalues: u15 (ref)
                if p24 == nil then
                    u15:DoCleaning();
                end;
            end));
        end;
    end;

    for i, descendant in u18:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            u15:GiveTask(descendant.AncestryChanged:Connect(function(p25, p26) -- Line: 227
                -- upvalues: u15 (copy)
                if p26 == nil then
                    u15:DoCleaning();
                end;
            end));
        end;
    end;

    local AXOLOTL_IDLE = AnimationType.AXOLOTL_IDLE;
    local AXOLOTL_SWIM = AnimationType.AXOLOTL_SWIM;
    local AXOLOTL_ABILITY = AnimationType.AXOLOTL_ABILITY;

    if u13 == BedwarsKitSkin.AXOLOTL_REINDEER then
        AXOLOTL_IDLE = AnimationType.AXOLOTL_REINDEER_IDLE;
        AXOLOTL_SWIM = AnimationType.AXOLOTL_REINDEER_SWIM;
        AXOLOTL_ABILITY = AnimationType.AXOLOTL_REINDEER_ABILITY;
    elseif u13 == BedwarsKitSkin.AXOLOTL_EASTER_BUNNY then
        AXOLOTL_IDLE = AnimationType.AXOLOTL_EASTER_IDLE;
        AXOLOTL_SWIM = AnimationType.AXOLOTL_EASTER_SWIM;
        AXOLOTL_ABILITY = AnimationType.AXOLOTL_EASTER_ABILITY;
    end;

    local u27 = nil;
    local u28 = nil;
    local u29;

    if AXOLOTL_IDLE then
        u29 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AXOLOTL_IDLE));
        u29.Priority = Enum.AnimationPriority.Movement;
    else
        u29 = nil;
    end;

    if AXOLOTL_SWIM then
        u27 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AXOLOTL_SWIM));
        u27.Priority = Enum.AnimationPriority.Movement;
        u27:AdjustSpeed(2);
    end;

    if AXOLOTL_ABILITY then
        u28 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AXOLOTL_ABILITY));
        u28.Priority = Enum.AnimationPriority.Action;
    end;

    local u30 = 0;
    local PrimaryPart = u18.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.CFrame;
    end;

    if PrimaryPart == nil then
        PrimaryPart = CFrame.new();
    end;

    local u31 = PrimaryPart;
    local u32 = 0;
    local u33 = u13 == BedwarsKitSkin.AXOLOTL_EASTER_BUNNY and "egg" or "torso.001";
    local u34 = u12:GetAttribute("AxolotlState");
    local u35 = u2.new();

    local function u53(p36) -- Line: 283
        -- upvalues: u30 (ref), u34 (ref), u18 (ref), u31 (ref), u35 (copy), AxolotlState (ref), u29 (ref), u27 (ref), u28 (ref), u12 (copy), TweenService (ref), u33 (ref), u3 (ref), u14 (copy), AxolotlType (ref), GameSound (ref), u13 (copy), BedwarsKitSkinMeta (ref), u32 (ref), SoundManager (ref)
        u30 = tick();
        u34 = p36;
        local PrimaryPart2 = u18.PrimaryPart;

        if PrimaryPart2 ~= nil then
            PrimaryPart2 = PrimaryPart2.CFrame;
        end;

        if PrimaryPart2 == nil then
            PrimaryPart2 = CFrame.new();
        end;

        u31 = PrimaryPart2;
        u35:DoCleaning();

        if p36 == AxolotlState.IDLE then
            if u29 then
                u29:Play();
                u29.TimePosition = math.random() * 5;
                u35:GiveTask(function() -- Line: 300
                    -- upvalues: u29 (ref)
                    local v37 = u29;

                    if v37 ~= nil then
                        v37:Stop();
                    end;
                end);
            end;
        elseif p36 == AxolotlState.SWIMMING_TO_ATTACHED then
            local v38 = u27;

            if v38 ~= nil then
                v38:Play();
            end;

            u35:GiveTask(function() -- Line: 312
                -- upvalues: u27 (ref)
                local v39 = u27;

                if v39 ~= nil then
                    v39:Stop();
                end;
            end);
        elseif p36 == AxolotlState.ACTIVE then
            local v40 = u28;

            if v40 ~= nil then
                v40:Play();
            end;

            local v41 = u29;

            if v41 ~= nil then
                v41:Play();
            end;

            if u12.AttachedTo.Value then
                u18.Beam.Attachment1 = u12.AttachedTo.Value.UpperTorso.BodyFrontAttachment;
                u18.Beam.Enabled = true;
                local u42 = true;
                u35:GiveTask(function() -- Line: 332
                    -- upvalues: u42 (ref), u18 (ref)
                    u42 = false;
                    u18.Beam.Enabled = false;
                end);
                task.spawn(function() -- Line: 336
                    -- upvalues: u42 (ref), TweenService (ref), u18 (ref)
                    local v43 = 1;

                    while u42 do
                        local v44 = 0.4 + 0.2 * math.random();
                        local v45 = TweenService:Create(u18.Beam, TweenInfo.new(v44), {
                            CurveSize0 = v43 * -0.3,
                            CurveSize1 = v43 * 0.3
                        });
                        v45:Play();
                        v45.Completed:Wait();
                        v43 = v43 * -1;
                    end;
                end);
            end;

            u35:GiveTask(function() -- Line: 350
                -- upvalues: u29 (ref)
                local v46 = u29;

                if v46 ~= nil then
                    v46:Stop();
                end;
            end);

            local function _(p47) -- Line: 357
                -- upvalues: u33 (ref)
                return p47.Name == u33;
            end;

            local v48 = nil;

            for i, descendant in u18:GetDescendants() do
                local _ = i - 1;

                if descendant.Name == u33 == true then
                    v48 = descendant;
                    break;
                end;
            end;

            local v49 = u3("BillboardGui", {
                LightInfluence = 0,
                MaxDistance = 60,
                StudsOffsetWorldSpace = Vector3.new(0, 2.2, 0),
                Parent = u18.PrimaryPart,
                Adornee = v48,
                Size = UDim2.fromScale(5, 0.55)
            });
            local v50 = u14 == AxolotlType.DAMAGE and "Damage!" or (u14 == AxolotlType.BREAK_SPEED and "Break Speed!" or (u14 == AxolotlType.HEALTH_REGEN and "Health Regen!" or "Shield!"));
            local u51 = u3("TextLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextScaled = true,
                Parent = v49,
                Size = UDim2.fromScale(1, 1),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                Font = Enum.Font.LuckiestGuy,
                Text = v50
            });
            task.spawn(function() -- Line: 397
                -- upvalues: TweenService (ref), u51 (copy)
                task.wait(1.1);
                TweenService:Create(u51, TweenInfo.new(1), {
                    TextTransparency = 1
                }):Play();
            end);
        end;

        local AXOLOTL_SWITCH_TARGETS = GameSound.AXOLOTL_SWITCH_TARGETS;

        if u13 and BedwarsKitSkinMeta[u13].amy then
            AXOLOTL_SWITCH_TARGETS = BedwarsKitSkinMeta[u13].amy.buffSound;
        end;

        if (p36 == AxolotlState.SWIMMING_TO_ATTACHED or p36 == AxolotlState.ACTIVE) and tick() - u32 > 1 then
            u32 = tick();
            local v52 = {};
            local PrimaryPart3 = u18.PrimaryPart;

            if PrimaryPart3 ~= nil then
                PrimaryPart3 = PrimaryPart3.Position;
            end;

            if PrimaryPart3 == nil then
                PrimaryPart3 = Vector3.new();
            end;

            v52.position = PrimaryPart3;
            v52.parent = u18.PrimaryPart;
            SoundManager:playSound(AXOLOTL_SWITCH_TARGETS, v52);
        end;
    end;

    u15:GiveTask(u12:GetAttributeChangedSignal("AxolotlState"):Connect(function() -- Line: 429
        -- upvalues: u53 (copy), u12 (copy)
        u53(u12:GetAttribute("AxolotlState"));
    end));
    u53(u12:GetAttribute("AxolotlState"));
    local Value2 = u12.AttachedTo.Value;
    u12.AttachedTo.Changed:Connect(function() -- Line: 435
        -- upvalues: Value2 (ref), u12 (copy)
        Value2 = u12.AttachedTo.Value;
    end);
    local u54 = u3("Part", {
        Size = Vector3.new(0, 0, 0),
        Transparency = 1,
        CanCollide = false,
        Anchored = true,
        Parent = u18,
        Children = { u3("Attachment", {
                Name = "Attachment"
            }) }
    });
    u18:WaitForChild("Beam");
    u18.Beam.Attachment0 = u54:FindFirstChild("Attachment");
    GameQueryUtil:setQueryIgnored(u54, true);

    local function _(p55) -- Line: 453
        -- upvalues: u33 (ref)
        return p55.Name == u33;
    end;

    local u56 = nil;

    for i, descendant in u18:GetDescendants() do
        local _ = i - 1;

        if descendant.Name == u33 == true then
            u56 = descendant;
            break;
        end;
    end;

    u15:GiveTask(RunService.RenderStepped:Connect(function(p57) -- Line: 466
        -- upvalues: Value2 (ref), u18 (ref), u11 (copy), u14 (copy), u30 (ref), u34 (ref), AxolotlState (ref), u31 (ref), AxolotlKit (ref), u56 (copy), u54 (copy)
        local v58 = Value2;

        if v58 ~= nil then
            v58 = v58.PrimaryPart;
        end;

        if v58 then
            v58 = u18.PrimaryPart;
        end;

        if v58 then
            local v59 = u11:getAngleFromAxolotlType(u14) + tick() % 6 / 6 * -6.283185307179586;
            local v60 = math.cos(v59) * 3.5;
            local v61 = math.sin(v59) * 3.5;
            local v62 = Vector3.new(v60, 0.1, v61);
            local v63 = Value2.PrimaryPart.CFrame + v62;
            local v64 = tick() - u30;

            if u34 == AxolotlState.IDLE then
                u18:PivotTo((u31:Lerp(v63, (math.clamp(v64 / 0.3, 0, 1)))));
            elseif u34 == AxolotlState.SWIMMING_TO_ATTACHED then
                local v65 = u31:Lerp(v63, (math.clamp(v64 / AxolotlKit.SWIM_TO_CHARACTER_TIME, 0, 1)));

                if (v65.Position - v63.Position).Magnitude > 0.01 then
                    v65 = CFrame.new(v65.Position, v63.Position);
                end;

                u18:PivotTo(v65);
            elseif u34 == AxolotlState.ACTIVE then
                u18:PivotTo((u31:Lerp(v63 + Vector3.new(0, 1.8, 0), (math.clamp(v64 / 0.3, 0, 1)))));
            end;

            u54.CFrame = u56.TransformedWorldCFrame;
        end;
    end));

    return u18;
end;

function u5.getAngleFromAxolotlType(p66, p67) -- Line: 516
    -- upvalues: AxolotlType (copy)
    return p67 == AxolotlType.SHIELD and 0 or (p67 == AxolotlType.DAMAGE and 1.5707963267948966 or (p67 == AxolotlType.BREAK_SPEED and 3.141592653589793 or (p67 == AxolotlType.HEALTH_REGEN and 4.71238898038469 or 0)));
end;

function u5.createClientOnlyAxolotlData(p68, p69, p70) -- Line: 530
    -- upvalues: u3 (copy), AxolotlState (copy), CollectionService (copy)
    local v71 = u3("ObjectValue", {
        Name = p69.Name .. "_Axolotl",
        Parent = p68.axolotlDataFolder,
        Children = { u3("ObjectValue", {
                Name = "AxolotlModel"
            }), u3("ObjectValue", {
                Name = "Owner",
                Value = p69
            }), u3("ObjectValue", {
                Name = "AttachedTo",
                Value = p69
            }) }
    });
    v71:SetAttribute("AxolotlState", AxolotlState.IDLE);
    v71:SetAttribute("RandomFloat", math.random());
    v71:SetAttribute("AxolotlType", p70);
    v71:SetAttribute("AxolotlLastActiveTime", 0);
    CollectionService:AddTag(v71, "axolotl_data");

    return v71;
end;

function u5.getAttachedAxolotls(p72, u73) -- Line: 552
    -- upvalues: CollectionService (copy)
    local function _(p74) -- Line: 554
        -- upvalues: u73 (copy)
        return p74.AttachedTo.Value == u73;
    end;

    local v75 = 0;
    local v76 = {};

    for i, v in CollectionService:GetTagged("axolotl_data") do
        local _ = i - 1;

        if v.AttachedTo.Value == u73 == true then
            v75 = v75 + 1;
            v76[v75] = v;
        end;
    end;

    return v76;
end;

function u5.getOwnedAxolotls(p77, u78) -- Line: 569
    -- upvalues: CollectionService (copy)
    local function _(p79) -- Line: 571
        -- upvalues: u78 (copy)
        return p79.Owner.Value == u78;
    end;

    local v80 = 0;
    local v81 = {};

    for i, v in CollectionService:GetTagged("axolotl_data") do
        local _ = i - 1;

        if v.Owner.Value == u78 == true then
            v80 = v80 + 1;
            v81[v80] = v;
        end;
    end;

    return v81;
end;

KnitClient.CreateController(u5.new());

return nil;