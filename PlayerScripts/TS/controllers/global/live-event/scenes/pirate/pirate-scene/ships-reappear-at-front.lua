-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InQuart = v1.InQuart;
local Linear = v1.Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src");
local CollectionService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService;
local PirateSceneTimestamps = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "bezier");

return {
    ShipsReappearAtFrontBehavior = {
        name = "Ships reappear at front",
        event = "Heartbeat",

        func = function(p4, p5, p6) -- Line: 16, Name: func
            -- upvalues: PirateSceneTimestamps (copy), CollectionService (copy), u3 (copy), Linear (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), u2 (copy), InQuart (copy)
            local v7 = p5:get("ships");

            if v7 == nil then
                return nil;
            end;

            if p4.elapsedEventTime < PirateSceneTimestamps.ShipReappears then
                return nil;
            end;

            if not p5:get("bezierCurve") then
                local v8 = CollectionService:GetTagged("pirate-ship-waypoint");
                table.sort(v8, function(p9, p10) -- Line: 26
                    local v11 = tonumber(p9.Name);
                    local v12 = tonumber(p10.Name);

                    return (v11 == nil and 0 or v11) < (v12 == nil and 0 or v12);
                end);

                local function _(p13) -- Line: 38
                    return p13:IsA("BasePart") and true or false;
                end;

                local v14 = 0;
                local v15 = {};

                for i, v in v8 do
                    local _ = i - 1;

                    if (v:IsA("BasePart") and true or false) == true then
                        v14 = v14 + 1;
                        v15[v14] = v;
                    end;
                end;

                if #v15 < 2 then
                    return nil;
                end;

                p5:set("bezierCurve", u3.new(unpack(v15)));
            end;

            local ship1 = v7.ship1;

            if ship1 == nil then
                return nil;
            end;

            local v16 = Linear(math.min(p4.elapsedEventTime, PirateSceneTimestamps.ShipGetShotDown), 0, 1, PirateSceneTimestamps.ShipGetShotDown + 10);

            if p4.elapsedEventTime < PirateSceneTimestamps.HouseExplodes then
                if not p5:get("bossBarMounted") then
                    SoundManager:playSound(GameSound.PIRATE_EVENT_FIRST_ENTRY, {
                        position = Vector3.new(17, 315.703, -300),
                        rollOffMinDistance = 500,
                        rollOffMaxDistance = 100000
                    });
                    p5:set("bossBarMounted", true);
                    KnitClient.Controllers.BossBarController:mountBossBar(1000, 1000);
                end;
            else
                KnitClient.Controllers.BossBarController:unmountBar();
            end;

            if p4.elapsedEventTime > PirateSceneTimestamps.ShipGetShotDown then
                local u17, v18 = u2.useState(nil);
                u2.useEffect(function() -- Line: 82
                    -- upvalues: SoundManager (ref), GameSound (ref), u17 (copy)
                    local PIRATE_EVENT_SHIP_CREAK = GameSound.PIRATE_EVENT_SHIP_CREAK;
                    local v19 = {};
                    local v20 = u17;

                    if v20 ~= nil then
                        v20 = v20.Position;
                    end;

                    v19.position = v20;
                    v19.rollOffMaxDistance = 500;
                    v19.rollOffMinDistance = 300;
                    SoundManager:playSound(PIRATE_EVENT_SHIP_CREAK, v19);
                end);

                if u17 == nil then
                    v18(ship1.cframe);

                    return nil;
                end;

                local v21 = InQuart(p4.elapsedEventTime - PirateSceneTimestamps.ShipGetShotDown, 0, 1, PirateSceneTimestamps.HouseExplodes + 1.2 - PirateSceneTimestamps.ShipGetShotDown);
                local v22 = math.clamp(v21, 0, 1);
                local LookVector = u17.LookVector;
                local Unit = (Vector3.new(183.959, 315.427, 323.018) - u17.Position).Unit;
                local v23;

                if v22 < 0.88 then
                    local v24 = math.noise(-p4.elapsedEventTime * 50);
                    local v25 = math.noise(0, 0, p4.elapsedEventTime * 50);
                    v23 = Vector3.new(v24, v25, math.noise(0, 0, p4.elapsedEventTime * 50 + p4.elapsedEventTime * 50));
                else
                    v23 = Vector3.new();
                end;

                local v26 = LookVector:Lerp(Unit, v22 * 0.7);
                local v27 = u17.Position:Lerp(Vector3.new(183.959, 320.427, 323.018) + v23 * 0.6, v22);
                ship1.cframe = CFrame.lookAt(v27, v27 + v26);
            else
                local v28 = math.clamp(v16, 0, 1);
                local v29 = p5:get("bezierCurve"):CalculatePositionAt(v28);
                local v30 = p5:get("bezierCurve"):CalculateDerivativeAt(v28);
                ship1.cframe = CFrame.lookAt(v29, v29 + v30);
            end;

            p5:set("ships", v7);
        end
    }
};