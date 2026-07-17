-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InOutQuad = v2.InOutQuad;
local Linear = v2.Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "TuckInKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 33
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 37
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, p8);
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(p9, p10, p11, p12) -- Line: 41
    -- upvalues: u3 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), PlaceUtil (copy), DeviceUtil (copy), KnitClient (copy), ColorUtil (copy), SoundManager (copy), GameSound (copy), RuntimeLib (copy), default (copy), InOutQuad (copy), Linear (copy)
    local u13 = u3.new();
    p11.Archivable = true;
    local u14 = p11:Clone();
    u14.HumanoidRootPart.Anchored = true;
    u14.Parent = Workspace;
    u13:GiveTask(u14);
    local _DamageHighlight_ = u14:FindFirstChild("_DamageHighlight_");

    if _DamageHighlight_ then
        _DamageHighlight_:Destroy();
    end;

    KillEffect.hideCharacter(p9, p11);
    local u15 = ReplicatedStorage.Assets.Misc.TuckInBed:Clone();
    local u16 = p12.Position + Vector3.new(0, -3, -6);
    u15:PivotTo(CFrame.new(u16));
    local v17;

    if PlaceUtil.isGameServer() and not DeviceUtil.isHoarceKat() then
        v17 = KnitClient.Controllers.TeamController:getPlayerTeam(p10);

        if v17 ~= nil then
            v17 = v17.color;
        end;
    else
        v17 = Color3.fromRGB(255, 255, 255);
    end;

    if v17 then
        u15.Pivot.Blanket.Color = ColorUtil.brighten(v17, 0.2);
        u15.Pivot.Mattress.Color = v17;
    end;

    u15.Parent = Workspace;
    u13:GiveTask(u15);
    local u18 = SoundManager:playModifiableSound(GameSound.TUCK_IN_KILL_EFFECT_MUSIC, {
        position = u15:GetPivot().Position,
        parent = u15:FindFirstChildOfClass("BasePart")
    });
    u18:Pause();
    u13:GiveTask(function() -- Line: 86
        -- upvalues: u18 (copy)
        u18:Stop();
        u18:Destroy();
    end);
    local u32 = RuntimeLib.Promise.new(function() -- Line: 90
        -- upvalues: u14 (copy), u16 (copy), default (ref), InOutQuad (ref), u13 (copy), u18 (copy), u15 (copy), Linear (ref)
        local u19 = u14:GetPivot();
        local u20 = CFrame.new(u16 + Vector3.new(0, 6.5, 0)) * CFrame.Angles(0, 3.141592653589793, 0);
        local u22 = default(1, InOutQuad, function(p21) -- Line: 99
            -- upvalues: u19 (copy), u20 (copy), u14 (ref)
            u14:PivotTo((u19:Lerp(u20, p21)));
        end, 0, 1);
        u13:GiveTask(function() -- Line: 103
            -- upvalues: u22 (copy)
            u22:Cancel();
        end);
        u22:Play():Wait();
        u18:Play();
        local u23 = CFrame.new(u16 + Vector3.new(0, 2.6, -0.2)) * CFrame.Angles(-158.65042900628455, 3.141592653589793, 0);
        local u25 = default(1, InOutQuad, function(p24) -- Line: 116
            -- upvalues: u20 (copy), u23 (copy), u14 (ref)
            u14:PivotTo((u20:Lerp(u23, p24)));
        end, 0, 1);
        u13:GiveTask(function() -- Line: 120
            -- upvalues: u25 (copy)
            u25:Cancel();
        end);
        u25:Play():Wait();
        local Blanket = u15.Pivot.Blanket;
        local Size = Blanket.Size;
        local Position = Blanket.Position;
        local u26 = u15:GetPivot().Position + Vector3.new(0, 2.727, 1.387);
        local u30 = default(1, InOutQuad, function(p27) -- Line: 132
            -- upvalues: Size (copy), Position (copy), u26 (copy), Blanket (copy)
            local v28 = Size:Lerp(Vector3.new(5.577, 1.522, 5.491), p27);
            local v29 = Position:Lerp(u26, p27);
            Blanket.Size = v28;
            Blanket.Position = v29;
        end, 0, 1);
        u13:GiveTask(function() -- Line: 138
            -- upvalues: u30 (copy)
            u30:Cancel();
        end);
        u30:Play():Wait();

        if u18 then
            task.spawn(function() -- Line: 145
                -- upvalues: default (ref), Linear (ref), u18 (ref)
                default(3, Linear, function(p31) -- Line: 146
                    -- upvalues: u18 (ref)
                    if not u18 then
                        return nil;
                    end;

                    u18.Volume = 1 - p31;
                end, 0, 1):Play():Wait();
                u18:Stop();
                u18:Destroy();
            end);
        end;

        task.wait(3);
        u13:DoCleaning();
    end);
    u13:GiveTask(function() -- Line: 160
        -- upvalues: u32 (copy)
        return u32:cancel();
    end);

    return u13;
end;

return u5;