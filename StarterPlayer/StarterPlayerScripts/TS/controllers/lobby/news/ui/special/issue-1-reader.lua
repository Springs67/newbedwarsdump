local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "news", "news-types").NewsMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["Issue1Reader"] = v7.new(u6)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u6
            [3] = u5
            [4] = u8
            [5] = u4
            [6] = u11
            [7] = u9
            [8] = u3
        --]]
        local v14 = p13.useState
        local v15 = p13.useEffect
        local v16 = u10[u12.SelectedNews]
        local u17, u18 = v14(0)
        local u19 = u6.createRef()
        v15(function() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u5
                [3] = u8
            --]]
            local v20 = u19:getValue()
            if not v20 then
                return nil
            end
            local u21 = u5.new()
            local u22 = u8:Create(v20, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ["Rotation"] = -5,
                ["Size"] = UDim2.fromScale(1.05, 1.5)
            })
            local u23 = u8:Create(v20, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ["Rotation"] = 0,
                ["Size"] = UDim2.fromScale(1, 1)
            })
            u21:GiveTask(v20.MouseEnter:Connect(function() --[[ Line: 34 ]]
                --[[
                Upvalues:
                    [1] = u22
                --]]
                u22:Play()
            end))
            u21:GiveTask(v20.MouseLeave:Connect(function() --[[ Line: 37 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                u23:Play()
            end))
            return function() --[[ Line: 40 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21:DoCleaning()
            end
        end, { u17 })
        local function v24() --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u11
                [3] = u12
            --]]
            u4:playSound(u11.UI_CLICK_2)
            u12.SetSelectedNews(nil)
        end
        local function v25() --[[ Line: 48 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u17
            --]]
            u18((u17 + 1) % 2)
        end
        local v26 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v27 = {}
        local v28 = #v27
        local v29 = {
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Image"] = v16.pageAssetIds[u17 + 1],
            ["Size"] = UDim2.fromScale(1, 1),
            ["ScaleType"] = Enum.ScaleType.Fit,
            ["BackgroundTransparency"] = 1,
            [u6.Event.MouseButton1Click] = v25
        }
        local v30 = {}
        local v31 = #v30
        local v32
        if u17 == 1 then
            v32 = u6.createElement("ImageLabel", {
                ["Image"] = "rbxassetid://96742516481304",
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                [u6.Ref] = u19
            }, { u6.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1.2828752642706132
                }) })
        else
            v32 = false
        end
        if v32 then
            v30[v31 + 1] = v32
        end
        local v33 = #v30
        local v34 = v33 + 1
        local v35 = u6.createElement
        local v36 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.05),
            ["Position"] = UDim2.fromScale(0, 0.03)
        }
        local v37 = {
            ["GoBackIcon"] = u6.createElement("ImageButton", {
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0.05, 0.5),
                ["Image"] = u9.HOME,
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["ImageTransparency"] = 0.2,
                ["BackgroundTransparency"] = 1,
                [u6.Event.Activated] = v24
            })
        }
        v30[v34] = v35("Frame", v36, v37)
        v30.NextPageIcon = u6.createElement("ImageButton", {
            ["Size"] = UDim2.fromScale(0.05, 0.1),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(1, 0.5),
            ["Image"] = u9.TRIANGLE_ARROW_RIGHT,
            ["ScaleType"] = Enum.ScaleType.Fit,
            ["ImageTransparency"] = 0.2,
            ["BackgroundTransparency"] = 1,
            [u6.Event.Activated] = v25
        })
        v30[v33 + 2] = u6.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1.2828752642706132
        })
        v27[v28 + 1] = u6.createElement("ImageButton", v29, v30)
        return u6.createFragment({
            ["NewsReader"] = u6.createElement(u3, v26, v27)
        })
    end)
}