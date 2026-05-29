local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DarkBackground
local u5 = v3.DeviceUtil
local u6 = v3.WidgetComponent
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "lobby", "lobby-hud", "lobby-hud-large-button").LobbyHudLargeButton
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").getEmoteAsset
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v25 = v8.new(u7)(function(p15, p16) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u4
        [4] = u12
        [5] = u14
        [6] = u2
        [7] = u11
        [8] = u10
        [9] = u13
        [10] = u6
    --]]
    local _ = p16.useState
    local _ = p16.useEffect
    local v17 = {
        ["ResetOnSpawn"] = false,
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = not u5.isSmallScreen()
    }
    local v18 = { u7.createElement(u4, {
            ["AppId"] = p15.AppId
        }) }
    local v19 = #v18
    local v20 = {
        ["Title"] = "SOCIAL",
        ["AppId"] = p15.AppId,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(u5.isSmallScreen() and 0.75 or 0.6, u5.isSmallScreen() and 0.75 or 0.6)
    }
    local v21 = { u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 10)
        }) }
    local v22 = #v21
    local v23 = {}
    local v24 = u12(u14.SELFIE)
    v23.Icon = v24 == nil and "" or v24
    v23.Text = "Friends"
    function v23.OnClick() --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u11
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u11.FRIENDS_LIST, {})
    end
    v23.FrameProps = {
        ["LayoutOrder"] = 0,
        ["Size"] = UDim2.fromScale(0.5, 1)
    }
    v21[v22 + 1] = u7.createElement(u10, v23)
    v21[v22 + 2] = u7.createElement(u10, {
        ["Text"] = "Verify",
        ["Icon"] = u13.XP_BOOST,
        ["OnClick"] = function() --[[ Name: OnClick, Line 65 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u11
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u11.SOCIAL_CONNECTIONS, {})
        end,
        ["FrameProps"] = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.5, 1)
        }
    })
    v18[v19 + 1] = u7.createElement(u6, v20, v21)
    return u7.createFragment({
        ["SocialApp"] = u7.createElement("ScreenGui", v17, v18)
    })
end)
return {
    ["SocialApp"] = v9.connect(function(_, p26) --[[ Line: 79 ]]
        local v27 = {}
        for v28, v29 in p26 do
            v27[v28] = v29
        end
        return v27
    end)(v25)
}