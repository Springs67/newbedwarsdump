local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.Countdown
local u5 = v2.Empty
local u6 = v2.TimedProgressBar
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["SquadLauncherUI"] = v9.new(u8)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u5
            [3] = u3
            [4] = u11
            [5] = u1
            [6] = u7
            [7] = u10
            [8] = u6
            [9] = u4
        --]]
        local _ = p13.useState
        local _ = p13.useEffect
        return u8.createElement(u5, {
            ["Size"] = u12.Size or UDim2.fromScale(1, 0.075)
        }, {
            u8.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }),
            ["ExitButton"] = u8.createElement(u3, {
                ["Text"] = "<b>EXIT</b>",
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.125, 1),
                ["BackgroundColor3"] = u11.backgroundSuccess,
                ["OnClick"] = u1.async(function() --[[ Line: 29 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u10
                        [3] = u12
                    --]]
                    u7.Controllers.SquadLauncherController:exitLauncher(u10.LocalPlayer, u12.SquadLauncher)
                end)
            }),
            u8.createElement(u6, {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.6, 1),
                ["StartTime"] = u12.StartTime,
                ["EndTime"] = u12.EndTime,
                ["ProgressBarConfig"] = {
                    ["Flip"] = true,
                    ["GradientRotation"] = 180,
                    ["BarGradient"] = ColorSequence.new(Color3.fromHex("33B6FF"), Color3.fromHex("C8EBFF"))
                }
            }),
            u8.createElement(u4, {
                ["EndTime"] = u12.EndTime,
                ["TextLabel"] = {
                    ["LayoutOrder"] = 3,
                    ["RichText"] = false,
                    ["Size"] = UDim2.fromScale(0.15, 1)
                },
                ["CountdownConfig"] = {
                    ["minutes"] = false,
                    ["hours"] = false,
                    ["days"] = false
                }
            }, { u8.createElement("UIStroke") })
        })
    end)
}