-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src", "Knit", "KnitClient");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "OasisController";
    end,

    __index = BaseKitController
});
u5.__index = u5;

function u5.new(...) -- Line: 30
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 34
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy), default (copy)
    BaseKitController.constructor(p7, BedwarsKit.OASIS, {
        sounds = {
            GameSound.OASIS_HEAL_PROJECTILE_1,
            GameSound.OASIS_HEAL_PROJECTILE_2,
            GameSound.OASIS_HEAL_PROJECTILE_3,
            GameSound.OASIS_HEAL_PROJECTILE_4,
            GameSound.OASIS_BUFF_PROJECTILE_1,
            GameSound.OASIS_BUFF_PROJECTILE_2,
            GameSound.OASIS_BUFF_PROJECTILE_3,
            GameSound.OASIS_BUFF_PROJECTILE_4,
            GameSound.OASIS_SWAP_BUFF,
            GameSound.OASIS_SWAP_HEAL,
            GameSound.OASIS_WATER_VEIL_APPLY,
            GameSound.OASIS_WATER_VEIL_LOOP,
            GameSound.OASIS_CANNOT_TARGET
        }
    });
    p7.Name = "OasisController";
    p7.healVeilTargetRemote = default.Client:Get("HealVeilTargetsSelected");
    p7.healVeilEndedEarlyRemote = default.Client:Get("HealVeilEndedEarly");
    p7.healVeilEffectMaids = {};
end;

function u5.KnitStart(u8) -- Line: 43
    -- upvalues: BaseKitController (copy), Players (copy)
    BaseKitController.KnitStart(u8);
    u8.healVeilTargetRemote:Connect(function(p9, p10, p11) -- Line: 45
        -- upvalues: Players (ref), u8 (copy)
        local v12 = Players:GetPlayerByUserId(p9);

        if not v12 then
            return nil;
        end;

        local function _(p13) -- Line: 51
            -- upvalues: Players (ref)
            return Players:GetPlayerByUserId(p13);
        end;

        local v14 = 0;
        local v15 = {};

        for i, v in p10 do
            local _ = i - 1;
            local v16 = Players:GetPlayerByUserId(v);

            if v16 ~= nil then
                v14 = v14 + 1;
                v15[v14] = v16;
            end;
        end;

        if #v15 == 0 then
            return nil;
        end;

        u8:playWaterVeilUserEffect(v12);

        for _, v in v15 do
            u8:createWaterVeilEffect(v, p11);
        end;
    end);
    u8.healVeilEndedEarlyRemote:Connect(function(p17) -- Line: 74
        -- upvalues: u8 (copy)
        local v18 = u8.healVeilEffectMaids[p17];

        if v18 ~= nil then
            v18:DoCleaning();
        end;
    end);
end;

function u5.onKitLocalActivated(p19, p20) -- Line: 83
end;

function u5.onKitLocalDeactivated(p21) -- Line: 85
end;

function u5.onKitReplicationActivated(p22, p23) -- Line: 87
end;

function u5.onKitReplicationDeactivated(p24) -- Line: 89
end;

function u5.onInnateAbilityEnabled(p25, p26, p27) -- Line: 91
end;

function u5.onAbilityUsed(p28, p29, p30) -- Line: 93
end;

function u5.playWaterVeilUserEffect(p31, p32) -- Line: 95
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), KnitClient (copy)
    AnimationUtil:playAnimation(p32, GameAnimationUtil:getAssetId(AnimationType.PUNCH));

    if p32 == Players.LocalPlayer then
        KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_USE_ITEM);
    end;
end;

function u5.createWaterVeilEffect(p33, u34, p35) -- Line: 101
    -- upvalues: ReplicatedStorage (copy), u3 (copy), Players (copy), u2 (copy), WeldUtil (copy), SoundManager (copy), GameSound (copy), Workspace (copy)
    if not u34.Character then
        return nil;
    end;

    local u36 = ReplicatedStorage.Assets.Effects.OasisWaterVeil:Clone();
    local u37 = u3.new();
    u37:GiveTask(u36);
    p33.healVeilEffectMaids[u34.UserId] = u37;

    local function u40(u38) -- Line: 111
        -- upvalues: u36 (copy), u34 (copy), Players (ref), u2 (ref)
        local function _(p39) -- Line: 113
            -- upvalues: u34 (ref), Players (ref), u2 (ref), u38 (copy)
            if not (p39:IsA("ParticleEmitter") or p39:IsA("Beam")) then
                return nil;
            end;

            if u34 == Players.LocalPlayer and (u2.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 and u38) then
                return nil;
            end;

            p39.Enabled = u38;
        end;

        for i, descendant in u36:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") or descendant:IsA("Beam") then
                if u34 ~= Players.LocalPlayer or (u2.Controllers.CameraPerspectiveController:getCameraPerspective() ~= 0 or not u38) then
                    descendant.Enabled = u38;
                end;
            end;
        end;
    end;

    u40(false);
    u36.Parent = u34.Character;
    WeldUtil:weldAccessory(u34.Character, u36);
    u40(true);
    local u41 = u3.new();

    if u34 == Players.LocalPlayer then
        local v42 = SoundManager:playSound(GameSound.OASIS_WATER_VEIL_APPLY, {
            position = nil
        });
        local v43 = SoundManager:playSound(GameSound.OASIS_WATER_VEIL_LOOP, {
            position = nil
        });
        u41:GiveTask(v42);
        u41:GiveTask(v43);
        u37:GiveTask(u41);
    end;

    local v44 = p35 - Workspace:GetServerTimeNow();
    task.delay(v44, function() -- Line: 144
        -- upvalues: u40 (copy), u41 (copy), u37 (copy)
        u40(false);
        u41:DoCleaning();
        task.wait(1);
        u37:DoCleaning();
    end);
end;

KnitClient.CreateController(u5.new());

return nil;