local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "components", "host-panel-setting").HostPanelSetting
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "components", "host-panel-textbox").HostPanelTextBox
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "gift", "ui", "gifting", "gifting-form", "text-box-character-counter").TextBoxCharacterCounter
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ClanCreateForm"] = v10.new(u9)(function(_, p19) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u15
            [3] = u8
            [4] = u7
            [5] = u17
            [6] = u5
            [7] = u11
            [8] = u12
            [9] = u13
            [10] = u6
            [11] = u14
            [12] = u4
            [13] = u18
            [14] = u16
            [15] = u3
        --]]
        local v20 = p19.useState
        local v21 = u9.createRef()
        local u22, v23 = v20("")
        local u24, v25 = v20("")
        local u26, v27 = v20("")
        local v28, u29 = v20(false)
        local v30, u31 = v20("")
        local function v37() --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u31
                [3] = u24
                [4] = u15
                [5] = u29
                [6] = u8
                [7] = u26
                [8] = u7
                [9] = u17
            --]]
            if u22 == "" then
                u31("Your clan must have a name.")
                return nil
            end
            if u24 == "" then
                u31("Your clan must have tag.")
                return nil
            end
            if #u24 < u15.CLAN_TAG_MIN_CHAR_LIMIT then
                local v32 = u31
                local v33 = u15.CLAN_TAG_MIN_CHAR_LIMIT
                v32("Your clan tag must be at least " .. tostring(v33) .. " characters.")
                return nil
            end
            u29(true)
            u31("")
            local v34 = {
                ["name"] = u22,
                ["tag"] = u24,
                ["introduction"] = u26
            }
            u8.Controllers.ClanController:submitClanCreateForm(v34):andThen(function(p35) --[[ Line: 47 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u31
                    [3] = u7
                    [4] = u17
                --]]
                u29(false)
                local v36 = p35.errorMessage
                if v36 ~= "" and v36 then
                    u31(p35.errorMessage)
                    u7:createSound(u17.ERROR_NOTIFICATION)
                end
            end)
        end
        if not u5.isHoarceKat() then
            u15.hasClanPass(u11.LocalPlayer)
        end
        local v38 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v39 = {}
        local v40 = #v39
        local v41 = {
            ["Size"] = UDim2.fromScale(1, 0.8)
        }
        local v42 = {}
        local v43 = u9.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.05, 0)
        })
        local v44 = u9.createElement
        local v45 = u12
        local v46 = {
            ["Name"] = "Name*"
        }
        local v47 = u15.CLAN_NAME_CHAR_LIMIT
        v46.Hint = "(Max " .. tostring(v47) .. " Characters)"
        local v48 = v44(v45, v46, { u9.createElement(u13, {
                ["PlaceholderText"] = "Your clan name",
                ["MaxCharacters"] = u15.CLAN_NAME_CHAR_LIMIT,
                ["OnFocusLost"] = v23
            }) })
        local v49 = u9.createElement
        local v50 = u12
        local v51 = {
            ["Name"] = "Tag*"
        }
        local v52 = u15.CLAN_TAG_MIN_CHAR_LIMIT
        local v53 = tostring(v52)
        local v54 = u15.CLAN_TAG_MAX_CHAR_LIMIT
        v51.Hint = "(" .. v53 .. "-" .. tostring(v54) .. " Characters)"
        __set_list(v42, 1, {v43, v48, v49(v50, v51, { u9.createElement(u13, {
        ["PlaceholderText"] = "Your clan tag",
        ["MaxCharacters"] = u15.CLAN_TAG_MAX_CHAR_LIMIT,
        ["OnFocusLost"] = v25
    }) }), u9.createElement(u6, {
    ["Size"] = UDim2.fromScale(1, 0.45)
}, { u9.createElement("UIListLayout", {
        ["FillDirection"] = "Vertical",
        ["Padding"] = UDim.new(0.05, 0)
    }), u9.createElement(u13, {
        ["Size"] = UDim2.fromScale(1, 0.9),
        ["MaxCharacters"] = u15.CLAN_INTRO_CHAR_LIMIT,
        ["PlaceholderText"] = "Please enter an introduction for players viewing your clan. This can be changed later.",
        ["Label"] = "Clan Introduction <font transparency=\".3\">(Optional)</font>",
        ["OnFocusLost"] = v27,
        ["Font"] = "Roboto",
        ["TextXAlignment"] = "Left",
        ["TextYAlignment"] = "Top",
        ["MultiLine"] = true,
        [u9.Ref] = v21
    }, {
        ["uipadding"] = u9.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 10),
            ["PaddingBottom"] = UDim.new(0, 10),
            ["PaddingLeft"] = UDim.new(0, 10),
            ["PaddingRight"] = UDim.new(0, 10)
        }),
        u9.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        })
    }), u9.createElement(u14, {
        ["AutomaticSize"] = "Y",
        ["SizeConstraint"] = "RelativeXX",
        ["Size"] = UDim2.new(1, 0, 0, 0),
        ["TextXAlignment"] = Enum.TextXAlignment.Right,
        ["TextBox"] = v21,
        ["MaxCharCount"] = u15.CLAN_INTRO_CHAR_LIMIT
    }) })})
        local v55 = #v42
        local v56
        if v30 == "" then
            v56 = false
        else
            v56 = u9.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.1),
                ["BackgroundColor3"] = u4.hexColor(16735324)
            }, { u9.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }), u9.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["SizeConstraint"] = "RelativeXX",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = "Center",
                    ["TextYAlignment"] = "Center",
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["Text"] = "<b>Error:</b> " .. v30,
                    ["TextColor3"] = u4.WHITE
                }, { u9.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) }) })
        end
        if v56 then
            v42[v55 + 1] = v56
        end
        v39[v40 + 1] = u9.createElement(u6, v41, v42)
        local v57 = {
            ["Size"] = UDim2.fromScale(1, 0.2),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["Position"] = UDim2.fromScale(0, 1)
        }
        local v58 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Bottom",
                ["Padding"] = UDim.new(0, 6)
            }) }
        local v59 = #v58
        local v60 = {
            ["Selectable"] = false,
            ["Size"] = UDim2.new(1, 0, 0, 50),
            ["BackgroundColor3"] = u18.backgroundSuccess,
            ["OnClick"] = v37,
            ["Loading"] = v28
        }
        local v61 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 10)
            }) }
        local v62 = #v61
        local v63 = not v28
        if v63 then
            v63 = u9.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ScaleType"] = "Fit",
                ["SizeConstraint"] = "RelativeYY",
                ["Image"] = u16.CLAN,
                ["ImageColor3"] = Color3.fromRGB(255, 255, 255),
                ["Size"] = UDim2.fromScale(0.65, 0.55),
                ["AnchorPoint"] = Vector2.new(1, 0.5)
            })
        end
        if v63 then
            v61[v62 + 1] = v63
        end
        v61[#v61 + 1] = u9.createElement("TextLabel", {
            ["AutomaticSize"] = "X",
            ["SizeConstraint"] = "RelativeXX",
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["Text"] = "<b>" .. (v28 and "Loading" or "Create Clan") .. "</b>",
            ["Size"] = UDim2.fromScale(0, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }, { u9.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 20
            }) })
        v58[v59 + 1] = u9.createElement(u3, v60, v61)
        v39[v40 + 2] = u9.createElement(u6, v57, v58)
        return u9.createElement(u6, v38, v39)
    end)
}