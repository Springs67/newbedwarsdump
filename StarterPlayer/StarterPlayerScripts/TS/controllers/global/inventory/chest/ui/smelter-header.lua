local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.Empty
local u5 = v2.ProgressBar
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block-smelter", "lucky-block-smelter-util").LuckyBlockSmelterUtil
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "lucky-block-drop-enums").LuckyBlockRarity
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v12 = u6.Component:extend("SmelterHeader")
function v12.init(_, _) --[[ Line: 16 ]] end
function v12.didMount(_) --[[ Line: 18 ]] end
function v12.willUnmount(_) --[[ Line: 20 ]] end
function v12.render(p13) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u6
        [4] = u4
        [5] = u5
        [6] = u11
        [7] = u3
        [8] = u1
        [9] = u7
        [10] = u10
    --]]
    local v14 = p13.props.SmeltPoints / 0.8
    local v15 = math.min(v14, 1)
    local u16 = p13.props.SmeltPoints >= 0.03
    local v17 = u8.getGuaranteedLowestRarityFromSmeltPoints(p13.props.SmeltPoints)
    local v18
    if v17 == 0 or (v17 ~= v17 or not v17) then
        v18 = u8.RarityEffectColors[u9.COMMON]
    else
        v18 = u8.RarityEffectColors[v17]
    end
    local v19
    if v17 == 0 or (v17 ~= v17 or not v17) then
        v19 = nil
    else
        v19 = u8.guaranteedRarityToWeightedSelect[v17]
    end
    local u20 = {}
    if v19 then
        local u21 = v19:getCumulativeWeight()
        local v22 = v19:getObjects()
        local function v32(p23) --[[ Line: 40 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u8
                [3] = u9
                [4] = u20
                [5] = u6
            --]]
            local v24 = p23.weight / u21 * 100
            local v25 = u8.RarityEffectColors[p23.luckyBlockRarity]
            local v26 = u9[p23.luckyBlockRarity]
            local v27 = u20
            local v28 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0, 1),
                ["AutomaticSize"] = Enum.AutomaticSize.X
            }
            local v29 = { u6.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["HorizontalAlignment"] = "Left",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0.04, 0)
                }) }
            local v30 = #v29
            if v25 then
                v25 = u6.createElement("Frame", {
                    ["BackgroundTransparency"] = 0,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["BackgroundColor3"] = v25,
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
                }, { u6.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(1)
                    }), u6.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
            end
            if v25 then
                v29[v30 + 1] = v25
            end
            v29[#v29 + 1] = u6.createElement("TextLabel", {
                ["Font"] = "Roboto",
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["Text"] = v26 .. ": <b>" .. tostring(v24) .. "%</b>",
                ["Size"] = UDim2.fromScale(0, 1),
                ["AutomaticSize"] = Enum.AutomaticSize.X,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            })
            local v31 = u6.createElement("Frame", v28, v29)
            table.insert(v27, v31)
        end
        for v33, v34 in v22 do
            v32(v34, v33 - 1, v22)
        end
    end
    local v35 = {
        ["LayoutOrder"] = 0,
        ["Size"] = UDim2.fromScale(1, 0.4)
    }
    local v36 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.05, 0)
        }) }
    local v37 = #v36
    local v38 = {
        ["Size"] = UDim2.fromScale(1, 0.1)
    }
    local v39 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Left",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.03, 0)
        }) }
    local v40 = #v39
    for v41, v42 in u20 do
        v39[v40 + v41] = v42
    end
    v36[v37 + 1] = u6.createElement(u4, v38, v39)
    v36[v37 + 2] = u6.createElement(u5, {
        ["LayoutOrder"] = 0,
        ["Size"] = UDim2.fromScale(1, 0.35),
        ["Progress"] = v15,
        ["BarColor"] = v18,
        ["BarBackgroundColor"] = u11.backgroundTertiary
    })
    local v43 = u6.createElement
    local v44 = u3
    local v45 = {
        ["Text"] = "<b>SMELT</b>",
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(0.3, 0.3)
    }
    local v46
    if u16 then
        v46 = u11.backgroundSuccess
    else
        v46 = u11.backgroundError
    end
    v45.BackgroundColor3 = v46
    v45.OnClick = u1.async(function() --[[ Line: 142 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u7
            [3] = u1
            [4] = u10
        --]]
        if not u16 then
            return nil
        end
        local v47 = u7.LocalPlayer.Character
        if v47 ~= nil then
            v47 = v47:FindFirstChild("ObservedChestFolder")
        end
        local v48 = u1.await(v47)
        local v49
        if v48 == nil then
            v49 = v48
        else
            v49 = v48.Value
        end
        if v49 then
            u10.Client:Get("SmeltChestContentsRequested"):SendToServer({
                ["chestFolder"] = v48.Value
            })
        end
    end)
    v36.SmeltButton = v43(v44, v45)
    return u6.createElement(u4, v35, v36)
end
return {
    ["SmelterHeader"] = v12
}