-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = Random.new();

return {
    ShipsFireTntBehavior = {
        name = "Ships fire tnt",
        event = "Heartbeat",

        func = function(p5, p6, p7) -- Line: 18, Name: func
            -- upvalues: DeviceUtil (copy), Players (copy), u4 (copy), u2 (copy), Workspace (copy), default (copy), InQuad (copy), ReplicatedStorage (copy), SoundManager (copy), GameSound (copy)
            local u8 = p6:get("ships");

            if u8 ~= nil then
                u8 = u8.ship1;
            end;

            if u8 == nil then
                return nil;
            end;

            local v9 = math.floor(p5.elapsedEventTime / 3600 * 1000) / 1000;

            if v9 > 0 and (v9 % 12 == 0 and (not DeviceUtil.isHoarceKat() and p6:get("tntFiredThisServer") ~= true)) then
                p6:set("tntFiredThisServer", true);
                task.spawn(function() -- Line: 30
                    -- upvalues: Players (ref), u4 (ref), u2 (ref), u8 (copy), Workspace (ref), default (ref), InQuad (ref), ReplicatedStorage (ref), SoundManager (ref), GameSound (ref)
                    local Character = Players.LocalPlayer.Character;

                    if Character == nil or Character.PrimaryPart == nil then
                        return nil;
                    end;

                    local Position = Character:GetPrimaryPartCFrame().Position;
                    local v10 = false;
                    local v11 = 0;

                    while true do
                        if v10 then
                            v11 = v11 + 1;
                        else
                            v10 = true;
                        end;

                        if v11 >= 3 then
                            return;
                        end;

                        local v12 = u4:NextNumber(-10, 10);
                        local v13 = Position + Vector3.new(v12, 0, u4:NextNumber(-10, 10));
                        local u14 = u2("Part", {
                            Size = Vector3.new(1, 1, 1),
                            Transparency = 1,
                            Anchored = true,
                            CanCollide = false,
                            Position = u8.cframe.Position,
                            Parent = Workspace
                        });
                        u2("Trail", {
                            Attachment0 = u2("Attachment", {
                                Position = Vector3.new(0, -1, 0),
                                Parent = u14
                            }),
                            Attachment1 = u2("Attachment", {
                                Position = Vector3.new(0, 1, 0),
                                Parent = u14
                            }),
                            Parent = u14
                        });
                        default(3, InQuad, function(p15) -- Line: 71
                            -- upvalues: u14 (copy)
                            u14.Position = p15;
                        end, u8.cframe.Position, v13):Wait();
                        u14.Transparency = 1;
                        local u16 = ReplicatedStorage.Assets.Effects.GuidedMissileExplosion:Clone();
                        u16.Position = v13;
                        u16.Parent = Workspace;
                        u16.Debris1:Emit(5);
                        u16.Debris2:Emit(5);
                        u16.ExplosionFlames:Emit(50);
                        SoundManager:playSound(GameSound.MINICOPTER_EXPLODE, {
                            rollOffMaxDistance = 160,
                            position = v13
                        });
                        task.delay(5, function() -- Line: 85
                            -- upvalues: u14 (copy), u16 (copy)
                            u14:Destroy();
                            u16:Destroy();
                        end);
                    end;
                end);
            end;
        end
    }
};