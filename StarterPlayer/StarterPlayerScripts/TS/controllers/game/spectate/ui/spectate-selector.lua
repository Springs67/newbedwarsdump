local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.Empty
local u5 = v2.ImageId
local u6 = v2.PlayerRender
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u32 = v9.new(u8)(function(p12, p13) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u10
        [4] = u8
        [5] = u7
        [6] = u6
        [7] = u4
        [8] = u11
    --]]
    local _ = p13.useState
    local v14 = u5.MOUSE
    if u3.isMobileControls() then
        v14 = u5.TOUCH
    end
    local v15
    if p12.store.Game.spectatingPlayer then
        v15 = u10.getPlayer(p12.store.Game.spectatingPlayer)
    else
        v15 = nil
    end
    local v16 = nil
    for v17, v18 in p12.store.Game.teams do
        local _ = v17 - 1
        local v19 = v18.id
        if v15 ~= nil then
            local v20 = v15.Team
            if v20 ~= nil then
                v20 = v20.Name
            end
        end
        if v19 == v20 == true then
            v16 = v18
            break
        end
    end
    local v21 = {
        ["Size"] = UDim2.fromScale(0.13, 0.13),
        ["Position"] = UDim2.fromScale(0.02, 0.7),
        ["ImageTransparency"] = 1,
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["AutoButtonColor"] = false,
        ["Selectable"] = false,
        [u8.Event.MouseButton1Click] = function() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            u7.Controllers.SpectateController:switchSpectateTargets("next")
        end
    }
    local v22 = { u8.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 3.1192660550458715
        }), u8.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Left"
        }) }
    local v23 = #v22
    local v24 = {
        ["SizeConstraint"] = "RelativeYY",
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v25 = {}
    local v26 = #v25
    local v27
    if p12.store.Game.spectatingPlayer == nil then
        v27 = false
    else
        v27 = u8.createElement(u6, {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["PlayerUserId"] = p12.store.Game.spectatingPlayer.userId
        })
    end
    if v27 then
        v25[v26 + 1] = v27
    end
    v22[v23 + 1] = u8.createElement(u4, v24, v25)
    local v28 = {
        ["SizeConstraint"] = "RelativeYY",
        ["Size"] = UDim2.fromScale(2.1192660550458715, 1)
    }
    local v29 = {}
    local v30 = #v29
    local v31 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Font"] = "LuckiestGuy",
        ["TextScaled"] = true,
        ["RichText"] = true,
        ["TextXAlignment"] = "Left",
        ["Text"] = not v15 and "Unknown" or u11.getGamePlayer(v15):getDisplayName(),
        ["Size"] = UDim2.fromScale(1, 0.6),
        ["Position"] = UDim2.fromScale(0, 0)
    }
    if v16 ~= nil then
        v16 = v16.color
    end
    if v16 == nil then
        v16 = Color3.fromRGB(255, 255, 255)
    end
    v31.TextColor3 = v16
    v31.AutoLocalize = false
    v29[v30 + 1] = u8.createElement("TextLabel", v31, { u8.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0.1, 0),
            ["PaddingTop"] = UDim.new(0.2),
            ["PaddingBottom"] = UDim.new(0.1)
        }) })
    v29[v30 + 2] = u8.createElement(u4, {
        ["Size"] = UDim2.fromScale(1, 0.4),
        ["Position"] = UDim2.fromScale(0, 1),
        ["AnchorPoint"] = Vector2.new(0, 1)
    }, {
        u8.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center"
        }),
        u8.createElement(u4, {
            ["Size"] = UDim2.fromScale(0.1, 0)
        }),
        u8.createElement("ImageLabel", {
            ["ImageTransparency"] = 0.18,
            ["SizeConstraint"] = "RelativeYY",
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Image"] = v14,
            ["Size"] = UDim2.fromScale(1, 1)
        }),
        u8.createElement("TextLabel", {
            ["Text"] = "NEXT PLAYER",
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Font"] = "Roboto",
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["TextTransparency"] = 0.18,
            ["Size"] = UDim2.fromScale(0.8, 1),
            ["Position"] = UDim2.fromScale(0, 0),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }, { u8.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.06, 0),
                ["PaddingTop"] = UDim.new(0.22),
                ["PaddingBottom"] = UDim.new(0.22)
            }) })
    })
    v22[v23 + 2] = u8.createElement(u4, v28, v29)
    return u8.createElement("ImageButton", v21, v22)
end)
return {
    ["SpectateSelectorWrapper"] = function(p33) --[[ Name: SpectateSelectorWrapper, Line 161 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u32
        --]]
        return u8.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false,
            ["IgnoreGuiInset"] = true,
            ["DisplayOrder"] = 90
        }, { u8.createElement(u32, {
                ["store"] = p33.store
            }) })
    end,
    ["SpectateSelector"] = u32
}