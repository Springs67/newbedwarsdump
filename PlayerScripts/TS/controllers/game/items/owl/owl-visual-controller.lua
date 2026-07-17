-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local OwlBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "owl-balance-file").OwlBalance;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local OwlStatus = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "owl", "owl-status").OwlStatus;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local OwlUtil = RuntimeLib.import(script, script.Parent, "owl-util").OwlUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "OwlVisualController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 37
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 41
    -- upvalues: KnitController (copy), OwlBalance (copy)
    KnitController.constructor(p6);
    p6.Name = "OwlVisualController";
    p6.defaultSpeed = OwlBalance.OWL_DEFAULT_MOVEMENT_SPEED;
    p6.animationMap = {};
end;

function u4.KnitStart(u7) -- Line: 47
    -- upvalues: KnitController (copy), default (copy), RunService (copy), OwlUtil (copy), Players (copy), OwlBalance (copy), OwlStatus (copy), WatchCollectionTag (copy)
    KnitController.KnitStart(u7);
    default.Client:Get("OwlSummoned"):Connect(function(u8, p9, p10) -- Line: 49
        -- upvalues: u7 (copy)
        u7:createClientOwl(p9, u8, p10);
        task.delay(0.5, function() -- Line: 52
            -- upvalues: u7 (ref), u8 (copy)
            u7:startMeditateAnimation(u8);
        end);
    end);
    default.Client:Get("OwlDeattached"):Connect(function(p11) -- Line: 56
        -- upvalues: u7 (copy)
        u7:removeClientOwl(p11);
        u7:endMeditateAnimation(p11);
    end);
    RunService.Heartbeat:Connect(function(p12) -- Line: 60
        -- upvalues: OwlUtil (ref), Players (ref), u7 (copy), OwlBalance (ref), OwlStatus (ref)
        for i, v in OwlUtil.userOwlMap do
            local v13 = Players:GetPlayerByUserId(i);

            if v13 then
                local v14 = OwlUtil:getOwlTarget(v13);

                if v14 then
                    local Character = v14.Character;

                    if Character ~= nil then
                        Character = Character.PrimaryPart;

                        if Character ~= nil then
                            Character = Character.Position;
                        end;
                    end;

                    if Character then
                        local Character2 = v14.Character;

                        if Character2 ~= nil then
                            Character2 = Character2:FindFirstChild("LeftUpperArm");

                            if Character2 ~= nil then
                                Character2 = Character2:FindFirstChild("LeftShoulderAttachment");
                            end;
                        end;

                        local v15 = Character + Vector3.new(1, 3, 1);
                        local v16 = v:GetAttribute("Interacting");

                        if v16 ~= 0 and (v16 == v16 and (v16 ~= "" and v16)) then
                            v15 = Character2.WorldPosition + Vector3.new(0, 0.5, 0);
                        end;

                        local PrimaryPart = v.PrimaryPart;

                        if PrimaryPart then
                            local v17;

                            if v15 == nil then
                                v17 = v15;
                            else
                                v17 = (v15 - PrimaryPart.Position).Unit;
                            end;

                            if v17 ~= Vector3.new(nil, nil, nil) and (v17 and v15) then
                                local defaultSpeed = u7.defaultSpeed;
                                local v18 = v13:GetAttribute("OwlAiming");

                                if v18 ~= 0 and (v18 == v18 and (v18 ~= "" and v18)) then
                                    defaultSpeed = OwlBalance.OWL_AIMING_MOVEMENT_SPEED;
                                end;

                                if v:GetAttribute("Status") == OwlStatus.LIFTING then
                                    defaultSpeed = OwlBalance.OWL_LIFTING_MOVEMENT_SPEED;
                                end;

                                if (v.PrimaryPart.Position - v15).Magnitude > 20 then
                                    defaultSpeed = OwlBalance.OWL_LIFTING_MOVEMENT_SPEED;
                                end;

                                local v19 = PrimaryPart.Position + v17 * (defaultSpeed * p12);
                                local Magnitude = (v19 - PrimaryPart.Position).Magnitude;

                                if Magnitude == 0 then
                                    Magnitude = false;
                                elseif Magnitude ~= Magnitude then
                                    Magnitude = false;
                                end;

                                if not Magnitude or (v19 - PrimaryPart.Position).Magnitude > (v15 - PrimaryPart.Position).Magnitude then
                                    v19 = v15;
                                end;

                                PrimaryPart.Position = v19;
                                local Character3 = v14.Character;

                                if Character3 ~= nil then
                                    Character3 = Character3:GetPrimaryPartCFrame().LookVector.Unit;
                                end;

                                local v20 = v:GetAttribute("Status");
                                local v21 = v:GetAttribute("FirstPerson");

                                if (v20 == OwlStatus.DEFAULT or v20 == OwlStatus.LIFTING) and (v21 == 0 or (v21 ~= v21 or (v21 == "" or not v21))) then
                                    PrimaryPart.CFrame = CFrame.new(PrimaryPart.Position, Character + Vector3.new(1, 3, 1) + Character3 * 6);
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end);
    WatchCollectionTag("Owl", function(p22) -- Line: 162
        -- upvalues: OwlUtil (ref), OwlStatus (ref)
        task.wait(0.5);
        local v23 = OwlUtil:getClientOwlFromServerOwl(p22);

        if not v23 then
            return nil;
        end;

        local v24 = p22:GetAttribute("Status");

        if v24 == 0 or (v24 ~= v24 or (v24 == "" or not v24)) then
            p22:SetAttribute("Status", OwlStatus.DEFAULT);
            v23:SetAttribute("Status", OwlStatus.DEFAULT);
        end;
    end);
