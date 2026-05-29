local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u9 = ColorSequence.new(u2.hexColor(16711726), u2.hexColor(10682368))
local v49 = v6.new(u5)(function(u10, p11) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u3
        [4] = u5
        [5] = u2
        [6] = u9
    --]]
    local v12 = p11.useState
    local v13 = p11.useEffect
    local u14, u15 = v12(u10.Health)
    local u16, u17 = v12(u10.Health)
    local u18 = u4.new()
    v13(function() --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u18
            [3] = u10
            [4] = u14
            [5] = u8
            [6] = u3
            [7] = u15
            [8] = u16
            [9] = u17
        --]]
        local u19 = u4.new()
        local u20 = true
        u18:DoCleaning()
        if u10.Health < u14 then
            local u23 = u8(0.08, u3, function(p21) --[[ Line: 22 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u14
                    [3] = u20
                    [4] = u15
                --]]
                local v22 = u10.Health * p21 + u14 * (1 - p21)
                if u20 then
                    u15(v22)
                end
            end)
            u18:GiveTask(function() --[[ Line: 28 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                u23:Cancel()
            end)
            task.delay(0.3, function() --[[ Line: 31 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u3
                    [3] = u10
                    [4] = u16
                    [5] = u20
                    [6] = u17
                --]]
                u8(0.3, u3, function(p24) --[[ Line: 33 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u16
                        [3] = u20
                        [4] = u17
                    --]]
                    local v25 = u10.Health * p24 + u16 * (1 - p24)
                    if u20 then
                        u17(v25)
                    end
                end)
            end)
        else
            u15(u10.Health)
            u17(u10.Health)
        end
        return function() --[[ Line: 48 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u19
                [3] = u20
            --]]
            u18:DoCleaning()
            u19:DoCleaning()
            u20 = false
        end
    end, { u10.Health })
    v13(function() --[[ Line: 54 ]] end, { u10.DisplayStudRange })
    local v26 = {
        ["ResetOnSpawn"] = false
    }
    local v27 = {}
    local _ = #v27
    local v28 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.3865546218487395, 0.055)
    }
    local v29 = UDim2
    local v30 = u10.OffsetY
    if v30 ~= nil then
        v30 = v30.X
    end
    local v31 = 0.5 + (v30 == nil and 0 or v30)
    local v32 = u10.OffsetY
    if v32 ~= nil then
        v32 = v32.Y
    end
    local v33 = v32 == nil and 0.03 or v32
    v28.Position = v29.fromScale(v31, 0.01 + v33)
    v28.AnchorPoint = Vector2.new(0.5, 0)
    v28.BorderSizePixel = 0
    local v34 = { u5.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 12.545454545454545
        }), u5.createElement("UIListLayout", {
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalAlignment"] = "Center",
            ["FillDirection"] = "Vertical"
        }) }
    local v35 = #v34
    local v36 = {
        ["LayoutOrder"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.8)
    }
    local v37 = u10.DisplayName
    v36.Text = v37 == nil and "" or v37
    v36.Font = Enum.Font.JosefinSans
    v36.TextColor3 = u2.WHITE
    v36.TextScaled = true
    v36.TextXAlignment = "Center"
    v36.TextYAlignment = "Center"
    v34[v35 + 1] = u5.createElement("TextLabel", v36)
    local v38 = {
        ["BackgroundTransparency"] = 0.8,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.5)
    }
    local v39 = {}
    local v40 = #v39
    local v41 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundColor3"] = u2.WHITE
    }
    local v42 = UDim2
    local v43 = u10.MaxHealth
    local v44 = v43 == nil and 1 or v43
    v41.Size = v42.fromScale(u16 / v44, 1)
    v39[v40 + 1] = u5.createElement("Frame", v41)
    local v45 = {
        ["BackgroundColor3"] = u2.WHITE
    }
    local v46 = UDim2
    local v47 = u10.MaxHealth
    local v48 = v47 == nil and 1 or v47
    v45.Size = v46.fromScale(u14 / v48, 1)
    v45.BorderSizePixel = 0
    v39[v40 + 2] = u5.createElement("Frame", v45, { u5.createElement("UIGradient", {
            ["Color"] = u10.Gradient or u9
        }) })
    v34[v35 + 2] = u5.createElement("Frame", v38, v39)
    v27.BossBar = u5.createElement("Frame", v28, v34)
    return u5.createFragment({
        ["BossBarScreenGui"] = u5.createElement("ScreenGui", v26, v27)
    })
end)
return {
    ["BossBarApp"] = v7.connect(function(p50, p51) --[[ Line: 154 ]]
        local v52 = {
            ["Health"] = p50.Bedwars.bossBar.health,
            ["MaxHealth"] = p50.Bedwars.bossBar.maxHealth
        }
        for v53, v54 in p51 do
            v52[v53] = v54
        end
        return v52
    end)(v49)
}