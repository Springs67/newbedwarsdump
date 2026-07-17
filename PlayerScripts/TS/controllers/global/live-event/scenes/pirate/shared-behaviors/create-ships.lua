-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local RunService = v1.RunService;
local Workspace = v1.Workspace;
local PirateSceneTimestamps = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local setupShipAnim = RuntimeLib.import(script, script.Parent.Parent, "pirate-scene", "modules", "setup-ship-anim").setupShipAnim;

return {
    CreateShipsBehavior = {
        name = "Create ships",
        priority = 200,
        event = "Heartbeat",

        func = function(p2, p3, p4) -- Line: 13, Name: func
            -- upvalues: RunService (copy), ReplicatedStorage (copy), Workspace (copy), setupShipAnim (copy), PirateSceneTimestamps (copy)
            if p3:get("shipsMayShow") == nil or RunService:IsStudio() then
                local v5 = p2.elapsedEventTime / 3600;
                local v6 = p2.totalLength / 3600;
                local v7 = math.noise(v5 * 0.5) * 0.05;
                p3:set("shipsMayShow", v5 % (-3 * (v5 / v6) ^ 2 + 3 + 1 + v7) < 1);
            end;

            local v8;

            if p2.chainInfo == nil then
                v8 = false;
            else
                v8 = p2.chainInfo.stageInChain > 0;
            end;

            local v9 = v8 == true and true or p3:get("shipsMayShow") == true;
            local u10 = p3:get("ships");

            if u10 ~= nil then
                if v9 then
                    if u10.ship1 == nil then
                        local v11 = ReplicatedStorage.Assets.Misc.PirateShip:Clone();
                        v11.Parent = Workspace;
                        u10.ship1 = {
                            timeOffset = 0,
                            seed = -837992,
                            heightOffset = 70,
                            radiusX = 1700,
                            radiusY = 2000,
                            instance = v11,
                            cframe = CFrame.new()
                        };
                        setupShipAnim(v11):andThen(function(p12) -- Line: 41
                            -- upvalues: u10 (copy)
                            local v13 = u10;

                            if v13 ~= nil then
                                v13 = v13.ship1;
                            end;

                            if v13 then
                                v13.animationTrack = p12;
                                local v14 = u10;

                                if v14 ~= nil then
                                    v14.ship1 = v13;
                                end;
                            end;
                        end);
                    end;
                else
                    u10.ship1 = nil;
                end;

                local v15;

                if v8 == true then
                    v15 = p2.elapsedEventTime < PirateSceneTimestamps.ShipsDisappear;
                elseif p2.elapsedEventTime > p2.totalLength * 0.3333333333333333 then
                    v15 = v9;
                else
                    v15 = false;
                end;

                if v15 then
                    if u10.ship2 == nil then
                        local v16 = ReplicatedStorage.Assets.Misc.PirateShip:Clone();
                        v16.Parent = Workspace;
                        u10.ship2 = {
                            timeOffset = 900,
                            seed = -713427,
                            heightOffset = 40,
                            radiusX = 1300,
                            radiusY = 1500,
                            instance = v16,
                            cframe = CFrame.new()
                        };
                        setupShipAnim(v16):andThen(function(p17) -- Line: 74
                            -- upvalues: u10 (copy)
                            local v18 = u10;

                            if v18 ~= nil then
                                v18 = v18.ship2;
                            end;

                            if v18 then
                                v18.animationTrack = p17;
                                local v19 = u10;

                                if v19 ~= nil then
                                    v19.ship2 = v18;
                                end;
                            end;
                        end);
                    end;
                else
                    u10.ship2 = nil;
                end;

                if v8 == true then
                    v9 = p2.elapsedEventTime < PirateSceneTimestamps.ShipsDisappear;
                elseif p2.elapsedEventTime <= p2.totalLength * 0.7 then
                    v9 = false;
                end;

                if v9 then
                    if u10.ship3 == nil then
                        local v20 = ReplicatedStorage.Assets.Misc.PirateShip:Clone();
                        v20.Parent = Workspace;
                        u10.ship3 = {
                            timeOffset = 980,
                            seed = 948074,
                            heightOffset = 0,
                            radiusX = 900,
                            radiusY = 900,
                            instance = v20,
                            cframe = CFrame.new()
                        };
                        setupShipAnim(v20):andThen(function(p21) -- Line: 107
                            -- upvalues: u10 (copy)
                            local v22 = u10;

                            if v22 ~= nil then
                                v22 = v22.ship3;
                            end;

                            if v22 then
                                v22.animationTrack = p21;
                                local v23 = u10;

                                if v23 ~= nil then
                                    v23.ship3 = v22;
                                end;
                            end;
                        end);
                    end;
                else
                    u10.ship3 = nil;
                end;

                p3:set("ships", u10);
            end;
        end
    }
};