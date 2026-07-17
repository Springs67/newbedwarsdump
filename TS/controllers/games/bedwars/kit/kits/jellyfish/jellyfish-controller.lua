-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceType = v1.DeviceType;
local DeviceUtil = v1.DeviceUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local OutQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v6.CollectionService;
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local RunService = v6.RunService;
local TweenService = v6.TweenService;
local Workspace = v6.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "jellyfish", "jellyfish-kit-util");
local EnemyJellyfishColors = v7.EnemyJellyfishColors;
local JellyfishBalance = v7.JellyfishBalance;
local JellyfishParts = v7.JellyfishParts;
local PrismaticJellyfishColors = v7.PrismaticJellyfishColors;
local SelfJellyfishColors = v7.SelfJellyfishColors;
local TeamJellyfishColors = v7.TeamJellyfishColors;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 42, Name: __tostring
        return "JellyfishController";
    end,

    __index = KnitController
});
u8.__index = u8;

function u8.new(...) -- Line: 48
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10, ...) -- Line: 52
    -- upvalues: KnitController (copy), default2 (copy)
    KnitController.constructor(p10, ...);
    p10.Name = "JellyfishController";
    p10.jellyfishMaids = {};
    p10.requestPickUpJellyfishRemote = default2.Client:Get("RequestPickupJellyfish");
end;

