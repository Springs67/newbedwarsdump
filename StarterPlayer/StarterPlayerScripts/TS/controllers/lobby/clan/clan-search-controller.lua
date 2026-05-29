local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "ClanSearchController"
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
    p9.Name = "ClanSearchController"
end
function u6.KnitStart(p10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.KnitStart(p10)
end
function u6.searchClan(_, p11) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return u5.Client:GetNamespace("Clans"):Get("SearchClans"):CallServerAsync(p11)
end
function u6.getRecommenedClans(_) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
    --]]
    local v12 = u2.resolveDependency("@easy-games/game-core:client/controllers/friends/friends-controller@FriendsController"):getFriends()
    local v13
    if v12 == nil then
        v13 = v12
    else
        v13 = table.create(#v12)
        for v14, v15 in v12 do
            local _ = v14 - 1
            v13[v14] = v15.userId
        end
    end
    local v16 = v13 == nil and {} or v13
    return u5.Client:GetNamespace("Clans"):Get("GetRecommendedClans"):CallServerAsync({
        ["friends"] = v16
    })
end
function u6.getRandomClans(_) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return u5.Client:GetNamespace("Clans"):Get("GetRandomClans"):CallServerAsync()
end
v3.CreateController(u6.new())
return nil