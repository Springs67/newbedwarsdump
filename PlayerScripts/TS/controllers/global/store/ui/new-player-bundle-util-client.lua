-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Logger = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").Logger;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local RunService = v1.RunService;
local Workspace = v1.Workspace;
local NewPlayerBundleConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "robux-store", "new-player-bundle-config").NewPlayerBundleConfig;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;

return {
    NewPlayerBundleClientUtil = {
        shouldShowNewPlayerBundle = function() -- Line: 16, Name: shouldShowNewPlayerBundle
            -- upvalues: RunService (copy), DeviceUtil (copy), PlaceUtil (copy), KnitClient (copy), Logger (copy), NewPlayerBundleConfig (copy)
            if RunService:IsStudio() then
                return false;
            end;

            if DeviceUtil.isHoarceKat() then
                return true;
            end;

            if not PlaceUtil.isLobbyServer() then
                return false;
            end;

            local v2 = KnitClient.Controllers.RobuxStoreController:getNewPlayerBundleData();

            if not v2 then
                Logger:default():Info("[NPB] USER DATA NOT FOUND");

                return false;
            end;

            local v3;

            if v2 == nil then
                v3 = v2;
            else
                v3 = v2.firstJoinTime;
            end;

            if v3 == 0 or (v3 ~= v3 or not v3) then
                Logger:default():Info("[NPB] FIRST JOIN DATA NOT FOUND");

                return false;
            end;

            if v2.firstJoinTime + NewPlayerBundleConfig.NEW_PLAYER_TIME < os.time() then
                Logger:default():Info("[NPB] ACCOUNT TOO OLD");

                return false;
            end;

            if not v2.purchased then
                return true;
            end;

            Logger:default():Info("[NPB] USER ALREADY OWNED");

            return false;
        end,

        getNewPlayerBundleExpireTime = function() -- Line: 50, Name: getNewPlayerBundleExpireTime
            -- upvalues: DeviceUtil (copy), Workspace (copy), Players (copy)
            if DeviceUtil.isHoarceKat() then
                return Workspace:GetServerTimeNow() + 604800;
            end;

            local v4 = Players.LocalPlayer:GetAttribute("NewPlayerStatusExpireTime");

            return v4 == nil and 0 or v4;
        end,

        getNewPlayerBundleExpireTimeFromJoin = function(p5) -- Line: 61, Name: getNewPlayerBundleExpireTimeFromJoin
            -- upvalues: DeviceUtil (copy), Workspace (copy), NewPlayerBundleConfig (copy)
            if DeviceUtil.isHoarceKat() then
                return Workspace:GetServerTimeNow() + 604800;
            end;

            return p5 + NewPlayerBundleConfig.NEW_PLAYER_TIME;
        end
    }
};