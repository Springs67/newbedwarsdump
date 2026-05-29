local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils
local v35 = v6.new(u5)(function(u10, p11) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u9
        [4] = u3
        [5] = u4
    --]]
    local v12 = p11.useState
    local v13 = p11.useEffect
    local v20, u21 = v12(function() --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        local v14 = u10.AfkStartTime
        local v15 = v14 / 3600
        local v16 = math.floor(v15)
        local v17 = v14 % 3600 / 60
        local v18 = math.floor(v17)
        local v19 = v14 % 60
        return string.format("%02i", v16) .. ":" .. string.format("%02i", v18) .. ":" .. string.format("%02i", v19)
    end)
    local u22 = u5.createRef()
    local u23 = u5.createRef()
    local function u25(p24) --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u9
        --]]
        if not p24 then
            return nil
        end
        u8:Create(p24, TweenInfo.new(u9.Tween.textTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            ["TextTransparency"] = 1,
            ["TextStrokeTransparency"] = 1
        }):Play()
    end
    v13(function() --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u22
            [3] = u23
            [4] = u25
            [5] = u21
            [6] = u3
        --]]
        local u26 = u10.AfkStartTime
        local v27 = u22:getValue()
        local v28 = u23:getValue()
        if u10.ReturnButtonPressed then
            u25(v27)
            u25(v28)
        end
        local function u34() --[[ Line: 42 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u10
                [3] = u21
                [4] = u3
                [5] = u34
            --]]
            task.delay(1, function() --[[ Line: 43 ]]
                --[[
                Upvalues:
                    [1] = u26
                    [2] = u10
                    [3] = u21
                    [4] = u3
                    [5] = u34
                --]]
                u26 = os.time() - u10.MountedStartTime + u10.AfkStartTime
                local v29 = u26 / 3600
                local v30 = math.floor(v29)
                local v31 = u26 % 3600 / 60
                local v32 = math.floor(v31)
                local v33 = u26 % 60
                u21("<font color=\"" .. u3.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\" transparency=\"" .. tostring(0.3) .. "\">SESSION:</font> " .. string.format("%02i", v30) .. ":" .. string.format("%02i", v32) .. ":" .. string.format("%02i", v33))
                u34()
            end)
        end
        u34()
        return function() --[[ Line: 53 ]] end
    end, { u10.AfkStartTime, u10.ReturnButtonPressed })
    return u5.createElement("TextLabel", {
        [u5.Ref] = u22,
        ["Text"] = v20,
        ["Size"] = UDim2.fromScale(u10.size.X, u10.size.Y),
        ["FontFace"] = Font.fromName(u9.Theme.font.Name, Enum.FontWeight.Medium),
        ["TextScaled"] = true,
        ["Font"] = u9.Theme.font,
        ["TextStrokeTransparency"] = 1,
        ["TextSize"] = u4.isSmallScreen() and 18 or 28,
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["TextYAlignment"] = Enum.TextYAlignment.Center,
        ["RichText"] = true,
        ["TextColor3"] = Color3.fromRGB(255, 246, 165),
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 3
    })
end)
return {
    ["AfkPlaceCurrentTimer"] = v7.connect(function(_, p36) --[[ Line: 74 ]]
        local v37 = {}
        for v38, v39 in p36 do
            v37[v38] = v39
        end
        return v37
    end)(v35)
}