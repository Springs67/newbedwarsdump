local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.AutoSizedText
local u6 = v3.ColorUtil
local u7 = v3.DarkBackground
local u8 = v3.DeviceUtil
local u9 = v3.Empty
local u10 = v3.IconButton
local v11 = v3.OfflinePlayerUtil
local u12 = v3.Padding
local u13 = v3.ScaleComponent
local u14 = v3.SlideIn
local u15 = v3.SoundManager
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, script.Parent, "friend-element").FriendElement
local _ = {
    {
        ["LastOnline"] = "test",
        ["IsOnline"] = true,
        ["LastLocation"] = "BedWars",
        ["LocationType"] = 4,
        ["PlaceId"] = 4793564307,
        ["GameId"] = "4793564307",
        ["VisitorId"] = v11.Dummy.oiogy.userId,
        ["UserName"] = v11.Dummy.oiogy.name,
        ["DisplayName"] = v11.Dummy.oiogy.displayName
    },
    {
        ["LastOnline"] = "test",
        ["IsOnline"] = true,
        ["LastLocation"] = "BedWars",
        ["LocationType"] = 4,
        ["PlaceId"] = 6660162924,
        ["GameId"] = "4793564307",
        ["VisitorId"] = v11.Dummy.spleenhook.userId,
        ["UserName"] = v11.Dummy.spleenhook.name,
        ["DisplayName"] = v11.Dummy.spleenhook.displayName
    }
}
local v57 = v17.new(u16)(function(u22, p23) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u20
        [3] = u8
        [4] = u16
        [5] = u7
        [6] = u13
        [7] = u12
        [8] = u9
        [9] = u5
        [10] = u6
        [11] = u10
        [12] = u19
        [13] = u2
        [14] = u21
        [15] = u4
        [16] = u14
    --]]
    local _ = p23.useState
    local v24 = p23.useEffect
    local v25 = UDim2.fromOffset(620, 500)
    v24(function() --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u20
        --]]
        u15:playSound(u20.UI_OPEN_2)
        return function() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u20
            --]]
            u15:playSound(u20.UI_CLOSE_2)
        end
    end, {})
    local v26 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u8.isSmallScreen()
    }
    local v27 = { u16.createElement(u7, {
            ["AppId"] = u22.AppId,
            ["ImageButtonProps"] = {
                ["ZIndex"] = 0
            }
        }) }
    local v28 = #v27
    local v29 = {}
    local v30 = #v29
    local v31 = {
        ["BorderSizePixel"] = 0,
        ["AutoButtonColor"] = false,
        ["Modal"] = true,
        ["Size"] = v25,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["BackgroundColor3"] = Color3.fromHex("#333333")
    }
    local v32 = {}
    local v33 = u16.createElement(u13, {
        ["PowerRelationshipPastMaximum"] = 0.6,
        ["MaximumSize"] = Vector2.new(v25.X.Offset * 1.2, v25.Y.Offset * 1.2),
        ["ScreenPadding"] = Vector2.new(30, 30)
    })
    local v34 = u16.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0, 10)
    })
    local v35 = u16.createElement(u12, {
        ["Padding"] = UDim.new(0, 28)
    })
    local v36 = u16.createElement("UIListLayout", {
        ["FillDirection"] = "Vertical",
        ["VerticalAlignment"] = "Center",
        ["HorizontalAlignment"] = "Left",
        ["Padding"] = UDim.new(0, 16)
    })
    local v37 = u16.createElement
    local v38 = u9
    local v39 = {
        ["Size"] = UDim2.new(1, 0, 0, 28)
    }
    local v40 = {}
    local v41 = u16.createElement
    local v42 = u5
    local v43 = {
        ["TextSize"] = 28
    }
    local v44 = #u22.OnlineFriends
    v43.Text = "FRIENDS LIST - " .. tostring(v44) .. " ONLINE "
    v43.TextColor3 = u6.WHITE
    v43.Font = Enum.Font.SourceSansBold
    __set_list(v40, 1, {v41(v42, v43), u16.createElement(u10, {
    ["Size"] = UDim2.new(0, 28, 0, 28),
    ["Image"] = u19.X,
    ["Position"] = UDim2.fromScale(1, 0.5),
    ["AnchorPoint"] = Vector2.new(1, 0.5),
    ["OnClick"] = function() --[[ Name: OnClick, Line 111 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u22
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u22.AppId)
    end
})})
    __set_list(v32, 1, {v33, v34, v35, v36, v37(v38, v39, v40)})
    local v45 = #v32
    local v46
    if #u22.OnlineFriends == 0 then
        v46 = u16.createElement(u5, {
            ["Text"] = "No friends online BedWars",
            ["TextSize"] = 18,
            ["TextTransparency"] = 0.3,
            ["TextColor3"] = Color3.fromRGB(242, 242, 242),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Font"] = Enum.Font.SourceSansBold
        })
    else
        local v47 = u22.OnlineFriends
        table.sort(v47, function(p48, p49) --[[ Line: 131 ]]
            return p48.info.DisplayName < p49.info.DisplayName
        end)
        v46 = table.create(#v47)
        for v50, v51 in v47 do
            local _ = v50 - 1
            v46[v50] = u16.createElement(u21, {
                ["Friend"] = v51
            })
        end
    end
    local v52 = {
        ["ScrollingFrameProps"] = {
            ["Size"] = UDim2.fromScale(1, 0.9)
        }
    }
    local v53 = { u16.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 8)
        }) }
    local v54 = #v53
    if v46.elements == nil and (v46.props == nil or v46.component == nil) then
        for v55, v56 in v46 do
            v53[v54 + v55] = v56
        end
    else
        v53[v54 + 1] = v46
    end
    v32[v45 + 1] = u16.createElement(u4, v52, v53)
    v29[v30 + 1] = u16.createElement("ImageButton", v31, v32)
    v27[v28 + 1] = u16.createElement(u14, {}, v29)
    return u16.createElement("ScreenGui", v26, v27)
end)
return {
    ["FriendsList"] = v18.connect(function(p58, p59) --[[ Line: 174 ]]
        local v60 = {}
        for v61, v62 in p59 do
            v60[v61] = v62
        end
        v60.OnlineFriends = p58.Friends.easyFriends
        return v60
    end)(v57)
}