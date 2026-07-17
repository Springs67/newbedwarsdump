-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local InOutExpo = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutExpo;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out");
local scaleModel = v5.scaleModel;
local scalePart = v5.scalePart;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Debris = v6.Debris;
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local RunService = v6.RunService;
local UserInputService = v6.UserInputService;
local Workspace = v6.Workspace;
local ShieldMobileUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "shielder", "shield-mobile-ui").ShieldMobileUI;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 36, Name: __tostring
        return "GlitchShieldController";
    end,

    __index = HandKnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 42
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 46
    -- upvalues: HandKnitController (copy), default2 (copy), u2 (copy)
    HandKnitController.constructor(p9);
    p9.Name = "GlitchShieldController";
    p9.infernalShieldState = default2.Client:Get("UseGlitchShield");
    p9.maid = u2.new();
    p9.raisedMaid = u2.new();
    p9.lastShieldRaised = 0;
end;

function u7.isRelevantItem(p10, p11) -- Line: 54
    -- upvalues: ItemType (copy)
    return p11.itemType == ItemType.GLITCH_INFERNAL_SHIELD;
end;

function u7.onEnable(u12, p13, p14) -- Line: 57
    -- upvalues: UserInputService (copy), Flamework (copy), u4 (copy), ShieldMobileUI (copy), Players (copy)
    if UserInputService.KeyboardEnabled or UserInputService.GamepadEnabled then
        local v18 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
            action = "Attack",
            actionId = "glitch-infernal-shield-click",

            boundFunction = function(p15, p16, p17) -- Line: 63, Name: boundFunction
                -- upvalues: u12 (copy)
                if p16 == Enum.UserInputState.Begin then
                    u12:raiseShield();

                    return;
                end;

                if p16 == Enum.UserInputState.End then
                    u12:lowerShield();
                end;
            end
        });
        u12.maid:GiveTask(v18);
    end;

    if UserInputService.TouchEnabled then
        u12:setupYield(function() -- Line: 74
            -- upvalues: u4 (ref), ShieldMobileUI (ref), u12 (copy), Players (ref)
            local u20 = u4.mount(u4.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u4.createElement(ShieldMobileUI, {
                    OnChange = function(p19) -- Line: 79, Name: OnChange
                        -- upvalues: u12 (ref)
                        if p19 then
                            u12:raiseShield();

                            return;
                        end;

                        u12:lowerShield();
                    end
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));

            return function() -- Line: 88
                -- upvalues: u4 (ref), u20 (copy)
                u4.unmount(u20);
            end;
        end);
    end;
end;

function u7.onDisable(p21) -- Line: 94
    p21:lowerShield();
    p21.maid:DoCleaning();
end;

function u7.KnitStart(u22) -- Line: 98
    -- upvalues: HandKnitController (copy), default2 (copy), ReplicatedStorage (copy), Workspace (copy), GameQueryUtil (copy), scalePart (copy), Debris (copy), SoundManager (copy), GameSound (copy), Players (copy)
    HandKnitController.KnitStart(u22);
    default2.Client:OnEvent("ReflectGlitchProjectileEffects", function(p23) -- Line: 100
        -- upvalues: u22 (copy)
        u22:playEffects(p23.player);
    end);
    default2.Client:OnEvent("GlitchProjectileDeflected", function(p24) -- Line: 103
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), GameQueryUtil (ref), scalePart (ref), Debris (ref), SoundManager (ref), GameSound (ref), Players (ref)
        local v25 = ReplicatedStorage.Assets.Effects.GlitchExplosion:Clone();
        v25.Position = p24.position;
        v25.Parent = Workspace;
        GameQueryUtil:setQueryIgnored(v25, true);
        scalePart(v25, 0.2);

        local function _(p26) -- Line: 110
            if p26:IsA("ParticleEmitter") then
                p26:Emit(30);
            end;
        end;

        for i, descendant in v25:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") then
                descendant:Emit(30);
            end;
        end;

        Debris:AddItem(v25, 1);
        local SHIELD_BLOCKED = GameSound.SHIELD_BLOCKED;
        local v27 = {};
        local v28;

        if p24.deflector == Players.LocalPlayer then
            v28 = nil;
        else
            v28 = p24.position;
        end;

        v27.position = v28;
        SoundManager:playSound(SHIELD_BLOCKED, v27);
    end);
