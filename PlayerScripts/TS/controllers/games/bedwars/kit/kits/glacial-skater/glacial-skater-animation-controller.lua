-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local SkatingSpeedAttr = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").SkatingSpeedAttr;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local GlacialSkaterBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "glacial-skater", "glacial-skater-balance").GlacialSkaterBalance;
local SkatingAttributeValues = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "glacial-skater", "skating-attribute-values").SkatingAttributeValues;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local GetAttribute = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "GlacialSkaterAnimationController";
    end,

    __index = BaseKitController
});
u3.__index = u3;

function u3.new(...) -- Line: 31
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 35
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p5, BedwarsKit.GLACIAL_SKATER);
    p5.Name = "GlacialSkaterAnimationController";
    p5.playerJumpAnimationTrack = {};
end;

function u3.KnitStart(p6) -- Line: 40
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p6);
end;

function u3.onKitLocalActivated(p7, p8) -- Line: 43
end;

function u3.onKitLocalDeactivated(p9) -- Line: 45
end;

function u3.onKitReplicationActivated(u10, u11) -- Line: 47
    -- upvalues: WatchCharacter (copy), KnitClient2 (copy), BedwarsKit (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), GlacialSkaterBalance (copy), GetAttribute (copy), SkatingSpeedAttr (copy), SkatingAttributeValues (copy)
    u11:GiveTask(WatchCharacter(function(p12, u13, u14) -- Line: 48
        -- upvalues: KnitClient2 (ref), BedwarsKit (ref), u10 (copy), SoundManager (ref), RandomUtil (ref), GameSound (ref), GlacialSkaterBalance (ref), GetAttribute (ref), SkatingSpeedAttr (ref), SkatingAttributeValues (ref), u11 (copy)
        if not KnitClient2.Controllers.KitController:isUsingKit(p12, BedwarsKit.GLACIAL_SKATER) then
            return nil;
        end;

        local Humanoid = u13:WaitForChild("Humanoid");
        local u15 = u10:setUpAnimationTrack(p12);
        local v16;

        if u15 == nil then
            v16 = u15;
        else
            v16 = u15.jumpTrack;
        end;

        if v16 then
            u14:GiveTask(u15.jumpTrack);
        end;

        local v17;

        if u15 == nil then
            v17 = u15;
        else
            v17 = u15.fastSkate;
        end;

        if v17 then
            u14:GiveTask(u15.fastSkate);
        end;

        local v18;

        if u15 == nil then
            v18 = u15;
        else
            v18 = u15.mediumSkate;
        end;

        if v18 then
            u14:GiveTask(u15.mediumSkate);
        end;

        local v19;

        if u15 == nil then
            v19 = u15;
        else
            v19 = u15.slowSkate;
        end;

        if v19 then
            u14:GiveTask(u15.slowSkate);
        end;

        if not u15 then
            return nil;
        end;

        local function _(p20) -- Line: 87
            -- upvalues: u14 (copy), SoundManager (ref), RandomUtil (ref), GameSound (ref), u13 (copy)
            u14:GiveTask(p20:GetMarkerReachedSignal("step"):Connect(function() -- Line: 88
                -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref), u13 (ref)
                SoundManager:playSound(RandomUtil.fromList(GameSound.ICE_SKATING_FOOTSTEP_1, GameSound.ICE_SKATING_FOOTSTEP_2, GameSound.ICE_SKATING_FOOTSTEP_3, GameSound.ICE_SKATING_FOOTSTEP_4, GameSound.ICE_SKATING_FOOTSTEP_5, GameSound.ICE_SKATING_FOOTSTEP_6), {
                    volumeMultiplier = 0.2,
                    position = u13:GetPivot().Position
                });
            end));
        end;

        for i, v in { u15.slowSkate, u15.mediumSkate, u15.fastSkate } do
            local _ = i - 1;
            u14:GiveTask(v:GetMarkerReachedSignal("step"):Connect(function() -- Line: 88
                -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref), u13 (copy)
                SoundManager:playSound(RandomUtil.fromList(GameSound.ICE_SKATING_FOOTSTEP_1, GameSound.ICE_SKATING_FOOTSTEP_2, GameSound.ICE_SKATING_FOOTSTEP_3, GameSound.ICE_SKATING_FOOTSTEP_4, GameSound.ICE_SKATING_FOOTSTEP_5, GameSound.ICE_SKATING_FOOTSTEP_6), {
                    volumeMultiplier = 0.2,
                    position = u13:GetPivot().Position
                });
            end));
        end;

        local u21 = nil;
        u14:GiveTask(Humanoid.Running:Connect(function(p22) -- Line: 99
            -- upvalues: GlacialSkaterBalance (ref), u21 (ref), GetAttribute (ref), u13 (copy), SkatingSpeedAttr (ref), SkatingAttributeValues (ref), u15 (copy)
            if p22 < GlacialSkaterBalance.MOVEMENT_SPEED_MIN then
                local v23 = u21;

                if v23 ~= nil then
                    v23:Stop();
                end;

                u21 = nil;

                return nil;
            end;

            local v24 = GetAttribute(u13, SkatingSpeedAttr) or SkatingAttributeValues.SkatingSpeed.SLOW;
            local slowSkate = u15.slowSkate;

            if v24 == SkatingAttributeValues.SkatingSpeed.SLOW then
                slowSkate = u15.slowSkate;
            elseif v24 == SkatingAttributeValues.SkatingSpeed.MEDIUM then
                slowSkate = u15.mediumSkate;
            elseif v24 == SkatingAttributeValues.SkatingSpeed.FAST then
                slowSkate = u15.fastSkate;
            end;

            if u21 ~= slowSkate then
                local v25 = u21;

                if v25 ~= nil then
                    v25:Stop();
                end;

                u21 = slowSkate;
                u21:Play();
            end;
        end));
        u14:GiveTask(Humanoid.StateChanged:Connect(function(p26, p27) -- Line: 133
            -- upvalues: u21 (ref), u15 (copy)
            if p26 ~= Enum.HumanoidStateType.Running then
                if p27 == Enum.HumanoidStateType.Landed and u15.jumpTrack.IsPlaying or p27 == Enum.HumanoidStateType.Running then
                    u15.StopJump();
                end;

                return;
            end;

            local v28 = u21;

            if v28 ~= nil then
                v28:Stop();
            end;

            u21 = nil;
        end));
        u11:GiveTask(u14);
    end));
