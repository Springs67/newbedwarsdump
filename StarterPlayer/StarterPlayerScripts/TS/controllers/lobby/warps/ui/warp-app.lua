local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.ButtonComponent
local u6 = v3.ColorUtil
local u7 = v3.DarkBackground
local u8 = v3.DeviceUtil
local u9 = v3.Empty
local u10 = v3.IconButton
local u11 = v3.Padding
local u12 = v3.ScaleComponent
local u13 = v3.SlideIn
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "lobby-warps", "lobby-warps")
local u20 = v19.LobbyWarp
local u21 = v19.LobbyWarpMeta
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v53 = v16.new(u15)(function(u24, p25) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u2
        [3] = u8
        [4] = u15
        [5] = u7
        [6] = u23
        [7] = u12
        [8] = u9
        [9] = u11
        [10] = u6
        [11] = u10
        [12] = u18
        [13] = u14
        [14] = u20
        [15] = u21
        [16] = u5
        [17] = u4
        [18] = u13
    --]]
    local _ = p25.useState
    local u26 = nil
    u26 = function() --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u24
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u24.AppId)
    end
    local v27 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u8.isSmallScreen()
    }
    local v28 = { u15.createElement(u7, {
            ["AppId"] = u24.AppId
        }) }
    local v29 = #v28
    local v30 = {}
    local v31 = #v30
    local v32 = {
        ["BackgroundTransparency"] = 0,
        ["BorderSizePixel"] = 0,
        ["Modal"] = true,
        ["AutoButtonColor"] = false,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromOffset(190, 200),
        ["BackgroundColor3"] = u23.backgroundTertiary
    }
    local v33 = { u15.createElement(u12, {
            ["MaximumSize"] = Vector2.new(800, 459),
            ["ScreenPadding"] = Vector2.new(24, 24)
        }), (u15.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.05, 0)
        })) }
    local v34 = u15.createElement
    local v35 = u9
    local v36 = {
        ["Size"] = UDim2.fromScale(1, 0.1)
    }
    local v37 = {
        u15.createElement(u11, {
            ["Padding"] = {
                ["Top"] = 4,
                ["Left"] = 6,
                ["Right"] = 6
            }
        }),
        u15.createElement("TextLabel", {
            ["Text"] = "Warps",
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.5, 1),
            ["TextColor3"] = u6.WHITE,
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
        }),
        ["CloseButton"] = u15.createElement(u10, {
            ["Size"] = UDim2.fromScale(1, 1),
            ["SizeConstraint"] = "RelativeYY",
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.fromScale(0.99, 0.01),
            ["Image"] = u18.X,
            [u15.Event.Activated] = function() --[[ Line: 91 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                u26()
            end
        }, { u15.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
    }
    v33.Header = v34(v35, v36, v37)
    local _ = #v33
    local v38 = {
        ["Position"] = UDim2.fromScale(0, 0.1),
        ["Size"] = UDim2.fromScale(1, 0.75)
    }
    local v39 = { u15.createElement(u11, {
            ["Padding"] = {
                ["Top"] = 8,
                ["Left"] = 12,
                ["Right"] = 12
            }
        }) }
    local v40 = #v39
    local v41 = u14.values(u20)
    local function v45(u42) --[[ Line: 117 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u15
            [3] = u5
            [4] = u22
            [5] = u26
        --]]
        local v43 = u21[u42]
        return u15.createElement(u5, {
            ["Size"] = UDim2.new(1, 0, 0, 18),
            ["Text"] = string.upper(v43.name),
            ["OnClick"] = function() --[[ Name: OnClick, Line 122 ]]
                --[[
                Upvalues:
                    [1] = u42
                    [2] = u22
                    [3] = u26
                --]]
                local v44 = u42
                u22.Client:Get("LobbyRequestTeleportToLocation"):SendToServer(v44)
                u26()
            end
        })
    end
    local v46 = table.create(#v41)
    for v47, v48 in v41 do
        v46[v47] = v45(v48, v47 - 1, v41)
    end
    local v49 = { u15.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["Padding"] = UDim.new(0, 6)
        }) }
    local v50 = #v49
    for v51, v52 in v46 do
        v49[v50 + v51] = v52
    end
    v39[v40 + 1] = u15.createElement(u4, {}, v49)
    v33.Body = u15.createElement(u9, v38, v39)
    v30[v31 + 1] = u15.createElement("ImageButton", v32, v33)
    v28[v29 + 1] = u15.createElement(u13, {}, v30)
    return u15.createFragment({
        ["WarpAppScreenGui"] = u15.createElement("ScreenGui", v27, v28)
    })
end)
return {
    ["WarpApp"] = v17.connect(function(_, p54) --[[ Line: 153 ]]
        local v55 = {}
        for v56, v57 in p54 do
            v55[v56] = v57
        end
        return v55
    end)(v53)
}