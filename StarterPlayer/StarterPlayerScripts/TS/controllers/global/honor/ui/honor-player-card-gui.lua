local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.Padding
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["HonorPlayerCardGUI"] = v9.new(u8)(function(u15, p16) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u13
            [3] = u14
            [4] = u4
            [5] = u10
            [6] = u12
            [7] = u7
            [8] = u5
            [9] = u3
            [10] = u6
            [11] = u11
        --]]
        local v17 = p16.useState
        local v18 = p16.useEffect
        local v19 = u8.createRef()
        local u20 = u8.createRef()
        local u21, u22 = v17(nil)
        local function v33() --[[ Line: 22 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u21
                [3] = u13
                [4] = u14
            --]]
            local v23 = u8.createFragment
            local v24 = {}
            local v25 = u8.createElement
            local v26 = "Frame"
            local v27 = {
                ["BackgroundTransparency"] = 0.35,
                ["Size"] = UDim2.fromScale(0.35, 0.35),
                ["Position"] = UDim2.fromScale(1, 0),
                ["AnchorPoint"] = Vector2.new(1, 0),
                ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
            }
            local v28 = { (u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                })) }
            local v29 = u8.createElement
            local v30 = "ImageLabel"
            local v31 = {
                ["ScaleType"] = "Crop",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1
            }
            local v32
            if u21 then
                v32 = u13[u21].renderImage
            else
                v32 = u14.X
            end
            v31.Image = v32
            v31.Size = UDim2.fromScale(0.875, 0.875)
            v31.Position = UDim2.fromScale(0.5, 0.5)
            v31.AnchorPoint = Vector2.new(0.5, 0.5)
            v28.PlayerKitImage = v29(v30, v31, { u8.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
            v24.PlayerKitFrame = v25(v26, v27, v28)
            return v23(v24)
        end
        v18(function() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u4
                [3] = u14
                [4] = u10
                [5] = u15
                [6] = u22
                [7] = u12
                [8] = u7
            --]]
            local v34 = u20:getValue()
            if v34 then
                if u4.isHoarceKat() then
                    v34.Image = u14.QUESTION_MARK_SOLID
                else
                    v34.Image = u10:GetUserThumbnailAsync(u15.Player.userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size352x352)
                end
            end
            if u4.isHoarceKat() then
                u22(u12.AERY)
            else
                local v35 = u10:GetPlayerByUserId(u15.Player.userId)
                if v35 then
                    u22((u7.Controllers.KitController:getPrimaryActiveKit(v35)))
                end
            end
        end, {})
        local v36 = u8.createFragment
        local v37 = {}
        local v38 = u8.createElement
        local v39 = u5
        local v40 = {
            ["Size"] = UDim2.new(1, 0, 1, 0),
            ["SizeConstraint"] = "RelativeYY",
            [u8.Ref] = v19,
            ["BackgroundColor3"] = u3.WHITE,
            ["BackgroundTransparency"] = 0,
            ["LayoutOrder"] = u15.Index
        }
        local v41 = {
            u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 0.75
            }),
            u8.createElement("UIListLayout", {
                ["Padding"] = UDim.new(0),
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            ["TopSection"] = u8.createElement(u5, {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.7)
            }, {
                u8.createElement(u6, {
                    ["Padding"] = UDim.new(0.05, 0)
                }),
                ["PlayerAvatar"] = u8.createElement("ImageLabel", {
                    [u8.Ref] = u20,
                    ["Size"] = UDim2.fromScale(1, 0.78),
                    ["AnchorPoint"] = Vector2.new(0.5, 0),
                    ["Position"] = UDim2.fromScale(0.5, 0),
                    ["BackgroundColor3"] = u3.BLACK,
                    ["BackgroundTransparency"] = 0.7,
                    ["ScaleType"] = Enum.ScaleType.Crop,
                    ["LayoutOrder"] = 1
                }, { u8.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }), u8.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(1, 0)
                    }) }),
                u8.createElement(v33),
                ["DisplayName"] = u8.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["TextYAlignment"] = "Bottom",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["AutoLocalize"] = false,
                    ["Size"] = UDim2.fromScale(1, 0.45),
                    ["AnchorPoint"] = Vector2.new(0.5, 1),
                    ["Position"] = UDim2.fromScale(0.5, 1),
                    ["Text"] = u15.Player.displayName,
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = Color3.new(1, 1, 1)
                }, { u8.createElement("UIStroke", {
                        ["Transparency"] = 0.3
                    }) })
            })
        }
        local v42 = u15.Player.userId
        local v43 = "GiveHonorButton_" .. tostring(v42)
        local v44 = u8.createElement
        local v45 = "ImageButton"
        local v46 = {
            ["Size"] = UDim2.fromScale(1, 0.3)
        }
        local v47
        if u15.IsHonored then
            v47 = Color3.fromRGB(72, 168, 120)
        elseif u15.Disabled then
            v47 = Color3.fromRGB(66, 66, 66)
        else
            v47 = Color3.fromRGB(212, 213, 235)
        end
        v46.BackgroundColor3 = v47
        v46.BorderSizePixel = 0
        v46.LayoutOrder = 2
        v46.BackgroundTransparency = (u15.IsHonored or u15.Disabled) and 0.3 or 0
        v46[u8.Event.Activated] = function() --[[ Line: 140 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u4
                [3] = u11
                [4] = u7
            --]]
            if u15.Disabled or u15.IsHonored then
                return nil
            elseif u4.isHoarceKat() then
                u11:dispatch({
                    ["type"] = "GameAddHonoredPlayer",
                    ["userId"] = u15.Player.userId
                })
            else
                u7.Controllers.HonorController:honorPlayer(u15.Player.userId)
            end
        end
        v46.Interactable = not (u15.Disabled or u15.IsHonored)
        local v48 = { (u8.createElement("UICorner")) }
        local v49 = u8.createElement
        local v50 = "ImageLabel"
        local v51 = {
            ["BackgroundTransparency"] = 1,
            ["Image"] = u14.THUMBS_UP
        }
        local v52
        if u15.IsHonored then
            v52 = Color3.fromRGB(99, 255, 143)
        else
            v52 = Color3.fromRGB(26, 26, 26)
        end
        v51.ImageColor3 = v52
        v51.Size = UDim2.new(0.8, 0, 0.8, 0)
        v51.AnchorPoint = Vector2.new(0.5, 0.5)
        v51.Position = UDim2.fromScale(0.5, 0.5)
        v51.ImageTransparency = (u15.IsHonored or u15.Disabled) and 0.6 or 0
        v48.HonorImage = v49(v50, v51, { u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        v41[v43] = v44(v45, v46, v48)
        v37.HonorPlayerCard = v38(v39, v40, v41)
        return v36(v37)
    end)
}