end;

function u4.createClientOwl(p25, p26, p27, p28) -- Line: 175
    -- upvalues: ReplicatedStorage (copy), CollectionService (copy), GameSound (copy), u2 (copy), Workspace (copy), OwlUtil (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local Character = p26.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not (Character and p27.Character) then
        return nil;
    end;

    local v29 = p25:getKitSkinData(p27.Character);
    local v30;

    if v29 == nil then
        v30 = v29;
    else
        v30 = v29.owlModel;
    end;

    local u31;

    if v30 then
        u31 = v29.owlModel:Clone();
    else
        u31 = ReplicatedStorage.Assets.Effects.OwlShooter:Clone();
    end;

    CollectionService:AddTag(u31, "FirstPersonHidden");
    u31.Name = "ClientOwl";
    local v32 = p25:getKitSkinData(p27.Character);
    local v33 = {};
    local v34;

    if v32 == nil then
        v34 = v32;
    else
        v34 = v32.owlFlySound;
    end;

    local v35;

    if v34 == "" or not v34 then
        v35 = GameSound.OWL_FLY;
    else
        v35 = v32.owlFlySound;
    end;

    v33.SoundId = v35;
    v33.RollOffMinDistance = 20;
    v33.RollOffMaxDistance = 40;
    v33.Volume = 0.1;
    v33.Playing = true;
    v33.Parent = u31.PrimaryPart;
    v33.Looped = true;
    u2("Sound", v33);
    u31.PrimaryPart.Position = Character.Position + Vector3.new(1, 3, 1);
    u2("BodyForce", {
        Name = "OwlForce",
        Force = Vector3.new(0, Workspace.Gravity * u31.PrimaryPart.AssemblyMass, 0),
        Parent = u31.PrimaryPart
    });
    OwlUtil:setOwlClientModel(p27, u31);
    OwlUtil:setOwlTarget(p27, p26);
    OwlUtil:linkOwls(p28, u31);
    task.wait(0.45);
    u31.Parent = Workspace;
    local v36 = AnimationUtil:playAnimation(u31, GameAnimationUtil:getAssetId(AnimationType.OWL_INTERACTION));
    p25:playCuteOwlSound(u31, p27);
    u31:SetAttribute("Interacting", true);

    if v36 ~= nil then
        v36.Stopped:Connect(function() -- Line: 226
            -- upvalues: AnimationUtil (ref), u31 (copy), GameAnimationUtil (ref), AnimationType (ref)
            AnimationUtil:playAnimation(u31, GameAnimationUtil:getAssetId(AnimationType.OWL_FLY));
            u31:SetAttribute("Interacting", false);
        end);
    end;
end;

function u4.removeClientOwl(p37, p38) -- Line: 232
    -- upvalues: OwlUtil (copy), RunService (copy)
    local u39 = OwlUtil:getOwlClientModelByUser(p38);

    if not u39 then
        return nil;
    end;

    local function _(p40) -- Line: 238
        return p40:IsA("MeshPart");
    end;

    local v41 = 0;
    local u42 = {};

    for i, descendant in u39:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("MeshPart") == true then
            v41 = v41 + 1;
            u42[v41] = descendant;
        end;
    end;

    OwlUtil:deattachOwl(p38);

    local function _(p43) -- Line: 255
        if p43:IsA("ParticleEmitter") then
            p43:Emit(30);
        end;
    end;

    local u44 = 0;

    for i, descendant in u39:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant:Emit(30);
        end;
    end;

    local u45 = nil;
    u45 = RunService.Heartbeat:Connect(function(p46) -- Line: 264
        -- upvalues: u44 (ref), u39 (copy), u45 (ref), u42 (copy)
        u44 = u44 + p46;

        if u44 >= 1 then
            local v47 = u39;

            if v47 ~= nil then
                v47:Destroy();
            end;

            u45:Disconnect();

            return nil;
        end;

        local function _(p48) -- Line: 274
            -- upvalues: u44 (ref)
            if p48:IsA("MeshPart") then
                p48.Transparency = u44;
            end;
        end;

        for i, v in u42 do
            local _ = i - 1;

            if v:IsA("MeshPart") then
                v.Transparency = u44;
            end;
        end;
    end);
end;

function u4.startMeditateAnimation(p49, p50) -- Line: 284
    -- upvalues: EntityUtil (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), InventoryUtil (copy), ReplicatedStorage (copy)
    if not EntityUtil:getEntity(p50) then
        return nil;
    end;

    local v51 = AnimationUtil:playAnimation(p50, GameAnimationUtil:getAssetId(AnimationType.ZEN_HOVER), {
        looped = true
    });

    if v51 then
        p49.animationMap[p50] = v51;
    end;

    local hand = InventoryUtil.getInventory(p50).hand;

    if hand ~= nil then
        hand = hand.itemType;
    end;

    if hand then
        local Character = p50.Character;

        if Character ~= nil then
            local v52 = Character:WaitForChild(hand, 3);

            if v52 ~= nil then
                v52:Destroy();
            end;
        end;
    end;

    local v53 = ReplicatedStorage.Assets.Effects.MeditateAura:Clone();
    local Character = p50.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position + Vector3.new(0, -2, 0);
        end;
    end;

    if Character then
        v53.PrimaryPart.Position = Character;
        v53.Parent = p50.Character;
    end;
end;

function u4.endMeditateAnimation(p54, p55) -- Line: 327
    local v56 = p54.animationMap[p55];

    if v56 then
        v56:Stop();
        v56:Destroy();
    end;

    local Character = p55.Character;

    if Character ~= nil then
        Character = Character:WaitForChild("MeditateAura");
    end;

    if Character ~= nil then
        Character:Destroy();
    end;
end;

function u4.playCuteOwlSound(p57, p58, p59) -- Line: 345
    -- upvalues: RandomUtil (copy), OwlUtil (copy), SoundManager (copy)
    local v60 = RandomUtil.fromList(unpack(OwlUtil:getOwlCuteSound(p59)));
    local v61 = {};
    local PrimaryPart = p58.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.Position;
    end;

    v61.position = PrimaryPart;
    v61.rollOffMaxDistance = 220;
    SoundManager:playSound(v60, v61);
end;

function u4.getKitSkinData(p62, p63) -- Line: 358
    -- upvalues: KnitClient (copy), BedwarsKitSkinMeta (copy)
    local v64 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p63)];

    if v64.owl then
        return v64.owl;
    end;
end;

KnitClient.CreateController(u4.new());

return nil;