-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "ExplodingTankBlockController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 29
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "ExplodingTankBlockController";
    p7.explodingTanks = {};
end;

function u5.KnitStart(u8) -- Line: 38
    -- upvalues: KnitController (copy), KnitClient2 (copy), GameSound (copy), default2 (copy), BlockEngine (copy), u3 (copy), SoundManager (copy), Workspace (copy), default (copy), Linear (copy), RandomUtil (copy), ReplicatedStorage (copy)
    KnitController.KnitStart(u8);
    KnitClient2.Controllers.PreloadController:runPreload({
        sounds = {
            GameSound.EXPLODING_TANK_BLOCK_ON_FIRE,
            GameSound.EXPLODING_TANK_BLOCK_EXPLODE_1,
            GameSound.EXPLODING_TANK_BLOCK_EXPLODE_2,
            GameSound.EXPLODING_TANK_BLOCK_EXPLODE_3
        }
    });
    default2.Client:Get("ExplodingTankBlock_TimerStarted"):Connect(function(p9, p10, p11, p12) -- Line: 43
        -- upvalues: BlockEngine (ref), u3 (ref), SoundManager (ref), GameSound (ref), u8 (copy), Workspace (ref), default (ref), Linear (ref), RandomUtil (ref), ReplicatedStorage (ref)
        local u13 = BlockEngine:getStore():getBlockAt(p10);

        if not u13 then
            return nil;
        end;

        local u14 = u13:GetAttribute("BlockUUID");

        if u14 == "" or (not u14 or u14 == "") then
            return nil;
        end;

        if u14 ~= p9 then
            return nil;
        end;

        local Position = u13.Position;
        local u15 = u3.new();
        local u16;

        if u13 == nil then
            u16 = u13;
        else
            u16 = u13:FindFirstChild("FireParent");

            if u16 ~= nil then
                u16 = u16:FindFirstChild("Fire");
            end;
        end;

        if u16 then
            u16.Enabled = true;
        end;

        u15:GiveTask(function() -- Line: 71
            -- upvalues: u16 (copy)
            if u16 then
                u16.Enabled = false;
            end;
        end);
        u15:GiveTask((SoundManager:playSound(GameSound.EXPLODING_TANK_BLOCK_ON_FIRE, {
            position = u13.Position,
            parent = u13
        })));
        u8.explodingTanks[u14] = {
            isCancelled = false,
            maid = u15
        };
        local u17 = p12 - Workspace:GetServerTimeNow();
        local Size = u13.Size;
        local u18 = Size * 1.25;
        default(u17, Linear, function(p19) -- Line: 93
            -- upvalues: u13 (copy), Size (copy), u18 (copy)
            u13.Size = Size:Lerp(u18, p19);
        end, 0, 1):Play();
        task.spawn(function() -- Line: 96
            -- upvalues: u17 (copy), u15 (copy), u8 (ref), u14 (copy), RandomUtil (ref), GameSound (ref), SoundManager (ref), u13 (copy), ReplicatedStorage (ref), Position (copy), Workspace (ref)
            if u17 > 0 then
                task.wait(u17);
            end;

            u15:DoCleaning();
            local v20 = u8.explodingTanks[u14];

            if v20 ~= nil then
                v20 = v20.isCancelled;
            end;

            if v20 then
                return nil;
            end;

            SoundManager:playSound(RandomUtil.fromList(unpack({ GameSound.EXPLODING_TANK_BLOCK_EXPLODE_1, GameSound.EXPLODING_TANK_BLOCK_EXPLODE_2, GameSound.EXPLODING_TANK_BLOCK_EXPLODE_3 })), {
                position = u13.Position
            });
            local u21 = ReplicatedStorage.Assets.Effects.ExplodingTankBlockExplosion:Clone();
            u21.Position = Position;
            u21.Parent = Workspace;
            u21.Explosion:Emit(30);
            task.delay(5, function() -- Line: 120
                -- upvalues: u21 (copy)
                return u21:Destroy();
            end);
        end);
    end);
    default2.Client:Get("ExplodingTankBlock_TimerCancelled"):Connect(function(p22, p23) -- Line: 125
        -- upvalues: BlockEngine (ref), u8 (copy)
        if not BlockEngine:getStore():getBlockAt(p23) then
            return nil;
        end;

        local v24 = u8.explodingTanks[p22];

        if v24 then
            v24.isCancelled = true;
            v24.maid:DoCleaning();
        end;
    end);
end;

KnitClient.CreateController(u5.new());

return nil;