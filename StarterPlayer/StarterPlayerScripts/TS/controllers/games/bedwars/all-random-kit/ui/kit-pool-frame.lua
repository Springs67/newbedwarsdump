local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.CircularProgress
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u11 = v1.import(script, script.Parent, "kit-pool-frame-highlight").KitPoolFrameHighlight
return {
    ["KitPoolFrame"] = v8.new(u7)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u9
            [3] = u6
            [4] = u10
            [5] = u4
            [6] = u11
            [7] = u3
            [8] = u5
        --]]
        local _ = p13.useState
        local v14 = p13.useEffect
        local _ = p13.useMemo
        local u15 = u7.createRef()
        v14(function() --[[ Line: 18 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u12
                [3] = u9
                [4] = u6
            --]]
            local u16 = u15:getValue()
            if not u16 then
                return nil
            end
            if u12.CooldownExpireTime == nil or u12.CooldownExpireTime - u9:GetServerTimeNow() <= 0 then
                return nil
            end
            local u17 = u6.new()
            local u18 = u16.ImageTransparency
            u16.ImageTransparency = 0.5
            u17:GiveTask(function() --[[ Line: 29 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u18
                --]]
                u16.ImageTransparency = u18
            end)
            task.delay(u12.CooldownExpireTime - u9:GetServerTimeNow(), function() --[[ Line: 32 ]]
                --[[
                Upvalues:
                    [1] = u17
                --]]
                return u17:DoCleaning()
            end)
            return function() --[[ Line: 35 ]]
                --[[
                Upvalues:
                    [1] = u17
                --]]
                u17:DoCleaning()
            end
        end, { u12.CooldownExpireTime })
        local v19
        if u12.Kit then
            v19 = u10(u12.Kit)
        else
            v19 = nil
        end
        local v20 = {}
        local v21 = u12.FrameProps
        if v21 then
            for v22, v23 in v21 do
                v20[v22] = v23
            end
        end
        local v24 = { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }), u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.05, 0),
                ["PaddingBottom"] = UDim.new(0.05, 0),
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0)
            }) }
        local v25 = #v24
        local v26 = {
            ["BackgroundTransparency"] = 0.5,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundColor3"] = u4.BLACK
        }
        local v27 = { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.05, 0)
            }) }
        local v28 = #v27
        local v29
        if u12.Kit == nil then
            v29 = false
        else
            v29 = u7.createElement(u11, {}, { u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.05, 0)
                }) })
        end
        if v29 then
            v27[v28 + 1] = v29
        end
        local v30 = #v27
        local v31 = {
            [u7.Ref] = u15,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundTransparency"] = 1
        }
        if v19 ~= nil then
            v19 = v19.renderImage
        end
        v31.Image = v19
        v31.ScaleType = Enum.ScaleType.Fit
        v31.BorderSizePixel = 0
        v31[u7.Event.MouseButton1Click] = u12.OnClick
        local v32 = {}
        local v33 = #v32
        local v34
        if u12.CooldownExpireTime == nil or u12.CooldownExpireTime - u9:GetServerTimeNow() <= 0 then
            v34 = false
        else
            v34 = u7.createElement(u3, {
                ["Transparency"] = 0.3,
                ["Duration"] = u12.CooldownExpireTime - u9:GetServerTimeNow(),
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            })
        end
        if v34 then
            v32[v33 + 1] = v34
        end
        v27[v30 + 1] = u7.createElement("ImageButton", v31, v32)
        v24[v25 + 1] = u7.createElement("Frame", v26, v27)
        return u7.createElement(u5, v20, v24)
    end)
}