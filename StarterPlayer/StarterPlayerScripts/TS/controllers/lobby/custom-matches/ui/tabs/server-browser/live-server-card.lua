local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.GetTarmacAsset
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = v1.import(script, script.Parent, "server-health-icon").ServerHealthIcon
return {
    ["LiveServerCard"] = v8.new(u7)(function(u11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u5
            [3] = u7
            [4] = u3
            [5] = u9
            [6] = u10
            [7] = u4
        --]]
        local _ = p12.useState
        local v13 = u11.serverInfo.blobData.thumbnailImage
        local v14
        if v13 == "" or not v13 then
            v14 = u5("NoImage").Image
        else
            v14 = "rbxassetid://" .. string.gsub(u11.serverInfo.blobData.thumbnailImage, "rbxassetid://", "")
        end
        local v15 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v16 = { (u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.03, 0)
            })) }
        local v17 = u7.createElement
        local v20 = {
            ["Size"] = UDim2.fromScale(1, 0.72),
            ["Image"] = v14,
            ["ScaleType"] = "Crop",
            ["AutoButtonColor"] = false,
            ["BackgroundTransparency"] = 0.3,
            ["BackgroundColor3"] = u3.BLACK,
            ["LayoutOrder"] = 1,
            ["ImageTransparency"] = 0.1,
            [u7.Event.Activated] = function() --[[ Line: 37 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u11
                --]]
                u6.Controllers.LiveGamesBrowserController:joinServer(u11.serverInfo.blobData.joinCode)
            end,
            [u7.Event.MouseEnter] = function(p18) --[[ Line: 40 ]]
                p18.ImageTransparency = 0
            end,
            [u7.Event.MouseLeave] = function(p19) --[[ Line: 43 ]]
                p19.ImageTransparency = 0.1
            end
        }
        local v21 = { (u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            })) }
        local v22 = u7.createElement
        local v23 = {
            ["AutomaticSize"] = "X",
            ["BackgroundTransparency"] = 0.3,
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["Position"] = UDim2.fromScale(0.02, 0.95),
            ["Size"] = UDim2.fromScale(0.35, 0.2),
            ["BackgroundColor3"] = u3.BLACK
        }
        local v24 = {
            u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }),
            u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 2.3333333333333335
            }),
            u7.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0, 6),
                ["PaddingRight"] = UDim.new(0, 6)
            }),
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 2)
            }),
            (u7.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.525),
                ["Image"] = u9.USERS_SOLID
            }))
        }
        local v25 = u7.createElement
        local v26 = {
            ["AutomaticSize"] = "X",
            ["TextXAlignment"] = "Center",
            ["TextYAlignment"] = "Center",
            ["TextScaled"] = true,
            ["TextWrapped"] = true,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0, 0.7)
        }
        local v27 = u11.serverInfo.players
        v26.Text = tostring(v27)
        v26.TextColor3 = u3.WHITE
        v26.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v24.PlayerCount = v25("TextLabel", v26)
        v21.StatisticPill = v22("Frame", v23, v24)
        v16.Thumbnail = v17("ImageButton", v20, v21)
        local _ = #v16
        local v28 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.25)
        }
        local v29 = {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Left",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.03, 0)
            }),
            ["ServerTitle"] = u7.createElement("TextLabel", {
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["TextScaled"] = true,
                ["TextWrapped"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.55),
                ["Text"] = u11.serverInfo.blobData.mapTitle,
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
            })
        }
        local _ = #v29
        local v30 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.42),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.fromScale(1, 0)
        }
        local v31 = {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder"
            }),
            ["HostName"] = u7.createElement("TextLabel", {
                ["AutomaticSize"] = "X",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["TextScaled"] = true,
                ["TextTransparency"] = 0.3,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0, 1),
                ["Text"] = u11.serverInfo.blobData.creator,
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular)
            }),
            ["MatchState"] = u7.createElement("TextLabel", {
                ["AutomaticSize"] = "X",
                ["Text"] = " ",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["TextScaled"] = true,
                ["TextTransparency"] = 0.3,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0, 1),
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular)
            })
        }
        local v32 = #v31
        local v33
        if u11.serverInfo.blobData.healthState == nil then
            v33 = false
        else
            v33 = u7.createElement(u10, {
                ["layoutOrder"] = 3,
                ["serverHealthState"] = u11.serverInfo.blobData.healthState
            })
        end
        if v33 then
            v31[v32 + 1] = v33
        end
        v29.ServerInfo = u7.createElement(u4, v30, v31)
        v16.InfoContainer = u7.createElement(u4, v28, v29)
        return u7.createFragment({
            ["LiveServerCard"] = u7.createElement(u4, v15, v16)
        })
    end)
}