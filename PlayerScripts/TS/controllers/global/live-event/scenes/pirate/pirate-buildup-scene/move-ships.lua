-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;

return {
    MoveShipsBehavior = {
        name = "Move ships",
        event = "Heartbeat",

        func = function(p1, p2, p3) -- Line: 9, Name: func
            -- upvalues: DeviceUtil (copy), KnitClient (copy), PlaceUtil (copy)
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

            local X = v4.X;
            local v5 = PlaceUtil.isGameServer() and 150 or 500;
            local v6 = Vector3.new(X, v5, v4.Z);
            local v7 = p2:get("ships");

            if v7 == nil then
                return nil;
            end;

            local v8 = p1.chainInfo == nil and 0 or p1.chainInfo.stageInChain;

            for _, v in v7 do
                local v9;

                if v8 > 0 then
                    local chainInfo = p1.chainInfo;

                    if chainInfo ~= nil then
                        chainInfo = chainInfo.length1;
                    end;

                    v9 = (chainInfo == nil and 0 or chainInfo) + p1.elapsedEventTime;
                else
                    v9 = p1.elapsedEventTime;
                end;

                local v10 = v9 + v.timeOffset;
                local seed = v.seed;
                local v11 = CFrame.new(math.noise(v10 / 15, 0, seed) * 3, math.noise(v10 / 15, 0, -seed) * 10, 0);
                local v12 = v.radiusX + math.noise(v10 / 40, seed) * 8;
                local v13 = v.radiusY + math.noise(v10 / 40, -seed + -seed) * 8;
                local v14 = math.cos(v10 / 60) * v12;
                local heightOffset = v.heightOffset;
                local v15 = math.sin(v10 / 60) * v13;
                local v16 = v6 + Vector3.new(v14, heightOffset, v15);
                local v17 = math.cos((v10 + 1) / 60) * v12;
                local heightOffset2 = v.heightOffset;
                local v18 = math.sin((v10 + 1) / 60) * v13;
                local v19 = v6 + Vector3.new(v17, heightOffset2, v18);
                local v20 = math.noise(v10 / 15, 0, seed) * 1;
                local v21 = math.noise(v10 / 15, 0, -seed) * 0.1 + math.sin(v10 / 1.8) * 0.05;
                local v22 = math.noise(v10 / 15, 0, seed) * 0.4;
                v.cframe = CFrame.lookAt(v16, CFrame.new(v19).Position) * v11 * CFrame.Angles(v21, v20, v22);
            end;

            p2:set("ships", v7);
        end
    }
};