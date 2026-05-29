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
local u12 = v1.import(script, script.Parent, "clan-lobby-selector-type").ClanLobbySelectorType
local u13 = v1.import(script, script.Parent, "clan-tag-selector-widget").ClanTagSelectorWidget
local u14 = v1.import(script, script.Parent, "podium-banner-selector-widget").PodiumBannerSelectorWidget
local v27 = v8.new(u7)(function(u15) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u4
        [4] = u2
        [5] = u10
        [6] = u11
        [7] = u6
        [8] = u12
        [9] = u14
        [10] = u13
    --]]
    local v16 = u15.myClanId
    if v16 == "" or not v16 then
        return u7.createFragment()
    end
    local v17 = u7.createElement
    local v18 = "ScreenGui"
    local v19 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u5.isSmallScreen()
    }
    local v20 = {}
    local v21 = u7.createElement(u4, {
        ["AppId"] = u15.AppId,
        ["OnClick"] = function() --[[ Name: OnClick, Line 28 ]]
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
    local v22 = u7.createElement
    local v23 = u6
    local v24 = {}
    local v25 = {}
    local v26
    if u15.type == u12.PODIUM_BANNER then
        v26 = u7.createElement(u14, {
            ["AppId"] = u15.AppId,
            ["store"] = u15.store
        })
    elseif u15.type == u12.CLAN_TAG_COLOR then
        v26 = u7.createElement(u13, {
            ["AppId"] = u15.AppId,
            ["store"] = u15.store
        })
    else
        v26 = u7.createFragment()
    end
    __set_list(v25, 1, {v26})
    __set_list(v20, 1, {v21, v22(v23, v24, v25)})
    return v17(v18, v19, v20)
end)
return {
    ["ClanLobbySelectorApp"] = v9.connect(function(p28, p29) --[[ Line: 48 ]]
        local v30 = {}
        for v31, v32 in p29 do
            v30[v31] = v32
        end
        v30.store = p28
        v30.myClanId = p28.Clans.myClanId
        return v30
    end)(v27)
}