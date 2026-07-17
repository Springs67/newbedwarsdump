-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "ReaperScytheController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 22
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 26
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p5);
    p5.Name = "GrimReaperScytheController";
    p5.reaperScytheRemote = default.Client:Get("ReaperScytheSwing");
    p5.playEffectsRemoteEvent = default.Client:Get("PlayReaperScytheEffects");
end;

function u3.KnitStart(u6) -- Line: 32
    -- upvalues: KnitController (copy), KnitClient (copy), ItemType (copy), AnimationType (copy), ClientSyncEvents (copy), u1 (copy), Players (copy)
    KnitController.KnitStart(u6);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.REAPER_SCYTHE, {
        animations = {
            AnimationType.SCYTHE_SLASH_1,
            AnimationType.SCYTHE_SLASH_2,
            AnimationType.SCYTHE_SLASH_1_FP,
            AnimationType.SCYTHE_SLASH_2_FP,
            AnimationType.SCYTHE_HOLD
        }
    });
    ClientSyncEvents.SwordSwing:connect(function(p7) -- Line: 37
        -- upvalues: ItemType (ref), u6 (copy)
        if p7:isCancelled() or p7.swordType ~= ItemType.REAPER_SCYTHE then
            return nil;
        end;

        u6.reaperScytheRemote:CallServerAsync();
    end);
    u6.playEffectsRemoteEvent:Connect(function(p8) -- Line: 43
        -- upvalues: u1 (ref), Players (ref), u6 (copy)
        local u9 = u1.new();
        local playerIds = p8.playerIds;

        local function v13(p10) -- Line: 46
            -- upvalues: Players (ref), u6 (ref), u9 (copy)
            local v11 = Players:GetPlayerByUserId(p10);

            if v11 ~= nil then
                v11 = v11.Character;
            end;

            if v11 then
                local function _(p12) -- Line: 54
                    -- upvalues: u9 (ref)
                    return u9:GiveTask(p12);
                end;

                for i, v in u6:makeParticleEmitter(v11.UpperTorso) do
                    local _ = i - 1;
                    u9:GiveTask(v);
                end;
            end;
        end;

        for i, v in playerIds do
            v13(v, i - 1, playerIds);
        end;

        task.delay(3, function() -- Line: 65
            -- upvalues: u9 (copy)
            return u9:DoCleaning();
        end);
    end);
end;

function u3.makeParticleEmitter(p14, u15) -- Line: 70
    -- upvalues: u2 (copy)
    local v16 = { ColorSequence.new(Color3.fromRGB(107, 223, 255)), ColorSequence.new(Color3.fromRGB(112, 237, 138)) };

    local function v19(p17, p18) -- Line: 72
        -- upvalues: u2 (ref), u15 (copy)
        return u2("ParticleEmitter", {
            Brightness = 2,
            LightEmission = 1,
            Texture = "rbxassetid://9153146729",
            Rate = 8,
            Drag = 4,
            TimeScale = 0.6,
            Name = "ReaperSpec-" .. tostring(p18),
            Color = p17,
            Size = NumberSequence.new(2.6, 0),
            Lifetime = NumberRange.new(0.7, 1),
            Speed = NumberRange.new(2),
            SpreadAngle = Vector2.new(360, 360),
            Shape = Enum.ParticleEmitterShape.Box,
            ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward,
            ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume,
            Parent = u15
        });
    end;

    local v20 = table.create(#v16);

    for i, v in v16 do
        v20[i] = v19(v, i - 1, v16);
    end;

    return v20;
end;

KnitClient.CreateController(u3.new());

return nil;