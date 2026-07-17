-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local PirateSceneTimestamps = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;

return {
    ShipsFlyAwayBehavior = {
        name = "Ships fly away",
        priority = 100,
        event = "Heartbeat",

        func = function(p1, p2, p3) -- Line: 10, Name: func
            -- upvalues: DeviceUtil (copy), KnitClient (copy), PirateSceneTimestamps (copy)
            local v4;

            if DeviceUtil.isHoarceKat() then
                v4 = Vector3.new();
            else
                v4 = KnitClient.Controllers.MapController:getCFrameWithoutYield("center");

                if v4 ~= nil then
                    v4 = v4.Position;
                end;

                if v4 == nil then
                    v4 = Vector3.new();
                end;
            end;

            local v5 = Vector3.new(v4.X, 150, v4.Z);
            local v6 = p2:get("ships");

            if v6 == nil then
                return nil;
            end;

            if p1.elapsedEventTime > PirateSceneTimestamps.ShipsDisappear then
                return nil;
            end;

            local v7 = p1.chainInfo == nil and 0 or p1.chainInfo.stageInChain;

            for _, v in v6 do
                local v8;

                if v7 > 0 then
                    local chainInfo = p1.chainInfo;

                    if chainInfo ~= nil then
                        chainInfo = chainInfo.length1;
                    end;

                    v8 = (chainInfo == nil and 0 or chainInfo) + p1.elapsedEventTime;
                else
                    v8 = p1.elapsedEventTime;
                end;

                local v9 = v8 + v.timeOffset;
                local seed = v.seed;
                local v10 = CFrame.new(math.noise(v9 / 15, 0, seed) * 3, math.noise(v9 / 15, 0, -seed) * 10, 0);
                local v11 = v.radiusX + math.noise(v9 / 40, seed) * 8;
                local v12 = v.radiusY + math.noise(v9 / 40, -seed + -seed) * 8;
                local Unit = (v.cframe.Position - v5).Unit;
                local v13 = math.cos(v9 / 60) * v11;
                local heightOffset = v.heightOffset;
                local v14 = math.sin(v9 / 60) * v12;
                local v15 = v5 + Vector3.new(v13, heightOffset, v14) + Unit * (p1.elapsedEventTime * 100);
                local v16 = math.cos((v9 + 1) / 60) * v11;
                local heightOffset2 = v.heightOffset;
                local v17 = math.sin((v9 + 1) / 60) * v12;
                local v18 = v5 + Vector3.new(v16, heightOffset2, v17) + Unit * (p1.elapsedEventTime * 100) + Unit * (p1.elapsedEventTime * 10);
                local v19 = math.noise(v9 / 15, 0, seed) * 1;
                local v20 = math.noise(v9 / 15, 0, -seed) * 0.1 + math.sin(v9 / 1.8) * 0.05;
                local v21 = math.noise(v9 / 15, 0, seed) * 0.4;
                v.cframe = CFrame.lookAt(v15, CFrame.new(v18).Position) * v10 * CFrame.Angles(v20, v19, v21);
            end;

            p2:set("ships", v6);
        end
    }
};