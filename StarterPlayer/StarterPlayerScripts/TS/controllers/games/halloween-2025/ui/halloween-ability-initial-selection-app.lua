local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DarkBackground
local u6 = v3.DeviceUtil
local u7 = v3.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kit-meta").getHalloweenKitMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kits").HalloweenKit
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u16 = v1.import(script, script.Parent, "halloween-ability-character-panel").HalloweenAbilityCharacterPanel
local v55 = v9.new(u8)(function(p17, p18) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u8
        [3] = u11
        [4] = u7
        [5] = u14
        [6] = u13
        [7] = u2
        [8] = u6
        [9] = u5
        [10] = u16
        [11] = u15
        [12] = u4
    --]]
    local v19 = p18.useState
    local v20 = p18.useEffect
    local v21, u22 = v19(0)
    local u23, u24 = v19(u12.NONE)
    local u25 = u8.createRef()
    local u26 = u8.createRef()
    local u27 = u8.createRef()
    local function u29(u28) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u29
        --]]
        if u28 < 4 then
            task.delay(0.5, function() --[[ Line: 29 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u28
                    [3] = u29
                --]]
                u22(u28 + 1)
                u29(u28 + 1)
            end)
        end
    end
    local function u35(p30) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u26
            [3] = u27
            [4] = u11
            [5] = u24
        --]]
        local v31 = u25:getValue()
        local v32 = u26:getValue()
        local v33 = u27:getValue()
        local v34 = u11(p30)
        if v32 then
            v32.Text = v34.name
        end
        if v33 then
            v33.Text = v34.description
        end
        if v31 then
            v31.Visible = true
        end
        u24(p30)
    end
    v20(function() --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29(0)
    end, {})
    local function u37(p36) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u14
            [3] = u13
            [4] = u2
        --]]
        u7:playSound(u14.UI_CLICK_2)
        u13.Client:GetNamespace("Halloween2025Remotes"):Get("PlayerSelectKit"):SendToServer({
            ["kitSelected"] = p36
        })
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("HalloweenAbilityInitialSelectionApp")
    end
    local v38 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u6.isSmallScreen()
    }
    local v39 = { u8.createElement(u5, {
            ["BackgroundTransparency"] = 0.9,
            ["DisableCloseOnClick"] = true,
            ["AppId"] = p17.AppId
        }) }
    local v40 = #v39
    local v41 = {
        ["BackgroundTransparency"] = 1,
        ["Modal"] = true,
        ["Size"] = UDim2.fromScale(1, 0.9),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v42 = { u8.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.04, 0)
        }), u8.createElement("TextLabel", {
            ["Text"] = "Select Your Power",
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextStrokeTransparency"] = 0,
            ["TextScaled"] = true,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.08),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["Font"] = Enum.Font.LuckiestGuy,
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextColor3"] = Color3.fromRGB(255, 200, 0)
        }, { u8.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new(Color3.fromHex("#fb6809"), Color3.fromHex("#fad300"))
            }) }) }
    local _ = #v42
    local v43 = {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(0.6, 0.65)
    }
    local v44 = {}
    local v45 = #v44
    local v46
    if v21 >= 1 then
        v46 = u8.createElement(u16, {
            ["HalloweenKit"] = u12.NAZAR,
            ["Position"] = UDim2.fromScale(-0.075, 0.5),
            ["OnClick"] = function() --[[ Name: OnClick, Line 119 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u12
                --]]
                u35(u12.NAZAR)
            end,
            ["Selected"] = u23 == u12.NAZAR
        })
    else
        v46 = false
    end
    if v46 then
        v44[v45 + 1] = v46
    end
    local v47 = #v44
    local v48
    if v21 >= 2 then
        v48 = u8.createElement(u16, {
            ["HalloweenKit"] = u12.REBELLION_LEADER,
            ["Position"] = UDim2.fromScale(0.15, 0.5),
            ["OnClick"] = function() --[[ Name: OnClick, Line 131 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u12
                --]]
                u35(u12.REBELLION_LEADER)
            end,
            ["Selected"] = u23 == u12.REBELLION_LEADER
        })
    else
        v48 = false
    end
    if v48 then
        v44[v47 + 1] = v48
    end
    local v49 = #v44
    local v50
    if v21 >= 2 then
        v50 = u8.createElement(u16, {
            ["HalloweenKit"] = u12.MELODY,
            ["Position"] = UDim2.fromScale(0.375, 0.5),
            ["OnClick"] = function() --[[ Name: OnClick, Line 143 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u12
                --]]
                u35(u12.MELODY)
            end,
            ["Selected"] = u23 == u12.MELODY
        })
    else
        v50 = false
    end
    if v50 then
        v44[v49 + 1] = v50
    end
    local v51 = #v44
    local v52
    if v21 >= 2 then
        v52 = u8.createElement(u16, {
            ["HalloweenKit"] = u12.SUMMONER,
            ["Position"] = UDim2.fromScale(0.6, 0.5),
            ["OnClick"] = function() --[[ Name: OnClick, Line 155 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u12
                --]]
                u35(u12.SUMMONER)
            end,
            ["Selected"] = u23 == u12.SUMMONER
        })
    else
        v52 = false
    end
    if v52 then
        v44[v51 + 1] = v52
    end
    local v53 = #v44
    local v54
    if v21 >= 2 then
        v54 = u8.createElement(u16, {
            ["HalloweenKit"] = u12.SORCERER,
            ["Position"] = UDim2.fromScale(0.825, 0.5),
            ["OnClick"] = function() --[[ Name: OnClick, Line 167 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u12
                --]]
                u35(u12.SORCERER)
            end,
            ["Selected"] = u23 == u12.SORCERER
        })
    else
        v54 = false
    end
    if v54 then
        v44[v53 + 1] = v54
    end
    v42.CharacterArea = u8.createElement("Frame", v43, v44)
    v42.BottomContainer = u8.createElement("Frame", {
        [u8.Ref] = u25,
        ["Size"] = UDim2.fromScale(0.7, 0.2),
        ["BorderSizePixel"] = 0,
        ["BackgroundColor3"] = u15.backgroundPrimary,
        ["BackgroundTransparency"] = 0,
        ["LayoutOrder"] = 2,
        ["Visible"] = false
    }, {
        u8.createElement("UIGradient", {
            ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(56, 0, 64)), ColorSequenceKeypoint.new(1, Color3.fromRGB(56, 0, 64)) }),
            ["Transparency"] = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.15, 0),
                NumberSequenceKeypoint.new(0.4, 0),
                NumberSequenceKeypoint.new(0.6, 0),
                NumberSequenceKeypoint.new(1, 1)
            })
        }),
        u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        }),
        u8.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.05, 0)
        }),
        ["InfoArea"] = u8.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(0.75, 1)
        }, {
            u8.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new(Color3.fromHex("#fb6809"), Color3.fromHex("#fad300"))
            }),
            u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 0)
            }),
            ["Name"] = u8.createElement("TextLabel", {
                [u8.Ref] = u26,
                ["Text"] = "Name",
                ["Size"] = UDim2.fromScale(0.9, 0.3),
                ["TextColor3"] = Color3.fromRGB(255, 252, 135),
                ["BackgroundTransparency"] = 1,
                ["Font"] = Enum.Font.LuckiestGuy,
                ["TextScaled"] = true,
                ["LayoutOrder"] = 0
            }),
            ["Description"] = u8.createElement("TextLabel", {
                [u8.Ref] = u27,
                ["Text"] = "Description",
                ["Size"] = UDim2.fromScale(0.9, 0.5),
                ["TextColor3"] = Color3.fromRGB(255, 252, 135),
                ["BackgroundTransparency"] = 1,
                ["Font"] = Enum.Font.Roboto,
                ["TextScaled"] = true,
                ["LayoutOrder"] = 1
            })
        }),
        ["ConfirmButton"] = u8.createElement("ImageButton", {
            ["Size"] = UDim2.fromScale(0.15, 0.9),
            ["BackgroundColor3"] = u4.WHITE,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            [u8.Event.Activated] = function() --[[ Line: 241 ]]
                --[[
                Upvalues:
                    [1] = u37
                    [2] = u23
                --]]
                u37(u23)
            end
        }, { u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }), u8.createElement("UIGradient", {
                ["Rotation"] = 45,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#fb6809")), ColorSequenceKeypoint.new(1, Color3.fromHex("#fad300")) })
            }), u8.createElement("TextLabel", {
                ["Text"] = "GO!",
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.55),
                ["Font"] = Enum.Font.LuckiestGuy,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }) })
    })
    v39[v40 + 1] = u8.createElement("ImageButton", v41, v42)
    return u8.createElement("ScreenGui", v38, v39)
end)
return {
    ["HalloweenAbilityInitialSelectionApp"] = v10.connect(function(_, p56) --[[ Line: 270 ]]
        local v57 = {}
        for v58, v59 in p56 do
            v57[v58] = v59
        end
        return v57
    end)(v55)
}