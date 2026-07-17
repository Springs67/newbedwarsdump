-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = {
    Color3.fromRGB(255, 171, 0),
    Color3.fromRGB(245, 163, 38),
    Color3.fromRGB(224, 171, 46),
    Color3.fromRGB(237, 186, 71)
};
local u4 = {
    ColorUtil.hexColor(65280),
    ColorUtil.hexColor(59391),
    ColorUtil.hexColor(65313),
    ColorUtil.hexColor(9573)
};
local u5 = {
    ColorUtil.hexColor(14021119),
    ColorUtil.hexColor(2498925),
    ColorUtil.hexColor(11206655),
    ColorUtil.hexColor(2502500)
};
local u6 = ColorUtil.hexColor(45122);
local u7 = ColorUtil.hexColor(7704721);
local u8 = { 0, 0.442, 0.692, 1 };
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "PoisonFogEffectController";
    end,

    __index = KnitController
});
u9.__index = u9;

function u9.new(...) -- Line: 29
    -- upvalues: u9 (ref)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11) -- Line: 33
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p11);
    p11.Name = "PoisonFogEffectController";
    p11.maid = u2.new();
    p11.poisonCountdownMaid = u2.new();
end;

function u9.KnitStart(u12) -- Line: 39
    -- upvalues: KnitController (copy), default2 (copy), SoundManager (copy), GameSound (copy), u3 (copy)
    KnitController.KnitStart(u12);
    default2.Client:Get("HalloweenPoisonWarning"):Connect(function() -- Line: 41
        -- upvalues: SoundManager (ref), GameSound (ref), u12 (copy), u3 (ref)
        SoundManager:playSound(GameSound.COUNTDOWN_GAMESTART, {
            volumeMultiplier = 1
        });
        u12:changeColors({
            layer1 = u3,
            layer3 = Color3.fromRGB(227, 145, 26)
        }, {
            layer1 = u3,
            layer3 = Color3.fromRGB(227, 145, 26)
        });
    end);
    default2.Client:Get("SetHalloweenPoisonEnabled"):Connect(function(p13) -- Line: 53
        -- upvalues: u12 (copy)
        if p13 then
            u12:enablePoison();

            return;
        end;

        u12:disablePoisonEffect();
    end);
end;

function u9.enablePoisonCountdownSound(p14, p15) -- Line: 61
    -- upvalues: SoundManager (copy), GameSound (copy)
    local u16 = p15 == nil and 1 or p15;
    p14.poisonCountdownMaid:DoCleaning();
    local u17 = true;
    p14.poisonCountdownMaid:GiveTask(function() -- Line: 67
        -- upvalues: u17 (ref)
        u17 = false;
    end);
    task.spawn(function() -- Line: 70
        -- upvalues: SoundManager (ref), GameSound (ref), u16 (ref), u17 (ref)
        while true do
            SoundManager:playSound(GameSound.COUNTDOWN_TICK);
            local v18 = task.wait(u16);

            if v18 ~= 0 and (v18 == v18 and v18) then
                v18 = u17;
            end;

            if v18 == 0 or (v18 ~= v18 or not v18) then
                return;
            end;
        end;
    end);
end;

function u9.enablePoison(p19) -- Line: 82
    -- upvalues: SoundManager (copy), GameSound (copy), u4 (copy), u6 (copy)
    p19.poisonCountdownMaid:DoCleaning();
    SoundManager:playSound(GameSound.LUNAR_VENOM_INFECTION);
    p19.poisonSound = SoundManager:playSound(GameSound.HALLOWEEN_BOSS_FOG_LOOP, {
        looped = true
    });
    p19:changeColors({
        layer1 = u4,
        layer3 = u6
    }, {
        layer1 = u4,
        layer3 = u6
    });
end;

function u9.disablePoisonEffect(u20) -- Line: 96
    -- upvalues: SoundManager (copy), u4 (copy), u6 (copy), u5 (copy), u7 (copy)
    local poisonSound = u20.poisonSound;

    if poisonSound then
        SoundManager:tweenSoundVolume(poisonSound, 0, 0.5);
        task.delay(0.5, function() -- Line: 101
            -- upvalues: u20 (copy), poisonSound (copy)
            if u20.poisonSound ~= poisonSound then
                return nil;
            end;

            local poisonSound2 = u20.poisonSound;

            if poisonSound2 ~= nil then
                poisonSound2:Stop();
            end;

            local poisonSound3 = u20.poisonSound;

            if poisonSound3 ~= nil then
                poisonSound3:Destroy();
            end;

            u20.poisonSound = nil;
        end);
    end;

    u20:changeColors({
        layer1 = u4,
        layer3 = u6
    }, {
        layer1 = u5,
        layer3 = u7
    });
end;

function u9.changeColors(p21, u22, u23) -- Line: 124
    -- upvalues: default (copy), Linear (copy), u8 (copy)
    local v24 = game.Workspace:FindFirstChild("skeleton_boss") or game.Workspace:FindFirstChild("halloween_boss");

    if v24 ~= nil then
        v24 = v24:FindFirstChild("Assets");

        if v24 ~= nil then
            v24 = v24:FindFirstChild("Scenery");

            if v24 ~= nil then
                v24 = v24:FindFirstChild("BossMist");
            end;
        end;
    end;

    if not v24 then
        warn("Couldn\'t find mist.");

        return nil;
    end;

    p21.maid:DoCleaning();
    local MistLayer1 = v24:FindFirstChild("MistLayer1");

    if MistLayer1 ~= nil then
        MistLayer1 = MistLayer1:FindFirstChild("Mist1");

        if MistLayer1 ~= nil then
            MistLayer1 = MistLayer1:FindFirstChild("Beam");
        end;
    end;

    local MistLayer3 = v24:FindFirstChild("MistLayer3");

    if MistLayer3 ~= nil then
        MistLayer3 = MistLayer3:FindFirstChild("Mist1");

        if MistLayer3 ~= nil then
            MistLayer3 = MistLayer3:FindFirstChild("Beam");
        end;
    end;

    local u32 = default(0.5, Linear, function(u25) -- Line: 157
        -- upvalues: MistLayer1 (copy), u22 (copy), u8 (ref), u23 (copy), MistLayer3 (copy)
        local v26 = MistLayer1;

        if v26 ~= nil then
            v26 = v26.Parent;
        end;

        if v26 then
            local layer1 = u22.layer1;

            local function _(p27, p28) -- Line: 164
                -- upvalues: u8 (ref), u23 (ref), u25 (copy)
                return ColorSequenceKeypoint.new(u8[p28 + 1], p27:Lerp(u23.layer1[p28 + 1], u25));
            end;

            local v29 = table.create(#layer1);

            for i, v in layer1 do
                local v30 = i - 1;
                v29[i] = ColorSequenceKeypoint.new(u8[v30 + 1], v:Lerp(u23.layer1[v30 + 1], u25));
            end;

            MistLayer1.Color = ColorSequence.new(v29);
        end;

        local v31 = MistLayer3;

        if v31 ~= nil then
            v31 = v31.Parent;
        end;

        if v31 then
            MistLayer3.Color = ColorSequence.new(u22.layer3:Lerp(u23.layer3, u25));
        end;
    end);
    p21.maid:GiveTask(function() -- Line: 183
        -- upvalues: u32 (copy)
        return u32:Cancel();
    end);
end;

KnitClient.CreateController(u9.new());

return nil;