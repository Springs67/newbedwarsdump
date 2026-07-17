-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local Linear = v1.Linear;
local OutBack = v1.OutBack;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local scalePart = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scalePart;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "SummonSnowEmoteController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 31
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 35
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "SummonSnowEmoteController";
end;

function u4.KnitStart(p7) -- Line: 39
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), u2 (copy), scalePart (copy), WeldUtil (copy), GameAnimationUtil (copy), AnimationType (copy), Workspace (copy), default (copy), OutBack (copy), EffectUtil (copy), GameSound (copy), Linear (copy)
    KnitController.KnitStart(p7);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local SUMMON_SNOW = EmoteType.SUMMON_SNOW;
    local u8 = EmoteHandler;
    local u9 = setmetatable({}, {
        __tostring = function() -- Line: 47, Name: __tostring
            return "Anonymous";
        end,

        __index = u8
    });
    u9.__index = u9;

    function u9.new(...) -- Line: 53
        -- upvalues: u9 (ref)
        local v10 = setmetatable({}, u9);

        return v10:constructor(...) or v10;
    end;

    function u9.constructor(p11, ...) -- Line: 57
        -- upvalues: u8 (copy)
        u8.constructor(p11, ...);
    end;

    function u9.onEnable(u12, u13, u14, p15, u16) -- Line: 60
        -- upvalues: ReplicatedStorage (ref), u2 (ref), scalePart (ref), WeldUtil (ref), GameAnimationUtil (ref), AnimationType (ref), Workspace (ref), default (ref), OutBack (ref), EffectUtil (ref), GameSound (ref), Linear (ref)
        local u17 = ReplicatedStorage.Assets.Misc.ChristmasTreeOrb.Spirit:Clone();
        u17.Name = "Handle";
        u17.Anchored = false;
        local u18 = u2("Attachment", {
            Name = "LeftGripAttachment",
            Orientation = Vector3.new(0, 130, 0),
            Position = Vector3.new(1, 0, 0),
            Parent = u17
        });
        scalePart(u17, 0.5);
        local u19 = u2("Accessory", {
            Children = { u17 }
        });
        u19.Parent = u14;
        u16:GiveTask(u19);
        WeldUtil:weldCharacterAccessories(u14);
        local u20 = GameAnimationUtil:getAssetId(AnimationType.SUMMON_SNOW);
        u16:GiveTask((u14.Humanoid.Animator.AnimationPlayed:Connect(function(p21) -- Line: 81
            -- upvalues: u20 (copy), ReplicatedStorage (ref), u16 (copy), u17 (copy), u18 (copy), u19 (copy), Workspace (ref), default (ref), OutBack (ref), EffectUtil (ref), u12 (copy), GameSound (ref), u13 (copy), Linear (ref), u14 (copy)
            local Animation = p21.Animation;

            if Animation ~= nil then
                Animation = Animation.AnimationId;
            end;

            if Animation ~= u20 then
                return nil;
            end;

            local u22 = ReplicatedStorage.Assets.Effects.SnowflakeFallPart:Clone();
            local u23 = ReplicatedStorage.Assets.Effects.SnowBlast:Clone();
            u16:GiveTask(u22);
            u16:GiveTask(u23);
            local v24;

            if p21 == nil then
                v24 = p21;
            else
                v24 = p21:GetMarkerReachedSignal("LeaveHand"):Connect(function() -- Line: 96
                    -- upvalues: u17 (ref), u18 (ref), u19 (ref), Workspace (ref), default (ref), OutBack (ref), u23 (copy), EffectUtil (ref), u12 (ref), GameSound (ref), u13 (ref), Linear (ref), u22 (copy), u14 (ref)
                    u17.Anchored = true;
                    u18:Destroy();
                    u19.Parent = Workspace;
                    local CFrame2 = u17.CFrame;
                    local CFrame3 = u17.CFrame;
                    local v25 = CFrame.Angles(41252.96124941927, 0, 0);
                    local u26 = (CFrame3 + Vector3.new(0, 1, 0)) * v25;
                    default(1.15, OutBack, function(p27) -- Line: 106
                        -- upvalues: u17 (ref), CFrame2 (copy), u26 (copy)
                        u17:PivotTo(CFrame2:Lerp(u26, p27));
                    end);
                    task.delay(0.8499999999999999, function() -- Line: 109
                        -- upvalues: u23 (ref), u17 (ref), EffectUtil (ref), u12 (ref), GameSound (ref), u13 (ref), u26 (copy), default (ref), Linear (ref), u22 (ref), Workspace (ref), u14 (ref)
                        if not u23 then
                            return nil;
                        end;

                        u23:PivotTo(u17.CFrame);
                        u23.Parent = u17;
                        EffectUtil:playEffects({ u17 }, nil, {
                            destroyAfterSec = 1
                        });
                        u12:playSound(GameSound.CHRISTMAS_ELDERTREE_PICKUP_5, u13, {
                            position = u26.Position
                        });
                        default(0.7, Linear, function(p28) -- Line: 123
                            -- upvalues: u17 (ref)
                            u17.Transparency = p28;
                        end);
                        u22.Size = Vector3.new(10, 0.5, 10);
                        u22.Anchored = true;
                        u22.Parent = Workspace;
                        u22:PivotTo(u14:GetPivot() + Vector3.new(0, 6, 0));
                    end);
                end);
            end;

            u16:GiveTask(v24);
            local v29;

            if p21 == nil then
                v29 = p21;
            else
                v29 = p21:GetMarkerReachedSignal("Summon"):Connect(function() -- Line: 140
                end);
            end;

            u16:GiveTask(v29);

            if p21 ~= nil then
                p21 = p21:GetMarkerReachedSignal("End"):Connect(function() -- Line: 146
                    -- upvalues: u22 (copy), u16 (ref)
                    if u22 then
                        local function _(p30) -- Line: 150
                            if p30:IsA("ParticleEmitter") then
                                p30.Enabled = false;
                            end;
                        end;

                        for i, descendant in u22:GetDescendants() do
                            local _ = i - 1;

                            if descendant:IsA("ParticleEmitter") then
                                descendant.Enabled = false;
                            end;
                        end;
                    end;

                    task.delay(2, function() -- Line: 159
                        -- upvalues: u16 (ref)
                        u16:DoCleaning();
                    end);
                end);
            end;

            u16:GiveTask(p21);
        end)));
    end;

    function u9.onDisable(p31, p32, p33, p34) -- Line: 168
    end;

    EmoteHandlerController:registerHandler(SUMMON_SNOW, u9);
end;

KnitClient.CreateController(u4.new());

return nil;