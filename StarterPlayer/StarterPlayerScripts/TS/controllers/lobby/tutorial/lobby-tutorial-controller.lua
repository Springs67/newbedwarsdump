local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.RunService
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, script.Parent.Parent, "lobby-hud", "lobby-play-menu", "lobby-play-menu-pages").LobbyPlayMenuPage
local u14 = v1.import(script, script.Parent, "kit-rental-ui", "beginner-kit-rental-popup").BeginnerKitRentalPopup
local u15 = v1.import(script, script.Parent, "tutorial-loading-screen").TutorialLoadingScreen
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "LobbyTutorialController"
    end,
    ["__index"] = u10
})
u16.__index = u16
function u16.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p19)
    p19.Name = "LobbyTutorialController"
end
function u16.KnitStart(u20) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u8
        [3] = u12
        [4] = u4
        [5] = u14
        [6] = u5
        [7] = u2
        [8] = u11
        [9] = u13
    --]]
    u10.KnitStart(u20)
    if u8.LocalPlayer:GetAttribute("LoadingTutorialTeleport") == true then
        task.spawn(function() --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            u20:mountTutorialLoadingHUD()
        end)
    end
    u8.LocalPlayer:GetAttributeChangedSignal("LoadingTutorialTeleport"):Connect(function() --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u20
        --]]
        if u8.LocalPlayer:GetAttribute("LoadingTutorialTeleport") == true then
            u20:mountTutorialLoadingHUD()
        end
    end)
    u12.Client:OnEvent("OpenBeginnerKitRentalPopup", function() --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u14
        --]]
        local v21 = {
            ["app"] = {
                ["appId"] = "BeginnerKitRentalPopup",
                ["app"] = u14
            },
            ["props"] = {}
        }
        u4.Controllers.UiQueueManagerController:queueApp(v21)
    end)
    u12.Client:OnEvent("PromptTutorial", function() --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
            [3] = u11
            [4] = u13
        --]]
        local v22 = u5.Controllers.LobbyTutorialController:hasCompletedTutorial()
        if not v22 then
            local v23 = u5.Controllers.PlayerLevelController:getPlayerLevel()
            v22 = (v23 == nil and 0 or v23) >= 2
        end
        local v24 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
        local v25 = u11.LOBBY_PLAY_MENU_APP
        local v26 = {}
        local v27
        if v22 then
            v27 = u13.GAME_SELECT
        else
            v27 = u13.WELCOME
        end
        v26.Page = v27
        v24:openApp(v25, v26)
    end)
end
function u16.mountTutorialLoadingHUD(_) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u15
    --]]
    local v28 = {
        ["appId"] = "TutorialLoadingScreen",
        ["app"] = u15
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v28, {})
end
function u16.unmountTutorialLoadingHUD(_) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("TutorialLoadingScreen")
end
function u16.hasCompletedTutorial(_) --[[ Line: 82 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return u8.LocalPlayer:GetAttribute("HasCompletedTutorial") == true
end
function u16.selectKitRental(p29, p30) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    if u12.Client:Get("PlayerSelectedBeginnerKit"):CallServer(p30) then
        p29:closeKitRentalPopup()
    end
end
function u16.closeKitRentalPopup(_) --[[ Line: 91 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("BeginnerKitRentalPopup")
end
function u16.respondToTutorialPrompt(p31, p32) --[[ Line: 94 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u6
    --]]
    u12.Client:Get("RespondedToTutorialPrompt"):CallServer(p32)
    if p31.promptTree then
        u6.unmount(p31.promptTree)
        p31.promptTree = nil
    end
end
function u16.shouldHideLobbyContent(_) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return u8.LocalPlayer:GetAttribute("HideLobbyContentForBeginner")
end
function u16.isFirstTimePlayer(_) --[[ Line: 104 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
    --]]
    if u9:IsStudio() then
        return false
    else
        return u8.LocalPlayer:GetAttribute("FirstTimePlayer")
    end
end
u4.CreateController(u16.new())
return nil