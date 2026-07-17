-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local summoner_getClawData = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-util").summoner_getClawData;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "SummonerClawController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 34
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 38
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "SummonerClawController";
    p8.clawColors = {
        Color3.fromRGB(75, 75, 75),
        Color3.fromRGB(255, 255, 255),
        Color3.fromRGB(43, 229, 229),
        Color3.fromRGB(49, 229, 94)
    };
    p8.debugging = false;
end;

function u6.KnitStart(u9) -- Line: 44
    -- upvalues: KnitController (copy), default (copy), Players (copy)
    KnitController.KnitStart(u9);
    default.Client:Get("SummonerClawAttackFromServer"):Connect(function(p10, p11, p12, p13) -- Line: 47
        -- upvalues: Players (ref), u9 (copy)
        if p10 ~= Players.LocalPlayer then
            u9:clawAttack(p10, p11, p12, p13);
        end;
    end);
end;

function u6.clawAttack(p14, p15, p16, p17, p18) -- Line: 53
    -- upvalues: u3 (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), ReplicatedStorage (copy), KnitClient2 (copy), Workspace (copy), Players (copy), summoner_getClawData (copy), GameSound (copy), SoundManager (copy), RandomUtil (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), RunService (copy), u4 (copy)
    local Character = p15.Character;

    if not Character then
        return nil;
    end;

    local PrimaryPart = Character.PrimaryPart;

    if not PrimaryPart then
        return nil;
    end;

    local u19 = u3.new();
    local v20 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(Character)];
    local Summoner_DragonClaw = ReplicatedStorage.Assets.Misc.Kaida.Summoner_DragonClaw;
    local kaida = v20.kaida;

    if kaida ~= nil then
        kaida = kaida.dragon_claw;
    end;

    if kaida then
        Summoner_DragonClaw = v20.kaida.dragon_claw;
    end;

    local u21 = Summoner_DragonClaw:Clone();

    if KnitClient2.Controllers.SummonerKitSkinController:isPrismaticSkin(p15) then
        KnitClient2.Controllers.SummonerKitSkinController:applyClawRGB(u21);
    end;

    u21.Parent = Workspace;

    local function _(p22) -- Line: 83
        return p22:IsA("MeshPart");
    end;

    local v23 = 0;
    local u24 = {};

    for i, child in u21:GetChildren() do
        local _ = i - 1;

        if child:IsA("MeshPart") == true then
            v23 = v23 + 1;
            u24[v23] = child;
        end;
    end;

    local v25 = KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0;

    if p15 == Players.LocalPlayer and v25 then
        local function _(p26) -- Line: 101
            p26.Transparency = 0.6;
        end;

        for i, v in u24 do
            local _ = i - 1;
            v.Transparency = 0.6;
        end;
    end;

    local v27 = p14.clawColors[summoner_getClawData(p18).level - 1 + 1];
    u21.dragon_claw_nail_mesh.Color = v27;
    local v28;

    if v20 == nil then
        v28 = v20;
    else
        v28 = v20.kaida;

        if v28 ~= nil then
            v28 = v28.clawAttackSounds;
        end;
    end;

    local v29;

    if v28 then
        v29 = v20.kaida.clawAttackSounds;
    else
        v29 = {
            GameSound.SUMMONER_CLAW_ATTACK_1,
            GameSound.SUMMONER_CLAW_ATTACK_2,
            GameSound.SUMMONER_CLAW_ATTACK_3,
            GameSound.SUMMONER_CLAW_ATTACK_4
        };
    end;

    SoundManager:playSound(RandomUtil.fromList(unpack(v29)), {
        position = PrimaryPart.Position
    });

    if p15 == Players.LocalPlayer then
        AnimationUtil:playAnimation(p15, GameAnimationUtil:getAssetId(AnimationType.SUMMONER_CHARACTER_SWIPE), {
            looped = false
        });
    end;

    local Unit = Vector3.new(p17.X, 0, p17.Z).Unit;
    local v30 = Unit:Cross(Vector3.new(0, 1, 0)).Unit * -1;
    local v31 = PrimaryPart.Position + v30 * 5 + Unit * 6;
    local Unit2 = (v31 + p17 * 13 - v31).Unit;
    local v32 = CFrame.new(v31, v31 + Unit2);
    u21:PivotTo(v32);
    u21.PrimaryPart.Anchored = true;

    if RunService:IsStudio() and p14.debugging then
        u4("Part", {
            Size = Vector3.new(0.1, 0.1, 4),
            Parent = Workspace,
            Position = v31 + Unit2 * 2,
            Anchored = true,
            BrickColor = BrickColor.new("Bright red"),
            CanCollide = false
        }):PivotTo(v32);
    end;

    local u33;

    if u21:FindFirstChild("Portal1") then
        u33 = RunService.Heartbeat:Connect(function() -- Line: 170
            -- upvalues: u21 (ref)
            local TransformedWorldCFrame = u21.RootPart.root.fore_arm.TransformedWorldCFrame;
            local Portal1 = u21.Portal1;

            if Portal1 ~= nil then
                Portal1:PivotTo(TransformedWorldCFrame);
            end;

            local v34 = TransformedWorldCFrame * CFrame.Angles(3.141592653589793, 0, 0);
            local Portal2 = u21.Portal2;

            if Portal2 ~= nil then
                Portal2:PivotTo(v34);
            end;
        end);
    else
        u33 = nil;
    end;

    AnimationUtil:playAnimation(u21.AnimationController.Animator, GameAnimationUtil:getAssetId(AnimationType.SUMMONER_CLAW_ATTACK), {
        looped = false,
        speed = 1
    });
    task.wait(0.5);
    local u35 = 0;
    local u36 = v25 and 0.6 or 0;
    local u40 = RunService.Heartbeat:Connect(function(p37) -- Line: 197
        -- upvalues: u35 (ref), u36 (copy), u24 (copy)
        u35 = u35 + p37;
        local u38 = math.clamp(u35 / 0.25, u36, 1);

        local function _(p39) -- Line: 200
            -- upvalues: u38 (copy)
            p39.Transparency = u38;
        end;

        for i, v in u24 do
            local _ = i - 1;
            v.Transparency = u38;
        end;
    end);
    task.delay(0.25, function() -- Line: 207
        -- upvalues: u19 (copy), u40 (copy), u33 (ref), u21 (ref)
        u19:DoCleaning();
        u40:Disconnect();
        local v41 = u33;

        if v41 ~= nil then
            v41:Disconnect();
        end;

        u21:Destroy();
    end);
end;

KnitClient.CreateController(u6.new());

return nil;