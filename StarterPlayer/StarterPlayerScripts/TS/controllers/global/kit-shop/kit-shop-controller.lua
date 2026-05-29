local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "KitShopController"
    end,
    ["__index"] = u6
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p13)
    p13.Name = "KitShopController"
end
function u10.KnitStart(p14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u4
        [4] = u5
        [5] = u8
        [6] = u2
        [7] = u7
    --]]
    u6.KnitStart(p14)
    if not u9.isGameServer() then
        return nil
    end
    u4.new():GiveTask(u5.MatchStateChange:connect(function(p15) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u2
            [3] = u7
        --]]
        if p15.matchState ~= u8.PRE then
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u7.KIT_DETAILS_APP)
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u7.KIT_SHOP_APP)
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u7.CONFIRMATION_MODAL)
        end
    end))
end
v3.CreateController(u10.new())
return nil