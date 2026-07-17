-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out");
local scaleModel = v3.scaleModel;
local scalePart = v3.scalePart;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local Tween = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").Tween;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "FlowerBowController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 39
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 43
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "FlowerBowController";
    p8.flowers = {};
    p8.count = 0;
end;

function u6.KnitStart(u9) -- Line: 49
    -- upvalues: KnitController (copy), default2 (copy), Players (copy), GameSound (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), RandomUtil (copy), SoundManager (copy), u2 (copy), Tween (copy), Linear (copy), u5 (copy)
    KnitController.KnitStart(u9);
    default2.Client:Get("FlowerSpawn"):Connect(function(p10) -- Line: 51
        -- upvalues: u9 (copy), Players (ref), GameSound (ref), KnitClient (ref), BedwarsKitSkinMeta (ref), RandomUtil (ref), SoundManager (ref), u2 (ref)
        u9.flowers[p10.flower] = true;
        u9:createBee(p10.flower);
        local v11 = p10.flower:GetAttribute("PlacedByUserId");

        if v11 == 0 or (v11 ~= v11 or not v11) then
            return nil;
        end;

        local v12 = Players:GetPlayerByUserId(v11);

        if not v12 then
            return nil;
        end;

        local FLOWER_PLANT = GameSound.FLOWER_PLANT;
        local Character = p10.owner.Character;

        if Character then
            local v13 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(Character)];

            if v13.lyla then
                FLOWER_PLANT = RandomUtil.fromList(v13.lyla.flowerPlantSounds)[1];
            end;
        end;

        SoundManager:playSound(FLOWER_PLANT, {
            rollOffMaxDistance = 220,
            position = p10.hitCFrame.Position
        });

        if Players.LocalPlayer.UserId == v11 then
            return;
        end;

        if v12.Team ~= Players.LocalPlayer.Team then
            local v14 = {};
            local PrimaryPart = p10.flower.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart:FindFirstChild("flower");
            end;

            v14.Parent = PrimaryPart;
            v14.OutlineColor = Color3.fromRGB(255, 120, 120);
            v14.FillColor = Color3.fromRGB(255, 150, 150);
            v14.FillTransparency = 1;
            v14.OutlineTransparency = 0;
            v14.DepthMode = Enum.HighlightDepthMode.Occluded;
            u2("Highlight", v14);
        end;
    end);
    default2.Client:Get("SpawnBeeOnTarget"):Connect(function(p15) -- Line: 99
        -- upvalues: u9 (copy)
        local v16 = false;
        local v17 = 0;

        while true do
            if v16 then
                v17 = v17 + 1;
            else
                v16 = true;
            end;

            if v17 >= p15.count then
                return;
            end;

            u9:createBee(p15.target);
        end;
    end);
    default2.Client:Get("BloomEvent"):Connect(function(p18) -- Line: 116
        -- upvalues: u9 (copy)
        u9:bloomEffect(p18.target, p18.attackerUserId);
    end);
    default2.Client:Get("FlowerTriggered"):Connect(function(u19) -- Line: 119
        -- upvalues: Tween (ref), Linear (ref)
        if not u19.flower then
            return nil;
        end;

        if u19.target then
            local SmallerBee = u19.flower:FindFirstChild("SmallerBee");

            if SmallerBee then
                SmallerBee.Parent = u19.target;
            end;

            local lastTime = u19.lastTime;

            if lastTime ~= 0 and (lastTime == lastTime and lastTime) then
                task.delay(u19.lastTime, function() -- Line: 130
                    -- upvalues: SmallerBee (copy)
                    local v20 = SmallerBee;

                    if v20 ~= nil then
                        v20:Destroy();
                    end;
                end);
            end;
        end;

        Tween(0.9, Linear, function(p21) -- Line: 138
            -- upvalues: u19 (copy)
            local PrimaryPart = u19.flower.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart:FindFirstChild("flower");
            end;

            if PrimaryPart then
                PrimaryPart.Transparency = p21;
            end;
        end, 0, 1);
    end);
    default2.Client:Get("BloomEnd"):Connect(function(p22) -- Line: 150
        -- upvalues: u5 (ref), Tween (ref), Linear (ref)
        local v23 = p22.target:GetChildren();

        local function v28(u24) -- Line: 152
            -- upvalues: u5 (ref), Tween (ref), Linear (ref)
            if u24.Name ~= "SmallerBee" then
                if u5.startsWith(u24.Name, "Flower") and (u24:IsA("Model") and u24.PrimaryPart ~= nil) then
                    local Root = u24:FindFirstChild("Root");

                    if Root ~= nil then
                        Root = Root:FindFirstChild("flower");
                    end;

                    local Root2 = u24:FindFirstChild("Root");

                    if Root2 ~= nil then
                        Root2 = Root2:FindFirstChild("flower");

                        if Root2 ~= nil then
                            Root2 = Root2:FindFirstChild("BeeSound");
                        end;
                    end;

                    if Root2 then
                        Root2.Volume = 0.5;
                        Tween(1, Linear, function(p25) -- Line: 174
                            -- upvalues: Root2 (copy)
                            Root2.Volume = p25;
                        end, 0.5, 0);
                    end;

                    Tween(0.8, Linear, function(p26) -- Line: 178
                        -- upvalues: Root (copy)
                        if Root then
                            Root.Transparency = p26;
                        end;
                    end, 0, 1);

                    local function _(p27) -- Line: 184
                        if p27:IsA("ParticleEmitter") then
                            p27:Emit(30);
                        end;
                    end;

                    for i, descendant in u24.PrimaryPart:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("ParticleEmitter") then
                            descendant:Emit(30);
                        end;
                    end;

                    task.delay(1, function() -- Line: 192
                        -- upvalues: u24 (copy)
                        u24:Destroy();
                    end);
                end;

                return;
            end;

            u24:SetAttribute("MaxDistanceFromOrigin", 100);
            task.delay(1, function() -- Line: 155
                -- upvalues: u24 (copy)
                u24:Destroy();
            end);
        end;

        for i, v in v23 do
            v28(v, i - 1, v23);
        end;
    end);
