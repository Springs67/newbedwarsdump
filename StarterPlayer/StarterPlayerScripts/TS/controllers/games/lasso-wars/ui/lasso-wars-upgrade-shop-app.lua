local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DarkBackground
local u6 = v3.DeviceUtil
local u7 = v3.SlideIn
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "lasso-wars", "lasso-wars-upgrade-meta").LassoWarsUpgrades
local u15 = u1.import(script, script.Parent, "lasso-wars-upgrade-card").LassoWarsUpgradeCard
local v50 = v10.new(u9)(function(p16, p17) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u14
        [3] = u6
        [4] = u12
        [5] = u1
        [6] = u2
        [7] = u13
        [8] = u9
        [9] = u5
        [10] = u4
        [11] = u15
        [12] = u7
    --]]
    local _ = p17.useState
    local v18 = p17.useEffect
    local v19 = #u8.keys(u14)
    local v20 = UDim2.new(1 / v19, 0, 1, 0)
    local v21 = u6.isSmallScreen()
    v18(function() --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u1
            [3] = u2
            [4] = u13
        --]]
        local u22 = true
        local v23 = u12.LocalPlayer
        if v23 ~= nil then
            v23 = v23.Character
        end
        if v23 then
            local u24 = u12.LocalPlayer.Character:GetPrimaryPartCFrame().Position
            u1.Promise.defer(function() --[[ Line: 32 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u12
                    [3] = u24
                    [4] = u2
                    [5] = u13
                --]]
                while true do
                    local v25 = task.wait(0.2)
                    if v25 ~= 0 and (v25 == v25 and v25) then
                        v25 = u22
                    end
                    if v25 == 0 or (v25 ~= v25 or not v25) then
                        return
                    end
                    local v26 = u12.LocalPlayer.Character
                    if v26 ~= nil then
                        v26 = v26:GetPrimaryPartCFrame().Position
                    end
                    if v26 == nil then
                        v26 = Vector3.new()
                    end
                    if (v26 - u24).Magnitude > 6 then
                        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u13.LASSO_WARS_UPGRADE_SHOP_APP)
                    end
                end
            end)
        end
        return function() --[[ Line: 56 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            u22 = false
        end
    end, {})
    local v27 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false
    }
    local v28 = { u9.createElement(u5, {
            ["BackgroundTransparency"] = 0.4,
            ["AppId"] = p16.AppId
        }) }
    local v29 = #v28
    local v30 = {}
    local v31 = #v30
    local v32 = {
        ["BackgroundTransparency"] = 1,
        ["Modal"] = true
    }
    local v33
    if v21 then
        v33 = UDim2.fromScale(0.9, 0.7)
    else
        v33 = UDim2.fromScale(0.8, 0.5)
    end
    v32.Size = v33
    v32.Position = UDim2.fromScale(0.5, 0.45)
    v32.AnchorPoint = Vector2.new(0.5, 0.5)
    local v34 = {}
    local _ = #v34
    local v35 = {
        ["BackgroundTransparency"] = 0,
        ["LayoutOrder"] = 1,
        ["BorderSizePixel"] = 0,
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["BackgroundColor3"] = Color3.fromHex("#AC714A"),
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v36 = { u9.createElement("UIStroke", {
            ["Thickness"] = 3,
            ["Color"] = Color3.fromHex("#3A160E")
        }), u9.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 10)
        }) }
    local _ = #v36
    local v37 = {
        ["LayoutOrder"] = 1,
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 0,
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["BackgroundColor3"] = Color3.fromHex("#C3976A"),
        ["Size"] = UDim2.fromScale(0.95, 0.88)
    }
    local v38 = { u9.createElement("UIStroke", {
            ["Thickness"] = 3,
            ["Color"] = Color3.fromHex("#924A36")
        }), u9.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 10)
        }), u9.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["Text"] = "Lasso Upgrades",
            ["TextScaled"] = true,
            ["TextStrokeTransparency"] = 0.2,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.1),
            ["Size"] = UDim2.fromScale(1, 0.2),
            ["TextColor3"] = u4.WHITE,
            ["Font"] = Enum.Font.SourceSansBold,
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextYAlignment"] = Enum.TextYAlignment.Center
        }) }
    local _ = #v38
    local v39 = 0
    local v40 = {}
    for v41, v42 in u8.keys(u14) do
        local _ = v41 - 1
        local v43 = u14[v42]
        local v44 = u9.createElement(u15, {
            ["cardSize"] = v20,
            ["upgradeMeta"] = v43,
            ["upgradeType"] = v42,
            ["LayoutOrder"] = v43.layoutOrder
        })
        if v44 ~= nil then
            v39 = v39 + 1
            v40[v39] = v44
        end
    end
    local v45 = {
        ["LayoutOrder"] = 1,
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.58),
        ["Size"] = UDim2.fromScale(0.95, 0.7)
    }
    local v46 = { u9.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }) }
    local v47 = #v46
    for v48, v49 in v40 do
        v46[v47 + v48] = v49
    end
    v38.UpgradeArea = u9.createElement("Frame", v45, v46)
    v36.InnerBackground = u9.createElement("Frame", v37, v38)
    v34.OuterBackground = u9.createElement("Frame", v35, v36)
    v30[v31 + 1] = u9.createElement("ImageButton", v32, v34)
    v28[v29 + 1] = u9.createElement(u7, {}, v30)
    return u9.createFragment({
        ["LassoWarsUpgradeShopApp"] = u9.createElement("ScreenGui", v27, v28)
    })
end)
return {
    ["LassoWarsUpgradeShopApp"] = v11.connect(function(_, p51) --[[ Line: 184 ]]
        local v52 = {}
        for v53, v54 in p51 do
            v52[v53] = v54
        end
        return v52
    end)(v50)
}