end;

function u3.onKitReplicationDeactivated(p29) -- Line: 147
end;

function u3.onInnateAbilityEnabled(p30, p31, p32) -- Line: 149
end;

function u3.onAbilityUsed(p33, p34, p35) -- Line: 151
end;

function u3.playJumpAnimation(p36, p37) -- Line: 153
    p36:spinJumpInvisibility(p37);
    local v38 = p36.playerJumpAnimationTrack[p37];

    if v38 ~= nil then
        v38:Play(nil, nil, 3);
    end;
end;

function u3.setUpAnimationTrack(p39, p40) -- Line: 162
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy)
    local Character = p40.Character;

    if not Character then
        return nil;
    end;

    Character.Humanoid:WaitForChild("Animator", 5);
    local Animator = Character.Humanoid.Animator;

    if not Animator then
        return nil;
    end;

    local u41 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.SKATING_SLOW));
    u41.Looped = true;
    u41.Priority = Enum.AnimationPriority.Movement;
    local u42 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.SKATING_MEDIUIM));
    u42.Looped = true;
    u42.Priority = Enum.AnimationPriority.Movement;
    local u43 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.SKATING_FAST));
    u43.Looped = true;
    u43.Priority = Enum.AnimationPriority.Movement;
    local u44 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.SKATING_SPIN_JUMP));
    u44.Priority = Enum.AnimationPriority.Movement;
    u44.Looped = false;
    p39.playerJumpAnimationTrack[Character] = u44;

    return {
        slowSkate = u41,
        mediumSkate = u42,
        fastSkate = u43,
        jumpTrack = u44,

        StopSkate = function() -- Line: 192, Name: StopSkate
            -- upvalues: u41 (copy), u42 (copy), u43 (copy)
            u41:Stop();
            u42:Stop();
            u43:Stop();
        end,

        StopJump = function() -- Line: 197, Name: StopJump
            -- upvalues: u44 (copy)
            u44:Stop();
        end
    };
end;

function u3.spinJumpInvisibility(p45, p46) -- Line: 202
    -- upvalues: EntityUtil (copy), KnitClient (copy), RuntimeLib (copy), GlacialSkaterBalance (copy)
    local u47 = EntityUtil:getEntity(p46);

    if u47 ~= nil then
        u47 = u47:getInstance();
    end;

    if not u47 then
        return nil;
    end;

    local u48 = {
        transparency = 0.7
    };
    KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(u47):addModifier(u48);
    RuntimeLib.Promise.delay(GlacialSkaterBalance.DODGE_BUFFER_TIME):andThen(function() -- Line: 215
        -- upvalues: KnitClient (ref), u47 (copy), u48 (copy)
        KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(u47):removeModifier(u48);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;