end;

function u6.createBee(p29, p30) -- Line: 202
    -- upvalues: ReplicatedStorage (copy), scaleModel (copy), u2 (copy), Workspace (copy), GameQueryUtil (copy), GameAnimationUtil (copy), AnimationType (copy), CollectionService (copy)
    local v31 = ReplicatedStorage.Assets.Effects.SmallerBee:Clone();

    if p30:GetAttribute("Strength") == 2 then
        scaleModel(v31, 2);
    end;

    v31:PivotTo(p30:GetPivot());
    local Root = v31.Root;
    local v32 = u2("Attachment", {
        Name = "BeeMovementAttachment",
        Parent = Root
    });
    u2("LinearVelocity", {
        Parent = Root,
        Attachment0 = v32,
        MaxForce = Root.AssemblyMass * 100000,
        RelativeTo = Enum.ActuatorRelativeTo.World
    });
    u2("VectorForce", {
        Parent = Root,
        Attachment0 = v32,
        Force = Vector3.new(0, Root.AssemblyMass * Workspace.Gravity, 0),
        RelativeTo = Enum.ActuatorRelativeTo.World
    });
    u2("AlignOrientation", {
        Responsiveness = 15,
        Parent = Root,
        Attachment0 = v32,
        Mode = Enum.OrientationAlignmentMode.OneAttachment,
        MaxTorque = Root.AssemblyMass * 100000
    });
    v31.Parent = p30;
    v31:SetAttribute("BeeOrigin", p30:GetPivot().Position);
    v31:SetAttribute("MaxDistanceFromOrigin", 1);
    v31:SetAttribute("NextUpdateDirection", -1);

    for _, descendant in v31:GetDescendants() do
        if descendant:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(descendant, true);
        end;
    end;

    local v33 = v31:FindFirstChildOfClass("AnimationController");

    if v33 ~= nil then
        local v34 = v33:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.BEE_FLAP));
        v34.Looped = true;
        v34:Play();
    end;

    CollectionService:AddTag(v31, "flower-bee");
