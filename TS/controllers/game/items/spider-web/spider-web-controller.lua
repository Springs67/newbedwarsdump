-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local SpiderWebBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").SpiderWebBalance;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "SpiderWebController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 29
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "SpiderWebController";
end;

function u3.KnitStart(u6) -- Line: 37
    -- upvalues: KnitController (copy), default2 (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), WatchCollectionTag (copy), Players (copy), default (copy), Linear (copy)
    KnitController.KnitStart(u6);
    default2.Client:Get("WebPlayer"):Connect(function(p7) -- Line: 39
        -- upvalues: u6 (copy)
        u6:applyEffect(p7.player, p7.stun);
    end);
    default2.Client:Get("SpiderAttack"):Connect(function(p8) -- Line: 42
        -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref)
        if not p8.position then
            return nil;
        end;

        SoundManager:playSound(RandomUtil.fromList(GameSound.SPIDER_ATTACK_1, GameSound.SPIDER_ATTACK_2, GameSound.SPIDER_ATTACK_3), {
            volumeMultiplier = 0.2,
            rollOffMaxDistance = 45,
            position = p8.position
        });
    end);
    WatchCollectionTag("spider_web", function(p9) -- Line: 52
        -- upvalues: Players (ref), default (ref), Linear (ref)
        local Web = p9:WaitForChild("Web", 3);

        if not Web then
            return nil;
        end;

        local v10 = p9:GetAttribute("SpiderWebTeamId");
        local v11 = 0.99;
        local Team = Players.LocalPlayer.Team;

        if Team ~= nil then
            Team = Team.Name;
        end;

        if Team == v10 then
            v11 = 0.8;
            local Indicator = p9:WaitForChild("Indicator", 3);

            if Indicator then
                Indicator.Transparency = 0.8;
            end;
        end;

        default(2, Linear, function(p12) -- Line: 70
            -- upvalues: Web (copy)
            Web.Transparency = p12;
        end, Web.Transparency, v11);
    end);
end;

function u3.applyEffect(p13, p14, p15) -- Line: 75
    -- upvalues: ReplicatedStorage (copy), WeldUtil (copy), KnitClient (copy), BedwarsImageId (copy), SpiderWebBalance (copy), SoundManager (copy), GameSound (copy)
    local Character = p14.Character;

    if not Character then
        return nil;
    end;

    local u16 = {};

    if p15 then
        local u17 = ReplicatedStorage.Assets.Effects.SpiderWebEffect:Clone();
        u17.Parent = Character;
        task.delay(2, function() -- Line: 85
            -- upvalues: u17 (copy)
            u17:Destroy();
        end);
    end;

    for _, child in ReplicatedStorage.Assets.Effects.WebEffectFolder:GetChildren() do
        child.Parent = Character;
        table.insert(u16, child);
    end;

    WeldUtil:weldCharacterAccessories(Character);
    local u18 = KnitClient.Controllers.StunController:showStatusBubble(Character, BedwarsImageId.SPIDER_WEB);
    task.delay(SpiderWebBalance.SPIDER_WEB_DEBUFF_TIME, function() -- Line: 96
        -- upvalues: u16 (copy), u18 (copy)
        for _, v in u16 do
            v:Destroy();
        end;

        u18:DoCleaning();
    end);
    local PrimaryPart = Character.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.Position;
    end;

    SoundManager:playSound(GameSound.SPIDER_WEB, {
        position = PrimaryPart
    });
end;

KnitClient.CreateController(u3.new());

return nil;