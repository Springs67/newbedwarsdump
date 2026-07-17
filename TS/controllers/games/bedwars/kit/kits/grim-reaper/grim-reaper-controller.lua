-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local Promise = v2.Promise;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local v6 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v6.InteractionCategory;
local InteractionPriority = v6.InteractionPriority;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GrimReaperBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "grim-reaper-balance").GrimReaperBalance;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 34, Name: __tostring
        return "GrimReaperController";
    end,

    __index = BaseKitController
});
u7.__index = u7;

function u7.new(...) -- Line: 40
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 44
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p9, BedwarsKit.GRIM_REAPER);
    p9.Name = "GrimReaperController";
    p9.soulsByPosition = {};
end;

function u7.onKitLocalActivated(u10, u11) -- Line: 49
    -- upvalues: default (copy)
    u10:registerSoulInteractions();
    default.Client:OnEvent("SpawnGrimReaperSoul", function(p12) -- Line: 51
        -- upvalues: u10 (copy)
        u10:spawnSoul(p12.position, p12.secret, p12.soulOfPlayer, p12.soulModel);
    end):andThen(function(p13) -- Line: 53
        -- upvalues: u11 (copy)
        u11:GiveTask(p13);
    end);
end;

function u7.onKitReplicationActivated(u14, u15) -- Line: 57
    -- upvalues: default (copy)
    default.Client:OnEvent("EntityConsumeGrimReaperSoul", function(p16) -- Line: 58
        -- upvalues: u14 (copy)
        u14:startChannel(p16.entity, p16.position);
    end):andThen(function(p17) -- Line: 60
        -- upvalues: u15 (copy)
        u15:GiveTask(p17);
    end);
end;

function u7.onKitLocalDeactivated(p18) -- Line: 64
end;

function u7.onKitReplicationDeactivated(p19) -- Line: 66
end;

function u7.onInnateAbilityEnabled(p20, p21, p22) -- Line: 68
end;

function u7.onAbilityUsed(p23, p24, p25) -- Line: 70
end;

function u7.registerSoulInteractions(u26) -- Line: 72
    -- upvalues: KnitClient (copy), DeviceUtil (copy), InteractionPriority (copy), InteractionCategory (copy), Players (copy)
    KnitClient.Controllers.InteractionRegistryController:RegisterInteraction({
        interactionLabel = "Player\'s Soul",
        interactionObjectText = "CONSUME",
        interactionTag = "GrimSoul",
        instantActivation = true,
        maxActivationDistance = 120,
        removePromptOnInteract = false,
        clickablePrompt = DeviceUtil.isMobileControls(),
        priority = InteractionPriority.ABILITY,
        category = InteractionCategory.ABILITY,

        onInteracted = function(p27, p28, p29) -- Line: 83, Name: onInteracted
            -- upvalues: Players (ref), u26 (copy)
            if not p28:IsA("Model") then
                return nil;
            end;

            if p27 == Players.LocalPlayer then
                local Character = p27.Character;

                if Character ~= nil then
                    Character = Character:GetAttribute("GrimReaperChannel");
                end;

                if Character ~= true then
                    u26:consumeSoul(p28);
                    p29:Destroy();
                end;
            end;
        end
    });
end;

function u7.spawnSoul(p30, p31, p32, p33, u34) -- Line: 100
    -- upvalues: ReplicatedStorage (copy), CollectionService (copy), Workspace (copy), Promise (copy), GrimReaperBalance (copy)
    if u34 ~= nil then
        u34 = u34:Clone();
    end;

    if u34 == nil then
        u34 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("GrimReaperSoul"):Clone();
    end;

    CollectionService:AddTag(u34, "GrimSoul");
    u34:SetAttribute("GrimReaperSoulSecret", p32);
    u34:PivotTo(CFrame.new(p31));
    p30.soulsByPosition[tostring(p31)] = u34;

    local function _(p35) -- Line: 117
        if p35:IsA("BasePart") then
            p35.CanCollide = false;
            p35.CanQuery = false;
            p35.CanTouch = false;
        end;
    end;

    for i, descendant in u34:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CanCollide = false;
            descendant.CanQuery = false;
            descendant.CanTouch = false;
        end;
    end;

    u34.Parent = Workspace;
    Promise.delay(GrimReaperBalance.SOUL_ORB_EXPIRE_TIME):andThen(function() -- Line: 129
        -- upvalues: u34 (copy)
        if u34.Parent then
            u34:Destroy();
        end;
    end);