end;

function u7.raiseShield(u29) -- Line: 124
    -- upvalues: u3 (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), KnitClient (copy)
    if os.clock() - u29.lastShieldRaised < 0.2 then
        return nil;
    end;

    u29.lastShieldRaised = os.clock();
    u29.infernalShieldState:SendToServer({
        raised = true
    });
    u29.raisedMaid:GiveTask(function() -- Line: 132
        -- upvalues: u29 (copy)
        u29.infernalShieldState:SendToServer({
            raised = false
        });
    end);
    local v30 = u3("Animation", {
        AnimationId = GameAnimationUtil:getAssetId(AnimationType.KNIGHT_SHIELD_RAISE_SHIELD)
    });
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild("Humanoid");
    end;

    local v31;

    if Character == nil then
        v31 = Character;
    else
        v31 = Character:FindFirstChild("Animator");
    end;

    if Character and v31 then
        local u32 = v31:LoadAnimation(v30);
        u32.Looped = true;
        u32:Play();
        u29.raisedMaid:GiveTask(function() -- Line: 154
            -- upvalues: u32 (copy)
            u32:Stop();
            u32:Destroy();
        end);
        local u33 = KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_SHIELD_USE, {
            looped = true
        });
        u29.raisedMaid:GiveTask(function() -- Line: 161
            -- upvalues: u33 (copy)
            local v34 = u33;

            if v34 ~= nil then
                v34:Stop();
            end;
        end);
        u29.raisedMaid:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
            moveSpeedMultiplier = 0.9
        }));
    end;
end;

function u7.lowerShield(p35) -- Line: 172
    p35.raisedMaid:DoCleaning();
end;

function u7.playEffects(u36, p37) -- Line: 175
    -- upvalues: EntityUtil (copy), u2 (copy), ReplicatedStorage (copy), scaleModel (copy), Workspace (copy), GameQueryUtil (copy), ModelUtil (copy), InOutExpo (copy), RunService (copy), default (copy)
    local u38 = EntityUtil:getEntity(p37);

    if u38 == nil then
        return nil;
    end;

    local u39 = u2.new();
    local u40 = ReplicatedStorage.Assets.Effects.GlitchInfernalShields:Clone();
    u40:PivotTo(u38:getInstance():GetPrimaryPartCFrame());
    scaleModel(u40, 0.06);
    u40.Parent = Workspace;

    for _, child in u40:GetChildren() do
        if child:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(child, true);
        end;
    end;

    ModelUtil.tweenModelSize(u40, 0, InOutExpo, 10);
    local u41 = 0;
    local u46 = RunService.Heartbeat:Connect(function(p42) -- Line: 192
        -- upvalues: u38 (copy), u41 (ref), u40 (copy), u36 (copy), u39 (copy), default (ref)
        local v43 = u38:getInstance():GetPrimaryPartCFrame();
        local v44 = CFrame.new(v43.Position);
        local v45 = CFrame.Angles(0, u41 * 0.8, 0);
        u40.Shields.CFrame = (v44 + Vector3.new(0, -0.25, 0)) * v45;

        if not u36:validPlayerConditions(u38) then
            u39:DoCleaning();

            return nil;
        end;

        u41 = u41 + p42;

        if u40.PrimaryPart == nil then
            default.Error("Shield effect has no primary part");

            return nil;
        end;
    end);
    u39:GiveTask(function() -- Line: 208
        -- upvalues: u46 (copy), u40 (copy)
        u46:Disconnect();
        u40:Destroy();
    end);
end;

function u7.validPlayerConditions(p47, p48) -- Line: 213
    -- upvalues: ItemType (copy)
    if not p48:isAlive() then
        return false;
    end;

    if p48:getInstance():GetAttribute("GlitchShieldRaised") ~= true then
        return false;
    end;

    local v49 = p48:getItemInHand();

    if v49 ~= nil then
        v49 = v49.Name;
    end;

    if v49 == ItemType.GLITCH_INFERNAL_SHIELD then
        return p48:getInstance().PrimaryPart ~= nil;
    end;

    return false;
end;

KnitClient.CreateController(u7.new());

return nil;