function u8.KnitStart(u11) -- Line: 58
    -- upvalues: KnitController (copy), CollectionService (copy), u4 (copy), default (copy), OutQuad (copy), Players (copy), BedwarsKitSkin (copy), KnitClient (copy), GameSound (copy), SoundManager (copy), RandomUtil (copy), RunService (copy), default2 (copy)
    KnitController.KnitStart(u11);
    CollectionService:GetInstanceAddedSignal("jellyfish"):Connect(function(u12) -- Line: 60
        -- upvalues: u4 (ref), u11 (copy), default (ref), OutQuad (ref), Players (ref), BedwarsKitSkin (ref), KnitClient (ref), GameSound (ref), SoundManager (ref), RandomUtil (ref), RunService (ref), default2 (ref)
        local v13 = u4.new();
        u11.jellyfishMaids[u12] = v13;
        u12:WaitForChild("RootPart");
        local v14 = u12:GetChildren();

        local function v17(u15) -- Line: 67
            -- upvalues: default (ref), OutQuad (ref)
            if u15:IsA("MeshPart") then
                u15.LocalTransparencyModifier = 1;
                default(1.5, OutQuad, function(p16) -- Line: 70
                    -- upvalues: u15 (copy)
                    u15.LocalTransparencyModifier = p16;

                    return u15.LocalTransparencyModifier;
                end, 1, 0):Play();
            end;
        end;

        for i, v in v14 do
            v17(v, i - 1, v14);
        end;

        local v18 = Players:GetPlayerByUserId(u12:GetAttribute("PlacedByUserId"));
        local DEFAULT = BedwarsKitSkin.DEFAULT;

        if v18 and v18.Character then
            DEFAULT = KnitClient.Controllers.KitController:getKitSkin(v18.Character);
        end;

        local v19 = { GameSound.JELLYFISH_DEPLOY_1, GameSound.JELLYFISH_DEPLOY_2, GameSound.JELLYFISH_DEPLOY_3 };
        local v20;

        if DEFAULT == BedwarsKitSkin.JELLYFISH_HOLIDAY then
            v20 = { GameSound.HOLIDAY_JELLYFISH_DEPLOY_1, GameSound.HOLIDAY_JELLYFISH_DEPLOY_2, GameSound.HOLIDAY_JELLYFISH_DEPLOY_3 };
        else
            v20 = DEFAULT == BedwarsKitSkin.JELLYFISH_DESSERT and { GameSound.DESSERT_JELLYFISH_DEPLOY_1, GameSound.DESSERT_JELLYFISH_DEPLOY_2, GameSound.DESSERT_JELLYFISH_DEPLOY_3 } or v19;
        end;

        SoundManager:playSound(RandomUtil.fromList(unpack(v20)), {
            position = u12:GetPivot().Position
        });
        local u21 = u11:setUpJellyfishAnimationTracks(u12);
        v13:GiveTask(u21.idle);
        v13:GiveTask(u21.attack);
        v13:GiveTask(u21.spawn);

        if u11:checkPositionForAnimation(u12) then
            u21.spawn:Play();
            u21.spawn.Ended:Connect(function() -- Line: 103
                -- upvalues: u21 (copy)
                u21.idle:Play();
            end);
        end;

        local u22 = 0;
        v13:GiveTask(RunService.Heartbeat:Connect(function(p23) -- Line: 110
            -- upvalues: u22 (ref), u21 (copy), u11 (ref), u12 (copy)
            u22 = u22 + p23;

            if u22 <= 5 then
                return nil;
            end;

            u22 = 0;
            local v24 = u21.idle.IsPlaying or (u21.attack.IsPlaying or u21.spawn.IsPlaying);

            local function _(p25) -- Line: 119
                return p25.IsPlaying;
            end;

            local v26 = nil;

            for i, v in { u21.idle, u21.attack, u21.spawn } do
                local _ = i - 1;

                if v.IsPlaying == true then
                    v26 = v;
                    break;
                end;
            end;

            if u11:checkPositionForAnimation(u12) then
                if not v24 then
                    u21.idle:Play();
                end;
            elseif v26 ~= nil then
                v26:Stop();
            end;
        end));
        local v27 = u11:createMovementConnection(u12);

        if v27 then
            v13:GiveTask(v27);
        end;

        u11:recolorJellyfish(u12);
        v13:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("Team"):Connect(function() -- Line: 153
            -- upvalues: u11 (ref), u12 (copy)
            u11:recolorJellyfish(u12);
        end));
        v13:GiveTask(u12:GetAttributeChangedSignal("Team"):Connect(function() -- Line: 157
            -- upvalues: u11 (ref), u12 (copy)
            u11:recolorJellyfish(u12);
        end));
        default2.Client:OnEvent("JellyfishZapAttack", function(p28) -- Line: 160
            -- upvalues: u12 (copy), u11 (ref), Players (ref), GameSound (ref), DEFAULT (ref), BedwarsKitSkin (ref), SoundManager (ref), RandomUtil (ref), u21 (copy)
            if p28.jellyfishId == u12:GetAttribute("Id") and p28.ownerId == u12:GetAttribute("PlacedByUserId") then
                u11:createLightningBeam(u12, p28.targetEntityInstance);
                u11:createStaticHitEffect(u12, p28.targetEntityInstance);
                local v29 = Players:GetPlayerFromCharacter(p28.targetEntityInstance);

                if v29 ~= nil then
                    local v30 = Players.LocalPlayer == v29;
                    local v31 = { GameSound.JELLYFISH_ZAP_1, GameSound.JELLYFISH_ZAP_2 };
                    local v32;

                    if DEFAULT == BedwarsKitSkin.JELLYFISH_HOLIDAY then
                        v32 = { GameSound.HOLIDAY_JELLYFISH_ZAP_1, GameSound.HOLIDAY_JELLYFISH_ZAP_2 };
                    else
                        v32 = DEFAULT == BedwarsKitSkin.JELLYFISH_DESSERT and { GameSound.DESSERT_JELLYFISH_ZAP_1, GameSound.DESSERT_JELLYFISH_ZAP_2 } or v31;
                    end;

                    local v33 = RandomUtil.fromList(unpack(v32));
                    local v34 = {};
                    local v35;

                    if v30 then
                        v35 = nil;
                    else
                        v35 = u12:GetPivot().Position;
                    end;

                    v34.position = v35;
                    SoundManager:playSound(v33, v34);
                end;

                if u11:checkPositionForAnimation(u12) then
                    u21.attack:Play();
                    u21.attack.Ended:Connect(function() -- Line: 181
                        -- upvalues: u21 (ref)
                        u21.idle:Play();
                    end);
                end;
            end;
        end);
        v13:GiveTask(u12:GetAttributeChangedSignal("State"):Connect(function() -- Line: 187
            -- upvalues: u12 (copy), u11 (ref)
            local v36 = u12:GetAttribute("State");

            if v36 == 0 then
                u12.Tentacles_3.Electric.Enabled = false;

                return;
            end;

            if v36 ~= 1 then
                return;
            end;

            u12.Tentacles_3.Electric.Enabled = true;
            u11:createActivationBeam(u12);
        end));
        v13:GiveTask(u12:GetAttributeChangedSignal("ActivationOrderId"):Connect(function() -- Line: 201
            -- upvalues: u12 (copy), Players (ref), GameSound (ref), DEFAULT (ref), BedwarsKitSkin (ref), SoundManager (ref)
            local v37 = u12:GetAttribute("ActivationOrderId");
            local v38 = u12:GetAttribute("PlacedByUserId") == Players.LocalPlayer.UserId;
            local v39 = {
                GameSound.JELLYFISH_PULSE_2,
                GameSound.JELLYFISH_PULSE_3,
                GameSound.JELLYFISH_PULSE_4,
                GameSound.JELLYFISH_PULSE_5
            };
            local v40;

            if DEFAULT == BedwarsKitSkin.JELLYFISH_HOLIDAY then
                v40 = {
                    GameSound.HOLIDAY_JELLYFISH_PULSE_2,
                    GameSound.HOLIDAY_JELLYFISH_PULSE_3,
                    GameSound.HOLIDAY_JELLYFISH_PULSE_4,
                    GameSound.HOLIDAY_JELLYFISH_PULSE_5
                };
            else
                v40 = DEFAULT == BedwarsKitSkin.JELLYFISH_DESSERT and {
                    GameSound.DESSERT_JELLYFISH_PULSE_2,
                    GameSound.DESSERT_JELLYFISH_PULSE_3,
                    GameSound.DESSERT_JELLYFISH_PULSE_4,
                    GameSound.DESSERT_JELLYFISH_PULSE_5
                } or v39;
            end;

            local v41 = v40[v37 + 1];
            local v42 = {};
            local v43;

            if v38 then
                v43 = nil;
            else
                v43 = u12:GetPivot().Position;
            end;

            v42.position = v43;
            v42.volumeMultiplier = not v38 and 1.2 or 1 - v37 * 0.17;
            SoundManager:playSound(v41, v42);
        end));

        if u12:GetAttribute("PlacedByUserId") == Players.LocalPlayer.UserId then
            task.delay(1.75, function() -- Line: 219
                -- upvalues: u11 (ref), u12 (copy)
                u11:createProximityPrompt(u12);
                u11:createConnectionBeams(u12);
            end);
        end;
    end);
    CollectionService:GetInstanceRemovedSignal("jellyfish"):Connect(function(p44) -- Line: 226
        -- upvalues: u11 (copy)
        local v45 = u11.jellyfishMaids[p44];

        if v45 ~= nil then
            v45:DoCleaning();
        end;

        u11.jellyfishMaids[p44] = nil;
    end);
