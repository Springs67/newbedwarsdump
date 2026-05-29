local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local v4 = v2.BedWarsPlaces
local u5 = v2.ColorUtil
local u6 = v2.Empty
local u7 = v2.Padding
local u8 = v2.PlaceId
local u9 = v2.PlayerRender
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").ServerType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = { v4.GAME, v4.GAME_MEGA, v4.GAME_MICRO }
local v47 = v13.new(u12)(function(u18, p19) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u8
        [3] = u17
        [4] = u16
        [5] = u10
        [6] = u11
        [7] = u12
        [8] = u7
        [9] = u9
        [10] = u6
        [11] = u3
        [12] = u5
    --]]
    local v20 = p19.useState
    local v21 = p19.useEffect
    local v22, u23 = v20(nil)
    local v24 = u18.Friend
    local v25 = u15:GetPlayerByUserId(u18.Friend.info.VisitorId) ~= nil
    local v26 = u18.Friend.placeId == u8.LOBBY and true or u18.Friend.placeId == u8.AFK
    local v27 = u18.Friend.placeId
    local v28 = table.find(u17, v27) ~= nil
    v21(function() --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u18
            [3] = u23
            [4] = u11
        --]]
        u10.Controllers.BedwarsPlayerLocationController:getPlayerLocation(u18.Friend.info.VisitorId):andThen(function(p29) --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u11
            --]]
            if not p29 then
                u23(nil)
                return nil
            end
            local v30 = (p29.inCustomMatch or p29.serverType == u11.STANDARD_SERVER) and "JOIN" or (not p29.inCustomMatch and p29.serverType == u11.RESERVED_SERVER and "SPECTATE" or "")
            u23({
                ["title"] = p29.title,
                ["subtitle"] = p29.subtitle,
                ["buttonText"] = v30
            })
        end)
    end, {})
    local v31 = {
        ["BorderSizePixel"] = 0,
        ["AutoButtonColor"] = false,
        ["Size"] = UDim2.new(1, 0, 0, 70),
        ["BackgroundColor3"] = Color3.fromRGB(247, 247, 247)
    }
    local v32 = {
        u12.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 8)
        }),
        u12.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        }),
        u12.createElement(u7, {
            ["Padding"] = UDim.new(0, 8)
        }),
        u12.createElement(u9, {
            ["SizeConstraint"] = "RelativeYY",
            ["BackgroundTransparency"] = 0.3,
            ["LayoutOrder"] = 1,
            ["PlayerUserId"] = u18.Friend.info.VisitorId,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(33, 33, 33)
        }, { u12.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }) })
    }
    local v33 = #v32
    local v34 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.new(0.8, -76, 1, 0)
    }
    local v35 = { u12.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0, 2)
        }), u12.createElement(u6, {
            ["Size"] = UDim2.new(1, 0, 0, 36)
        }, { u12.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 0)
            }), u12.createElement(u3, {
                ["TextSize"] = 20,
                ["Text"] = v24.info.DisplayName,
                ["TextColor3"] = Color3.fromRGB(34, 34, 34),
                ["Font"] = Enum.Font.SourceSans
            }), u12.createElement(u3, {
                ["TextSize"] = 14,
                ["TextTransparency"] = 0.4,
                ["Text"] = "@" .. v24.info.UserName,
                ["TextColor3"] = u5.BLACK,
                ["Font"] = Enum.Font.SourceSans
            }) }) }
    local v36 = #v35
    local v37 = {
        ["Size"] = UDim2.new(1, 0, 0, 28)
    }
    local v38 = { u12.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 0)
        }) }
    local v39 = #v38
    local v40 = {}
    local v41
    if v22 == nil then
        v41 = v22
    else
        v41 = v22.title
    end
    if v41 == nil then
        v41 = string.upper(u18.Friend.locationDisplayName)
    end
    v40.Text = v41
    v40.TextSize = 14
    local _ = u18.Friend.placeId
    local v42
    if v26 then
        v42 = Color3.fromRGB(0, 148, 255)
    elseif v28 then
        v42 = Color3.fromRGB(29, 207, 0)
    else
        v42 = Color3.fromRGB(0, 148, 255)
    end
    v40.TextColor3 = v42
    v40.Font = Enum.Font.SourceSansBold
    v40.LayoutOrder = 1
    v38[v39 + 1] = u12.createElement(u3, v40)
    local v43 = {}
    local v44
    if v22 == nil then
        v44 = v22
    else
        v44 = v22.subtitle
    end
    v43.Text = v44 == nil and "" or v44
    v43.TextSize = 12
    v43.TextColor3 = Color3.fromRGB(34, 34, 34)
    v43.Font = Enum.Font.SourceSansBold
    v43.LayoutOrder = 2
    v38[v39 + 2] = u12.createElement(u3, v43)
    v35[v36 + 1] = u12.createElement(u6, v37, v38)
    v32.PlayerNameContainer = u12.createElement(u6, v34, v35)
    local v45 = not v25 and v22
    if v45 then
        local v46
        if v22 == nil then
            v46 = v22
        else
            v46 = v22.buttonText
        end
        v45 = v46 ~= ""
        if v45 then
            v45 = u12.createFragment({
                ["ActionButton"] = u12.createElement("ImageButton", {
                    ["Size"] = UDim2.fromScale(0.2, 0.8),
                    ["BackgroundColor3"] = Color3.fromRGB(255, 56, 56),
                    [u12.Event.Activated] = function() --[[ Line: 183 ]]
                        --[[
                        Upvalues:
                            [1] = u16
                            [2] = u18
                        --]]
                        u16.Client:Get("JoinFriend"):SendToServer(u18.Friend.info.VisitorId)
                    end,
                    ["LayoutOrder"] = 3
                }, { u12.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 6)
                    }), u12.createElement(u3, {
                        ["TextSize"] = 18,
                        ["Text"] = v22.buttonText,
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["TextColor3"] = u5.WHITE,
                        ["Font"] = Enum.Font.SourceSansBold
                    }) })
            })
        end
    end
    if v45 then
        v32[v33 + 1] = v45
    end
    return u12.createFragment({
        ["PlayerRow"] = u12.createElement("ImageButton", v31, v32)
    })
end)
return {
    ["FriendElement"] = v14.connect(function(_, p48) --[[ Line: 211 ]]
        local v49 = {}
        for v50, v51 in p48 do
            v49[v50] = v51
        end
        return v49
    end)(v47)
}