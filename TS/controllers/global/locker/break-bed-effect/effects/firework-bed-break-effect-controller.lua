-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local BedBreakBedType = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-util-controller").BedBreakBedType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "FireworkBedBreakEffectController";
    end,

    __index = BreakBedEffectController
});
u3.__index = u3;

function u3.new(...) -- Line: 27
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 31
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p5, BedBreakEffectType.FIREWORK);
    p5.Name = "FireworkBedBreakEffectController";
end;

function u3.KnitStart(p6) -- Line: 35
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p6);
end;

function u3.onBedBreak(u7, p8, u9, p10, p11) -- Line: 38
    -- upvalues: KnitClient (copy), BedBreakBedType (copy), Workspace (copy), ReplicatedStorage (copy), ItemType (copy), u1 (copy), SoundManager (copy), GameSound (copy), default (copy), Linear (copy), FireworkType (copy)
    local u12 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(p10, BedBreakBedType.SPIN);

    if u12 then
        u12.Name = "BedBreakEffectBedClone";
        u12:PivotTo(u9);
        u12.Parent = Workspace;
        u7.maid:GiveTask(u12);
        local PrimaryPart = u12.PrimaryPart;
        local v13 = PrimaryPart.Rotation.Y == 0 and true or PrimaryPart.Rotation.Y == 180;
        local v14 = v13 and 1.5 or 3;
        local v15 = v13 and 3 or 1.5;
        local v16 = {
            Vector3.new(v14, 0, v15),
            Vector3.new(-v14, 0, v15),
            Vector3.new(v14, 0, -v15),
            (Vector3.new(-v14, 0, -v15))
        };
        local v17 = false;
        local v18 = 0;

        while true do
            if true then
                if v17 then
                    v18 = v18 + 1;
                else
                    v17 = true;
                end;
            end;

            if v18 >= 4 then
                break;
            end;

            local Items = ReplicatedStorage:FindFirstChild("Items");

            if Items ~= nil then
                Items = Items:FindFirstChild(ItemType.STICKY_FIREWORK);

                if Items ~= nil then
                    Items = Items:FindFirstChild("Handle");

                    if Items ~= nil then
                        Items = Items:Clone();
                    end;
                end;
            end;

            if Items then
                Items.Parent = u12;
                Items:PivotTo(CFrame.new(u12.PrimaryPart.Position + v16[v18 + 1]));
                u1("WeldConstraint", {
                    Part0 = Items,
                    Part1 = u12.PrimaryPart,
                    Parent = Items
                });
                local v19 = Items:FindFirstChildWhichIsA("ParticleEmitter");

                if v19 then
                    v19.Enabled = true;
                end;
            end;
        end;

        SoundManager:playSound(GameSound.FIREWORK_LAUNCH, {
            position = u9.Position
        });
        local v20 = SoundManager:playSound(GameSound.FIREWORK_TRAIL, {
            looped = true,
            position = u9.Position
        });

        if v20 then
            u7.maid:GiveTask(v20);
        end;

        local _ = u9.Position + Vector3.new(0, 15, 0);
        u12.WorldPivot = u9 - p11;
        default(2, Linear, function(p21) -- Line: 106
            -- upvalues: u12 (copy), u9 (copy)
            local v22 = math.sin(10 * p21) * 10;
            local v23 = math.cos(10 * p21) * 10;
            local v24 = Vector3.new(v22, 15 * p21, v23);
            local v25 = CFrame.Angles(0, p21 * 6 * 3.141592653589793, 0);
            u12:PivotTo((u9 + v24) * v25);
            u12:ScaleTo(math.max(0, 1 - p21 * 0.7) + 0.3);
        end, 0, 1);
        task.delay(2, function() -- Line: 115
            -- upvalues: u7 (copy), u12 (copy), SoundManager (ref), GameSound (ref), KnitClient (ref), FireworkType (ref)
            u7:createBedDebris(u12.PrimaryPart, true);
            local GOO_SPLAT = GameSound.GOO_SPLAT;
            local v26 = {};
            local PrimaryPart2 = u12.PrimaryPart;

            if PrimaryPart2 ~= nil then
                PrimaryPart2 = PrimaryPart2.Position;
            end;

            v26.position = PrimaryPart2;
            v26.rollOffMaxDistance = 45;
            SoundManager:playSound(GOO_SPLAT, v26);
            KnitClient.Controllers.FireworkController:playFireworkEffect(u12.PrimaryPart.Position, FireworkType.NORMAL);
            u12:Destroy();
        end);
    end;
end;

KnitClient.CreateController(u3.new());

return nil;