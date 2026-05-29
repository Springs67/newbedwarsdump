local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u3 = v2.Players
local u4 = v2.RunService
local u5 = v2.UserService
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local v20 = {
    ["getOfflinePlayer"] = function(p7) --[[ Name: getOfflinePlayer, Line 11 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u6
        --]]
        return (p7 or not u4:IsStudio()) and {
            ["name"] = p7.Name,
            ["userId"] = p7.UserId,
            ["displayName"] = p7.DisplayName
        } or {
            ["name"] = "SnickTrix",
            ["displayName"] = "SnickTrix",
            ["userId"] = u6.UserId.SnickTrix
        }
    end,
    ["getPlayer"] = function(p8) --[[ Name: getPlayer, Line 27 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        return u3:GetPlayerByUserId(p8.userId)
    end,
    ["getOfflinePlayersByUserIds"] = function(u9) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u5
        --]]
        return u1.Promise.defer(function(p10, _) --[[ Line: 33 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u9
            --]]
            local v11 = u5:GetUserInfosByUserIdsAsync(u9)
            local v12 = table.create(#v11)
            for v13, v14 in v11 do
                local _ = v13 - 1
                v12[v13] = {
                    ["name"] = v14.Username,
                    ["userId"] = v14.Id,
                    ["displayName"] = v14.DisplayName
                }
            end
            p10(v12)
        end)
    end,
    ["getUserAvatarFromUserId"] = function(p15) --[[ Line: 53 ]]
        return "rbxthumb://type=AvatarHeadShot&id=" .. tostring(p15) .. "&w=" .. tostring(48) .. "&h=" .. tostring(48)
    end,
    ["loadUserAvatarFromName"] = function(u16) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u3
        --]]
        return u1.Promise.defer(function(p17, p18) --[[ Line: 58 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u3
            --]]
            if u16 == "" or not u16 then
                p17("")
            end
            if #u16 <= 2 then
                p17("")
            end
            local v19 = u3:GetUserIdFromNameAsync(u16)
            if v19 == 0 or (v19 ~= v19 or not v19) then
                p18()
            else
                p17("rbxthumb://type=AvatarHeadShot&id=" .. tostring(v19) .. "&w=" .. tostring(48) .. "&h=" .. tostring(48))
            end
        end)
    end,
    ["Dummy"] = {
        ["SnickTrix"] = {
            ["name"] = "SnickTrix",
            ["userId"] = 22641473,
            ["displayName"] = "SnickTrix"
        },
        ["spleenhook"] = {
            ["name"] = "spleenhook",
            ["userId"] = 225721992,
            ["displayName"] = "spleenhook"
        },
        ["grilme99"] = {
            ["name"] = "grilme99",
            ["userId"] = 75380482,
            ["displayName"] = "Brooke"
        },
        ["Vorlias"] = {
            ["name"] = "Vorlias",
            ["userId"] = 4308133,
            ["displayName"] = "Vorlias"
        },
        ["oiogy"] = {
            ["name"] = "oIogy",
            ["userId"] = 21406719,
            ["displayName"] = "Sprux"
        },
        ["Bryan3838"] = {
            ["name"] = "bryan3838",
            ["userId"] = 20663325,
            ["displayName"] = "bryan3838"
        },
        ["OneThousand1k"] = {
            ["name"] = "OneThousand1k",
            ["userId"] = 1730213868,
            ["displayName"] = "Brian1KB"
        },
        ["Rascal"] = {
            ["name"] = "Rascal",
            ["userId"] = 34466481,
            ["displayName"] = "Rascal"
        },
        ["Asen"] = {
            ["name"] = "Asen",
            ["userId"] = 205430552,
            ["displayName"] = "Asen"
        },
        ["Candelz"] = {
            ["name"] = "Candelz",
            ["userId"] = 437492645,
            ["displayName"] = "Candelz"
        },
        ["SteamPulse"] = {
            ["name"] = "SteamPulse",
            ["userId"] = 172603477,
            ["displayName"] = "SteamPulse"
        },
        ["JKJ"] = {
            ["name"] = "jkj",
            ["userId"] = 385015560,
            ["displayName"] = "jkj"
        },
        ["Chase"] = {
            ["name"] = "Chase",
            ["userId"] = 22808138,
            ["displayName"] = "Chase"
        },
        ["Midciel"] = {
            ["name"] = "Midciel",
            ["userId"] = 2237298638,
            ["displayName"] = "Midciel"
        },
        ["leoduquartier"] = {
            ["name"] = "leoduquartier",
            ["userId"] = 243707806,
            ["displayName"] = "leoduquartier"
        },
        ["DVwastaken"] = {
            ["name"] = "DVwastaken",
            ["userId"] = 964088769,
            ["displayName"] = "DVwastaken"
        },
        ["LongNameMan"] = {
            ["name"] = "OOOOOOOOOOOOOOOOOOOO",
            ["userId"] = 195259,
            ["displayName"] = "OOOOOOOOOOOOOOOOOOOO"
        },
        ["Hacker"] = {
            ["name"] = "IlIlIlIlIIlIlIlIlIl",
            ["userId"] = 183989117,
            ["displayName"] = "IlIlIlIlIIlIlIlIlIl"
        }
    }
}
return {
    ["OfflinePlayerUtil"] = v20
}