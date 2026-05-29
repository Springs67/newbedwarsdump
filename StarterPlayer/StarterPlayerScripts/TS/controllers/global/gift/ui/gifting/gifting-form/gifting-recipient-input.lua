local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["GiftingRecipientInput"] = v4.new(u3)(function(u7, p8) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u1
            [3] = u5
            [4] = u2
            [5] = u6
        --]]
        local v9 = p8.useState
        local v10 = p8.useEffect
        local u11, u12 = v9({
            ["user"] = nil,
            ["usernameFormatted"] = ""
        })
        local v13, u14 = v9("")
        local v15, u16 = v9(false)
        local u17 = u3.createRef()
        local function u24(p18) --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            local v19 = nil
            for v20, v21 in u7.Friends do
                local _ = v20 - 1
                local v22 = string.lower(v21.username)
                local v23 = #p18
                if string.sub(v22, 1, v23) == string.lower(p18) == true then
                    return v21
                end
            end
            return v19
        end
        local u25 = nil
        local u26 = nil
        local function v44(p27) --[[ Line: 40 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u14
                [3] = u24
                [4] = u25
                [5] = u11
                [6] = u26
                [7] = u7
            --]]
            if #p27.Text > 20 then
                local v28 = p27.Text
                p27.Text = string.sub(v28, 0, 20)
                return nil
            end
            if #p27.Text == 0 then
                u12({
                    ["user"] = nil,
                    ["usernameFormatted"] = ""
                })
                u14("")
                return nil
            end
            local v29 = u24(p27.Text)
            if v29 then
                u25(v29.username, p27)
                local v30 = p27.Text
                local v31 = v29.username
                local v32 = #p27.Text + 1
                local v33 = v30 .. string.sub(v31, v32)
                local v34 = {}
                for v35, v36 in u11 do
                    v34[v35] = v36
                end
                v34.user = {
                    ["username"] = v29.username,
                    ["userId"] = v29.userId
                }
                v34.usernameFormatted = v33
                u12(v34)
                local v37 = u11.user
                if v37 ~= nil then
                    v37 = v37.userId
                end
                if v37 ~= v29.userId then
                    u26(v29.userId)
                end
            else
                u12({
                    ["user"] = nil,
                    ["usernameFormatted"] = ""
                })
                u14("")
            end
            local v38 = string.lower(p27.Text)
            local v39 = u7.FriendsListUser
            if v39 ~= nil then
                v39 = string.lower(v39.username)
            end
            local v40 = v38 == v39
            local v41 = u7.FriendsListUser
            if v41 ~= nil then
                v41 = v41.userId
            end
            local v42 = u7.SetRecipient
            local v43 = {
                ["username"] = p27.Text
            }
            if not v40 then
                v41 = nil
            end
            v43.userId = v41
            v42(v43)
        end
        u26 = function(u45) --[[ Line: 104 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u5
                [3] = u14
            --]]
            u1.Promise.defer(function() --[[ Line: 105 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u45
                    [3] = u14
                --]]
                local v46, v47 = u5:GetUserThumbnailAsync(u45, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
                if v47 then
                    return u14(v46)
                end
            end)
        end
        local function u54(_, u48) --[[ Line: 112 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u5
                [3] = u26
            --]]
            u1.Promise.defer(function(p49, p50) --[[ Line: 113 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u48
                --]]
                local v51 = u5:GetUserIdFromNameAsync(u48)
                if v51 == 0 or (v51 ~= v51 or not v51) then
                    p50()
                else
                    p49(v51)
                end
            end):andThen(function(p52) --[[ Line: 121 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                u26(p52)
            end):catch(function(p53) --[[ Line: 124 ]]
                print("[Gifting Input]: loadUserAvatarFromName Error", p53)
            end)
        end
        u25 = function(p55, p56) --[[ Line: 129 ]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            if string.lower(p56.Text) == string.lower(p55) then
                u16(true)
            else
                u16(false)
            end
        end
        v10(function() --[[ Line: 152 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u17
                [3] = u26
                [4] = u12
                [5] = u16
            --]]
            if u7.FriendsListUser then
                u17:getValue().Text = u7.FriendsListUser.username
                u26(u7.FriendsListUser.userId)
                u12({
                    ["user"] = u7.FriendsListUser,
                    ["usernameFormatted"] = u7.FriendsListUser.username
                })
                u16(true)
            end
        end, { u7.FriendsListUser })
        local v57 = u3.createElement
        local v58 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = u7.Size,
            ["LayoutOrder"] = u7.LayoutOrder
        }
        local v59 = {}
        local v60 = u3.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 12)
        })
        local v61 = u3.createElement("TextLabel", {
            ["Text"] = "Recipient Username",
            ["TextTransparency"] = 0.3,
            ["TextSize"] = 20,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 14),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Top,
            ["TextColor3"] = u2.WHITE,
            ["Font"] = Enum.Font.Roboto
        })
        local v62 = u3.createElement
        local v63 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 1, -26),
            ["BackgroundColor3"] = u6.backgroundTertiary
        }
        local v64 = {}
        local v65 = u3.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 5)
        })
        local v66 = u3.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 0)
        })
        local v67 = u3.createElement
        local v68 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.2, 1)
        }
        local v69 = {
            u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 8)
            }),
            u3.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 5),
                ["PaddingBottom"] = UDim.new(0, 5),
                ["PaddingLeft"] = UDim.new(0, 10),
                ["PaddingRight"] = UDim.new(0, 10)
            }),
            ["UserAvatar"] = u3.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 0,
                ["BorderSizePixel"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = v13,
                ["ImageTransparency"] = v15 and 0 or 0.6,
                ["BackgroundColor3"] = u6.interactionPrimary,
                ["BorderColor3"] = u6.textPrimary
            }, { u3.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 5)
                }) }),
            u3.createElement("TextLabel", {
                ["Text"] = "@",
                ["TextTransparency"] = 0.6,
                ["TextSize"] = 14,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(0, 0, 0, 14),
                ["AutomaticSize"] = Enum.AutomaticSize.X,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextColor3"] = u2.WHITE,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
            })
        }
        __set_list(v64, 1, {v65, v66, v67("Frame", v68, v69), u3.createElement("Frame", {
    ["BackgroundTransparency"] = 1,
    ["LayoutOrder"] = 3,
    ["Size"] = UDim2.fromScale(0.8, 1)
}, { u3.createElement("TextBox", {
        ["Size"] = UDim2.fromScale(1, 1),
        ["Text"] = "",
        ["PlaceholderText"] = "username",
        ["BackgroundTransparency"] = 1,
        ["BackgroundColor3"] = u2.WHITE,
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["TextYAlignment"] = Enum.TextYAlignment.Center,
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["PlaceholderColor3"] = Color3.fromRGB(107, 110, 136),
        ["TextSize"] = 20,
        ["Font"] = Enum.Font.Roboto,
        ["ClearTextOnFocus"] = false,
        [u3.Ref] = u17,
        ["AutoLocalize"] = false,
        [u3.Change.Text] = v44,
        [u3.Event.FocusLost] = function(p70, p71, _) --[[ Line: 136 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u17
                [3] = u12
                [4] = u16
                [5] = u54
            --]]
            if p71 and u11.usernameFormatted ~= "" then
                u17:getValue().Text = u11.user.username
                local v72 = {}
                for v73, v74 in u11 do
                    v72[v73] = v74
                end
                v72.usernameFormatted = u11.user.username
                u12(v72)
                u16(true)
            else
                u54(p70, p70.Text)
                u16(true)
            end
        end
    }), u3.createElement("TextLabel", {
        ["BackgroundTransparency"] = 1,
        ["TextSize"] = 20,
        ["TextTransparency"] = 0.7,
        ["RichText"] = true,
        ["AutoLocalize"] = false,
        ["Size"] = UDim2.fromScale(1, 1),
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["TextYAlignment"] = Enum.TextYAlignment.Center,
        ["Text"] = u11.usernameFormatted,
        ["Font"] = Enum.Font.Roboto,
        ["TextColor3"] = Color3.fromRGB(255, 255, 255)
    }) })})
        __set_list(v59, 1, {v60, v61, v62("Frame", v63, v64)})
        return v57("Frame", v58, v59)
    end)
}