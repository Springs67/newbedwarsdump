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
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-util").HalloweenAbilityUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u17 = v1.import(script, script.Parent, "halloween-ability-character-panel").HalloweenAbilityCharacterPanel
local v53 = v9.new(u8)(function(p18, p19) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u8
        [3] = u12
        [4] = u7
        [5] = u15
        [6] = u13
        [7] = u14
        [8] = u2
        [9] = u6
        [10] = u5
        [11] = u17
        [12] = u16
        [13] = u4
    --]]
    local v20 = p19.useState
    local v21 = p19.useEffect
    local v22, u23 = v20(0)
    local u24, u25 = v20(u11.NONE)
    local u26 = u8.createRef()
    local u27 = u8.createRef()
    local u28 = u8.createRef()
    local function u30(u29) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u30
        --]]
        if u29 < 4 then
            task.delay(0.5, function() --[[ Line: 30 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u29
                    [3] = u30
                --]]
                u23(u29 + 1)
                u30(u29 + 1)
            end)
        end
    end
    local function u36(p31) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u27
            [3] = u28
            [4] = u12
            [5] = u25
        --]]
        local v32 = u26:getValue()
        local v33 = u27:getValue()
        local v34 = u28:getValue()
        local v35 = u12(p31)
        if v33 then
            v33.Text = v35.name
        end
        if v34 then
            v34.Text = v35.description
        end
        if v32 then
            v32.Visible = true
        end
        u25(p31)
    end
    v21(function() --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30(0)
    end, {})
    local function u39(p37) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u15
            [3] = u13
            [4] = u14
            [5] = u2
        --]]
        u7:playSound(u15.UI_CLICK_2)
        local v38 = u13.halloweenStarterAbilityMap[p37]
        if v38 then
            u14.Client:GetNamespace("Halloween2024Remotes"):Get("RequestSkillUpgrade"):SendToServer({
                ["level"] = 1,
                ["halloweenAbilityType"] = v38
            })
        else
            warn("Starter ability for " .. p37 .. " is undefined.")
        end
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("HalloweenAbilityInitialSelectionApp")
    end
    local v40 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u6.isSmallScreen()
    }
    local v41 = { u8.createElement(u5, {
            ["BackgroundTransparency"] = 0.9,
            ["DisableCloseOnClick"] = true,
            ["AppId"] = p18.AppId
        }) }
    local v42 = #v41
    local v43 = {
        ["BackgroundTransparency"] = 1,
        ["Modal"] = true,
        ["Size"] = UDim2.fromScale(1, 0.9),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v44 = { u8.createElement("UIListLayout", {
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
    local _ = #v44
    local v45 = {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(0.6, 0.65)
    }
    local v46 = {}
    local v47 = #v46
    local v48
    if v22 >= 1 then
        v48 = u8.createElement(u17, {
            ["bedwarsKit"] = u11.SUMMONER,
            ["Position"] = UDim2.fromScale(-0.075, 0.5),
            ["OnClick"] = function() --[[ Name: OnClick, Line 128 ]]
                --[[
                Upvalues:
                    [1] = u36
                    [2] = u11
                --]]
                u36(u11.SUMMONER)
            end,
            ["Selected"] = u24 == u11.SUMMONER
        })
    else
        v48 = false
    end
    if v48 then
        v46[v47 + 1] = v48
    end
    local v49 = #v46
    local v50
    if v22 >= 2 then
        v50 = u8.createElement(u17, {
            ["bedwarsKit"] = u11.SORCERER,
            ["Position"] = UDim2.fromScale(0.525, 0.5),
            ["OnClick"] = function() --[[ Name: OnClick, Line 140 ]]
                --[[
                Upvalues:
                    [1] = u36
                    [2] = u11
                --]]
                u36(u11.SORCERER)
            end,
            ["Selected"] = u24 == u11.SORCERER
        })
    else
        v50 = false
    end
    if v50 then
        v46[v49 + 1] = v50
    end
    local v51 = #v46
    local v52
    if v22 >= 3 then
        v52 = u8.createElement(u17, {
            ["bedwarsKit"] = u11.REBELLION_LEADER,
            ["Position"] = UDim2.fromScale(0.825, 0.5),
            ["OnClick"] = function() --[[ Name: OnClick, Line 152 ]]
                --[[
                Upvalues:
                    [1] = u36
                    [2] = u11
                --]]
                u36(u11.REBELLION_LEADER)
            end,
            ["Selected"] = u24 == u11.REBELLION_LEADER
        })
    else
        v52 = false
    end
    if v52 then
        v46[v51 + 1] = v52
    end
    v44.CharacterArea = u8.createElement("Frame", v45, v46)
    v44.BottomContainer = u8.createElement("Frame", {
        [u8.Ref] = u26,
        ["Size"] = UDim2.fromScale(0.7, 0.2),
        ["BorderSizePixel"] = 0,
        ["BackgroundColor3"] = u16.backgroundPrimary,
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
                [u8.Ref] = u27,
                ["Text"] = "Name",
                ["Size"] = UDim2.fromScale(0.9, 0.3),
                ["TextColor3"] = Color3.fromRGB(255, 252, 135),
                ["BackgroundTransparency"] = 1,
                ["Font"] = Enum.Font.LuckiestGuy,
                ["TextScaled"] = true,
                ["LayoutOrder"] = 0
            }),
            ["Description"] = u8.createElement("TextLabel", {
                [u8.Ref] = u28,
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
            [u8.Event.Activated] = function() --[[ Line: 226 ]]
                --[[
                Upvalues:
                    [1] = u39
                    [2] = u24
                --]]
                u39(u24)
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
    v41[v42 + 1] = u8.createElement("ImageButton", v43, v44)
    return u8.createElement("ScreenGui", v40, v41)
end)
return {
    ["HalloweenAbilityInitialSelectionApp"] = v10.connect(function(_, p54) --[[ Line: 255 ]]
        local v55 = {}
        for v56, v57 in p54 do
            v55[v56] = v57
        end
        return v55
    end)(v53)
}