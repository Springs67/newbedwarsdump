local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u7 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
return {
    ["FireSheepHpBar"] = v3.new(u2)(function(u8, p9) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u5
            [3] = u4
            [4] = u7
            [5] = u6
        --]]
        local v10 = p9.useEffect
        local u11 = u2.createRef()
        local u12 = u2.createRef()
        v10(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u8
                [3] = u11
                [4] = u12
                [5] = u4
                [6] = u7
            --]]
            u5.Client:WaitFor("FireSheepHpUpdate"):expect():Connect(function(p13) --[[ Line: 16 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u11
                    [3] = u12
                    [4] = u4
                    [5] = u7
                --]]
                if p13.statue ~= u8.statue then
                    return nil
                end
                local v14 = u11:getValue()
                local v15 = u12:getValue()
                if not (v14 and v15) then
                    return nil
                end
                local v16 = p13.currentHp / p13.maxHp
                v15.Size = UDim2.fromScale(v16, 1)
                u4:Create(v14, u7, {
                    ["Size"] = UDim2.fromScale(v16, 1)
                }):Play()
            end)
        end, {})
        local v17 = u2.createFragment
        local v18 = {}
        local v19 = u2.createElement
        local v20 = {
            ["AlwaysOnTop"] = true,
            ["StudsOffset"] = Vector3.new(0, 7, 0),
            ["MaxDistance"] = 35,
            ["Adornee"] = u8.statue,
            ["Size"] = UDim2.fromScale(6.5, 0.5)
        }
        local v21 = {
            ["InnerBar"] = u2.createElement("Frame", {
                ["BackgroundTransparency"] = 0.8,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 8,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
            }),
            ["MiddleBar"] = u2.createElement("Frame", {
                [u2.Ref] = u11,
                ["Position"] = UDim2.fromScale(0, 0),
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 9
            }),
            ["OuterBar"] = u2.createElement("Frame", {
                [u2.Ref] = u12,
                ["Position"] = UDim2.fromScale(0, 0),
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u6.mcGreen,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 10
            })
        }
        v18.SheepHpBillboard = v19("BillboardGui", v20, v21)
        return v17(v18)
    end)
}