end;

function u6.bloomEffect(p35, u36, p37) -- Line: 249
    -- upvalues: ReplicatedStorage (copy), Players (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), scaleModel (copy), default (copy), EntityUtil (copy), GameSound (copy), u2 (copy), SoundManager (copy), RunService (copy), scalePart (copy)
    local Flower = ReplicatedStorage.Assets.Effects.Lyla.Flower;
    local v38 = Players:GetPlayerByUserId(p37);

    if v38 ~= nil then
        v38 = v38.Character;
    end;

    local v39;

    if v38 then
        v39 = KnitClient.Controllers.KitSkinController:getKitSkin(v38);
    else
        v39 = nil;
    end;

    local v40;

    if v39 then
        v40 = BedwarsKitSkinMeta[v39];
    else
        v40 = nil;
    end;

    local v41;

    if v40 == nil then
        v41 = v40;
    else
        v41 = v40.lyla;
    end;

    if v41 then
        Flower = ReplicatedStorage.Assets.Effects.Lyla:FindFirstChild(v40.lyla.customFlowerName);
    end;

    local u42 = Flower:Clone();
    scaleModel(u42, 0.3);
    u42.Parent = u36;

    if u42.PrimaryPart == nil then
        local v43 = u42:FindFirstChildWhichIsA("BasePart");

        if not v43 then
            default.Error("flower has no primary part");

            return nil;
        end;

        u42.PrimaryPart = v43;
    end;

    local Head = u36:FindFirstChild("Head");

    if Head ~= nil then
        Head = Head:FindFirstChild("HairAttachment");
    end;

    if not Head then
        return nil;
    end;

    local u44 = EntityUtil:getEntity(u36);
    local FLOWER_BLOOM = GameSound.FLOWER_BLOOM;
    local ANGRY_BEE = GameSound.ANGRY_BEE;
    local v45;

    if v40 == nil then
        v45 = v40;
    else
        v45 = v40.lyla;
    end;

    if v45 then
        FLOWER_BLOOM = v40.lyla.flowerBloomSound;
        ANGRY_BEE = v40.lyla.angryBeesSound;
    end;

    u2("Sound", {
        RollOffMinDistance = 30,
        RollOffMaxDistance = 45,
        Volume = 0.5,
        Playing = true,
        SoundId = FLOWER_BLOOM,
        Parent = u42.PrimaryPart
    });
    local v46 = SoundManager:createSound(ANGRY_BEE);
    v46.RollOffMinDistance = 30;
    v46.RollOffMaxDistance = 45;
    v46.Name = "BeeSound";
    SoundManager:playSound(v46, {
        looped = true,
        parent = u42.PrimaryPart
    });
    local u47 = nil;
    u47 = RunService.Heartbeat:Connect(function(p48) -- Line: 315
        -- upvalues: u42 (ref), scalePart (ref), u44 (copy), u47 (ref), u36 (copy)
        if u42.PrimaryPart and u42.PrimaryPart.Size.Y < 3 then
            scalePart(u42.PrimaryPart, 1 + p48 * 4);
        end;

        if not u44 or u44:isDead() then
            u47:Disconnect();
            u42:Destroy();

            return nil;
        end;

        if not u36.PrimaryPart then
            u42:Destroy();
            u47:Disconnect();

            return nil;
        end;

        u42:PivotTo(u36.PrimaryPart.CFrame + Vector3.new(0, 3.5, 0));
    end);
    u42.Destroying:Connect(function() -- Line: 337
        -- upvalues: u47 (ref)
        u47:Disconnect();
    end);
end;

KnitClient.CreateController(u6.new());

return nil;