end;

function u8.checkPositionForAnimation(p46, p47) -- Line: 235
    -- upvalues: Players (copy), DeviceUtil (copy), DeviceType (copy), JellyfishBalance (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:GetPivot().Position;
    end;

    if not Character then
        return false;
    end;

    local v48 = DeviceUtil.guessCurrentDeviceType() == DeviceType.Mobile;

    if v48 then
        return false;
    end;

    local Magnitude = (Character - p47:GetPivot().Position).Magnitude;
    local v49;

    if v48 then
        v49 = JellyfishBalance.JellyfishMobileAnimationDistance;
    else
        v49 = JellyfishBalance.JellyfishAnimationDistance;
    end;

    return Magnitude < v49;
end;

function u8.createConnectionBeams(p50, u51) -- Line: 252
    -- upvalues: CollectionService (copy), Players (copy), JellyfishBalance (copy), KnitClient2 (copy), BedwarsKitSkin (copy), ReplicatedStorage (copy), u4 (copy)
    u51:WaitForChild("RootPart");

    local function _(p52) -- Line: 255
        -- upvalues: Players (ref)
        return p52:GetAttribute("PlacedByUserId") == Players.LocalPlayer.UserId;
    end;

    local v53 = 0;
    local v54 = {};

    for i, v in CollectionService:GetTagged("jellyfish") do
        local _ = i - 1;

        if v:GetAttribute("PlacedByUserId") == Players.LocalPlayer.UserId == true then
            v53 = v53 + 1;
            v54[v53] = v;
        end;
    end;

    local function _(p55) -- Line: 268
        -- upvalues: u51 (copy), JellyfishBalance (ref)
        return (p55:GetAttribute("CenteredPosition") - u51:GetAttribute("CenteredPosition")).Magnitude < JellyfishBalance.MaxReplicationRadius;
    end;

    local v56 = 0;
    local v57 = {};

    for i, v in v54 do
        local _ = i - 1;

        if (v:GetAttribute("CenteredPosition") - u51:GetAttribute("CenteredPosition")).Magnitude < JellyfishBalance.MaxReplicationRadius == true then
            v56 = v56 + 1;
            v57[v56] = v;
        end;
    end;

    local v58 = Players:GetPlayerByUserId((u51:GetAttribute("PlacedByUserId")));
    local v59;

    if v58 then
        v59 = KnitClient2.Controllers.KitSkinController:getKitSkin(v58);
    else
        v59 = BedwarsKitSkin.DEFAULT;
    end;

    local u60 = ReplicatedStorage.Assets.Effects.JellyfishConnectionBeam:Clone();

    if v59 == BedwarsKitSkin.JELLYFISH_DESSERT then
        u60 = ReplicatedStorage.Assets.Effects.JellyfishDessertConnectionBeam:Clone();
    end;

    local function v63(p61) -- Line: 291
        -- upvalues: u4 (ref), u60 (ref), u51 (copy)
        p61:WaitForChild("RootPart");
        local u62 = u4.new();
        u60.Parent = p61.Bell_Under.BeamAttachment;
        u60.Attachment0 = p61.Bell_Under.BeamAttachment;
        u60.Attachment1 = u51.Bell_Under.BeamAttachment;
        u60.Enabled = true;
        p61.Destroying:Connect(function() -- Line: 298
            -- upvalues: u62 (copy)
            u62:DoCleaning();
        end);
        u51.Destroying:Connect(function() -- Line: 301
            -- upvalues: u62 (copy)
            u62:DoCleaning();
        end);
    end;

    for i, v in v57 do
        v63(v, i - 1, v57);
    end;
end;

function u8.createLightningBeam(p64, p65, p66) -- Line: 309
    -- upvalues: Players (copy), KnitClient2 (copy), BedwarsKitSkin (copy), ReplicatedStorage (copy), u5 (copy), TweenService (copy)
    local v67 = Players:GetPlayerByUserId((p65:GetAttribute("PlacedByUserId")));
    local v68;

    if v67 then
        v68 = KnitClient2.Controllers.KitSkinController:getKitSkin(v67);
    else
        v68 = BedwarsKitSkin.DEFAULT;
    end;

    local StaticConnection = ReplicatedStorage.Assets.Effects.StaticConnection;

    if v68 == BedwarsKitSkin.JELLYFISH_DESSERT then
        StaticConnection = ReplicatedStorage.Assets.Effects.JellyfishDessertStaticConnection;
    end;

    local u69 = StaticConnection.Beam1:Clone();
    local u70 = StaticConnection.Beam2:Clone();
    local u71 = StaticConnection.PointLight:Clone();
    local v72 = Players:GetPlayerFromCharacter(p66);
    local u73;

    if v72 then
        u73 = v72.Character;

        if u73 ~= nil then
            u73 = u73:FindFirstChild("UpperTorso");

            if u73 ~= nil then
                u73 = u73:FindFirstChild("BodyFrontAttachment");
            end;
        end;
    else
        u73 = u5("Attachment", {
            Parent = p66:FindFirstChildWhichIsA("Part")
        });
        task.delay(1, function() -- Line: 337
            -- upvalues: u73 (copy)
            u73:Destroy();
        end);
    end;

    if not u73 then
        return nil;
    end;

    u69.Parent = p65;
    u69.Attachment0 = p65.Bell_Under.BeamAttachment;
    u69.Attachment1 = u73;
    u70.Parent = p65;
    u70.Attachment0 = p65.Bell_Under.BeamAttachment;
    u70.Attachment1 = u73;
    u71.Parent = u73;
    task.delay(0.24, function() -- Line: 351
        -- upvalues: TweenService (ref), u69 (copy), u70 (copy), u71 (copy)
        TweenService:Create(u69, TweenInfo.new(0.12), {
            Width0 = 0,
            Width1 = 0
        }):Play();
        TweenService:Create(u70, TweenInfo.new(0.12), {
            Width0 = 0,
            Width1 = 0
        }):Play();
        task.wait(0.12);
        u69:Destroy();
        u70:Destroy();
        u71:Destroy();
    end);
end;

function u8.createStaticHitEffect(p74, p75, p76) -- Line: 366
    -- upvalues: Players (copy), KnitClient2 (copy), BedwarsKitSkin (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    local UpperTorso = p76:FindFirstChild("UpperTorso");

    if not UpperTorso then
        return nil;
    end;

    local v77 = Players:GetPlayerByUserId((p75:GetAttribute("PlacedByUserId")));
    local v78;

    if v77 then
        v78 = KnitClient2.Controllers.KitSkinController:getKitSkin(v77);
    else
        v78 = BedwarsKitSkin.DEFAULT;
    end;

    local u79 = ReplicatedStorage.Assets.Effects.StaticHit:Clone();

    if v78 == BedwarsKitSkin.JELLYFISH_DESSERT then
        u79 = ReplicatedStorage.Assets.Effects.JellyfishDessertStaticHit:Clone();
    end;

    u79.Parent = Workspace;
    u79.Anchored = false;
    u79.CFrame = UpperTorso.CFrame;
    u79.Lightning.Anchored = false;
    u79.Lightning.CFrame = UpperTorso.CFrame;
    EffectUtil:playEffects(u79:GetChildren(), p76);
    task.delay(0.2, function() -- Line: 384
        -- upvalues: u79 (ref)
        u79.Attachment.PointLight.Enabled = false;
    end);
    task.delay(5, function() -- Line: 387
        -- upvalues: u79 (ref)
        u79:Destroy();
    end);
end;

function u8.createActivationBeam(p80, p81) -- Line: 391
    -- upvalues: u4 (copy), Players (copy), KnitClient2 (copy), BedwarsKitSkin (copy), ReplicatedStorage (copy)
    local u82 = u4.new();
    local v83 = Players:GetPlayerByUserId((p81:GetAttribute("PlacedByUserId")));
    local v84;

    if v83 then
        v84 = KnitClient2.Controllers.KitSkinController:getKitSkin(v83);
    else
        v84 = BedwarsKitSkin.DEFAULT;
    end;

    local v85 = ReplicatedStorage.Assets.Effects.JellyfishActivationBeam:Clone();

    if v84 == BedwarsKitSkin.JELLYFISH_DESSERT then
        v85 = ReplicatedStorage.Assets.Effects.JellyfishDessertActivationBeam:Clone();
    end;

    v85.Parent = p81.Bell_Under.BeamAttachment;
    u82:GiveTask(v85);
    p81.Destroying:Connect(function() -- Line: 402
        -- upvalues: u82 (copy)
        u82:DoCleaning();
    end);
    v85.Attachment1 = p81.Bell_Under.BeamAttachment;
    local v86 = p80:getJellyfishOrPlayerById(p81:GetAttribute("ActivatedBy"));

    if v86 == nil then
        u82:DoCleaning();

        return nil;
    end;

    v86.Destroying:Connect(function() -- Line: 411
        -- upvalues: u82 (copy)
        u82:DoCleaning();
    end);

    if v86:IsA("Player") then
        local Character = v86.Character;

        if Character ~= nil then
            Character = Character:FindFirstChild("RightHand");

            if Character ~= nil then
                Character = Character:FindFirstChild("RightGripAttachment");
            end;
        end;

        v85.Attachment0 = Character;
    else
        v85.Attachment0 = v86.Bell_Under.BeamAttachment;
    end;

    v85.Enabled = true;
    task.delay(1, function() -- Line: 429
        -- upvalues: u82 (copy)
        u82:DoCleaning();
    end);
end;

function u8.createProximityPrompt(u87, p88) -- Line: 433
    -- upvalues: u4 (copy), KnitClient2 (copy), EntityDamageEventZap (copy), default2 (copy), Players (copy)
    local u89 = p88:GetAttribute("Id");
    local u90 = u4.new();
    local u91 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
        RequiresLineOfSight = false,
        MaxActivationDistance = 10,
        HoldDuration = 0,
        ActionText = "Pick Up",
        ObjectText = "Jellyfish",
        Parent = p88
    });
    u90:GiveTask(u91);
    local u93 = EntityDamageEventZap.On(function(p92) -- Line: 445
        -- upvalues: u89 (copy), u91 (copy)
        if p92:GetAttribute("Id") == u89 and p92:HasTag("jellyfish") then
            u91.ActionText = "Remove";
        end;
    end);
    u90:GiveTask(function() -- Line: 450
        -- upvalues: u93 (copy)
        u93();
    end);
    default2.Client:WaitFor("EntityDeathEvent"):andThen(function(p94) -- Line: 454
        -- upvalues: u89 (copy), u90 (copy)
        local u95 = nil;
        u95 = p94:Connect(function(p96) -- Line: 456
            -- upvalues: u89 (ref), u90 (ref), u95 (ref)
            if p96.entityInstance:GetAttribute("Id") == u89 and p96.entityInstance:HasTag("jellyfish") then
                u90:DoCleaning();
                u95:Disconnect();
            end;
        end);
        u90:GiveTask(u95);
    end);
    p88.AncestryChanged:Once(function() -- Line: 465
        -- upvalues: u90 (copy)
        u90:DoCleaning();
    end);
    u91.Triggered:Connect(function(p97) -- Line: 468
        -- upvalues: Players (ref), u87 (copy), u89 (copy)
        if p97 == Players.LocalPlayer then
            u87.requestPickUpJellyfishRemote:CallServer(u89);
        end;
    end);
