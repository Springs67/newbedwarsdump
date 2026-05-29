local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "bw-player-render")
local u9 = v8.BWPlayerRender
local u10 = v8.PlayerRenderFallbackMode
return {
    ["VersusHud"] = v7.new(u6)(function(p11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u6
            [3] = u5
            [4] = u3
            [5] = u9
            [6] = u10
        --]]
        local _ = p12.useState
        local _ = p12.useEffect
        local v13 = u4.isMobileControls()
        local function v35(p14) --[[ Line: 16 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u5
                [3] = u3
                [4] = u9
                [5] = u10
            --]]
            local v15 = {
                ["Size"] = UDim2.fromScale(0.3, 1)
            }
            local v16 = p14.TeamInfo.FrameProps
            if v16 then
                for v17, v18 in v16 do
                    v15[v17] = v18
                end
            end
            local v19 = { u6.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 2.4074074074074074
                }), u6.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["Padding"] = UDim.new(0.1, 0)
                }) }
            local v20 = #v19
            local v21 = p14.TeamInfo.stat
            if v21 then
                local v22 = u6.createFragment
                local v23 = {}
                local v24 = u6.createElement
                local v25 = u5
                local v26 = {
                    ["Size"] = UDim2.fromScale(1, 0.25)
                }
                local v27 = {
                    u6.createElement("UIListLayout", {
                        ["FillDirection"] = "Horizontal",
                        ["HorizontalAlignment"] = "Center",
                        ["VerticalAlignment"] = "Center",
                        ["SortOrder"] = "LayoutOrder"
                    }),
                    ["Icon"] = u6.createElement("ImageLabel", {
                        ["SizeConstraint"] = "RelativeYY",
                        ["ScaleType"] = "Fit",
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["Image"] = p14.TeamInfo.stat.icon
                    })
                }
                local v28 = u6.createElement
                local v29 = {
                    ["AutomaticSize"] = "X",
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(0, 1)
                }
                local v30 = p14.TeamInfo.stat.value
                v29.Text = tostring(v30)
                v29.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                v29.TextColor3 = u3.WHITE
                v27.Value = v28("TextLabel", v29, { u6.createElement("UIStroke") })
                v23.StatWrapper = v24(v25, v26, v27)
                v21 = v22(v23)
            end
            if v21 then
                v19[v20 + 1] = v21
            end
            local _ = #v19
            local v31 = {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.65),
                ["BackgroundColor3"] = p14.TeamInfo.teamColor
            }
            local v32 = { u6.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }) }
            local v33 = #v32
            local v34
            if p14.TeamInfo.offlinePlayer == nil then
                v34 = false
            else
                v34 = u6.createElement(u9, {
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["Position"] = UDim2.fromScale(p14.RightIcon and 1 or -0, 0.5),
                    ["AnchorPoint"] = Vector2.new(p14.RightIcon and 0 or 1, 0.5),
                    ["Size"] = UDim2.fromScale(2, 2),
                    ["PlayerUserId"] = p14.TeamInfo.offlinePlayer.userId,
                    ["FallbackMode"] = u10.KIT,
                    ["PlayerThumbnail"] = {
                        ["Type"] = Enum.ThumbnailType.AvatarThumbnail,
                        ["Size"] = Enum.ThumbnailSize.Size420x420
                    }
                }, { u6.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
            end
            if v34 then
                v32[v33 + 1] = v34
            end
            local _ = #v32
            v32.TeamName = u6.createElement("TextLabel", {
                ["TextXAlignment"] = "Center",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.9, 0.7),
                ["Text"] = p14.TeamInfo.Name,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u3.WHITE
            }, { u6.createElement("UIStroke") })
            v19.TeamInfoWrapper = u6.createElement("Frame", v31, v32)
            return u6.createElement(u5, v15, v19)
        end
        local v36 = {
            ["ResetOnSpawn"] = false,
            ["IgnoreGuiInset"] = u4.isSmallScreen()
        }
        local v37 = {}
        local _ = #v37
        local v38 = p11.TeamA ~= nil
        if v38 then
            local v39 = {}
            local v40 = {}
            for v41, v42 in p11.TeamA do
                v39[v41] = v42
            end
            v39.FrameProps = {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.3, 1)
            }
            v40.TeamInfo = v39
            v38 = u6.createElement(v35, v40)
        end
        local v43 = {
            ["Size"] = UDim2.fromScale(0.5, 0.125)
        }
        local v44
        if v13 then
            v44 = UDim2.fromScale(0.5, 0.2)
        else
            v44 = UDim2.fromScale(0.5, 0.1)
        end
        v43.Position = v44
        v43.AnchorPoint = Vector2.new(0.5, 0)
        local v45 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v46 = #v45
        if v38 then
            v45[v46 + 1] = v38
        end
        local v47 = #v45
        v45[v47 + 1] = u6.createElement(u5, {
            ["AutomaticSize"] = "X",
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0, 1)
        }, {
            ["VS"] = u6.createElement("TextLabel", {
                ["AutomaticSize"] = "X",
                ["Text"] = "VS",
                ["TextYAlignment"] = "Center",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Position"] = UDim2.new(0.5, 2, 0.25, 2),
                ["Size"] = UDim2.fromScale(0, 0.7),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = Color3.fromRGB(255, 189, 89)
            }),
            ["VS_Background"] = u6.createElement("TextLabel", {
                ["AutomaticSize"] = "X",
                ["Text"] = "VS",
                ["TextYAlignment"] = "Center",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Position"] = UDim2.new(0.5, 6, 0.25, 6),
                ["Size"] = UDim2.fromScale(0, 0.7),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = Color3.fromRGB(255, 149, 89)
            })
        })
        local v48 = p11.TeamB ~= nil
        if v48 then
            local v49 = {}
            local v50 = {}
            for v51, v52 in p11.TeamB do
                v49[v51] = v52
            end
            v49.FrameProps = {
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(0.3, 1)
            }
            v50.TeamInfo = v49
            v50.RightIcon = true
            v48 = u6.createElement(v35, v50)
        end
        if v48 then
            v45[v47 + 2] = v48
        end
        v37.VersusHud = u6.createElement(u5, v43, v45)
        return u6.createFragment({
            ["VersusHudScreenGui"] = u6.createElement("ScreenGui", v36, v37)
        })
    end)
}