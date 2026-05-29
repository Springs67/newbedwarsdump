local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.ColorUtil
local u5 = v2.DarkBackground
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-meta").HalloweenAbilityMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-util").HalloweenAbilityUtil
local v53 = v10.new(u9)(function(p16, p17) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
        [3] = u14
        [4] = u15
        [5] = u12
        [6] = u13
        [7] = u9
        [8] = u5
        [9] = u4
        [10] = u7
        [11] = u3
    --]]
    local _ = p17.useState
    local _ = p17.useEffect
    local u18 = {}
    if u6.isHoarceKat() then
        for v19, v20 in u8.entries(u14) do
            local _ = v19 - 1
            local v21 = {
                ["tier"] = 2,
                ["abilityType"] = v20[1]
            }
            table.insert(u18, v21)
        end
    else
        local v22 = u8.entries(u14)
        local function v29(p23) --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u12
                [3] = u13
                [4] = u18
            --]]
            local v24 = p23[1]
            local v25 = u15:getAttributeName(v24)
            if u12.LocalPlayer:GetAttribute(v25) == true then
                local v26 = u13:getEntity(u12.LocalPlayer)
                if v26 ~= nil then
                    v26 = v26:getInstance()
                end
                local v27 = {
                    ["abilityType"] = v24
                }
                if v26 ~= nil then
                    v26 = v26:GetAttribute(v25)
                end
                v27.tier = v26 == nil and 0 or v26
                local v28 = u18
                table.insert(v28, v27)
            end
        end
        for v30, v31 in v22 do
            v29(v31, v30 - 1, v22)
        end
    end
    local v32 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u6.isSmallScreen()
    }
    local v33 = { u9.createElement(u5, {
            ["BackgroundTransparency"] = 0.9,
            ["AppId"] = p16.AppId
        }) }
    local v34 = #v33
    local v35 = {
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(0.6, 0.9),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["BackgroundColor3"] = u4.WHITE
    }
    local v36 = {
        u9.createElement("UIGradient", {
            ["Rotation"] = -90,
            ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(125, 69, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)) }),
            ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 0.1) })
        }),
        u9.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 10)
        }),
        u9.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 10)
        }),
        u9.createElement(u7, {
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.02)
        }),
        u9.createElement("TextLabel", {
            ["Text"] = "CURRENT UPGRADES",
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Font"] = Enum.Font.LuckiestGuy,
            ["Size"] = UDim2.fromScale(1, 0.05),
            ["TextColor3"] = u4.WHITE
        })
    }
    local v37 = #v36
    local v38 = {
        ["ScrollingFrameProps"] = {
            ["Size"] = UDim2.new(0, 400, 0.9, 0) - UDim2.fromOffset(0, 10),
            ["Position"] = UDim2.fromScale(0, 0),
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["LayoutOrder"] = 2,
            ["ScrollingDirection"] = Enum.ScrollingDirection.Y
        }
    }
    local function v45(p39, p40) --[[ Line: 126 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u14
            [3] = u4
        --]]
        local v41 = u9.createElement
        local v42 = {
            ["BackgroundTransparency"] = 1,
            ["RichText"] = true,
            ["Size"] = UDim2.new(1, 0, 0, 20)
        }
        local v43 = u14[p39.abilityType].hudDescription
        local v44 = p39.tier
        v42.Text = "<b>" .. v43 .. "</b> x" .. tostring(v44)
        v42.LayoutOrder = p40
        v42.FontSize = Enum.FontSize.Size18
        v42.TextColor3 = u4.WHITE
        v42.Font = Enum.Font.Roboto
        return v41("TextLabel", v42)
    end
    local v46 = table.create(#u18)
    for v47, v48 in u18 do
        v46[v47] = v45(v48, v47 - 1, u18)
    end
    local v49 = { u9.createElement("UIGridLayout", {
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Top",
            ["SortOrder"] = "LayoutOrder",
            ["FillDirectionMaxCells"] = 2,
            ["CellSize"] = UDim2.fromOffset(200, 30)
        }) }
    local v50 = #v49
    for v51, v52 in v46 do
        v49[v50 + v51] = v52
    end
    v36[v37 + 1] = u9.createElement(u3, v38, v49)
    v33[v34 + 1] = u9.createElement("Frame", v35, v36)
    return u9.createElement("ScreenGui", v32, v33)
end)
return {
    ["HalloweenAbilityViewApp"] = v11.connect(function(_, p54) --[[ Line: 162 ]]
        local v55 = {}
        for v56, v57 in p54 do
            v55[v56] = v57
        end
        return v55
    end)(v53)
}