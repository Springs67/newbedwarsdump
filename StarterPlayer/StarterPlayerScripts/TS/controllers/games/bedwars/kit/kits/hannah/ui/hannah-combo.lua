local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.GameTheme
local u5 = v2.ProgressBar
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local v35 = v9.new(u8)(function(p13, p14) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
        [3] = u11
        [4] = u6
        [5] = u3
        [6] = u4
        [7] = u8
        [8] = u5
    --]]
    local v15 = p14.useEffect
    local v16, u17 = p14.useState(u12.HANNAH_COMBO_EXPIRATION_SEC)
    v15(function() --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u11
            [3] = u12
            [4] = u6
            [5] = u17
        --]]
        local u18 = u7.new()
        local u20 = u11(u12.HANNAH_COMBO_EXPIRATION_SEC, u6, function(p19) --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            u17(1 - p19)
        end)
        u18:GiveTask(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            u20:Cancel()
        end)
        return function() --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            u18:DoCleaning()
        end
    end, { p13.combo })
    local v21 = u3.hexColor(16686918)
    if p13.combo > 1 then
        v21 = u3.hexColor(16676678)
    end
    if p13.combo > 2 then
        v21 = u3.hexColor(16664149)
    end
    local v22 = {
        ["BorderSizePixel"] = 0,
        ["Size"] = u4.actionBarButtonSize,
        ["BackgroundTransparency"] = p13.combo == 0 and 1 or 0.4,
        ["BackgroundColor3"] = Color3.fromRGB(20, 20, 20)
    }
    local v23 = {}
    local v24 = #v23
    local v25
    if p13.combo > 0 then
        local v26 = u8.createFragment
        local v27 = {}
        local v28 = u8.createFragment
        local v29 = {}
        local v30 = u8.createElement
        local v31 = {
            ["RichText"] = true,
            ["LayoutOrder"] = 100,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.9, 0.9),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v32 = u3.richTextColor(u3.WHITE)
        local v33 = u3.richTextColor(v21)
        local v34 = p13.combo
        v31.Text = "<font color=\"" .. v32 .. "\">COMBO:</font> <b><font color=\"" .. v33 .. "\">" .. tostring(v34) .. "</font></b>"
        v31.Font = Enum.Font.JosefinSans
        v31.TextColor3 = u3.WHITE
        v29.HannahCombo = v30("TextLabel", v31)
        v27.HannahCombo = v28(v29)
        __set_list(v27, 1, {u8.createElement(u5, {
    ["Size"] = UDim2.fromScale(1, 0.12),
    ["Position"] = UDim2.fromScale(0.5, 1),
    ["AnchorPoint"] = Vector2.new(0.5, 0),
    ["BarColor"] = u3.hexColor(16772019),
    ["Progress"] = v16
})})
        v25 = v26(v27)
    else
        v25 = false
    end
    if v25 then
        v23[v24 + 1] = v25
    end
    v23[#v23 + 1] = u8.createElement("UIAspectRatioConstraint", {
        ["AspectRatio"] = 4
    })
    return u8.createElement("ImageLabel", v22, v23)
end)
return {
    ["HannahCombo"] = v10.connect(function(p36, p37) --[[ Line: 78 ]]
        local v38 = {}
        for v39, v40 in p37 do
            v38[v39] = v40
        end
        v38.combo = p36.Kit.hannahCombo
        return v38
    end)(v35)
}