end;

function u8.getJellyfishOrPlayerById(p98, u99) -- Line: 474
    -- upvalues: Players (copy), CollectionService (copy)
    local v100 = Players:GetPlayerByUserId(u99);

    if v100 then
        return v100;
    end;

    local function _(p101) -- Line: 480
        -- upvalues: u99 (copy)
        return p101:GetAttribute("Id") == u99;
    end;

    local v102 = 0;
    local v103 = {};

    for i, v in CollectionService:GetTagged("jellyfish") do
        local _ = i - 1;

        if v:GetAttribute("Id") == u99 == true then
            v102 = v102 + 1;
            v103[v102] = v;
        end;
    end;

    return v103[1];
end;

function u8.recolorJellyfish(u104, u105) -- Line: 496
    -- upvalues: KnitClient (copy), Players (copy), SelfJellyfishColors (copy), TeamJellyfishColors (copy), EnemyJellyfishColors (copy), u3 (copy), JellyfishParts (copy)
    local v106 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

    if v106 ~= nil then
        v106 = v106.id;
    end;

    local v107 = v106 == nil and true or string.find(v106, "spectat");

    if v107 ~= 0 and (v107 == v107 and v107) then
        return nil;
    end;

    local v108 = u105:GetAttribute("Team");
    local u109 = u105:GetAttribute("PlacedByUserId");
    local v110 = v106 == v108;
    local u111;

    if u109 == Players.LocalPlayer.UserId then
        u111 = SelfJellyfishColors;
    elseif v110 then
        u111 = TeamJellyfishColors;
    else
        u111 = EnemyJellyfishColors;
    end;

    local u112 = u3.keys(JellyfishParts);
    task.delay(0, function() -- Line: 512
        -- upvalues: u105 (copy), u112 (copy), u111 (copy), Players (ref), u109 (copy), KnitClient (ref), u104 (copy)
        u105:WaitForChild("RootPart");

        local function _(p113) -- Line: 515
            -- upvalues: u112 (ref), u111 (ref)
            local v114 = p113:IsA("MeshPart") and table.find(u112, p113.Name) ~= nil;

            if v114 then
                p113.Color = u111[p113.Name];
            end;
        end;

        for i, descendant in u105:GetDescendants() do
            local _ = i - 1;
            local v115 = descendant:IsA("MeshPart") and table.find(u112, descendant.Name) ~= nil;

            if v115 then
                descendant.Color = u111[descendant.Name];
            end;
        end;

        local v116 = Players:GetPlayerByUserId(u109);

        if not v116 then
            return nil;
        end;

        if KnitClient.Controllers.JellyfishPrismaticController:isPrismaticSkinEquipped(v116) then
            u104:applyJellyfishPrismaticEffect(u105);
        end;
    end);
