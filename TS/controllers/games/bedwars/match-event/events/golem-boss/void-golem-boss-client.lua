-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local getCurrentStatefulEntitySkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-skin-theme-meta").getCurrentStatefulEntitySkinMeta;
local StatefulEntityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-type").StatefulEntityType;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golem-boss", "golem-boss-constants");
local GolemBossAction = v3.GolemBossAction;
local VOID_GOLEM_LASER_DELAY = v3.VOID_GOLEM_LASER_DELAY;
local VOID_GOLEM_LASER_DURATION = v3.VOID_GOLEM_LASER_DURATION;
local VoidGolemBossConstants = v3.VoidGolemBossConstants;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatefulEntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil;
local GolemBossClient = RuntimeLib.import(script, script.Parent, "golem-boss-client").GolemBossClient;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "VoidGolemBossClient";
    end,

    __index = GolemBossClient
});
u4.__index = u4;

function u4.new(...) -- Line: 37
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7, p8, p9) -- Line: 41
    -- upvalues: GolemBossClient (copy)
    GolemBossClient.constructor(p6, p7, p8, p9);
end;

function u4.createGameEntity(p10, p11) -- Line: 44
    -- upvalues: getCurrentStatefulEntitySkinMeta (copy), StatefulEntityType (copy), StatefulEntityUtil (copy), Workspace (copy)
    local v12 = getCurrentStatefulEntitySkinMeta(StatefulEntityType.VOID_GOLEM_BOSS).model:Clone();
    v12:WaitForChild("RootPart").Anchored = true;
    StatefulEntityUtil:setEntityIgnoreQuery(v12);
    StatefulEntityUtil:setClientEntityNotCollidable(v12);
    v12:PivotTo(p11);
    p10.gameEntity = v12;
    StatefulEntityUtil:hideStatefulEntity(p10.gameEntity);
    v12.Parent = Workspace;
    p10:registerClientGameEntity(v12);
end;

function u4.handleActionRequest(p13, p14, p15) -- Line: 59
    -- upvalues: GolemBossClient (copy), GolemBossAction (copy)
    GolemBossClient.handleActionRequest(p13, p14, p15);

    if p14 == GolemBossAction.VOID_PORTAL_ATTACK then
        p13:handleVoidPortalAttack(p15);
    end;
end;

function u4.handleVoidPortalAttack(p16, p17) -- Line: 65
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), StatefulEntityUtil (copy), SoundManager (copy), GameSound (copy), VoidGolemBossConstants (copy), RandomUtil (copy), KnitClient (copy), VOID_GOLEM_LASER_DURATION (copy)
    if not p16.gameEntity or (not p16.gameEntity.Parent or p16.isDead) then
        return nil;
    end;

    if p17.firstPortal then
        AnimationUtil:playAnimation(p16.gameEntity, GameAnimationUtil:getAssetId(AnimationType.VOID_GOLEM_PORTAL_ATTACK), {
            looped = false
        });
        local Position = StatefulEntityUtil:getGameEntityCFrame(p16.gameEntity).Position;
        SoundManager:playSound(GameSound.VOID_TITAN_PORTAL_ATTACK, {
            volumeMultiplier = 2,
            position = Position
        });
        task.wait(VoidGolemBossConstants.VOID_GOLEM_PORTAL_ANIMATION_DELAY);
    end;

    local portalPosition = p17.portalPosition;
    SoundManager:playSound(RandomUtil.fromList(unpack(VoidGolemBossConstants.VOID_GOLEM_PORTAL_OPEN_SOUNDS)), {
        position = portalPosition
    });
    p16:createPortal(portalPosition, p17.dangerPosition);
    local v18 = p16:getDangerPositions(p17.dangerPosition);
    KnitClient.Controllers.GolemBossController:showDangerIndicators(v18);
    task.delay(VOID_GOLEM_LASER_DURATION, function() -- Line: 88
        -- upvalues: KnitClient (ref)
        KnitClient.Controllers.GolemBossController:hideAllBlockDangerIndicators();
    end);
