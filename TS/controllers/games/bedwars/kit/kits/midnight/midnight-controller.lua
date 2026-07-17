-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Lighting = v3.Lighting;
local Players = v3.Players;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local MidnightConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "midnight", "midnight-constants").MidnightConstants;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u4 = {
    correctionBrightness = 0,
    correctionContrast = 0.05,
    atmosphereDensity = 0.2,
    atmosphereHaze = 10,
    brightness = 1,
    farIntensity = 0.25,
    correctionTintColor = Color3.fromRGB(118, 132, 209),
    atmosphereColor = Color3.fromRGB(45, 56, 46),
    atmosphereDecay = Color3.fromRGB(30, 32, 35),
    outdoorAmbient = Color3.fromRGB(115, 111, 167),
    ambient = Color3.fromRGB(170, 170, 170)
};
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 40, Name: __tostring
        return "MidnightController";
    end,

    __index = BaseKitController
});
u5.__index = u5;

function u5.new(...) -- Line: 46
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 50
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), u1 (copy)
    BaseKitController.constructor(p7, BedwarsKit.MIDNIGHT);
    p7.Name = "MidnightController";
    p7.activeMidnightMaid = u1.new();
end;

function u5.onKitLocalActivated(u8, u9) -- Line: 55
    -- upvalues: default2 (copy), Players (copy)
    default2.Client:OnEvent("EntityDeathEvent", function(p10) -- Line: 56
        -- upvalues: Players (ref), u8 (copy)
        if p10.entityInstance ~= Players.LocalPlayer.Character then
            return nil;
        end;

        u8.activeMidnightMaid:DoCleaning();
    end):andThen(function(p11) -- Line: 61
        -- upvalues: u9 (copy)
        u9:GiveTask(p11);
    end);
end;

function u5.onKitLocalDeactivated(p12) -- Line: 65
end;

function u5.onKitReplicationActivated(p13, p14) -- Line: 67
end;

function u5.onKitReplicationDeactivated(p15) -- Line: 69
end;

function u5.onInnateAbilityEnabled(p16, p17, p18) -- Line: 71
end;

function u5.onAbilityUsed(u19, p20, p21) -- Line: 73
    -- upvalues: AbilityId (copy), EntityUtil (copy), RuntimeLib (copy), PlayerEntity (copy), Players (copy), Workspace (copy), u4 (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), MidnightConstants (copy), TweenService (copy), u2 (copy), Lighting (copy), CollectionService (copy), default (copy), InQuad (copy)
    if p21.ability ~= AbilityId.MIDNIGHT then
        return nil;
    end;

    local v22 = EntityUtil:getEntity(p20);

    if not RuntimeLib.instanceof(v22, PlayerEntity) then
        return nil;
    end;

    local extra = p21.extra;

    if v22:getPlayer() ~= Players.LocalPlayer then
        return nil;
    end;

    u19.activeMidnightMaid:DoCleaning();
    task.delay(extra.expirationTime - Workspace:GetServerTimeNow(), function() -- Line: 87
        -- upvalues: u19 (copy)
        u19.activeMidnightMaid:DoCleaning();
    end);
    local v23 = extra.team == Players.LocalPlayer:GetAttribute("Team");
    local u24 = u4;
    local MIDNIGHT_ACTIVATE = GameSound.MIDNIGHT_ACTIVATE;
    local v25 = {};
    local v26;

    if v23 then
        v26 = nil;
    else
        v26 = v22:getInstance().PrimaryPart;

        if v26 ~= nil then
            v26 = v26.Position;
        end;
    end;

    v25.position = v26;
    SoundManager:playSound(MIDNIGHT_ACTIVATE, v25);

    if v23 then
        local u27 = SoundManager:playModifiableSound(GameSound.RAVEN_SPACE_AMBIENT);
        local Volume = u27.Volume;
        u27.Looped = true;
        u27.Volume = 0;
        local v28 = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
            moveSpeedMultiplier = MidnightConstants.MIDNIGHT_SPEED_BOOST
        });
        u19.activeMidnightMaid:GiveTask(v28);
        u19.activeMidnightMaid:GiveTask(function() -- Line: 117
            -- upvalues: TweenService (ref), u27 (copy)
            TweenService:Create(u27, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
                Volume = 0
            }):Play();
            task.delay(1, function() -- Line: 121
                -- upvalues: u27 (ref)
                u27:Destroy();
            end);
        end);
        local v29 = u2("Folder", {
            Name = "Disabled",
            Parent = Lighting
        });
        local u30 = Lighting:FindFirstChildWhichIsA("Atmosphere");
        local u31 = Lighting:FindFirstChildWhichIsA("SunRaysEffect");

        if u31 then
            u31.Parent = v29;
            u19.activeMidnightMaid:GiveTask(function() -- Line: 133
                -- upvalues: u31 (copy), Lighting (ref)
                u31.Parent = Lighting;
            end);
        end;

        local u32 = u30:Clone();
        local u33 = u2("ColorCorrectionEffect", {
            Parent = Lighting
        });
        local u34 = u2("DepthOfFieldEffect", {
            Name = "MidnightDepthOfField",
            FocusDistance = 19.76,
            InFocusRadius = 28.2,
            FarIntensity = 0,
            NearIntensity = 0,
            Parent = Lighting
        });
        local OutdoorAmbient = Lighting.OutdoorAmbient;
        local Ambient = Lighting.Ambient;
        local Brightness = Lighting.Brightness;
        Lighting.OutdoorAmbient = u24.outdoorAmbient;
        Lighting.Ambient = u24.ambient;
        Lighting.Brightness = u24.brightness;
        u19.activeMidnightMaid:GiveTask(u33);
        u19.activeMidnightMaid:GiveTask(u34);
        u19.activeMidnightMaid:GiveTask(function() -- Line: 157
            -- upvalues: Lighting (ref), OutdoorAmbient (copy), Ambient (copy), Brightness (copy), u32 (copy), u30 (copy)
            Lighting.OutdoorAmbient = OutdoorAmbient;
            Lighting.Ambient = Ambient;
            Lighting.Brightness = Brightness;
            u32.Parent = Lighting;
            u30:Destroy();
        end);
        local u35 = {};

        for _, v in CollectionService:GetTagged("DisableDuringMidnight") do
            if v:IsA("PointLight") and v.Enabled == true then
                v.Enabled = false;
                table.insert(u35, v);
            end;
        end;

        u19.activeMidnightMaid:GiveTask(function() -- Line: 171
            -- upvalues: u35 (copy)
            for _, v in u35 do
                v.Enabled = true;
            end;
        end);
        default(1, InQuad, function(p36) -- Line: 176
            -- upvalues: u33 (copy), u24 (copy), u34 (copy), u30 (copy), u32 (copy), u27 (copy), Volume (copy)
            u33.Brightness = -0.05 * p36;
            u33.Contrast = 0.05 * p36;
            u33.TintColor = Color3.fromRGB(255, 255, 255):Lerp(u24.correctionTintColor, p36);
            u34.FarIntensity = u24.farIntensity * p36;
            u30.Density = u24.atmosphereDensity * p36 + u32.Density * (1 - p36);
            u30.Color = u32.Color:Lerp(u24.atmosphereColor, p36);
            u30.Decay = u32.Decay:Lerp(u24.atmosphereDecay, p36);
            u30.Haze = u24.atmosphereHaze * p36 + u32.Haze * (1 - p36);
            u27.Volume = p36 * Volume;
        end, 0, 1);
    end;
end;

KnitClient.CreateController(u5.new());

return nil;