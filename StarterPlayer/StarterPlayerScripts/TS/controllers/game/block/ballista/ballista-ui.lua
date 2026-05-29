local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.ContextActionService
local u11 = v9.Players
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["BallistaUI"] = v8.new(u7)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u10
            [3] = u6
            [4] = u11
            [5] = u7
            [6] = u3
            [7] = u12
            [8] = u1
            [9] = u5
        --]]
        local _ = p14.useState
        local v15 = p14.useEffect
        local v16 = u4.isMobileControls()
        v15(function() --[[ Line: 18 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u6
                [3] = u11
                [4] = u13
            --]]
            local v17 = u10
            local function v19(_, p18, _) --[[ Line: 19 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u11
                    [3] = u13
                --]]
                if p18 == Enum.UserInputState.End then
                    u6.Controllers.BallistaController:exitBallista(u11.LocalPlayer, u13.Ballista)
                end
            end
            local v20 = u13.inputTypes
            v17:BindAction("ballista-exit", v19, false, unpack(v20))
        end, {})
        local v21 = {
            ["Size"] = u13.Size or UDim2.fromScale(1, 0.075)
        }
        local v22 = {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0),
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
            }),
            ["ExitButton"] = u7.createElement(u3, {
                ["Text"] = "<b>EXIT(X)</b>",
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.125, 1),
                ["BackgroundColor3"] = u12.backgroundSuccess,
                ["OnClick"] = u1.async(function() --[[ Line: 40 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u11
                        [3] = u13
                    --]]
                    u6.Controllers.BallistaController:exitBallista(u11.LocalPlayer, u13.Ballista)
                end)
            })
        }
        local v23 = #v22
        if v16 then
            v16 = u7.createFragment({
                ["FireButton"] = u7.createElement(u3, {
                    ["Text"] = "<b>FIRE</b>",
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(0.125, 1),
                    ["BackgroundColor3"] = u12.backgroundSuccess,
                    ["OnClick"] = u1.async(function() --[[ Line: 52 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                        --]]
                        u6.Controllers.BallistaController:fire()
                    end)
                })
            })
        end
        if v16 then
            v22[v23 + 1] = v16
        end
        return u7.createElement(u5, v21, v22)
    end)
}