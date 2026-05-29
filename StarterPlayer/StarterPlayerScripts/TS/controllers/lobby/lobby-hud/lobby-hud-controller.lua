local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u8 = v1.import(script, script.Parent, "lobby-hud-main", "lobby-hud-main").LobbyHudMain
local u9 = v1.import(script, script.Parent, "lobby-hud-side", "lobby-hud-side").LobbyHudSide
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "LobbyHudController"
    end,
    ["__index"] = u5
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
        [1] = u5
    --]]
    u5.constructor(p13)
    p13.Name = "LobbyHudController"
    p13.lobbyHudHiddenIds = {}
end
function u10.KnitStart(u14) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u7
    --]]
    u5.KnitStart(u14)
    task.spawn(function() --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        while not game:IsLoaded() do
            task.wait(0.5)
        end
        u14:mountLobbyHud()
    end)
    u3.Controllers.PreloadController:runPreload({
        ["sounds"] = {
            u7.UI_HOVER,
            u7.UI_CLICK_2,
            u7.UI_OPEN_2,
            u7.UI_CLOSE_2
        }
    })
end
function u10.mountLobbyHud(_) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
        [3] = u9
    --]]
    if not u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("LobbyHudMain") then
        local v15 = {
            ["appId"] = "LobbyHudMain",
            ["app"] = u8
        }
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v15, {})
    end
    if not u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("LobbyHudSide") then
        local v16 = {
            ["appId"] = "LobbyHudSide",
            ["app"] = u9
        }
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v16, {})
    end
end
function u10.unmountLobbyHud(_) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("LobbyHudSide") then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("LobbyHudSide")
    end
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("LobbyHudMain") then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("LobbyHudMain")
    end
end
function u10.openLobbyPlayMenu(_) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
        [3] = u4
        [4] = u3
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u6.LOBBY_PLAY_MENU_APP, {})
    if u4.LocalPlayer:GetAttribute("GamesPlayed") == 0 then
        u3.Controllers.AnalyticsController:sendFunnelEvent("Onboarding Funnel", nil, 2, "First Opened Play Menu")
    end
end
function u10.hideLobbyHud(p17, p18) --[[ Line: 71 ]]
    local v19 = p17.lobbyHudHiddenIds
    table.insert(v19, p18)
    p17:unmountLobbyHud()
end
function u10.unhideLobbyHud(p20, p21) --[[ Line: 77 ]]
    local v22 = p20.lobbyHudHiddenIds
    local v23 = (table.find(v22, p21) or 0) - 1
    if v23 ~= -1 then
        table.remove(p20.lobbyHudHiddenIds, v23 + 1)
    end
    if #p20.lobbyHudHiddenIds == 0 then
        p20:mountLobbyHud()
    end
end
u3.CreateController(u10.new())
return nil