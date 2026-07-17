-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local SingleMotor = v1.SingleMotor;
local Spring = v1.Spring;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local useEvent = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "useEvent").useEvent;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;

return {
    MakeShipsRedOnHit = {
        name = "make ships red on hit",
        event = "Heartbeat",

        func = function(p4, p5, p6) -- Line: 21, Name: func
            -- upvalues: u2 (copy), SingleMotor (copy), useEvent (copy), ClientSyncEvents (copy), RuntimeLib (copy), PlayerEntity (copy), Players (copy), KnitClient (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy), Spring (copy)
            local v7 = p5:get("ships");

            if v7 == nil then
                return nil;
            end;

            local ship1 = v7.ship1;

            if ship1 ~= nil then
                ship1 = ship1.instance;
            end;

            if ship1 == nil then
                return nil;
            end;

            local u8 = u2.useState(SingleMotor.new(1));
            u2.useEffect(function() -- Line: 35
                -- upvalues: u8 (copy)
                return function() -- Line: 36
                    -- upvalues: u8 (ref)
                    u8:destroy();
                end;
            end);
            local v9 = u2.useState({});

            for i, v in v9 do
                local timestamp = v.timestamp;

                if os.clock() - timestamp > 0.1 then
                    v9[i] = nil;
                end;
            end;

            for i in useEvent("projectile hit", ClientSyncEvents.ProjectileHit) do
                local v10 = i[1];
                local v11 = RuntimeLib.instanceof(v10.shooter, PlayerEntity) and v10.shooter:getPlayer().UserId == Players.LocalPlayer.UserId;

                if v11 then
                    local part = v10.hitData.part;

                    if part ~= nil then
                        part = part.Parent;
                    end;

                    v11 = part == ship1 and not v10:isCancelled();

                    if v11 then
                        v11 = not (v9[v10.projectileRefId] ~= nil);
                    end;
                end;

                if v11 then
                    local v12 = p5:get("shipHealth");
                    local v13 = (v12 == nil and 1000 or v12) - 6;
                    p5:set("shipHealth", v13);
                    KnitClient.Controllers.BossBarController:updateHealth(v13);
                    v9[v10.projectileRefId] = {
                        timestamp = os.clock()
                    };
                    local v14 = ReplicatedStorage.Assets.Effects.PirateShipHit:Clone();
                    v14.Position = v10.hitData.hitCFrame.Position;
                    v14.Parent = Workspace;
                    EffectUtil:playEffects({ v14 }, nil, {
                        destroyAfterSec = 3
                    });
                    SoundManager:playSound(GameSound.PIRATE_SHIP_HIT);
                    u8:setGoal(Spring.new(0.5, {
                        dampingRatio = 0.75,
                        frequency = 6
                    }));
                    task.delay(0.15, function() -- Line: 89
                        -- upvalues: u8 (copy), Spring (ref)
                        u8:setGoal(Spring.new(1, {
                            dampingRatio = 0.75,
                            frequency = 4
                        }));
                    end);
                end;
            end;
        end
    }
};