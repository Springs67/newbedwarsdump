-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BalloonSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "balloon", "balloon-skin").BalloonSkin;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "FlowerSplosionBedBreakEffect";
    end,

    __index = BreakBedEffectController
});
u5.__index = u5;

function u5.new(...) -- Line: 31
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 35
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p7, BedBreakEffectType.FLOWER_SPLOSION);
    p7.Name = "FlowerSplosionBedBreakEffect";
    p7.springColors = {
        Color3.fromRGB(249, 150, 174),
        Color3.fromRGB(159, 244, 223),
        Color3.fromRGB(246, 240, 163),
        Color3.fromRGB(107, 206, 238),
        Color3.fromRGB(217, 182, 253),
        Color3.fromRGB(135, 221, 89),
        Color3.fromRGB(4, 118, 7)
    };
end;

function u5.KnitStart(p8) -- Line: 40
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p8);
end;

function u5.onBedBreak(u9, p10, p11, p12, p13) -- Line: 43
    -- upvalues: u2 (copy), ReplicatedStorage (copy), GameQueryUtil (copy), Workspace (copy), RandomUtil (copy), SoundManager (copy), GameSound (copy), EffectUtil (copy), RuntimeLib (copy)
    local u14 = u2.new();
    u9.maid:GiveTask(u14);
    local v15 = ReplicatedStorage.Assets.Effects.FlowerSplosionEffect:Clone();
    GameQueryUtil:setQueryIgnored(v15, true);
    v15.Transparency = 1;
    v15.CFrame = p11;
    v15.Parent = Workspace;
    u14:GiveTask(v15);
    local Attachment = v15.Attachment;

    local function _(p16) -- Line: 55
        -- upvalues: RandomUtil (ref), u9 (copy)
        local v17 = RandomUtil.fromList(u9.springColors)[1];
        p16.Color = ColorSequence.new(v17);
    end;

    for i, v in {
        Attachment.Flower,
        Attachment.Flower1,
        Attachment.Flower2,
        Attachment.Flower3
    } do
        local _ = i - 1;
        local v18 = RandomUtil.fromList(u9.springColors)[1];
        v.Color = ColorSequence.new(v18);
    end;

    u14:GiveTask(SoundManager:playSound(GameSound.STAR_KILL_EFFECT, {
        position = p11.Position
    }));
    EffectUtil:playInstanceEffects({ v15 });
    RuntimeLib.Promise.delay(4):andThen(function() -- Line: 67
        -- upvalues: u14 (copy)
        u14:DoCleaning();
    end);
end;

function u5.hookBalloon(p19, p20, p21) -- Line: 72
    local RopeConstraint = p21:WaitForChild("RopeConstraint");
    RopeConstraint.Attachment0 = p20;
    RopeConstraint.Attachment1 = p21.Balloon.Attachment;
end;

function u5.inflateBalloon(p22, p23) -- Line: 77
    -- upvalues: PlaceUtil (copy), BalloonSkin (copy), RandomUtil (copy), ReplicatedStorage (copy), u3 (copy), Workspace (copy), CollectionService (copy), ClientStore (copy)
    if not (p23 and p23.PrimaryPart) then
        return nil;
    end;

    local v24 = "InflatedBalloon";
    local v25;

    if PlaceUtil.isLobbyServer() then
        v25 = BalloonSkin.BALLOON_SKIN_MODELS_LOBBY;
    else
        v25 = BalloonSkin.BALLOON_SKIN_MODELS;
    end;

    if v25 and #v25 > 0 then
        v24 = RandomUtil.fromList(unpack(v25));
    end;

    local v26 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild(v24):Clone();
    v26.Balloon:SetAttribute("IgnoreProjectileCollision", true);
    v26.Balloon.CFrame = p23:GetPrimaryPartCFrame();
    u3("BodyForce", {
        Name = "BodyForce",
        Force = Vector3.new(0, Workspace.Gravity * v26.Balloon.Mass * 7, 0),
        Parent = v26.Balloon
    });

    if v24 == "InflatedBalloon" then
        u3("BodyGyro", {
            D = 0,
            CFrame = v26.Balloon.CFrame,
            Parent = v26.Balloon
        });
    else
        u3("BodyGyro", {
            D = 1000,
            P = 10,
            CFrame = v26.Balloon.CFrame,
            Parent = v26.Balloon
        });
    end;

    v26.Parent = p23;
    CollectionService:AddTag(v26, "InflatedBalloon:" .. p23.Name);
    local v27 = Color3.fromRGB(216, 50, 53);
    local myTeam = ClientStore:getState().Game.myTeam;

    if myTeam then
        if myTeam ~= nil then
            myTeam = myTeam.color;
        end;
    else
        myTeam = v27;
    end;

    v26.Balloon.Color = myTeam;
    v26.Balloon.PopEffect.Color = ColorSequence.new(myTeam);

    return v26;
end;

function u5.popBalloon(p28, u29) -- Line: 124
    -- upvalues: RuntimeLib (copy), SoundManager (copy), GameSound (copy)
    u29.Balloon.BodyForce.Force = Vector3.new(0, 0, 0);
    u29:SetAttribute("DeflatedBalloon", true);
    RuntimeLib.Promise.delay(2):andThen(function() -- Line: 128
        -- upvalues: u29 (copy), SoundManager (ref), GameSound (ref)
        u29:Destroy();
        SoundManager:playSound(GameSound.BALLOON_POP, {
            position = u29.Balloon.Position
        });
    end);
end;

KnitClient.CreateController(u5.new());

return nil;