end;

function u7.consumeSoul(p36, p37) -- Line: 136
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy), default (copy)
    local v38 = p37:GetAttribute("GrimReaperSoulSecret");
    GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.GRIM_REAPER_CONSUME);
    default.Client:Get("ConsumeGrimReaperSoul"):CallServer({
        secret = v38
    });
end;

function u7.startChannel(p39, p40, p41) -- Line: 143
    -- upvalues: GameSound (copy), ColorUtil (copy), u3 (copy), Players (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), SoundManager (copy), ReplicatedStorage (copy), Workspace (copy), u4 (copy), Promise (copy), TweenService (copy), GrimReaperBalance (copy), ClientSyncEvents (copy)
    local v42 = {
        consume = GameSound.GRIM_REAPER_CONSUME,
        channel = GameSound.GRIM_REAPER_CHANNEL
    };
    local v43 = ColorSequence.new(ColorUtil.WHITE);
    local v44 = p40:FindFirstChild("3DClothing");

    if v44 ~= nil then
        local function _(p45) -- Line: 152
            return p45.Name == "GrimReaperChannelAttachment";
        end;

        v44 = nil;

        for i, descendant in v44:GetDescendants() do
            local _ = i - 1;

            if descendant.Name == "GrimReaperChannelAttachment" == true then
                v44 = descendant;
                break;
            end;
        end;
    end;

    if v44 == nil then
        v44 = p40:FindFirstChild("UpperTorso");

        if v44 ~= nil then
            v44 = v44:FindFirstChild("BodyFrontAttachment");
        end;
    end;

    if v44 then
        local u46 = u3.new();
        local v47 = p40 == Players.LocalPlayer.Character;
        local v48 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p40)];

        if v48.grimReaper then
            v42.consume = v48.grimReaper.consumeSound;
            v42.channel = v48.grimReaper.channelSound;
            v43 = v48.grimReaper.beamColor;
        end;

        local consume = v42.consume;
        local v49 = {};
        local v50;

        if v47 then
            v50 = nil;
        else
            v50 = p40:GetPrimaryPartCFrame().Position;
        end;

        v49.position = v50;
        SoundManager:playSound(consume, v49);
        local channel = v42.channel;
        local v51 = {
            looped = true
        };
        local v52;

        if v47 then
            v52 = nil;
        else
            v52 = p40:GetPrimaryPartCFrame().Position;
        end;

        v51.position = v52;
        local v53;

        if v47 then
            v53 = nil;
        else
            v53 = p40.PrimaryPart;
        end;

        v51.parent = v53;
        local u54 = SoundManager:playSound(channel, v51);

        if u54 then
            u46:GiveTask(function() -- Line: 194
                -- upvalues: SoundManager (ref), u54 (copy)
                SoundManager:tweenSoundVolume(u54, 0, 0.1).Completed:Wait();
                local v55 = u54;

                if v55 ~= nil then
                    v55:Stop();
                end;

                local v56 = u54;

                if v56 ~= nil then
                    v56:Destroy();
                end;
            end);
        end;

        local u57 = p39.soulsByPosition[tostring(p41)];

        if u57 == nil then
            u57 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("GrimReaperSoul"):Clone();
            u57:PivotTo(CFrame.new(p41));
            u57.Parent = Workspace;
        end;

        u46:GiveTask(function() -- Line: 216
            -- upvalues: u57 (ref)
            local v58 = u57;

            if v58 ~= nil then
                v58:Destroy();
            end;
        end);
        local u59 = u4("Beam", {
            LightEmission = 0.6,
            LightInfluence = 1,
            Width0 = 0.4,
            Width1 = 0.2,
            CurveSize0 = 3,
            CurveSize1 = -3,
            FaceCamera = true,
            Attachment0 = u57:FindFirstChild("Spirit"):FindFirstChild("Attachment"),
            Attachment1 = v44,
            Transparency = NumberSequence.new(0),
            Color = v43,
            Parent = u57
        });
        local u60 = u59:Clone();
        u60.FaceCamera = false;
        u60.Parent = u57;

        local function _() -- Line: 240
            -- upvalues: Promise (ref), u59 (copy), TweenService (ref), u60 (copy)
            Promise.defer(function() -- Line: 241
                -- upvalues: u59 (ref), TweenService (ref), u60 (ref)
                local v61 = 1;

                while u59.Parent do
                    local v62 = 0.4 + 0.2 * math.random();
                    local v63 = TweenService:Create(u59, TweenInfo.new(v62), {
                        CurveSize0 = v61 * -3,
                        CurveSize1 = v61 * 3
                    });
                    TweenService:Create(u60, TweenInfo.new(v62), {
                        CurveSize0 = v61 * -3,
                        CurveSize1 = v61 * 3
                    }):Play();
                    v63:Play();
                    v63.Completed:Wait();
                    v61 = v61 * -1;
                end;
            end);
        end;

        Promise.defer(function() -- Line: 241
            -- upvalues: u59 (copy), TweenService (ref), u60 (copy)
            local v64 = 1;

            while u59.Parent do
                local v65 = 0.4 + 0.2 * math.random();
                local v66 = TweenService:Create(u59, TweenInfo.new(v65), {
                    CurveSize0 = v64 * -3,
                    CurveSize1 = v64 * 3
                });
                TweenService:Create(u60, TweenInfo.new(v65), {
                    CurveSize0 = v64 * -3,
                    CurveSize1 = v64 * 3
                }):Play();
                v66:Play();
                v66.Completed:Wait();
                v64 = v64 * -1;
            end;
        end);

        for _, descendant in p40:GetDescendants() do
            if descendant:IsA("BasePart") then
                if descendant.Transparency < 0.5 then
                    local Transparency = descendant.Transparency;
                    local Material = descendant.Material;
                    TweenService:Create(descendant, TweenInfo.new(0.1), {
                        Transparency = 0.369
                    }):Play();
                    descendant.Material = Enum.Material.ForceField;
                    u46:GiveTask(function() -- Line: 270
                        -- upvalues: descendant (copy), TweenService (ref), Transparency (copy), Material (copy)
                        if descendant.Parent then
                            TweenService:Create(descendant, TweenInfo.new(0.1), {
                                Transparency = Transparency
                            }):Play();
                            descendant.Material = Material;
                        end;
                    end);
                end;
            elseif descendant:IsA("ParticleEmitter") then
                local _ = descendant.Transparency;
            end;
        end;

        if v47 then
            u46:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                moveSpeedMultiplier = GrimReaperBalance.CONSUME_SPEED_MULTIPLIER
            }));
        end;

        if v47 then
            local u68 = ClientSyncEvents.PerformCombat:connect(function(p67) -- Line: 298
                p67:setCancelled(true);
            end);
            task.delay(GrimReaperBalance.INVISIBILITY_ABILITY_DURATION, function() -- Line: 301
                -- upvalues: u68 (copy)
                u68:Destroy();
            end);
        end;

        Promise.delay(GrimReaperBalance.INVISIBILITY_ABILITY_DURATION):andThen(function() -- Line: 307
            -- upvalues: u46 (copy)
            u46:DoCleaning();
        end);
    end;
end;

KnitClient.CreateController(u7.new());

return nil;