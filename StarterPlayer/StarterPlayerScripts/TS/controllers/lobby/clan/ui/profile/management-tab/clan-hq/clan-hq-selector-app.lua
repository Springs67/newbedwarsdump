local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DarkBackground
local u5 = v3.DeviceUtil
local u6 = v3.SlideIn
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u11 = v1.import(script, script.Parent.Parent.Parent, "clan-profile-core").ClanProfileTab
local u12 = v1.import(script, script.Parent, "background-music-selector-widget").BackgroundMusicSelectorWidget
local u13 = v1.import(script, script.Parent, "clan-hq-selector-type").ClanHqSelectorType
local u14 = v1.import(script, script.Parent, "skybox-selector-widget").SkyboxSelectorWidget
local v28 = v8.new(u7)(function(u15, p16) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u4
        [4] = u2
        [5] = u10
        [6] = u11
        [7] = u6
        [8] = u13
        [9] = u12
        [10] = u14
    --]]
    local _ = p16.useState
    local v17 = u15.myClanId
    if v17 == "" or not v17 then
        return u7.createFragment()
    end
    local v18 = u7.createElement
    local v19 = "ScreenGui"
    local v20 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u5.isSmallScreen()
    }
    local v21 = {}
    local v22 = u7.createElement(u4, {
        ["AppId"] = u15.AppId,
        ["OnClick"] = function() --[[ Name: OnClick, Line 29 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u10
                [3] = u15
                [4] = u11
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u10.CLAN_PROFILE, {
                ["ClanId"] = u15.myClanId,
                ["tab"] = u11.MANAGEMENT
            })
            return true
        end
    })
    local v23 = u7.createElement
    local v24 = u6
    local v25 = {}
    local v26 = {}
    local v27
    if u15.type == u13.BACKGROUND_MUSIC then
        v27 = u7.createElement(u12, {
            ["AppId"] = u15.AppId,
            ["store"] = u15.store
        })
    else
        v27 = u7.createElement(u14, {
            ["AppId"] = u15.AppId,
            ["store"] = u15.store
        })
    end
    __set_list(v26, 1, {v27})
    __set_list(v21, 1, {v22, v23(v24, v25, v26)})
    return v18(v19, v20, v21)
end)
return {
    ["ClanHqSelectorApp"] = v9.connect(function(p29, p30) --[[ Line: 49 ]]
        local v31 = {}
        for v32, v33 in p30 do
            v31[v32] = v33
        end
        v31.store = p29
        v31.myClanId = p29.Clans.myClanId
        local v34 = p29.Clans.myClan
        if v34 ~= nil then
            v34 = v34.clanHq
        end
        v31.clanHq = v34
        return v31
    end)(v28)
}