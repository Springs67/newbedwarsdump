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
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-meta").HalloweenUpgradeMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-util").HalloweenUpgradeUtil
local v54 = v10.new(u9)(function(p16, p17) --[[ Line: 17 ]]
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
        local function v30(p23) --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u12
                [3] = u13
                [4] = u18
            --]]
            local v24 = p23[1]
            local v25 = u15:getAttributeName(v24)
            if u12.LocalPlayer:GetAttribute(v25) ~= nil then
                local v26 = u13:getEntity(u12.LocalPlayer)
                if v26 ~= nil then
                    v26 = v26:getInstance()
                end
                local v27 = {
                    ["abilityType"] = v24
                }
                local v28 = u12.LocalPlayer:GetAttribute(v25)
                v27.tier = v28 == nil and 0 or v28
                local v29 = u18
                table.insert(v29, v27)
            end
        end
        for v31, v32 in v22 do
            v30(v32, v31 - 1, v22)
        end
    end
    local v33 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u6.isSmallScreen()
    }
    local v34 = { u9.createElement(u5, {
            ["BackgroundTransparency"] = 0.9,
            ["AppId"] = p16.AppId
        }) }
    local v35 = #v34
    local v36 = {
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(0.6, 0.9),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["BackgroundColor3"] = u4.WHITE
    }
    local v37 = {
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
    local v38 = #v37
    local v39 = {
        ["ScrollingFrameProps"] = {
            ["Size"] = UDim2.new(0, 400, 0.9, 0) - UDim2.fromOffset(0, 10),
            ["Position"] = UDim2.fromScale(0, 0),
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["LayoutOrder"] = 2,
            ["ScrollingDirection"] = Enum.ScrollingDirection.Y
        }
    }
    local function v46(p40, p41) --[[ Line: 122 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u14
            [3] = u4
        --]]
        local v42 = u9.createElement
        local v43 = {
            ["BackgroundTransparency"] = 1,
            ["RichText"] = true,
            ["Size"] = UDim2.new(1, 0, 0, 20)
        }
        local v44 = u14[p40.abilityType].hudDescription
        local v45 = p40.tier
        v43.Text = "<b>" .. v44 .. "</b> x" .. tostring(v45)
        v43.LayoutOrder = p41
        v43.FontSize = Enum.FontSize.Size18
        v43.TextColor3 = u4.WHITE
        v43.Font = Enum.Font.Roboto
        return v42("TextLabel", v43)
    end
    local v47 = table.create(#u18)
    for v48, v49 in u18 do
        v47[v48] = v46(v49, v48 - 1, u18)
    end
    local v50 = { u9.createElement("UIGridLayout", {
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Top",
            ["SortOrder"] = "LayoutOrder",
            ["FillDirectionMaxCells"] = 2,
            ["CellSize"] = UDim2.fromOffset(200, 30)
        }) }
    local v51 = #v50
    for v52, v53 in v47 do
        v50[v51 + v52] = v53
    end
    v37[v38 + 1] = u9.createElement(u3, v39, v50)
    v34[v35 + 1] = u9.createElement("Frame", v36, v37)
    return u9.createElement("ScreenGui", v33, v34)
end)
return {
    ["HalloweenAbilityViewApp"] = v11.connect(function(_, p55) --[[ Line: 158 ]]
        local v56 = {}
        for v57, v58 in p55 do
            v56[v57] = v58
        end
        return v56
    end)(v54)
}