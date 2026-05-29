local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").UILayers
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent.Parent.Parent, "lobby", "player-profile", "ui", "player-profile-app").PlayerProfileApp
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "PlayerProfileUIController"
    end,
    ["__index"] = u8
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p15)
    p15.Name = "PlayerProfileUIController"
end
function u12.KnitStart(u16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u11
        [3] = u10
        [4] = u6
        [5] = u5
        [6] = u9
    --]]
    u8.KnitStart(u16)
    task.spawn(function() --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u10
            [3] = u6
            [4] = u5
            [5] = u9
        --]]
        while not game:IsLoaded() do
            task.wait(0.5)
        end
        if u11.isLobbyServer() then
            u10.Client:Get("RequestProfileData"):CallServerAsync(u6.LocalPlayer):andThen(function(p17) --[[ Line: 39 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u6
                    [3] = u9
                --]]
                if p17 then
                    u5.Info("Successfully retrieved profile data for " .. u6.LocalPlayer.Name)
                    u9:dispatch({
                        ["type"] = "LobbySetProfileData",
                        ["profileData"] = p17
                    })
                end
            end)
        end
    end)
    u10.Client:Get("OpenPlayerProfile"):Connect(function(p18) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u9
            [3] = u16
        --]]
        if p18.profileData then
            if u11.isLobbyServer() then
                u9:dispatch({
                    ["type"] = "LobbySetCurrentlyViewingProfileData",
                    ["profileData"] = p18.profileData
                })
                return
            end
        else
            u16:openPlayerProfileLoading()
        end
    end)
end
function u12.openPlayerProfileFromData(_, p19) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u4
        [3] = u2
        [4] = u7
        [5] = u3
    --]]
    if u11.isLobbyServer() then
        u4.Controllers.PlayerProfileHighlightController:unmountPlayerInfoBillboard()
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        ["appId"] = "PlayerProfile",
        ["app"] = u7,
        ["layer"] = u3.MAIN
    }, {
        ["AppId"] = "PlayerProfile",
        ["ProfileData"] = p19
    })
end
function u12.openPlayerProfileLoading(_) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u4
        [3] = u9
        [4] = u2
        [5] = u7
        [6] = u3
    --]]
    if u11.isLobbyServer() then
        u4.Controllers.PlayerProfileHighlightController:unmountPlayerInfoBillboard()
        u9:dispatch({
            ["type"] = "LobbySetCurrentlyViewingProfileData",
            ["profileData"] = nil
        })
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        ["appId"] = "PlayerProfile",
        ["app"] = u7,
        ["layer"] = u3.MAIN
    }, {
        ["AppId"] = "PlayerProfile"
    })
end
function u12.openPlayerProfile(p20, p21) --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u2
    --]]
    p20:openPlayerProfileLoading()
    u10.Client:Get("RequestProfileData"):CallServerAsync(p21):andThen(function(p22) --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u2
        --]]
        if p22 then
            u9:dispatch({
                ["type"] = "LobbySetCurrentlyViewingProfileData",
                ["profileData"] = p22
            })
        else
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("PlayerProfile")
        end
    end)
end
u4.CreateController(u12.new())
return nil