end;

function u8.applyJellyfishPrismaticEffect(p117, u118) -- Line: 537
    -- upvalues: u4 (copy), PrismaticJellyfishColors (copy), TweenService (copy)
    local Detail_Ring = u118.Detail_Ring;
    task.spawn(function() -- Line: 539
        -- upvalues: u4 (ref), PrismaticJellyfishColors (ref), Detail_Ring (copy), u118 (copy), TweenService (ref)
        local u119 = u4.new();
        local Color3Value = Instance.new("Color3Value");
        Color3Value.Value = PrismaticJellyfishColors[1];
        u119:GiveTask(Color3Value.Changed:Connect(function(p120) -- Line: 543
            -- upvalues: Detail_Ring (ref)
            Detail_Ring.Color = p120;
        end));
        u118.Destroying:Connect(function() -- Line: 546
            -- upvalues: u119 (copy)
            u119:DoCleaning();
        end);
        u118:GetAttributeChangedSignal("Team"):Connect(function() -- Line: 549
            -- upvalues: u119 (copy)
            u119:DoCleaning();
        end);
        local v121 = 1;

        while Detail_Ring.Parent ~= nil do
            local v122 = TweenService:Create(Color3Value, TweenInfo.new(3), {
                Value = PrismaticJellyfishColors[v121 + 1]
            });
            v122:Play();
            v122.Completed:Wait();
            local v123 = v121 + 1;
            v121 = #PrismaticJellyfishColors <= v123 and 0 or v123;
        end;

        u119:DoCleaning();
    end);
