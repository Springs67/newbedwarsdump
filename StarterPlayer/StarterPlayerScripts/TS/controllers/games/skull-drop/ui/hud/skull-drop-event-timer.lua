local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Countdown
local u5 = v2.DeviceUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["SkullDropEventTimer"] = v7.new(u6)(function(p10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u8
            [3] = u6
            [4] = u4
            [5] = u3
            [6] = u9
        --]]
        local v12 = p11.useState
        local v13 = p11.useEffect
        local v14, u15 = v12(nil)
        v13(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u8
                [3] = u15
            --]]
            if u5.isHoarceKat() then
                return nil
            end
            local u17 = u8.Client:Get("SkullDropEventTimer"):Connect(function(p16) --[[ Line: 19 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15(p16)
            end)
            return function() --[[ Line: 22 ]]
                --[[
                Upvalues:
                    [1] = u17
                --]]
                u17:Disconnect()
            end
        end, {})
        local v18 = {
            ["BackgroundTransparency"] = 0.15,
            ["LayoutOrder"] = 2,
            ["Size"] = p10.Size or UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(28, 28, 28)
        }
        local v19 = { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.35, 0)
            }) }
        local v20 = #v19
        local v21
        if v14 == nil then
            v21 = false
        else
            v21 = u6.createElement(u4, {
                ["PostText"] = "s</font></b>",
                ["PreText"] = v14.name .. ": <b><font color=\"" .. u3.richTextColor(u9.mcYellow) .. "\">",
                ["EndTime"] = v14.startTime,
                ["CountdownConfig"] = {
                    ["days"] = false,
                    ["hours"] = false,
                    ["minutes"] = false,
                    ["seconds"] = true
                },
                ["TextLabel"] = {
                    ["BackgroundTransparency"] = 1,
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["Size"] = UDim2.fromScale(0.9, 0.6),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["TextColor3"] = u3.WHITE
                }
            })
        end
        if v21 then
            v19[v20 + 1] = v21
        end
        return u6.createFragment({
            ["SkullDropEventTimer"] = u6.createElement("Frame", v18, v19)
        })
    end)
}