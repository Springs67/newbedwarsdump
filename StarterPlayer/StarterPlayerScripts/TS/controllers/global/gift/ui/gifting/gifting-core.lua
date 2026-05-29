local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DarkBackground
local u4 = v2.DeviceUtil
local u5 = v2.ImageId
local u6 = v2.OfflinePlayerUtil
local u7 = v2.ScaleComponent
local u8 = v2.SlideIn
local u9 = v2.WidgetComponent
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-meta").GiftMeta
local u16 = v1.import(script, script.Parent, "gift-ui-types").SuggestedPlayerListTabs
local u17 = v1.import(script, script.Parent, "gifting-form", "gifting-form").GiftingForm
local u18 = v1.import(script, script.Parent, "gifting-suggested-list", "gifting-suggested-list").GiftingSuggestedList
local v64 = v12.new(u11)(function(p19, p20) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u4
        [3] = u10
        [4] = u6
        [5] = u15
        [6] = u14
        [7] = u11
        [8] = u3
        [9] = u7
        [10] = u5
        [11] = u18
        [12] = u17
        [13] = u9
        [14] = u8
    --]]
    local v21 = p20.useState
    local v22 = p20.useEffect
    local v23, v24 = v21(u16.SERVER)
    local v25
    if u4.isHoarceKat() then
        local v26 = u10.values(u6.Dummy)
        v25 = table.create(#v26)
        for v27, v28 in v26 do
            local _ = v27 - 1
            v25[v27] = {
                ["displayName"] = "",
                ["name"] = v28.name,
                ["userId"] = v28.userId
            }
        end
    else
        local v29 = p19.RobloxFriends
        local v30
        if v29 == nil then
            v30 = v29
        else
            v30 = table.create(#v29)
            for v31, v32 in v29 do
                local _ = v31 - 1
                v30[v31] = {
                    ["displayName"] = "",
                    ["name"] = v32.username,
                    ["userId"] = v32.userId
                }
            end
        end
        v25 = v30 == nil and {} or v30
    end
    local v33, _ = v21(v25)
    local v34, u35 = v21({})
    local v36, v37 = v21(nil)
    local v38 = u15[p19.GiftType]
    v22(function() --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u10
            [3] = u6
            [4] = u35
            [5] = u14
        --]]
        if u4.isHoarceKat() then
            local v39 = u10.values(u6.Dummy)
            local v40 = table.create(#v39)
            for v41, v42 in v39 do
                local _ = v41 - 1
                v40[v41] = {
                    ["name"] = v42.name,
                    ["displayName"] = v42.displayName,
                    ["userId"] = v42.userId
                }
            end
            u35(v40)
        else
            local v43 = 0
            local v44 = {}
            for v45, v46 in u14:GetPlayers() do
                local _ = v45 - 1
                local v47
                if v46 == u14.LocalPlayer then
                    v47 = nil
                else
                    v47 = u6.getOfflinePlayer(v46)
                end
                if v47 ~= nil then
                    v43 = v43 + 1
                    v44[v43] = v47
                end
            end
            u35(v44)
        end
    end, {})
    local v48 = {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = u4.isSmallScreen()
    }
    local v49 = { u11.createElement(u3, {
            ["AppId"] = p19.AppId
        }) }
    local v50 = #v49
    local v51 = {}
    local v52 = #v51
    local v53 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromOffset(620, 463)
    }
    local v54 = { u11.createElement(u7, {
            ["MaximumSize"] = Vector2.new(775, 579),
            ["ScreenPadding"] = Vector2.new(24, 24)
        }) }
    local v55 = #v54
    local v56 = {
        ["AppId"] = p19.AppId,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["TitleIcon"] = u5.GIFTS_SOLID,
        ["Title"] = "Gift " .. v38.name
    }
    local v57 = { u11.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 16)
        }), u11.createElement(u18, {
            ["LayoutOrder"] = 1,
            ["SetSelectedUser"] = v37,
            ["SuggestedPlayerListTab"] = v23,
            ["SetSuggestedPlayerListTab"] = v24,
            ["Friends"] = v33,
            ["PlayersInServer"] = v34,
            ["Size"] = UDim2.new(0.43, -8, 1, 0)
        }) }
    local v58 = #v57
    local v59 = {
        ["SelectedUser"] = v36
    }
    local v60 = {}
    local v61 = #v60
    local v62 = #v34
    table.move(v34, 1, v62, v61 + 1, v60)
    local v63 = v61 + v62
    table.move(v33, 1, #v33, v63 + 1, v60)
    v59.Players = v60
    v59.GiftType = p19.GiftType
    v59.Size = UDim2.new(0.57, -8, 1, 0)
    v59.LayoutOrder = 2
    v57[v58 + 1] = u11.createElement(u17, v59)
    v54[v55 + 1] = u11.createElement(u9, v56, v57)
    v51[v52 + 1] = u11.createElement("Frame", v53, v54)
    v49[v50 + 1] = u11.createElement(u8, {}, v51)
    return u11.createElement("ScreenGui", v48, v49)
end)
return {
    ["GiftingCore"] = v13.connect(function(p65, p66) --[[ Line: 184 ]]
        local v67 = {}
        for v68, v69 in p66 do
            v67[v68] = v69
        end
        v67.RobloxFriends = p65.Friends.friends
        return v67
    end)(v64)
}