end;

function u8.createMovementConnection(p124, u125) -- Line: 567
    -- upvalues: RunService (copy)
    local u126 = math.random(0, 1) * 2 - 1;
    local u127 = u125:GetAttribute("CenteredPosition");
    local u128 = 0;

    return RunService.Heartbeat:Connect(function(p129) -- Line: 573
        -- upvalues: u128 (ref), u125 (copy), u127 (copy), u126 (copy)
        u128 = u128 + p129;

        if not u125 then
            return nil;
        end;

        local new = CFrame.new;
        local X = u127.X;
        local v130 = u127.Y + math.sin(u128);
        u125:PivotTo(new((Vector3.new(X, v130, u127.Z))) * CFrame.Angles(0, 3.141592653589793 * u128 * 0.17 * u126, 0));
    end);
end;

function u8.setUpJellyfishAnimationTracks(p131, p132) -- Line: 584
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy)
    local AnimationController = Instance.new("AnimationController");
    AnimationController.Parent = p132;
    local Animator = Instance.new("Animator");
    Animator.Parent = AnimationController;

    return {
        spawn = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.JELLYFISH_SPAWN)),
        idle = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.JELLYFISH_MOUNT_IDLE)),
        attack = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.JELLYFISH_ATTACK))
    };
end;

KnitClient.CreateController(u8.new());

return nil;