end;

function u4.getDangerPositions(p19, p20) -- Line: 92
    local v21 = {};

    for _, v in { Vector3.new(0, 0, 0), Vector3.new(1, 0, 1), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0), Vector3.new(-1, 0, 0), Vector3.new(0, 0, -1), Vector3.new(-1, 0, -1), Vector3.new(1, 0, -1), Vector3.new(-1, 0, 1) } do
        table.insert(v21, p20 + v);
    end;

    return v21;
end;

function u4.createPortal(u22, p23, p24) -- Line: 101
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), VOID_GOLEM_LASER_DELAY (copy), TweenService (copy), VOID_GOLEM_LASER_DURATION (copy)
    local u25 = ReplicatedStorage.Assets.Effects.TitanVoidPortal:Clone();
    u25.Parent = Workspace;
    u25:ScaleTo(0.01);
    local v26 = CFrame.fromEulerAnglesXYZ(0, 0, -1.5707963267948966);
    u25:PivotTo(CFrame.new(p23) * v26);
    u22:scalePortal(u25, 1, 0.75);
    task.delay(VOID_GOLEM_LASER_DELAY, function() -- Line: 111
        -- upvalues: u25 (copy), TweenService (ref), VOID_GOLEM_LASER_DURATION (ref), u22 (copy)
        local BottomAttachment = u25.beam.BottomAttachment;
        local WorldCFrame = BottomAttachment.WorldCFrame;
        local v27 = TweenService:Create(BottomAttachment, TweenInfo.new(0.25), {
            WorldCFrame = CFrame.new(WorldCFrame.X, WorldCFrame.Y - 22.2, WorldCFrame.Z) * CFrame.Angles(0, 3.141592653589793, -1.5707963267948966)
        });
        v27:Play();
        v27.Completed:Connect(function() -- Line: 123
            -- upvalues: BottomAttachment (copy)
            local function _(p28) -- Line: 125
                if p28:IsA("ParticleEmitter") then
                    p28.Enabled = true;
                end;
            end;

            for i, descendant in BottomAttachment:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("ParticleEmitter") then
                    descendant.Enabled = true;
                end;
            end;
        end);
        local u29 = TweenService:Create(BottomAttachment, TweenInfo.new(0.25), {
            WorldCFrame = WorldCFrame
        });
        task.delay(VOID_GOLEM_LASER_DURATION, function() -- Line: 137
            -- upvalues: BottomAttachment (copy), u29 (copy)
            local function _(p30) -- Line: 139
                if p30:IsA("ParticleEmitter") then
                    p30.Enabled = false;
                end;
            end;

            for i, descendant in BottomAttachment:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("ParticleEmitter") then
                    descendant.Enabled = false;
                end;
            end;

            u29:Play();
        end);
        u29.Completed:Connect(function() -- Line: 149
            -- upvalues: u22 (ref), u25 (ref)
            u22:scalePortal(u25, 0.01, 0.75);
            task.delay(0.75, function() -- Line: 151
                -- upvalues: u25 (ref)
                u25:Destroy();
            end);
        end);
    end);

    return u25;
end;

function u4.scalePortal(p31, u32, u33, u34) -- Line: 158
    -- upvalues: RunService (copy)
    local u35 = u32:GetScale();
    local u36 = 0;
    local u37 = nil;
    u37 = RunService.Heartbeat:Connect(function(p38) -- Line: 163
        -- upvalues: u36 (ref), u34 (copy), u35 (copy), u33 (copy), u32 (copy), u37 (ref)
        u36 = u36 + p38;
        local v39 = math.clamp(u36 / u34, 0, 1);
        u32:ScaleTo(u35 + (u33 - u35) * v39);

        if v39 >= 1 then
            u37:Disconnect();
        end;
    end);
end;

return {
    VoidGolemBossClient = u4
};