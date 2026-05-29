local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local v7 = v2.ExpireList
local u8 = v2.SoundManager
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u16 = v7.new(0.25)
return {
    ["ClanProfileInviteInput"] = v11.new(u10)(function(u17, p18) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u16
            [3] = u12
            [4] = u9
            [5] = u13
            [6] = u1
            [7] = u10
            [8] = u4
            [9] = u6
            [10] = u15
            [11] = u3
            [12] = u8
            [13] = u14
        --]]
        local v19 = p18.useState
        local v20, u21 = v19("")
        local v22, u23 = v19(false)
        local v24, u25 = v19("")
        local function u29(p26) --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u16
                [3] = u12
                [4] = u23
                [5] = u25
                [6] = u9
                [7] = u13
            --]]
            if u5.isHoarceKat() then
                return nil
            elseif u16:has(u12.LocalPlayer.UserId) then
                return nil
            else
                u16:add(u12.LocalPlayer.UserId)
                u23(true)
                u25("Loading")
                local v27 = u9.Controllers.ClanController:invitePlayerToClan({
                    ["userId"] = p26
                }, u13:getState().Clans.myClanId)
                u23(false)
                local v28 = v27.errorMessage
                if v28 == "" or not v28 then
                    u25("Invite Sent!")
                else
                    u25(v27.errorMessage)
                end
            end
        end
        local u31 = u1.async(function(p30) --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u12
            --]]
            return u1.await(u12:GetUserIdFromNameAsync(p30))
        end)
        local u32 = u10.createRef()
        local function v37(p33, _, _) --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u1
                [3] = u12
                [4] = u21
            --]]
            u31(p33.Text):andThen(function(u34) --[[ Line: 66 ]]
                --[[
                Upvalues:
                    [1] = u1
                    [2] = u12
                    [3] = u21
                --]]
                u1.Promise.defer(function() --[[ Line: 46 ]]
                    --[[
                    Upvalues:
                        [1] = u12
                        [2] = u34
                        [3] = u21
                    --]]
                    local v35, v36 = u12:GetUserThumbnailAsync(u34, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
                    if v36 then
                        return u21(v35)
                    end
                end)
            end)
        end
        local v38 = u10.createElement
        local v39 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = u17.Size,
            ["LayoutOrder"] = u17.LayoutOrder
        }
        local v40 = {}
        local v41 = u10.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 6)
        })
        local v42 = u10.createElement("TextLabel", {
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
        local v43 = u10.createElement
        local v44 = u6
        local v45 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 0.65, 0)
        }
        local v46 = { (u10.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 6)
            })) }
        local v47 = u10.createElement
        local v48 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(0.6, -12, 1, 0),
            ["BackgroundColor3"] = u15.backgroundTertiary
        }
        local v49 = { u10.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 5)
            }), (u10.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 0)
            })) }
        local v50 = u10.createElement
        local v51 = {
            ["AutomaticSize"] = "X",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0, 1)
        }
        local v52 = {
            u10.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 8)
            }),
            u10.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 5),
                ["PaddingBottom"] = UDim.new(0, 5),
                ["PaddingLeft"] = UDim.new(0, 10),
                ["PaddingRight"] = UDim.new(0, 0)
            }),
            ["UserAvatar"] = u10.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["SizeConstraint"] = "RelativeYY",
                ["ImageTransparency"] = 0,
                ["BackgroundTransparency"] = 0,
                ["BorderSizePixel"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = v20,
                ["BackgroundColor3"] = u15.interactionPrimary,
                ["BorderColor3"] = u15.textPrimary
            }, { u10.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 5)
                }) }),
            u10.createElement("TextLabel", {
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
        v49.PrefixContainer = v50("Frame", v51, v52)
        v49.InputTextBox = u10.createElement("TextBox", {
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
            [u10.Ref] = u32,
            ["AutoLocalize"] = false,
            [u10.Change.Text] = function(p53) --[[ Line: 57 ]]
                --[[
                Upvalues:
                    [1] = u17
                --]]
                if u17.MaxCharacters ~= nil and #p53.Text > u17.MaxCharacters then
                    local v54 = p53.Text
                    p53.Text = string.sub(v54, 0, 20)
                    return nil
                end
            end,
            [u10.Event.FocusLost] = v37,
            ["LayoutOrder"] = 3
        })
        v46.InputBoxContainer = v47("Frame", v48, v49)
        __set_list(v46, 2, {u10.createElement(u3, {
    ["Text"] = "<b>Invite User</b>",
    ["LayoutOrder"] = 2,
    ["Size"] = UDim2.fromScale(0.2, 1),
    ["BackgroundColor3"] = u15.backgroundSuccess,
    ["OnClick"] = function() --[[ Name: OnClick, Line 195 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u14
            [3] = u32
            [4] = u31
            [5] = u1
            [6] = u12
            [7] = u21
            [8] = u29
        --]]
        u8:playSound(u14.UI_CLICK_2)
        local v55 = u32:getValue()
        if not v55 then
            return nil
        end
        u31(v55.Text):andThen(function(u56) --[[ Line: 202 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u12
                [3] = u21
                [4] = u29
            --]]
            u1.Promise.defer(function() --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u56
                    [3] = u21
                --]]
                local v57, v58 = u12:GetUserThumbnailAsync(u56, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
                if v58 then
                    return u21(v57)
                end
            end)
            u29(u56)
        end)
    end,
    ["CornerRadius"] = UDim.new(0, 3),
    ["Disabled"] = v22,
    ["Loading"] = v22
}), u10.createElement("TextLabel", {
    ["TextTransparency"] = 0.6,
    ["RichText"] = true,
    ["TextScaled"] = true,
    ["BackgroundTransparency"] = 1,
    ["LayoutOrder"] = 3,
    ["Text"] = v24,
    ["Size"] = UDim2.new(0.1, 0, 1, 0),
    ["TextXAlignment"] = Enum.TextXAlignment.Left,
    ["TextColor3"] = u4.WHITE
}, { u10.createElement("UITextSizeConstraint", {
        ["MaxTextSize"] = 14
    }) })})
        __set_list(v40, 1, {v41, v42, v43(v44, v45, v46)})
        return v38("Frame", v39, v40)
    end)
}