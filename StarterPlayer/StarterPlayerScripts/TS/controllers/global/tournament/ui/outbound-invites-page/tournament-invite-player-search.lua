local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.ColorUtil
local u5 = v2.Empty
local v6 = v2.ExpireList
local u7 = v2.SoundManager
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u12 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u15 = v6.new(5)
return {
    ["TournamentInvitePlayerSearch"] = v10.new(u9)(function(u16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u11
            [3] = u12
            [4] = u8
            [5] = u1
            [6] = u9
            [7] = u4
            [8] = u5
            [9] = u14
            [10] = u3
            [11] = u7
            [12] = u13
        --]]
        local v18 = p17.useState
        local v19, u20 = v18("")
        local v21, u22 = v18(false)
        local v23, u24 = v18("")
        local function u28(p25) --[[ Line: 22 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u11
                [3] = u22
                [4] = u24
                [5] = u12
                [6] = u8
            --]]
            if u15:has(u11.LocalPlayer.UserId) then
                return nil
            end
            u15:add(u11.LocalPlayer.UserId)
            u22(true)
            u24("Loading")
            local v26 = u12:getState().Tournament.myTeamId
            if v26 == "" or not v26 then
                return nil
            end
            u8.Controllers.TournamentTeamController:requestSendTournamentTeamInvitation(v26, p25):andThen(function(p27) --[[ Line: 34 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u24
                --]]
                u22(false)
                if p27 then
                    u24("Invite Sent!")
                else
                    u24("Could not invite player.")
                end
            end)
        end
        local u30 = u1.async(function(p29) --[[ Line: 51 ]]
            --[[
            Upvalues:
                [1] = u11
            --]]
            return u11:GetUserIdFromNameAsync(p29)
        end)
        local u31 = u9.createRef()
        local function v36(p32) --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u1
                [3] = u11
                [4] = u20
            --]]
            u30(p32.Text):andThen(function(u33) --[[ Line: 64 ]]
                --[[
                Upvalues:
                    [1] = u1
                    [2] = u11
                    [3] = u20
                --]]
                u1.Promise.defer(function() --[[ Line: 44 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u33
                        [3] = u20
                    --]]
                    local v34, v35 = u11:GetUserThumbnailAsync(u33, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
                    if v35 then
                        return u20(v34)
                    end
                end)
            end)
        end
        local v37 = u9.createElement
        local v38 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = u16.Size,
            ["LayoutOrder"] = u16.LayoutOrder
        }
        local v39 = {}
        local v40 = u9.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 6)
        })
        local v41 = u9.createElement("TextLabel", {
            ["Text"] = "<b>Send Invite to User</b>",
            ["TextTransparency"] = 0.3,
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0.3, 0),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Top,
            ["TextColor3"] = u4.WHITE,
            ["Font"] = Enum.Font.Roboto
        })
        local v42 = u9.createElement
        local v43 = u5
        local v44 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 0.65, 0)
        }
        local v45 = { (u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 6)
            })) }
        local v46 = u9.createElement
        local v47 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(0.6, -12, 1, 0),
            ["BackgroundColor3"] = u14.backgroundTertiary
        }
        local v48 = { u9.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 5)
            }), (u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 0)
            })) }
        local v49 = u9.createElement
        local v50 = {
            ["AutomaticSize"] = "X",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0, 1)
        }
        local v51 = {
            u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 8)
            }),
            u9.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 5),
                ["PaddingBottom"] = UDim.new(0, 5),
                ["PaddingLeft"] = UDim.new(0, 10),
                ["PaddingRight"] = UDim.new(0, 0)
            }),
            ["UserAvatar"] = u9.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["SizeConstraint"] = "RelativeYY",
                ["ImageTransparency"] = 0,
                ["BackgroundTransparency"] = 0,
                ["BorderSizePixel"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = v19,
                ["BackgroundColor3"] = u14.interactionPrimary,
                ["BorderColor3"] = u14.textPrimary
            }, { u9.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 5)
                }) }),
            u9.createElement("TextLabel", {
                ["Text"] = "<b>@</b>",
                ["TextTransparency"] = 0.6,
                ["RichText"] = true,
                ["TextSize"] = 14,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(0, 0, 1, 0),
                ["AutomaticSize"] = Enum.AutomaticSize.X,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextColor3"] = u4.WHITE
            })
        }
        v48.PrefixContainer = v49("Frame", v50, v51)
        v48.InputTextBox = u9.createElement("TextBox", {
            ["Size"] = UDim2.fromScale(0.85, 0.55),
            ["Text"] = "",
            ["PlaceholderText"] = "username",
            ["BackgroundTransparency"] = 1,
            ["BackgroundColor3"] = u4.WHITE,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Center,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["PlaceholderColor3"] = Color3.fromRGB(107, 110, 136),
            ["TextScaled"] = true,
            ["Font"] = Enum.Font.Roboto,
            ["ClearTextOnFocus"] = false,
            [u9.Ref] = u31,
            ["AutoLocalize"] = false,
            [u9.Change.Text] = function(p52) --[[ Line: 55 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                if u16.MaxCharacters ~= nil and #p52.Text > u16.MaxCharacters then
                    local v53 = p52.Text
                    p52.Text = string.sub(v53, 0, 20)
                    return nil
                end
            end,
            [u9.Event.FocusLost] = v36,
            ["LayoutOrder"] = 3
        })
        v45.InputBoxContainer = v46("Frame", v47, v48)
        __set_list(v45, 2, {u9.createElement(u3, {
    ["Text"] = "<b>Invite User</b>",
    ["LayoutOrder"] = 2,
    ["Size"] = UDim2.fromScale(0.2, 1),
    ["BackgroundColor3"] = u14.backgroundSuccess,
    ["OnClick"] = function() --[[ Name: OnClick, Line 193 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u13
            [3] = u31
            [4] = u30
            [5] = u1
            [6] = u11
            [7] = u20
            [8] = u28
        --]]
        u7:playSound(u13.UI_CLICK_2)
        local v54 = u31:getValue()
        if not v54 then
            return nil
        end
        u30(v54.Text):andThen(function(u55) --[[ Line: 200 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u11
                [3] = u20
                [4] = u28
            --]]
            u1.Promise.defer(function() --[[ Line: 44 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u55
                    [3] = u20
                --]]
                local v56, v57 = u11:GetUserThumbnailAsync(u55, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
                if v57 then
                    return u20(v56)
                end
            end)
            u28(u55)
        end)
    end,
    ["CornerRadius"] = UDim.new(0, 3),
    ["Disabled"] = v21,
    ["Loading"] = v21
}), u9.createElement("TextLabel", {
    ["TextTransparency"] = 0.6,
    ["RichText"] = true,
    ["TextScaled"] = true,
    ["BackgroundTransparency"] = 1,
    ["LayoutOrder"] = 3,
    ["Text"] = v23,
    ["Size"] = UDim2.new(0.1, 0, 1, 0),
    ["TextXAlignment"] = Enum.TextXAlignment.Left,
    ["TextColor3"] = u4.WHITE
}, { u9.createElement("UITextSizeConstraint", {
        ["MaxTextSize"] = 14
    }) })})
        __set_list(v39, 1, {v40, v41, v42(v43, v44, v45)})
        return v37("Frame", v38, v39)
    end)
}