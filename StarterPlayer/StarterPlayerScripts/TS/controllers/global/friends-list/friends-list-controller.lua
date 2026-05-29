local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "FriendsListController"
    end,
    ["__index"] = u4
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p9)
    p9.Name = "FriendsListController"
end
function u6.KnitStart(p10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u2
    --]]
    u4.KnitStart(p10)
    u5.changed:connect(function(p11, p12) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        if p11.Settings.friendNotifications ~= p12.Settings.friendNotifications then
            u2.resolveDependency("@easy-games/game-core:client/controllers/friends/easy-friends-controller@EasyFriendsController"):setShowNotifications(p11.Settings.friendNotifications)
        end
    end)
    u2.resolveDependency("@easy-games/game-core:client/controllers/friends/easy-friends-controller@EasyFriendsController"):startFetchingFriends()
    u2.resolveDependency("@easy-games/game-core:client/controllers/friends/easy-friends-controller@EasyFriendsController"):setFetchCooldown(7)
end
v3.CreateController(u6.new())
return nil