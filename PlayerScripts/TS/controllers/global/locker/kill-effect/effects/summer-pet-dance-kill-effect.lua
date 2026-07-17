-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InCubic = v2.InCubic;
local OutCubic = v2.OutCubic;
local OutExpo = v2.OutExpo;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EventType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType;
local Summer2024EventConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "summer-2024", "summer-event-2024-config").Summer2024EventConfig;
local GlobalTeamKey = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-types").GlobalTeamKey;
local PetMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "pet", "pet-meta").PetMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "SummerPetDanceKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 37
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 41
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, p8);
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(p9, p10, p11, p12) -- Line: 45
    -- upvalues: u3 (copy), KillEffect (copy), GlobalTeamKey (copy), DeviceUtil (copy), ClientStore (copy), EventType (copy), RandomUtil (copy), Summer2024EventConfig (copy), PetMeta (copy), default (copy), GameQueryUtil (copy), Workspace (copy), u4 (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), default2 (copy), OutCubic (copy), ModelUtil (copy), InCubic (copy), OutExpo (copy)
    local u13 = u3.new();
    KillEffect.hideCharacter(p9, p11);
    local v14 = { GlobalTeamKey.SUMMER_2024_CRAB, GlobalTeamKey.SUMMER_2024_TURTLE };
    local v15;

    if DeviceUtil.isHoarceKat() then
        v15 = GlobalTeamKey.SUMMER_2024_CRAB;
    else
        v15 = ClientStore:getState().Event.profileData.events[EventType.SUMMER_2024];

        if v15 ~= nil then
            v15 = v15.globalTeamKey;
        end;

        if v15 == nil then
            v15 = RandomUtil.randomArraySelectN(v14, 1)[1];
        end;
    end;

    if not v15 or table.find(v14, v15) == nil then
        return u13;
    end;

    local pet = Summer2024EventConfig.teamToPet[v15].pet;
    local u16 = PetMeta[pet].model:Clone();

    if u16 == nil or u16.PrimaryPart == nil then
        default.Warn("Error creating pet {petType}. model not found", pet);

        return u13;
    end;

    local v17 = p12 * CFrame.Angles(0, -3.141592653589793, 0);
    u16:PivotTo(v17);
    local Character = p9.killerPlayer.Character;

    if Character ~= nil then
        Character = Character:GetPivot().Position;
    end;

    local v18 = CFrame;
    local v19 = p12.Position + Vector3.new(0, 3, 0);
    local v20;

    if Character then
        v20 = Vector3.new(Character.X, p12.Y, Character.Z);
    else
        v20 = p12.Position + Vector3.new(0, 3, 0);
    end;

    local v21 = v18.lookAt(v19, v20);

    if u16.PrimaryPart then
        u16.PrimaryPart.Anchored = true;
    end;

    u16:ScaleTo(0.00001);
    GameQueryUtil:setQueryIgnored(u16, true);
    u16.Parent = Workspace;
    u13:GiveTask(u16);
    local v22 = u16:FindFirstChildWhichIsA("AnimationController");

    if v22 ~= nil then
        v22 = v22:FindFirstChildWhichIsA("Animator");
    end;

    local v23 = v22 or u4("Animator", {
        Parent = u16:FindFirstChildWhichIsA("AnimationController")
    });

    if v23 ~= nil then
        local v24;

        if v15 == GlobalTeamKey.SUMMER_2024_CRAB then
            v24 = AnimationType.CRAB_DANCE;
        else
            v24 = AnimationType.TURTLE_DANCE;
        end;

        v23 = v23:LoadAnimation(GameAnimationUtil:getAnimation(v24));
    end;

    if not v23 then
        return u13;
    end;

    v23.Looped = true;
    v23:Play();
    u13:GiveTask((SoundManager:playSound(GameSound.LOBBY_MUSIC_SUMMER, {
        volumeMultiplier = 2,
        position = v17.Position
    })));
    default2(1, OutCubic, function(p25) -- Line: 138
        -- upvalues: u16 (copy)
        local PrimaryPart = u16.PrimaryPart;

        if PrimaryPart then
            PrimaryPart:PivotTo(p25);
        end;
    end, v17, v21);
    ModelUtil.tweenModelSizeScaleTo(u16, 0.7, InCubic, 1.5);
    task.delay(3, function() -- Line: 146
        -- upvalues: ModelUtil (ref), u16 (copy), OutExpo (ref), u13 (copy)
        ModelUtil.tweenModelSizeScaleTo(u16, 0.6, OutExpo, 0.00001):andThen(function() -- Line: 148
            -- upvalues: u13 (ref)
            u13:DoCleaning();
        end);
    end);

    return u13;
end;

return u5;