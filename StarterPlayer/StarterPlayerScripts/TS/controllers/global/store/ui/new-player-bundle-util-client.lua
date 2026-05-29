local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").Logger
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.RunService
local u8 = v5.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "robux-store", "new-player-bundle-config").NewPlayerBundleConfig
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
return {
    ["NewPlayerBundleClientUtil"] = {
        ["shouldShowNewPlayerBundle"] = function() --[[ Name: shouldShowNewPlayerBundle, Line 16 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u2
                [3] = u10
                [4] = u3
                [5] = u4
                [6] = u9
            --]]
            if u7:IsStudio() then
                return false
            end
            if u2.isHoarceKat() then
                return true
            end
            if not u10.isLobbyServer() then
                return false
            end
            local v11 = u3.Controllers.RobuxStoreController:getNewPlayerBundleData()
            if not v11 then
                u4:default():Info("[NPB] USER DATA NOT FOUND")
                return false
            end
            local v12
            if v11 == nil then
                v12 = v11
            else
                v12 = v11.firstJoinTime
            end
            if v12 == 0 or (v12 ~= v12 or not v12) then
                u4:default():Info("[NPB] FIRST JOIN DATA NOT FOUND")
                return false
            end
            if v11.firstJoinTime + u9.NEW_PLAYER_TIME < os.time() then
                u4:default():Info("[NPB] ACCOUNT TOO OLD")
                return false
            end
            if not v11.purchased then
                return true
            end
            u4:default():Info("[NPB] USER ALREADY OWNED")
            return false
        end,
        ["getNewPlayerBundleExpireTime"] = function() --[[ Name: getNewPlayerBundleExpireTime, Line 50 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u8
                [3] = u6
            --]]
            if u2.isHoarceKat() then
                return u8:GetServerTimeNow() + 604800
            end
            local v13 = u6.LocalPlayer:GetAttribute("NewPlayerStatusExpireTime")
            return v13 == nil and 0 or v13
        end,
        ["getNewPlayerBundleExpireTimeFromJoin"] = function(p14) --[[ Name: getNewPlayerBundleExpireTimeFromJoin, Line 61 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u8
                [3] = u9
            --]]
            if u2.isHoarceKat() then
                return u8:GetServerTimeNow() + 604800
            else
                return p14 + u9.NEW_PLAYER_TIME
            end
        end
    }
}