local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchPlayerCharacter
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-config").PvPArenaConfig
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-types").PvPArenaGameState
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, script.Parent.Parent, "ui", "pvp-arena-shop-button").PvPArenaShopButton
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "PvpArenaShopController"
    end,
    ["__index"] = u6
})
u13.__index = u13
function u13.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
    --]]
    u6.constructor(p16, { u8.PVP_ARENA })
    p16.Name = "PvpArenaShopController"
end
function u13.KnitStart(p17) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.KnitStart(p17)
end
function u13.onGameInit(u18) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
        [3] = u3
        [4] = u5
        [5] = u4
        [6] = u9
    --]]
    u11.Client:Get("PvPArenaGameStateChanged"):Connect(function(p19) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u18
        --]]
        if p19.gameState == u10.INTERMISSION then
            u18:mountShopUI()
        end
        if p19.gameState == u10.IN_PROGRESS then
            u18:unMountShopUI()
        end
    end)
    u3(u5.LocalPlayer, function(_, _) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u10
            [3] = u18
        --]]
        if u4.Controllers.PvpArenaController:getGameState() == u10.IN_PROGRESS then
            u18:mountShopUI()
        end
    end)
    u11.Client:Get("PvPArenaMatchupCompleted"):Connect(function(p20) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u9
            [3] = u18
        --]]
        if not p20.roundEnded then
            local v21 = p20.winningTeamMembers
            local v22 = u5.LocalPlayer
            if table.find(v21, v22) ~= nil then
                task.delay(u9.ROUND_END_DELAY - 0.1, function() --[[ Line: 55 ]]
                    --[[
                    Upvalues:
                        [1] = u18
                    --]]
                    u18:mountShopUI()
                end)
            end
        end
    end)
end
function u13.mountShopUI(_) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u12
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("PvPArenaShopUI") then
        return nil
    end
    local v23 = {
        ["appId"] = "PvPArenaShopUI",
        ["app"] = u12
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v23, {})
end
function u13.unMountShopUI(_) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
    --]]
    if not u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("PvPArenaShopUI") then
        return nil
    end
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u7.BEDWARS_ITEM_SHOP) then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u7.BEDWARS_ITEM_SHOP)
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("PvPArenaShopUI")
end
u4.CreateController(u13.new())
return nil